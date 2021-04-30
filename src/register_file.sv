/**
 * name: register_file.sv
 * desc: group of registers
 */

module register_file (
    input   logic   clock,
    input   logic   write_enable,

    input   logic [4:0] selector_out1,  // read
    input   logic [4:0] selector_out2,  // read
    input   logic [4:0] selector_in1,   // write

    output  logic [31:0]    value_out1,   // read 
    output  logic [31:0]    value_out2,   // read
    input   logic [31:0]    value_in1     // write
);
    /**
     * # 32 regiters (32 bit each)
     * - Zero: Always returns 0
     * - AT:   (assembler temporary) Reserved for use by assembler
	 * - V0:   Value returned by subroutine
	 * - V1:   Value returned by subroutine
	 * - A0:   (arguments) First four parameters for a subroutine
	 * - A1:   (arguments) First four parameters for a subroutine
	 * - A2:   (arguments) First four parameters for a subroutine
	 * - A3:   (arguments) First four parameters for a subroutine
	 * - T0:   (temporaries) Subroutines can use without saving
	 * - T1:   (temporaries) Subroutines can use without saving
	 * - T2:   (temporaries) Subroutines can use without saving
	 * - T3:   (temporaries) Subroutines can use without saving
	 * - T4:   (temporaries) Subroutines can use without saving
	 * - T5:   (temporaries) Subroutines can use without saving
	 * - T6:   (temporaries) Subroutines can use without saving
	 * - T7:   (temporaries) Subroutines can use without saving
	 * - S0:   Subroutine register variables, must be restored before returning
	 * - S1:   Subroutine register variables, must be restored before returning
	 * - S2:   Subroutine register variables, must be restored before returning
	 * - S3:   Subroutine register variables, must be restored before returning
	 * - S4:   Subroutine register variables, must be restored before returning
	 * - S5:   Subroutine register variables, must be restored before returning
	 * - S6:   Subroutine register variables, must be restored before returning
	 * - S7:   Subroutine register variables, must be restored before returning
	 * - T8:   (temporaries) Subroutines can use without saving
	 * - T9:   (temporaries) Subroutines can use without saving
	 * - K0:   Reserved for use by interrupt/trap handler; may change under your feet
	 * - K1:   Reserved for use by interrupt/trap handler; may change under your feet
	 * - GP:   Global pointer; used to access "static" or "extern" variables
	 * - SP:   Stack pointer
	 * - FP:   Frame pointer or ninth subroutine variable
	 * - RA:   Return address for subroutine
     */
    logic [31:0] registers [31:0] = '{default: 'd0};

    always_ff @(posedge clock) begin
        if (write_enable && selector_in1 != 0)
            registers[selector_in1] <= value_in1;
        value_out1 <= registers[selector_out1];
        value_out2 <= registers[selector_out2];
    end
endmodule