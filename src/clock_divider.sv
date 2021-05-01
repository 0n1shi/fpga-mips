module clock_divider (
    input   logic clock,
    output  logic clock_pc  = 0,
    output  logic clock_reg = 0,
    output  logic clock_mem = 0
);
    logic [2:0] counter = 0;

    always_ff @(posedge clock) begin 
        clock_reg   <= 0;
        clock_mem   <= 0;
        clock_pc    <= 0;

        case (counter)
            3'b00: clock_reg    <= 1;
            3'b01: clock_mem    <= 1;
            3'b10: clock_reg    <= 1;
            3'b11: clock_pc     <= 1;
        endcase

        counter <= counter + 1;
    end        

endmodule