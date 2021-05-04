/**
 * name: ram.sv
 * desc: 32bit RAM
 */

module RAM (
    input   logic           clk,
    input   logic           write_enable,
    input   logic [31:0]    addr,
    input   logic [31:0]    set_val,
    output  logic [31:0]    val
);
    logic [7:0] mem [65535:0] = '{default:'d0};

    always_ff @(posedge clk) begin
        if (write_enable) begin
            mem[addr+3]   <= set_val[31:24];
            mem[addr+2]   <= set_val[23:16];
            mem[addr+1]   <= set_val[15:8];
            mem[addr+0]   <= set_val[7:0];
        end
    end

    assign val = {
        mem[addr+3],
        mem[addr+2],
        mem[addr+1],
        mem[addr]
    };
endmodule