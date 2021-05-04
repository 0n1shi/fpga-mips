module mips_test;
    logic clk = 1'd0;
    
    mips mips(.clk);

    initial begin
        forever #(10) clk <= ~clk;
    end
endmodule