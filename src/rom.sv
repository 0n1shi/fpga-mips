/**
 * name: rom.sv
 * desc: 32bit ROM
 */

module rom (
    input logic [31:0] address,
    output logic [31:0] data
);
    always_comb begin
        case(address)
            // deploy instructions later ...
            default: data = 31'b0;
    end
endmodule