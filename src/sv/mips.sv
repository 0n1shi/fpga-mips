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
    logic write_mem;
    logic [11:0] alu_ctrl;

    logic [31:0] reg_val_1 = 0;
    logic [31:0] reg_val_2 = 0;

    logic alu_zero = 0;
    logic [31:0] alu_result;

    /* type common */
    logic [5:0] opcode;
    assign opcode = fetch_val[31:26];

    /* type R */
    logic [5:0] func;
    assign func = fetch_val[5:0];

    /* type I */
    logic [4:0] typeI_rs;
    assign typeI_rs = fetch_val[25:21];
    logic [4:0] typeI_rt;
    assign typeI_rt = fetch_val[20:16];
    logic [15:0] imm;
    assign imm = fetch_val[15:0];

    /* type J */

    logic [31:0] signed_imm;

    clk_gen clk_gen(
        .clk, 
        .clk_pc, 
        .clk_reg, 
        .clk_mem
    );

    PC PC(
        .clk(clk_pc), 
        .next(next_pc), 
        .current(pc)
    );

    pc_inc pc_inc(
        .current(pc), 
        .next(next_pc)
    );

    ROM ROM(
        .addr(pc), 
        .val(fetch_val)
    );

    decoder decoder(
        .opcode,
        .func,
        .write_reg,
        .write_mem,
        .alu_ctrl
    );

    reg_file reg_file(
        .clk(clk_reg),
        .write_enable_3(write_reg),
        .sel_1(typeI_rs),
        .sel_2(typeI_rt),
        .sel_3(typeI_rt),
        .val_1(reg_val_1),
        .val_2(reg_val_2),
        .val_3(alu_result)
    );

    sign_ext sign_ext(
        .org_val(imm), 
        .val(signed_imm)
    );

    ALU ALU(
        .ctrl(alu_ctrl), 
        .src1(reg_val_1), 
        .src2(signed_imm), 
        .zero(alu_zero), 
        .result(alu_result)
    );

    RAM RAM(
        .clk(clk_mem), 
        .write_enable(write_mem), 
        .addr(alu_result), 
        .set_val(reg_val_2)
    );
endmodule