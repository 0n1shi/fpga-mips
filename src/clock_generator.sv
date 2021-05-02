/**
 * name: clk_gen.sv
 * desc: clock generator for each components from original clock
 */

module clk_gen (
    input   logic clk,
    output  logic clk_pc  = 0,
    output  logic clk_reg = 0,
    output  logic clk_mem = 0
);
    logic [1:0] cnt = 0; // counter for generation of each clocks

    always_ff @(posedge clk) begin 
        clk_reg   <= 0;
        clk_mem   <= 0;
        clk_pc    <= 0;

        case (cnt)
            3'b00: clk_reg    <= 1;
            3'b01: clk_mem    <= 1;
            3'b10: clk_reg    <= 1;
            3'b11: clk_pc     <= 1;
        endcase

        cnt <= cnt + 1;
    end        

endmodule