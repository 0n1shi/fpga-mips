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
        #10;

        address = 4;
        in = 10;
        write_enable = 'd1;
        #20;

        address = 0;
        in = 20;
        write_enable = 'd1;
        #20;

        address = 4;
        #10;
        
        address = 0;
        #10;
    end
endmodule