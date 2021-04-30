/**
 * name: pc_inc
 * desc: increment and output new value for program counter
 */

module pc_inc  (
    input   logic [31:0] in,
    output  logic [31:0] out
);
    assign out = in + 4;
endmodule