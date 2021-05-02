module clock_gen_test;
    logic clk = 0;

    logic clk_pc = 0;
    logic clk_reg = 0;
    logic clk_mem = 0;

    clk_gen clk_gen(.clk, .clk_pc, .clk_reg, .clk_mem);

    initial begin
        forever #(5) clk <= ~clk;    
    end
endmodule