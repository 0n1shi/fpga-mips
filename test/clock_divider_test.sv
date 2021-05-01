module clock_divider_test;
    logic clock = 0;

    logic pc = 0;
    logic register = 0;
    logic mem = 0;

    clock_divider clock_divider(.clock, .pc, .register, .mem);

    initial begin
        forever #(10) clock <= ~clock;    
    end
endmodule