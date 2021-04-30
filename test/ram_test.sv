module ram_test;
    logic           clock = 0;
    logic           write_enable = 0;
    logic [31:0]    address = 0;
    logic [31:0]    in = 0;
    logic [31:0]    out = 0;

    RAM ram(
        .clock,
        .write_enable,
        .address,
        .in,
        .out
    );

    initial begin
        forever #10 clock = ~clock;
    end

    initial begin
        address = 0;
        in = 294967295;
        write_enable = 'd1;
        #20;

        address = 4;
        in = 394967295;
        write_enable = 'd1;
        #20;

        address = 0;
        #20;

        address = 4;
        #20;
    end
endmodule