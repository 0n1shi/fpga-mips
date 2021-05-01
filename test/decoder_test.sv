module decoder_test;
    logic [5:0] opcode;
    logic [5:0] func;
    logic       write_reg;
    logic [5:0] alu_control;

    decoder dc(
        .opcode,
        .func,
        .write_reg,
        .alu_control
    );

    initial begin
        opcode  = 6'b000000;
        func    = 6'b100001;
    end
endmodule