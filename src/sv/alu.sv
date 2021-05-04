/**
 * name: alu.sv
 * desc: 
 */

module ALU (
    input   logic [11:0]    ctrl,
    input   logic [31:0]    src1,
    input   logic [31:0]    src2,
    output  logic           zero        = 'd0, // zero or not
    output  logic [31:0]    result      = 32'd0 
);
    always_comb 
        case (ctrl)
            /* addiu */
            12'b001001000000: begin
                zero    = src1 == src2 ? 1'b1 : 1'b0;
                result  = src1 + src2;
            end
            /* sw */
            12'b101011000000: begin
                zero    = src1 == src2 ? 1'b1 : 1'b0;
                result  = src1 + src2;
            end
            default: begin
                zero    = 1'b0;
                result  = 32'b0;
            end
        endcase
endmodule