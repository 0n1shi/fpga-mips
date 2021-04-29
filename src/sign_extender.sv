/**
 * name: sign_extender.sv
 * desc: extend 16bit value into signed 32bit
 */

module sign_extender (
    input   logic [15:0] in,
    output  logic [31:0] out
);
    assign out = {in[15] >>> 7, in};
endmodule