module test_sign_extender;

logic [15:0] in;
logic [31:0] out;

sign_extender sign_extender(.in, .out);

initial begin
    in = 0; out = 0;
    in = 65; #10;
    //in = -128; #10;
end

endmodule