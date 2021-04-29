/**
 * name: sign_extender.sv
 * desc: extend 16bit value into signed 32bit
 */

// i wanna write this with "logic" ...

module sign_extender (
    input   shortint in,
    output  int out
);
    assign out = {in >>> 15, in};
endmodule