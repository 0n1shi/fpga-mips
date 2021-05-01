module mips (
    input logic clock
);
    logic [31:0] pc = 'd0;
    logic [31:0] next_pc;

    logic [31:0] fetch_data = 0'd0;

    PC PC(.clock, .in(next_pc), .out(pc));

    pc_inc pc_inc(.in(pc), .out(next_pc));

    ROM ROM(.address(pc), .data(fetch_data));
endmodule