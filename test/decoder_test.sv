module decoder_test;
    logic [5:0]     opcode;
    logic [5:0]     func;
    logic           write_reg;
    logic [11:0]    alu_ctrl;

    decoder dc(
        .opcode,
        .func,
        .write_reg,
        .alu_ctrl
    );

    initial begin
        opcode  = 6'b000000;
        func    = 6'b100001;

        #10;

        opcode  = 6'b000000;
        func    = 6'b000000;
    end
endmodule