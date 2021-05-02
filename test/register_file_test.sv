module register_file_test;
    logic       clock           = 0;
    logic       write_enable_3  = 0;
    
    logic [4:0]     selector_1   = 0;
    logic [4:0]     selector_2   = 0;
    logic [4:0]     selector_3   = 0;

    logic [31:0]    value_1;
    logic [31:0]    value_2;
    logic [31:0]    value_3 = 0;

    register_file rf(
        .clock,
        .write_enable_3,
        .selector_1,
        .selector_2,
        .selector_3,
        .value_1,
        .value_2,
        .value_3
    );

    initial begin
        forever #5 clock = ~clock;
    end

    initial begin
        selector_1 = 1;
        selector_2 = 2;
        #10;

        selector_3 = 1;
        value_3 = 10;
        #10;

        write_enable_3 = 1;

        selector_3 = 2;
        value_3 = 20;
        #10;
    end
endmodule