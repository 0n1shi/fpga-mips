/**
 * name: sign_extender.sv
 * desc: sign extend 16bit value into signed 32bit
 */

module sign_ext (
    input   logic signed    [15:0] org_val,
    output  logic           [31:0] val
);
    assign val = {org_val >>> 15, org_val};
endmodule