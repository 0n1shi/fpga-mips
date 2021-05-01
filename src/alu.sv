/**
 * name: alu.sv
 * desc: 
 */

module ALU (
    input   logic [5:0]     control,
    input   logic [31:0]    src1,
    input   logic [31:0]    src2,
    output  logic           zero        = 0, // zero or not
    output  logic [31:0]    result 
);
    always_comb 
        case (control)
            4'b010: begin
                result = src1 + src2;
                zero = src1 == src2 ? 1 : 0;
            end
            default: begin
                result = 0;
                zero = 0;
            end
        endcase
endmodule