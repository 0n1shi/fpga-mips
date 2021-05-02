/**
 * name: pc.sv
 * desc: 32bit program counter
 */

module PC (
    input   logic           clk,
    input   logic [31:0]    next,
    output  logic [31:0]    current = 32'd0
);
    always_ff @(posedge clk) begin
        current <= next;
    end
endmodule