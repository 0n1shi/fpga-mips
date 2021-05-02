module mips (
    input logic clock
);
    logic clock_pc = 0;
    logic clock_reg = 0;
    logic clock_mem = 0;

    logic [31:0] pc = 'd0;
    logic [31:0] next_pc;

    logic [31:0] fetch_data = 'd0;

    logic write_reg;
    logic [11:0] alu_control;

    logic [31:0] reg_value1 = 0;
    logic [31:0] reg_value2 = 0;

    logic [31:0] imm = 0;

    logic alu_zero = 0;
    logic [31:0] alu_result = 0;

    clock_divider clock_divider(.clock, .clock_pc, .clock_reg, .clock_mem);

    PC PC(.clock(clock_pc), .in(next_pc), .out(pc));

    pc_inc pc_inc(.in(pc), .out(next_pc));

    ROM ROM(.address(pc), .data(fetch_data));

    decoder decoder(
        .opcode(fetch_data[31:26]), 
        .func(fetch_data[5:0]), 
        .write_reg,
        .alu_control
    );

    register_file register_file(
        .clock(clock_reg),
        .write_enable(write_reg),
        .selector_out1(fetch_data[25:21]),
        .selector_out2(fetch_data[20:16]),
        .selector_in1(fetch_data[20:16]),
        .value_out1(reg_value1),
        .value_out2(reg_value2),
        .value_in1(alu_result)
    );

    sign_extender sign_extender(.in(fetch_data[15:0]), .out(imm));

    ALU ALU(.control(alu_control), .src1(reg_value1), .src2(imm), .zero(alu_zero), .result(alu_result));
endmodule