/**
 * name: register_file.sv
 * desc: group of registers
 */

module reg_file (
    input   logic   clk,
    input   logic   write_enable_3,

    input   logic [4:0] sel_1,  // read
    input   logic [4:0] sel_2,  // read
    input   logic [4:0] sel_3,  // write

    output  logic [31:0]	val_1,	// read 
    output  logic [31:0]    val_2,	// read
    input   logic [31:0]    val_3,  // write

	output	logic [31:0]	ra // for debug
);
    // 32 regiters (32 bit each)
    logic [31:0] regs [31:0] = {
		32'h0000,	// 31) RA:		Return address for subroutine
		32'h0000,	// 30) FP:		Frame pointer or ninth subroutine variable
		32'hFFFF,	// 29) SP:		Stack pointer
		32'h0000,	// 28) GP:		Global pointer; used to access "static" or "extern" variables
		32'h0000,	// 27) K1:		Reserved for use by interrupt/trap handler; may change under your feet
		32'h0000,	// 26) K0:		Reserved for use by interrupt/trap handler; may change under your feet
		32'h0000,	// 25) T9:		(temporaries) Subroutines can use without saving
		32'h0000,	// 24) T8:		(temporaries) Subroutines can use without saving
		32'h0000,	// 23) S7:		Subroutine register variables, must be restored before returning
		32'h0000,	// 22) S6:		Subroutine register variables, must be restored before returning
		32'h0000,	// 21) S5:		Subroutine register variables, must be restored before returning
		32'h0000,	// 20) S4:		Subroutine register variables, must be restored before returning
		32'h0000,	// 19) S3:		Subroutine register variables, must be restored before returning
		32'h0000,	// 18) S2:		Subroutine register variables, must be restored before returning
		32'h0000,	// 17) S1:		Subroutine register variables, must be restored before returning
		32'h0000,	// 16) S0:		Subroutine register variables, must be restored before returning
		32'h0000,	// 15) T7:		(temporaries) Subroutines can use without saving
		32'h0000,	// 14) T6:		(temporaries) Subroutines can use without saving
		32'h0000,	// 13) T5:		(temporaries) Subroutines can use without saving
		32'h0000,	// 12) T4:		(temporaries) Subroutines can use without saving
		32'h0000,	// 11) T3:		(temporaries) Subroutines can use without saving
		32'h0000,	// 10) T2:		(temporaries) Subroutines can use without saving
		32'h0000,	// 09) T1:		(temporaries) Subroutines can use without saving
		32'h0000,	// 08) T0:		(temporaries) Subroutines can use without saving
		32'h0000,	// 07) A3:		(arguments) First four parameters for a subroutine
		32'h0000,	// 06) A2:		(arguments) First four parameters for a subroutine
		32'h0000,	// 05) A1:		(arguments) First four parameters for a subroutine
		32'h0000,	// 04) A0:		(arguments) First four parameters for a subroutine
		32'h0000,	// 03) V1:		Value returned by subroutine
		32'h0000,	// 02) V0:		Value returned by subroutine
		32'h0000,	// 01) AT:		(assembler temporary) Reserved for use by assembler
		32'h0000	// 00) Zero:	Always returns 0
	};

    always_ff @(posedge clk) begin
        if (write_enable_3 && sel_3 != 0)
            regs[sel_3] <= val_3;
    end

	assign val_1 = regs[sel_1];
    assign val_2 = regs[sel_2];

	assign ra = regs[31]; // for debug
endmodule