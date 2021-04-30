/**
 * name: pc.sv
 * desc: 32bit program counter
 */

module program_counter (
    input   logic           clock,
    input   logic [31:0]    in,
    output  logic [31:0]    out     = 32'd0
);
    always_ff @(posedge clock) begin
        out <= in;
    end
endmodule