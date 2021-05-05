module decoder (
    input   logic [5:0]     opcode,
    input   logic [5:0]     func,
    output  logic           write_reg   = 'b0,
    output  logic           write_mem   = 'b0,
    output  logic           use_imm     = 'b0,
    output  logic           dst_reg     = 'b0,
    output  logic [11:0]    alu_ctrl    = 12'b0
);
    /* opcodes */
    parameter op_type_r = 6'b000000;
    parameter op_addiu  = 6'b001001;
    parameter op_sw     = 6'b101011;

    /* type R functions */
    parameter func_addu = 6'b100001;

    /* destination register */
    parameter dst_reg_rt = 'b0;
    parameter dst_reg_rd = 'b1;

    always_comb begin
        case (opcode)
            /* type R */
            op_type_r: begin
                case (func)
                    // addu rd, rs, rt => rd = rs + rt;
                    func_addu: begin
                        write_reg   = 1'b1;
                        write_mem   = 1'b0;
                        use_imm     = 1'b0;
                        dst_reg     = dst_reg_rd;
                        alu_ctrl    = ALU.ctrl_addu;
                    end
                    default: begin
                        write_reg   = 1'b0;
                        write_mem   = 1'b0;
                        use_imm     = 1'b0;
                        dst_reg     = dst_reg_rt;
                        alu_ctrl    = ALU.ctrl_invalid;
                    end
                endcase
            end

            /* type I */
            // addiu rt, rs, imm => rt = rs + imm;
            op_addiu: begin    
                write_reg   = 1'b1;
                write_mem   = 1'b0;
                use_imm     = 1'b1;
                dst_reg     = dst_reg_rt;
                alu_ctrl    = ALU.ctrl_addiu;
            end
            // sw rt, imm(rs) => *(int*)(offset+rs) = rt;
            op_sw: begin    
                write_reg   = 1'b0;
                write_mem   = 1'b1;
                use_imm     = 1'b1;
                alu_ctrl    = ALU.ctrl_sw;
            end
            default: begin
                write_reg   = 1'b0;
                write_mem   = 1'b0;
                use_imm     = 1'b0;
                alu_ctrl    = ALU.ctrl_invalid;
            end
        endcase
    end
endmodule