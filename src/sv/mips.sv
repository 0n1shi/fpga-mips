module mips (
    input logic clk
);
    logic clk_pc = 0;
    logic clk_reg = 0;
    logic clk_mem = 0;

    logic [31:0] pc = 'd0;
    logic [31:0] next_pc;

    logic [31:0] fetch_val = 'd0;

    logic write_reg;
    logic [11:0] alu_ctrl;

    logic [31:0] reg_val_1 = 0;
    logic [31:0] reg_val_2 = 0;

    logic [31:0] imm = 0;

    logic alu_zero = 0;
    logic [31:0] alu_result = 0;

    clk_gen clk_gen(.clk, .clk_pc, .clk_reg, .clk_mem);

    PC PC(.clk(clk_pc), .next(next_pc), .current(pc));

    pc_inc pc_inc(.current(pc), .next(next_pc));

    ROM ROM(.addr(pc), .val(fetch_val));

    decoder decoder(
        .opcode(fetch_val[31:26]), 
        .func(fetch_val[5:0]), 
        .write_reg,
        .alu_ctrl
    );

    reg_file reg_file(
        .clk(clk_reg),
        .write_enable_3(write_reg),
        .sel_1(fetch_val[25:21]),
        .sel_2(fetch_val[20:16]),
        .sel_3(fetch_val[20:16]),
        .val_1(reg_val_1),
        .val_2(reg_val_2),
        .val_3(alu_result)
    );

    sign_ext sign_ext(.org_val(fetch_val[15:0]), .val(imm));

    ALU ALU(.ctrl(alu_ctrl), .src1(reg_val_1), .src2(imm), .zero(alu_zero), .result(alu_result));
endmodule