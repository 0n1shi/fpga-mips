/**
 * name: rom.sv
 * desc: 32bit ROM
 */

module ROM (
    input   logic [31:0] addr,
    output  logic [31:0] val
);
    always_comb begin
        case(addr)
            // src/c/fib.c
            32'h00:     val = 32'h27BDFFE0;     //  addiu   sp,sp,-32
            32'h04:     val = 32'hAFBF001C;     //  sw      ra,28(sp)
            32'h08:     val = 32'hAFBE0018;     //  sw      s8,24(sp)
            32'h0C:     val = 32'h03A0F021;     //  move    s8,sp           // (addu)
            32'h10:     val = 32'h2404000A;     //  li      a0,10           // (addiu)
            32'h14:     val = 32'h0C000011;     //  jal     0x44
            32'h18:     val = 32'h00200825;     //  move    at,at
            32'h1C:     val = 32'h00401821;     //  move    v1,v0
            32'h20:     val = 32'h3C020001;     //  lui     v0,0x1
            32'h24:     val = 32'hAC438000;     //  sw      v1,-32768(v0)
            32'h28:     val = 32'h00001021;     //  move    v0,zero
            32'h2C:     val = 32'h03C0E821;     //  move    sp,s8
            32'h30:     val = 32'h8FBF001C;     //  lw      ra,28(sp)
            32'h34:     val = 32'h8FBE0018;     //  lw      s8,24(sp)
            32'h38:     val = 32'h27BD0020;     //  addiu   sp,sp,32
            32'h3C:     val = 32'h03E00008;     //  jr      ra
            32'h40:     val = 32'h00200825;     //  move    at,at
            32'h44:     val = 32'h27BDFFD8;     //  addiu   sp,sp,-40
            32'h48:     val = 32'hAFBF0024;     //  sw      ra,36(sp)
            32'h4C:     val = 32'hAFBE0020;     //  sw      s8,32(sp)
            32'h50:     val = 32'hAFB0001C;     //  sw      s0,28(sp)
            32'h54:     val = 32'h03A0F021;     //  move    s8,sp            // (addu)
            32'h58:     val = 32'hAFC40028;     //  sw      a0,40(s8)
            32'h5C:     val = 32'h8FC20028;     //  lw      v0,40(s8)
            32'h60:     val = 32'h00200825;     //  move    at,at
            32'h64:     val = 32'h14400004;     //  bnez    v0,0x78
            32'h68:     val = 32'h00200825;     //  move    at,at
            32'h6C:     val = 32'h00001021;     //  move    v0,zero
            32'h70:     val = 32'h08000033;     //  j       0xcc
            32'h74:     val = 32'h00200825;     //  move    at,at
            32'h78:     val = 32'h8FC30028;     //  lw      v1,40(s8)
            32'h7C:     val = 32'h24020001;     //  li      v0,1            // (addiu)
            32'h80:     val = 32'h14620004;     //  bne     v1,v0,0x94
            32'h84:     val = 32'h00200825;     //  move    at,at
            32'h88:     val = 32'h24020001;     //  li      v0,1            // (addiu)
            32'h8C:     val = 32'h08000033;     //  j       0xcc
            32'h90:     val = 32'h00200825;     //  move    at,at
            32'h94:     val = 32'h8FC20028;     //  lw      v0,40(s8)
            32'h98:     val = 32'h00200825;     //  move    at,at
            32'h9C:     val = 32'h2442FFFF;     //  addiu   v0,v0,-1
            32'hA0:     val = 32'h00402021;     //  move    a0,v0
            32'hA4:     val = 32'h0C000011;     //  jal     0x44
            32'hA8:     val = 32'h00200825;     //  move    at,at
            32'hAC:     val = 32'h00408021;     //  move    s0,v0
            32'hB0:     val = 32'h8FC20028;     //  lw      v0,40(s8)
            32'hB4:     val = 32'h00200825;     //  move    at,at
            32'hB8:     val = 32'h2442FFFE;     //  addiu   v0,v0,-2
            32'hBC:     val = 32'h00402021;     //  move    a0,v0
            32'hC0:     val = 32'h0C000011;     //  jal     0x44
            32'hC4:     val = 32'h00200825;     //  move    at,at
            32'hC8:     val = 32'h02021021;     //  addu    v0,s0,v0
            32'hCC:     val = 32'h03C0E821;     //  move    sp,s8
            32'hD0:     val = 32'h8FBF0024;     //  lw      ra,36(sp)
            32'hD4:     val = 32'h8FBE0020;     //  lw      s8,32(sp)
            32'hD8:     val = 32'h8FB0001C;     //  lw      s0,28(sp)
            32'hDC:     val = 32'h27BD0028;     //  addiu   sp,sp,40
            32'hE0:     val = 32'h03E00008;     //  jr      ra
            32'hE4:     val = 32'h00200825;     //  move    at,at
            32'hE8:     val = 32'h00200825;     //  move    at,at
            32'hEC:     val = 32'h00200825;     //  move    at,at
            default:    val = 32'hxxxxxxxx;
        endcase
    end
endmodule