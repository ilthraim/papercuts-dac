
module aes_cipher_top_u0 (
    input logic clk,
    input logic kld,
    input logic[127:0] key,
    output reg[31:0] w0,
    output reg[31:0] w1,
    output reg[31:0] w2,
    output reg[31:0] w3,
    output reg[31:0] w4_reg,
    output reg[31:0] w5_reg,
    output reg[31:0] w6_reg,
    output reg[31:0] w7_reg
);
    reg[31:0] w4;
    reg[31:0] w5;
    reg[31:0] w6;
    reg[31:0] w7;
    wire logic[31:0] subword;
    wire logic[31:0] subword2;
    wire logic[31:0] rcon;
    wire logic[31:0] rcon2;
    always @(posedge clk) begin
        w4_reg <= w4;
        w5_reg <= w5;
        w6_reg <= w6;
        w7_reg <= w7;
    end
    always @* begin
        w0 = (kld ? key[127:96] : ((w4_reg ^ subword2) ^ {rcon[31:24], 24'd0}));
        w1 = (kld ? key[95:64] : (((w5_reg ^ w4_reg) ^ subword2) ^ {rcon[31:24], 24'd0}));
        w2 = (kld ? key[63:32] : ((((w6_reg ^ w5_reg) ^ w4_reg) ^ subword2) ^ {rcon[31:24], 24'd0}));
        w3 = (kld ? key[31:0] : (((((w7_reg ^ w6_reg) ^ w5_reg) ^ w4_reg) ^ subword2) ^ {rcon[31:24], 24'd0}));
        w4 = ( ((w0 ^ subword) ^ {rcon2[31:24], 24'd0}));
        w5 = ( (((w1 ^ w0) ^ subword) ^ {rcon2[31:24], 24'd0}));
        w6 = ( ((((w2 ^ w1) ^ w0) ^ subword) ^ {rcon2[31:24], 24'd0}));
        w7 = ( (((((w3 ^ w2) ^ w1) ^ w0) ^ subword) ^ {rcon2[31:24], 24'd0}));
    end
    aes_cipher_top_u0_inst1 inst1 (
        .a(w3[23:16]),
        .d(subword[31:24])
    );
    aes_cipher_top_u0_inst2 inst2 (
        .a(w3[15:8]),
        .d(subword[23:16])
    );
    aes_cipher_top_u0_inst3 inst3 (
        .a(w3[7:0]),
        .d(subword[15:8])
    );
    aes_cipher_top_u0_inst4 inst4 (
        .a(w3[31:24]),
        .d(subword[7:0])
    );
    aes_cipher_top_u0_inst5 inst5 (
        .clk(clk),
        .kld(kld),
        .out(rcon[31:24]),
        .out2(rcon2[31:24])
    );
    aes_cipher_top_u0_u4 u4 (
        .a(w7_reg[23:16]),
        .d(subword2[31:24])
    );
    aes_cipher_top_u0_u5 u5 (
        .a(w7_reg[15:8]),
        .d(subword2[23:16])
    );
    aes_cipher_top_u0_u6 u6 (
        .a(w7_reg[7:0]),
        .d(subword2[15:8])
    );
    aes_cipher_top_u0_u7 u7 (
        .a(w7_reg[31:24]),
        .d(subword2[7:0])
    );
endmodule