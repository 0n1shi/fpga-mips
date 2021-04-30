module sign_extender_test;
    logic [15:0] in;
    logic [31:0] out;

    sign_extender sign_extender(.in, .out);

    parameter WAIT = 10; // ps

    initial begin
        in = 0; out = 0;

        #WAIT;
        in = 65;
        
        #WAIT;
        in = -128;
    end
endmodule