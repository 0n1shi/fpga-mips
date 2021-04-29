module program_coutner (
    input   logic           clock,
    input   logic [31:0]    in,
    output  logic [31:0]    out
);
    always_ff @(posedge clock) begin
        out <= in;
    end
endmodule