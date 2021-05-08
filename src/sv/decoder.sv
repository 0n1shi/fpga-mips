module decoder (
    input   logic [5:0]     opcode,
    input   logic [5:0]     func,
    output  logic           write_reg   = 1'b0,
    output  logic           write_mem   = 1'b0,
    output  logic           use_imm     = 1'b0,
    output  logic           read_ram    = 1'b0,
    output  logic [1:0]     dst_reg     = 2'b0,
    output  logic           jal         = 1'b0,
    output  logic [3:0]     alu_ctrl    = 4'b0
);
    /* opcodes */
    parameter op_type_r = 6'b000000;
    parameter op_addiu  = 6'b001001;
    parameter op_sw     = 6'b101011;
    parameter op_jal    = 6'b000011;
    parameter op_lw     = 6'b100011;

    /* type R functions */
    parameter func_addu = 6'b100001;

    /* destination register */
    parameter dst_reg_rt = 2'b00;
    parameter dst_reg_rd = 2'b01;
    parameter dst_reg_ra = 2'b10;

    always_comb begin
        case (opcode)
            /* type R */
            op_type_r: begin
                case (func)
                    // addu rd, rs, rt  => rd = rs + rt;
                    func_addu: begin
                        write_reg   = 1'b1;
                        write_mem   = 1'b0;
                        use_imm     = 1'b0;
                        read_ram    = 1'b0;
                        dst_reg     = dst_reg_rd;
                        jal         = 1'b0;
                        alu_ctrl    = ALU.ctrl_addu;
                    end
                    default: begin
                        write_reg   = 1'b0;
                        write_mem   = 1'b0;
                        use_imm     = 1'b0;
                        read_ram    = 1'b0;
                        dst_reg     = dst_reg_rt;
                        jal         = 1'b0;
                        alu_ctrl    = ALU.ctrl_invalid;
                    end
                endcase
            end

            /* type I */
            // addiu    rt, rs, imm => rt = rs + imm;
            op_addiu: begin    
                write_reg   = 1'b1;
                write_mem   = 1'b0;
                use_imm     = 1'b1;
                read_ram    = 1'b0;
                dst_reg     = dst_reg_rt;
                jal         = 1'b0;
                alu_ctrl    = ALU.ctrl_addiu;
            end
            // sw   rt, imm(rs) => *(int*)(offset + rs) = rt;
            op_sw: begin    
                write_reg   = 1'b0;
                write_mem   = 1'b1;
                use_imm     = 1'b1;
                read_ram    = 1'b0;
                // dst_reg     = dst_reg_rt; doesn't care ...
                jal         = 1'b0;
                alu_ctrl    = ALU.ctrl_sw;
            end
            // lw   rt, imm(rs) => rt = *(int*)(offset + rs)
            op_lw: begin
                write_reg   = 1'b1;
                write_mem   = 1'b0;
                use_imm     = 1'b1;
                read_ram    = 1'b1;
                dst_reg     = dst_reg_rt;
                jal         = 1'b0;
                alu_ctrl    = ALU.ctrl_lw;
            end

            /* type J */
            // jal  label   => r31 = pc; pc = target << 2
            op_jal: begin
                write_reg   = 1'b1;
                write_mem   = 1'b0;
                use_imm     = 1'b0;
                read_ram    = 1'b0;
                dst_reg     = dst_reg_ra;
                jal         = 1'b1;
                alu_ctrl    = ALU.ctrl_jal;
            end

            default: begin
                write_reg   = 1'b0;
                write_mem   = 1'b0;
                use_imm     = 1'b0;
                read_ram    = 1'b0;
                jal         = 1'b0;
                alu_ctrl    = ALU.ctrl_invalid;
            end
        endcase
    end
endmodule