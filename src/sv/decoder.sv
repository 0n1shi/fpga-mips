module decoder (
    input   logic [5:0]     opcode,
    input   logic [5:0]     func,
    output  logic           write_reg = 0,
    output  logic [11:0]    alu_ctrl = 0
);
    always_comb begin
        case (opcode)
            /* type R */
            6'b000000: begin
                case (func)
                    /* ADDU rd,rs,rt */
                    6'b100001: begin
                        write_reg = 1'b1;
                        alu_ctrl = 12'b000000100001;
                    end
                    default: begin
                        write_reg = 'b0;
                        alu_ctrl = 12'hFFF;
                    end
                endcase
            end

            /* addi: Add Immediate (rt=rs+imm) */
            6'b001000: begin
                write_reg = 1'b1;
                alu_ctrl = 12'b001000000000;
            end
            default: begin
                write_reg = 1'b0;
                alu_ctrl = 12'hFFF;
            end
        endcase
    end
endmodule