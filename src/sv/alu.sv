/**
 * name: alu.sv
 * desc: 
 */

module ALU (
    input   logic [3:0]     ctrl,
    input   logic [31:0]    arg1,
    input   logic [31:0]    arg2,
    output  logic           zero        = 'd0, // zero or not
    output  logic [31:0]    result      = 32'd0 
);
    /* ctrls */
    parameter ctrl_addiu    = 4'b0000;
    parameter ctrl_sw       = 4'b0001;
    parameter ctrl_addu     = 4'b0010;
    parameter ctrl_jal      = 4'b0011;
    parameter ctrl_lw       = 4'b0100;
    parameter ctrl_or       = 4'b0101;
    parameter ctrl_bne      = 4'b0110;
    parameter ctrl_invalid  = 4'bxxxx;

    always_comb begin
        zero = arg1 == arg2 ? 1'b1 : 1'b0;
        case (ctrl)
            /* addiu */
            ctrl_addiu: begin
                result = arg1 + arg2;
            end
            /* sw */
            ctrl_sw: begin
                result = arg1 + arg2;
            end
            /* addu */
            ctrl_addu: begin
                result = arg1 + arg2;
            end
            ctrl_jal: begin
                // don't need ALU
            end
            ctrl_lw: begin
                result = arg1 + arg2;
            end
            ctrl_or: begin
                result = arg1 | arg2;
            end
            ctrl_bne: begin
                // don't need ALU
            end
            default: begin
                zero    = 1'bx;
                result  = 32'bx;
            end
        endcase
    end
endmodule