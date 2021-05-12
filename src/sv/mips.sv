module mips (
    input logic clk
);
    logic clk_pc = 0;
    logic clk_reg = 0;
    logic clk_mem = 0;

    logic [31:0] pc = 'd0;
    

    // for decoder
    logic write_reg;
    logic write_mem;
    logic use_imm;
    logic read_ram;
    logic [1:0] dst_reg;
    logic [1:0] jmp;
    logic branch;
    logic [3:0] alu_ctrl;

    logic [31:0] reg_val_1 = 0;
    logic [31:0] reg_val_2 = 0;

    // for ALU
    logic alu_zero = 0;
    logic [31:0] alu_result;

    // for fetch value
    logic [31:0] fetch_val = 'd0;

    logic [5:0] opcode;
    assign opcode = fetch_val[31:26];
    
    logic [5:0] func;
    assign func = fetch_val[5:0];
    
    logic [4:0] rs;
    assign rs = fetch_val[25:21];
    
    logic [4:0] rt;
    assign rt = fetch_val[20:16];
    
    logic [4:0] rd;
    assign rd = fetch_val[15:11];
    
    logic [15:0] imm;
    assign imm = fetch_val[15:0];
    logic [31:0] label;
    assign label = {14'b0, imm << 2};

    logic [4:0] sa;
    assign sa = fetch_val[10:6];

    logic [25:0] target;
    assign target = fetch_val[25:0] << 2;

    logic [31:0] next_addr;
    assign next_addr = branch && !alu_zero ? pc + 4 + label : pc + 4;

    logic [31:0] next_pc;
    always_comb begin
        case (jmp)
            decoder.jmp_not:    next_pc = next_addr;
            decoder.jmp_jal:    next_pc = target;
            decoder.jmp_j:      next_pc = (next_addr & 32'hFFFF0000) | target;
            decoder.jmp_jr:     next_pc = reg_val_1;
        endcase
    end

    // for sign extender
    logic [31:0] signed_imm;

    // for RAM
    logic [31:0] mem_val;

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

    ROM ROM(
        .addr(pc), 
        .val(fetch_val)
    );

    decoder decoder(
        .opcode,
        .func,
        .write_reg,
        .write_mem,
        .use_imm,
        .read_ram,
        .dst_reg,
        .jmp,
        .branch,
        .alu_ctrl
    );

    logic [4:0] sel_3;
    assign sel_3 = dst_reg == decoder.dst_reg_rd ? rd : (dst_reg == decoder.dst_reg_rt ? rt : 31);

    reg_file reg_file(
        .clk(clk_reg),
        .write_enable_3(write_reg),
        .sel_1(rs),
        .sel_2(rt),
        .sel_3,
        .val_1(reg_val_1),
        .val_2(reg_val_2),
        .val_3(jmp == decoder.jmp_jal ? pc + 4 : (read_ram ? mem_val : alu_result))
    );

    sign_ext sign_ext(
        .org_val(imm), 
        .val(signed_imm)
    );

    logic [31:0] alu_arg2;
    assign alu_arg2 = use_imm ? signed_imm : reg_val_2;

    ALU ALU(
        .ctrl(alu_ctrl), 
        .arg1(reg_val_1), 
        .arg2(alu_arg2), 
        .zero(alu_zero), 
        .result(alu_result)
    );

    RAM RAM(
        .clk(clk_mem), 
        .write_enable(write_mem), 
        .addr(alu_result), 
        .set_val(reg_val_2),
        .val(mem_val)
    );
endmodule