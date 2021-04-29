/**
 * name: rom.sv
 * desc: 32bit ROM
 */

module rom (
    input   logic [31:0] address,
    output  logic [31:0] out
);
    always_comb begin
        case(address)
            // deploy instructions later ...
            default: out = 31'b0;
    end
endmodule