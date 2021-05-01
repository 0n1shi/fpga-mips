/**
 * name: rom.sv
 * desc: 32bit ROM
 */

module ROM (
    input   logic [31:0] address,
    output  logic [31:0] data
);
    always_comb begin
        case(address)
            // deploy instructions later ...
            32'h00000000: data = 32'b001000_00001_00010_0000001111101000;   // addi $at, $v0, 1000
            default: data = 32'b0;
        endcase
    end
endmodule