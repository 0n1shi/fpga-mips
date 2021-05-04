module decoder (
    input   logic [5:0]     opcode,
    input   logic [5:0]     func,
    output  logic           write_reg   = 'b0,
    output  logic           write_mem   = 'b0,
    output  logic [11:0]    alu_ctrl    = 12'b0
);
    always_comb begin
        case (opcode)
            /* type R */
            6'b000000: begin
                case (func)
                    default: begin
                        write_reg   = 1'b0;
                        write_mem   = 1'b0;
                        alu_ctrl    = 12'hFFF;
                    end
                endcase
            end

            /* type I */
            6'b001001: begin    // addiu	rt, rs, imm     == rt=rs+imm
                write_reg   = 1'b1;
                write_mem   = 1'b0;
                alu_ctrl    = 12'b001001000000;
            end
            6'b101011: begin    // sw	    rt, imm(rs)     == *(int*)(offset+rs)=rt
                write_reg   = 1'b0;
                write_mem   = 1'b1;
                alu_ctrl    = 12'b101011000000;
            end
            default: begin
                write_reg   = 1'b0;
                write_mem   = 1'b0;
                alu_ctrl    = 12'hFFF;
            end
        endcase
    end
endmodule