
module aes_cipher_top_u0 (
    input logic clk,
    input logic[127:0] key,
    output reg[31:0] w0,
    output reg[31:0] w1,
    output reg[31:0] w2,
    output reg[31:0] w3,
    output reg[31:0] w4,
    output reg[31:0] w5,
    output reg[31:0] w6,
    output reg[31:0] w7,
    output reg[31:0] w8,
    output reg[31:0] w9,
    output reg[31:0] w10,
    output reg[31:0] w11,
    output reg[31:0] w12,
    output reg[31:0] w13,
    output reg[31:0] w14,
    output reg[31:0] w15,
    output reg[31:0] w16,
    output reg[31:0] w17,
    output reg[31:0] w18,
    output reg[31:0] w19,
    output reg[31:0] w20,
    output reg[31:0] w21,
    output reg[31:0] w22,
    output reg[31:0] w23,
    output reg[31:0] w24,
    output reg[31:0] w25,
    output reg[31:0] w26,
    output reg[31:0] w27,
    output reg[31:0] w28,
    output reg[31:0] w29,
    output reg[31:0] w30,
    output reg[31:0] w31,
    output reg[31:0] w32,
    output reg[31:0] w33,
    output reg[31:0] w34,
    output reg[31:0] w35,
    output reg[31:0] w36,
    output reg[31:0] w37,
    output reg[31:0] w38,
    output reg[31:0] w39,
    output reg[31:0] w40,
    output reg[31:0] w41,
    output reg[31:0] w42,
    output reg[31:0] w43
);
    wire logic[31:0] subword;
    wire logic[31:0] subword2;
    wire logic[31:0] subword3;
    wire logic[31:0] subword4;
    wire logic[31:0] subword5;
    wire logic[31:0] subword6;
    wire logic[31:0] subword7;
    wire logic[31:0] subword8;
    wire logic[31:0] subword9;
    wire logic[31:0] subword10;
    wire logic [0:0] rcon;
    wire logic [1:0] rcon2;
    wire logic [2:0] rcon3;
    wire logic [3:0] rcon4;
    wire logic [4:0] rcon5;
    wire logic [5:0] rcon6;
    wire logic [6:0] rcon7;
    wire logic[7:0] rcon8;
    wire logic [4:0] rcon9;
    wire logic [5:0] rcon10;
    always @* begin
        w0 = key[127:96];
        w1 = key[95:64];
        w2 = key[63:32];
        w3 = key[31:0];
        w4 = ((key[127:96] ^ subword) ^ 32'd16777216);
        w5 = (((key[95:64] ^ key[127:96]) ^ subword) ^ 32'd16777216);
        w6 = ((((key[63:32] ^ key[95:64]) ^ key[127:96]) ^ subword) ^ 32'd16777216);
        w7 = (((((key[127:96] ^ key[95:64]) ^ key[63:32]) ^ key[31:0]) ^ subword) ^ 32'd16777216);
        w8 = ((w4 ^ subword2) ^ {rcon2, 24'd0});
        w9 = (((w5 ^ w4) ^ subword2) ^ {rcon2, 24'd0});
        w10 = ((((w6 ^ w5) ^ w4) ^ subword2) ^ {rcon2, 24'd0});
        w11 = (((((w7 ^ w6) ^ w5) ^ w4) ^ subword2) ^ {rcon2, 24'd0});
        w12 = ((w8 ^ subword3) ^ {rcon3, 24'd0});
        w13 = (((w8 ^ w9) ^ subword3) ^ {rcon3, 24'd0});
        w14 = ((((w8 ^ w9) ^ w10) ^ subword3) ^ {rcon3, 24'd0});
        w15 = (((((w8 ^ w9) ^ w10) ^ w11) ^ subword3) ^ {rcon3, 24'd0});
        w16 = ((w12 ^ subword4) ^ {rcon4, 24'd0});
        w17 = (((w12 ^ w13) ^ subword4) ^ {rcon4, 24'd0});
        w18 = ((((w12 ^ w13) ^ w14) ^ subword4) ^ {rcon4, 24'd0});
        w19 = (((((w12 ^ w13) ^ w14) ^ w15) ^ subword4) ^ {rcon4, 24'd0});
        w20 = ((w16 ^ subword5) ^ {rcon5, 24'd0});
        w21 = (((w16 ^ w17) ^ subword5) ^ {rcon5, 24'd0});
        w22 = ((((w16 ^ w17) ^ w18) ^ subword5) ^ {rcon5, 24'd0});
        w23 = (((((w16 ^ w17) ^ w18) ^ w19) ^ subword5) ^ {rcon5, 24'd0});
        w24 = ((w20 ^ subword6) ^ {rcon6, 24'd0});
        w25 = (((w20 ^ w21) ^ subword6) ^ {rcon6, 24'd0});
        w26 = ((((w20 ^ w21) ^ w22) ^ subword6) ^ {rcon6, 24'd0});
        w27 = (((((w20 ^ w21) ^ w22) ^ w23) ^ subword6) ^ {rcon6, 24'd0});
        w28 = ((w24 ^ subword7) ^ {rcon7, 24'd0});
        w29 = (((w24 ^ w25) ^ subword7) ^ {rcon7, 24'd0});
        w30 = ((((w24 ^ w25) ^ w26) ^ subword7) ^ {rcon7, 24'd0});
        w31 = (((((w24 ^ w25) ^ w26) ^ w27) ^ subword7) ^ {rcon7, 24'd0});
        w32 = ((w28 ^ subword8) ^ {rcon8, 24'd0});
        w33 = (((w28 ^ w29) ^ subword8) ^ {rcon8, 24'd0});
        w34 = ((((w28 ^ w29) ^ w30) ^ subword8) ^ {rcon8, 24'd0});
        w35 = (((((w28 ^ w29) ^ w30) ^ w31) ^ subword8) ^ {rcon8, 24'd0});
        w36 = ((w32 ^ subword9) ^ {rcon9, 24'd0});
        w37 = (((w32 ^ w33) ^ subword9) ^ {rcon9, 24'd0});
        w38 = ((((w32 ^ w33) ^ w34) ^ subword9) ^ {rcon9, 24'd0});
        w39 = (((((w32 ^ w33) ^ w34) ^ w35) ^ subword9) ^ {rcon9, 24'd0});
        w40 = ((w36 ^ subword10) ^ {rcon10, 24'd0});
        w41 = (((w36 ^ w37) ^ subword10) ^ {rcon10, 24'd0});
        w42 = ((((w36 ^ w37) ^ w38) ^ subword10) ^ {rcon10, 24'd0});
        w43 = (((((w36 ^ w37) ^ w38) ^ w39) ^ subword10) ^ {rcon10, 24'd0});
    end
    aes_cipher_top_u0_inst5 inst5 (
        .clk(clk),
        .out(rcon),
        .out2(rcon2),
        .out3(rcon3),
        .out4(rcon4),
        .out5(rcon5),
        .out6(rcon6),
        .out7(rcon7),
        .out8(rcon8),
        .out9(rcon9),
        .out10(rcon10)
    );
    aes_cipher_top_u0_u0 u0 (
        .a(w3[23:16]),
        .d(subword[31:24])
    );
    aes_cipher_top_u0_u1 u1 (
        .a(w3[15:8]),
        .d(subword[23:16])
    );
    aes_cipher_top_u0_u2 u2 (
        .a(w3[7:0]),
        .d(subword[15:8])
    );
    aes_cipher_top_u0_u3 u3 (
        .a(w3[31:24]),
        .d(subword[7:0])
    );
    aes_cipher_top_u0_u4 u4 (
        .a(w7[23:16]),
        .d(subword2[31:24])
    );
    aes_cipher_top_u0_u5 u5 (
        .a(w7[15:8]),
        .d(subword2[23:16])
    );
    aes_cipher_top_u0_u6 u6 (
        .a(w7[7:0]),
        .d(subword2[15:8])
    );
    aes_cipher_top_u0_u7 u7 (
        .a(w7[31:24]),
        .d(subword2[7:0])
    );
    aes_cipher_top_u0_u8 u8 (
        .a(w11[23:16]),
        .d(subword3[31:24])
    );
    aes_cipher_top_u0_u9 u9 (
        .a(w11[15:8]),
        .d(subword3[23:16])
    );
    aes_cipher_top_u0_u10 u10 (
        .a(w11[7:0]),
        .d(subword3[15:8])
    );
    aes_cipher_top_u0_u11 u11 (
        .a(w11[31:24]),
        .d(subword3[7:0])
    );
    aes_cipher_top_u0_u12 u12 (
        .a(w15[23:16]),
        .d(subword4[31:24])
    );
    aes_cipher_top_u0_u13 u13 (
        .a(w15[15:8]),
        .d(subword4[23:16])
    );
    aes_cipher_top_u0_u14 u14 (
        .a(w15[7:0]),
        .d(subword4[15:8])
    );
    aes_cipher_top_u0_u15 u15 (
        .a(w15[31:24]),
        .d(subword4[7:0])
    );
    aes_cipher_top_u0_u16 u16 (
        .a(w19[23:16]),
        .d(subword5[31:24])
    );
    aes_cipher_top_u0_u17 u17 (
        .a(w19[15:8]),
        .d(subword5[23:16])
    );
    aes_cipher_top_u0_u18 u18 (
        .a(w19[7:0]),
        .d(subword5[15:8])
    );
    aes_cipher_top_u0_u19 u19 (
        .a(w19[31:24]),
        .d(subword5[7:0])
    );
    aes_cipher_top_u0_u20 u20 (
        .a(w23[23:16]),
        .d(subword6[31:24])
    );
    aes_cipher_top_u0_u21 u21 (
        .a(w23[15:8]),
        .d(subword6[23:16])
    );
    aes_cipher_top_u0_u22 u22 (
        .a(w23[7:0]),
        .d(subword6[15:8])
    );
    aes_cipher_top_u0_u23 u23 (
        .a(w23[31:24]),
        .d(subword6[7:0])
    );
    aes_cipher_top_u0_u24 u24 (
        .a(w27[23:16]),
        .d(subword7[31:24])
    );
    aes_cipher_top_u0_u25 u25 (
        .a(w27[15:8]),
        .d(subword7[23:16])
    );
    aes_cipher_top_u0_u26 u26 (
        .a(w27[7:0]),
        .d(subword7[15:8])
    );
    aes_cipher_top_u0_u27 u27 (
        .a(w27[31:24]),
        .d(subword7[7:0])
    );
    aes_cipher_top_u0_u28 u28 (
        .a(w31[23:16]),
        .d(subword8[31:24])
    );
    aes_cipher_top_u0_u29 u29 (
        .a(w31[15:8]),
        .d(subword8[23:16])
    );
    aes_cipher_top_u0_u30 u30 (
        .a(w31[7:0]),
        .d(subword8[15:8])
    );
    aes_cipher_top_u0_u31 u31 (
        .a(w31[31:24]),
        .d(subword8[7:0])
    );
    aes_cipher_top_u0_u32 u32 (
        .a(w35[23:16]),
        .d(subword9[31:24])
    );
    aes_cipher_top_u0_u33 u33 (
        .a(w35[15:8]),
        .d(subword9[23:16])
    );
    aes_cipher_top_u0_u34 u34 (
        .a(w35[7:0]),
        .d(subword9[15:8])
    );
    aes_cipher_top_u0_u35 u35 (
        .a(w35[31:24]),
        .d(subword9[7:0])
    );
    aes_cipher_top_u0_u36 u36 (
        .a(w39[23:16]),
        .d(subword10[31:24])
    );
    aes_cipher_top_u0_u37 u37 (
        .a(w39[15:8]),
        .d(subword10[23:16])
    );
    aes_cipher_top_u0_u38 u38 (
        .a(w39[7:0]),
        .d(subword10[15:8])
    );
    aes_cipher_top_u0_u39 u39 (
        .a(w39[31:24]),
        .d(subword10[7:0])
    );
endmodule