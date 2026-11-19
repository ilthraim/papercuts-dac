
module aes_inv_cipher_top_u0 (
    input logic clk,
    input logic kld,
    input logic[127:0] key,
    output logic[31:0] wo_0,
    output logic[31:0] wo_1,
    output logic[31:0] wo_2,
    output logic[31:0] wo_3
);
    reg[31:0] w[3:0];
    wire logic[31:0] tmp_w;
    wire logic[31:0] subword;
    wire logic[31:0] rcon;
    assign wo_0 = w[0];
    assign wo_1 = w[1];
    assign wo_2 = w[2];
    assign wo_3 = w[3];
    always @(posedge clk) begin
        w[0] <= (kld ? key[127:96] : ((w[0] ^ subword) ^ rcon));
    end
    always @(posedge clk) begin
        w[1] <= (kld ? key[95:64] : (((w[0] ^ w[1]) ^ subword) ^ rcon));
    end
    always @(posedge clk) begin
        w[2] <= (kld ? key[63:32] : ((((w[0] ^ w[2]) ^ w[1]) ^ subword) ^ rcon));
    end
    always @(posedge clk) begin
        w[3] <= (kld ? key[31:0] : (((((w[0] ^ w[3]) ^ w[2]) ^ w[1]) ^ subword) ^ rcon));
    end
    assign tmp_w = w[3];
    aes_inv_cipher_top_u0_u0 u0 (
        .a(tmp_w[23:16]),
        .d(subword[31:24])
    );
    aes_inv_cipher_top_u0_u1 u1 (
        .a(tmp_w[15:8]),
        .d(subword[23:16])
    );
    aes_inv_cipher_top_u0_u2 u2 (
        .a(tmp_w[7:0]),
        .d(subword[15:8])
    );
    aes_inv_cipher_top_u0_u3 u3 (
        .a(tmp_w[31:24]),
        .d(subword[7:0])
    );
    aes_inv_cipher_top_u0_r0 r0 (
        .clk(clk),
        .kld(kld),
        .out(rcon)
    );
endmodule