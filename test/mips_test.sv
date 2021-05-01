module mips_test;
    logic clock = 1'd0;
    
    mips mips(.clock);

    initial begin
        forever #(10) clock <= ~clock;
    end
endmodule