module alu_test;
    logic [2:0]     control = 0;
    logic [31:0]    src1    = 0;
    logic [31:0]    src2    = 0;
    logic           zero    = 0;
    logic [31:0]    result  = 0;

    ALU alu(
        .control,
        .src1,
        .src2,
        .zero,
        .result
    );

    initial begin
        #10;
        src1 = 10;

        #10
        src2 = 10;

        #10
        control = 3'b010;
    end
endmodule