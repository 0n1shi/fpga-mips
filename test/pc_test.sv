module program_counter_test;
    logic           clock   = 0;
    logic [31:0]    current = 4;
    logic [31:0]    next    = 0;

    PC pc(
        .clock, 
        .in(next), 
        .out(current)
    );

    pc_inc pc_inc(
        .in(current), 
        .out(next)
    );

    initial begin
        forever #10 clock = ~clock;
    end
endmodule