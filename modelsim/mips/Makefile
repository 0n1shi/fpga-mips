#-------------------------------------------------------------------------------
# Makefile for vsim
#
# usage :
#   make vlog  => compile
#   make sim   => simulation with CUI
#   make simx  => simulation with GUI (Linux)
#   make simw  => simulation with GUI (Windows)
#   make clean => cleanup
#-------------------------------------------------------------------------------
.PHONY : all sim simx simw vlog clean

CMD_VLOG = vlog +incdir+$(RTL_DIR) +define+__SIM__
CMD_VSIM = vsim -voptargs=+acc
CMD_VSIM_WIN = modelsim.exe -voptargs=+acc
TOP_MODULE = mips_test
SIM_SCRIPT = sim.do

SRC = ../../src/sv/*.sv ../../test/mips_test.sv

all : vlog

sim : vlog
	$(CMD_VSIM) -c $(TOP_MODULE)

simx : vlog
	$(CMD_VSIM) -do $(SIM_SCRIPT)

simw : vlog
	$(CMD_VSIM_WIN) -do $(SIM_SCRIPT)

work :
	vlib work

#-------------------------------------------------------------------------------
# vlog - compile .v files
#-------------------------------------------------------------------------------
vlog : work
	@make -s $(addsuffix .tgt_vlog,$(SRC))

%.tgt_vlog :
	$(CMD_VLOG) $(subst .tgt_vlog,,$@)

#-------------------------------------------------------------------------------
# misc
#-------------------------------------------------------------------------------
clean :
	@rm -rf *.ver work transcript vsim.wlf wlf* *~

%.tgt_clean :
	@make -s -C $(subst .tgt_clean,,$@) clean
