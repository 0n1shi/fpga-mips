/**
 * name: rom.sv
 * desc: 32bit ROM
 */

module ROM (
    input   logic [31:0] addr,
    output  logic [31:0] val
);
    always_comb begin
        case(addr)
            // deploy instructions later ...
            32'h00000000: value = 32'b001000_00001_00010_0000001111101000;   // addi $at, $v0, 1000
            default: value = 32'b0;
        endcase
    end
endmodule