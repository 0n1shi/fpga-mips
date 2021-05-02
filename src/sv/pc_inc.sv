/**
 * name: pc_inc
 * desc: increment and output new value for program counter
 */

module pc_inc  (
    input   logic [31:0] current,
    output  logic [31:0] next
);
    assign next = current + 4;
endmodule