module register_file_test;
    logic       clock           = 0;
    logic       write_enable    = 0;
    
    logic [4:0]     selector_out1   = 0;
    logic [4:0]     selector_out2   = 0;
    logic [4:0]     selector_in1    = 0;

    logic [31:0]    value_out1  = 0;
    logic [31:0]    value_out2  = 0;
    logic [31:0]    value_in1   = 0;

    register_file rf(
        .clock,
        .write_enable,
        .selector_out1,
        .selector_out2,
        .selector_in1,
        .value_out1,
        .value_out2,
        .value_in1
    );

    initial begin
        forever #5 clock = ~clock;
    end

    initial begin
        selector_out1 = 1;
        selector_out2 = 2;
        #10;

        write_enable = 1;
        selector_in1 = 1;
        value_in1 = 10;
        #10;

        selector_in1 = 2;
        value_in1 = 20;
        #10;

        selector_in1 = 0;
        value_in1 = 10;
        #10;

        selector_out1 = 0;
    end
endmodule