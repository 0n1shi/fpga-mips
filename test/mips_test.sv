module mips_test;
    logic clk = 1'd0;
    logic [31:0] debug_ra;
    logic debug_jr;
    logic [3:0] debug_alu_ctrl;
    
    mips mips(.clk, .debug_ra, .debug_jr, .debug_alu_ctrl);

    initial begin
        forever #(10) clk <= ~clk;
    end

    always_comb begin
        if (debug_ra == 32'b0 && debug_jr) $stop;
        if (debug_alu_ctrl == 'bx) $stop;
    end
endmodule