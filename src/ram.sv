/**
 * name: ram.sv
 * desc: 32bit RAM
 */

module ram (
    input   logic           clock,
    input   logic           write_enable,
    input   logic [31:0]    address,
    input   logic [31:0]    in,
    output  logic [31:0]    out
);
    logic [31:0] memory [7:0];

    always_ff @(posedge clock) begin
        if (write_enable) begin
            memory[address+3]   <= in[31:24];
            memory[address+2]   <= in[23:16];
            memory[address+1]   <= in[15:8];
            memory[address+0]   <= in[7:0];
        end
    end

    assign out = {
        memory[address+3],
        memory[address+2],
        memory[address+1],
        memory[address]
    };
endmodule