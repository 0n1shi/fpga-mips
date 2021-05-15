vsim mips_test
add wave -divider tb
add wave sim:/mips_test/*
add wave -divider mips
add wave sim:/mips_test/mips/*
add wave -divider mips/clk_gen
add wave sim:/mips_test/mips/clk_gen/*
add wave -divider mips/PC
add wave sim:/mips_test/mips/PC/*
add wave -divider mips/ROM
add wave sim:/mips_test/mips/ROM/*
add wave -divider mips/decoder
add wave sim:/mips_test/mips/decoder/*
add wave -divider mips/reg_file
add wave sim:/mips_test/mips/reg_file/*
add wave -divider mips/sign_ext
add wave sim:/mips_test/mips/sign_ext/*
add wave -divider mips/ALU
add wave sim:/mips_test/mips/ALU/*
add wave -divider mips/RAM
add wave sim:/mips_test/mips/RAM/*
run -all
