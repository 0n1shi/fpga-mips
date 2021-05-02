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
    logic [7:0] mem [15:0] = '{default:'d0};

    always_ff @(posedge clock) begin
        if (write_enable) begin
            mem[addr+3]   <= set_value[31:24];
            mem[addr+2]   <= set_value[23:16];
            mem[addr+1]   <= set_value[15:8];
            mem[addr+0]   <= set_value[7:0];
        end

        value <= {
            mem[addr+3],
            mem[addr+2],
            mem[addr+1],
            mem[addr]
        };
    end
    
endmodule