module aes_cipher_top (
    input logic clk,
    input logic rst,
    input logic ld,
    output reg done,
    input logic[127:0] key,
    input logic[127:0] text_in,
    output reg[127:0] text_out
);
    wire logic[31:0] w0;
    wire logic[31:0] w1;
    wire logic[31:0] w2;
    wire logic[31:0] w3;
    reg[127:0] text_in_r;
    reg[7:0] sa00;
    reg[7:0] sa01;
    reg[7:0] sa02;
    reg[7:0] sa03;
    reg[7:0] sa10;
    reg[7:0] sa11;
    reg[7:0] sa12;
    reg[7:0] sa13;
    reg[7:0] sa20;
    reg[7:0] sa21;
    reg[7:0] sa22;
    reg[7:0] sa23;
    reg[7:0] sa30;
    reg[7:0] sa31;
    reg[7:0] sa32;
    reg[7:0] sa33;
    wire logic[7:0] sa00_next;
    wire logic[7:0] sa01_next;
    wire logic[7:0] sa02_next;
    wire logic[7:0] sa03_next;
    wire logic[7:0] sa10_next;
    wire logic[7:0] sa11_next;
    wire logic[7:0] sa12_next;
    wire logic[7:0] sa13_next;
    wire logic[7:0] sa20_next;
    wire logic[7:0] sa21_next;
    wire logic[7:0] sa22_next;
    wire logic[7:0] sa23_next;
    wire logic[7:0] sa30_next;
    wire logic[7:0] sa31_next;
    wire logic[7:0] sa32_next;
    wire logic[7:0] sa33_next;
    wire logic[7:0] sa00_sub;
    wire logic[7:0] sa01_sub;
    wire logic[7:0] sa02_sub;
    wire logic[7:0] sa03_sub;
    wire logic[7:0] sa10_sub;
    wire logic[7:0] sa11_sub;
    wire logic[7:0] sa12_sub;
    wire logic[7:0] sa13_sub;
    wire logic[7:0] sa20_sub;
    wire logic[7:0] sa21_sub;
    wire logic[7:0] sa22_sub;
    wire logic[7:0] sa23_sub;
    wire logic[7:0] sa30_sub;
    wire logic[7:0] sa31_sub;
    wire logic[7:0] sa32_sub;
    wire logic[7:0] sa33_sub;
    wire logic[7:0] sa00_sr;
    wire logic[7:0] sa01_sr;
    wire logic[7:0] sa02_sr;
    wire logic[7:0] sa03_sr;
    wire logic[7:0] sa10_sr;
    wire logic[7:0] sa11_sr;
    wire logic[7:0] sa12_sr;
    wire logic[7:0] sa13_sr;
    wire logic[7:0] sa20_sr;
    wire logic[7:0] sa21_sr;
    wire logic[7:0] sa22_sr;
    wire logic[7:0] sa23_sr;
    wire logic[7:0] sa30_sr;
    wire logic[7:0] sa31_sr;
    wire logic[7:0] sa32_sr;
    wire logic[7:0] sa33_sr;
    wire logic[7:0] sa00_mc;
    wire logic[7:0] sa01_mc;
    wire logic[7:0] sa02_mc;
    wire logic[7:0] sa03_mc;
    wire logic[7:0] sa10_mc;
    wire logic[7:0] sa11_mc;
    wire logic[7:0] sa12_mc;
    wire logic[7:0] sa13_mc;
    wire logic[7:0] sa20_mc;
    wire logic[7:0] sa21_mc;
    wire logic[7:0] sa22_mc;
    wire logic[7:0] sa23_mc;
    wire logic[7:0] sa30_mc;
    wire logic[7:0] sa31_mc;
    wire logic[7:0] sa32_mc;
    wire logic[7:0] sa33_mc;
    reg ld_r;
    reg[3:0] dcnt;
    always @(posedge clk) begin
        if (!(rst)) begin
            dcnt <= 4'b0;
        end
        else if (ld) begin
            dcnt <= 4'b1011;
        end
        else if (|(dcnt)) begin
            dcnt <= (dcnt - 4'b1);
        end
    end
    always @(posedge clk) begin
        done <= ((!(|(dcnt[3:1])) & dcnt[0]) & !(ld));
    end
    always @(posedge clk) begin begin
            text_in_r <= text_in;
        end
    end
    always @(posedge clk) begin
        ld_r <= ld;
    end
    always @(posedge clk) begin
        sa33 <= (ld_r ? (text_in_r[7:0] ^ w3[7:0]) : sa33_next);
    end
    always @(posedge clk) begin
        sa23 <= (ld_r ? (text_in_r[15:8] ^ w3[15:8]) : sa23_next);
    end
    always @(posedge clk) begin
        sa13 <= (ld_r ? (text_in_r[23:16] ^ w3[23:16]) : sa13_next);
    end
    always @(posedge clk) begin
        sa03 <= (ld_r ? (text_in_r[31:24] ^ w3[31:24]) : sa03_next);
    end
    always @(posedge clk) begin
        sa32 <= (ld_r ? (text_in_r[39:32] ^ w2[7:0]) : sa32_next);
    end
    always @(posedge clk) begin
        sa22 <= (ld_r ? (text_in_r[47:40] ^ w2[15:8]) : sa22_next);
    end
    always @(posedge clk) begin
        sa12 <= (ld_r ? (text_in_r[55:48] ^ w2[23:16]) : sa12_next);
    end
    always @(posedge clk) begin
        sa02 <= (ld_r ? (text_in_r[63:56] ^ w2[31:24]) : sa02_next);
    end
    always @(posedge clk) begin
        sa31 <= (ld_r ? (text_in_r[71:64] ^ w1[7:0]) : sa31_next);
    end
    always @(posedge clk) begin
        sa21 <= (ld_r ? (text_in_r[79:72] ^ w1[15:8]) : sa21_next);
    end
    always @(posedge clk) begin
        sa11 <= (ld_r ? (text_in_r[87:80] ^ w1[23:16]) : sa11_next);
    end
    always @(posedge clk) begin
        sa01 <= (ld_r ? (text_in_r[95:88] ^ w1[31:24]) : sa01_next);
    end
    always @(posedge clk) begin
        sa30 <= (ld_r ? (text_in_r[103:96] ^ w0[7:0]) : sa30_next);
    end
    always @(posedge clk) begin
        sa20 <= (ld_r ? (text_in_r[111:104] ^ w0[15:8]) : sa20_next);
    end
    always @(posedge clk) begin
        sa10 <= (ld_r ? (text_in_r[119:112] ^ w0[23:16]) : sa10_next);
    end
    always @(posedge clk) begin
        sa00 <= (ld_r ? (text_in_r[127:120] ^ w0[31:24]) : sa00_next);
    end
    assign sa00_sr = sa00_sub;
    assign sa01_sr = sa01_sub;
    assign sa02_sr = sa02_sub;
    assign sa03_sr = sa03_sub;
    assign sa10_sr = sa11_sub;
    assign sa11_sr = sa12_sub;
    assign sa12_sr = sa13_sub;
    assign sa13_sr = sa10_sub;
    assign sa20_sr = sa22_sub;
    assign sa21_sr = sa23_sub;
    assign sa22_sr = sa20_sub;
    assign sa23_sr = sa21_sub;
    assign sa30_sr = sa33_sub;
    assign sa31_sr = sa30_sub;
    assign sa32_sr = sa31_sub;
    assign sa33_sr = sa32_sub;
    assign {sa00_mc, sa10_mc, sa20_mc, sa30_mc} = mix_col(sa00_sr, sa10_sr, sa20_sr, sa30_sr);
    assign {sa01_mc, sa11_mc, sa21_mc, sa31_mc} = mix_col(sa01_sr, sa11_sr, sa21_sr, sa31_sr);
    assign {sa02_mc, sa12_mc, sa22_mc, sa32_mc} = mix_col(sa02_sr, sa12_sr, sa22_sr, sa32_sr);
    assign {sa03_mc, sa13_mc, sa23_mc, sa33_mc} = mix_col(sa03_sr, sa13_sr, sa23_sr, sa33_sr);
    assign sa00_next = (sa00_mc ^ w0[31:24]);
    assign sa01_next = (sa01_mc ^ w1[31:24]);
    assign sa02_next = (sa02_mc ^ w2[31:24]);
    assign sa03_next = (sa03_mc ^ w3[31:24]);
    assign sa10_next = (sa10_mc ^ w0[23:16]);
    assign sa11_next = (sa11_mc ^ w1[23:16]);
    assign sa12_next = (sa12_mc ^ w2[23:16]);
    assign sa13_next = (sa13_mc ^ w3[23:16]);
    assign sa20_next = (sa20_mc ^ w0[15:8]);
    assign sa21_next = (sa21_mc ^ w1[15:8]);
    assign sa22_next = (sa22_mc ^ w2[15:8]);
    assign sa23_next = (sa23_mc ^ w3[15:8]);
    assign sa30_next = (sa30_mc ^ w0[7:0]);
    assign sa31_next = (sa31_mc ^ w1[7:0]);
    assign sa32_next = (sa32_mc ^ w2[7:0]);
    assign sa33_next = (sa33_mc ^ w3[7:0]);
    always @(posedge clk) begin
        text_out[127:120] <= (sa00_sr ^ w0[31:24]);
    end
    always @(posedge clk) begin
        text_out[95:88] <= (sa01_sr ^ w1[31:24]);
    end
    always @(posedge clk) begin
        text_out[63:56] <= (sa02_sr ^ w2[31:24]);
    end
    always @(posedge clk) begin
        text_out[31:24] <= (sa03_sr ^ w3[31:24]);
    end
    always @(posedge clk) begin
        text_out[119:112] <= (sa10_sr ^ w0[23:16]);
    end
    always @(posedge clk) begin
        text_out[87:80] <= (sa11_sr ^ w1[23:16]);
    end
    always @(posedge clk) begin
        text_out[55:48] <= (sa12_sr ^ w2[23:16]);
    end
    always @(posedge clk) begin
        text_out[23:16] <= (sa13_sr ^ w3[23:16]);
    end
    always @(posedge clk) begin
        text_out[111:104] <= (sa20_sr ^ w0[15:8]);
    end
    always @(posedge clk) begin
        text_out[79:72] <= (sa21_sr ^ w1[15:8]);
    end
    always @(posedge clk) begin
        text_out[47:40] <= (sa22_sr ^ w2[15:8]);
    end
    always @(posedge clk) begin
        text_out[15:8] <= (sa23_sr ^ w3[15:8]);
    end
    always @(posedge clk) begin
        text_out[103:96] <= (sa30_sr ^ w0[7:0]);
    end
    always @(posedge clk) begin
        text_out[71:64] <= (sa31_sr ^ w1[7:0]);
    end
    always @(posedge clk) begin
        text_out[39:32] <= (sa32_sr ^ w2[7:0]);
    end
    always @(posedge clk) begin
        text_out[7:0] <= (sa33_sr ^ w3[7:0]);
    end
    function logic[31:0] mix_col(input logic[7:0] s0, input logic[7:0] s1, input logic[7:0] s2, input logic[7:0] s3);
        reg [0:0] s0_o;
        reg [0:0] s1_o;
        reg [0:0] s2_o;
        reg [0:0] s3_o;
        begin
            mix_col[31:24] = ((((xtime(s0) ^ xtime(s1)) ^ s1) ^ s2) ^ s3);
            mix_col[23:16] = ((((s0 ^ xtime(s1)) ^ xtime(s2)) ^ s2) ^ s3);
            mix_col[15:8] = ((((s0 ^ s1) ^ xtime(s2)) ^ xtime(s3)) ^ s3);
            mix_col[7:0] = ((((xtime(s0) ^ s0) ^ s1) ^ s2) ^ xtime(s3));
        end
    endfunction
    function logic[7:0] xtime(input logic[7:0] b);
        xtime = ({b[6:0], 1'b0} ^ (8'd27 & {8{b[7]}}));
    endfunction
    aes_cipher_top_u0 u0 (
        .clk(clk),
        .kld(ld),
        .key(key),
        .wo_0(w0),
        .wo_1(w1),
        .wo_2(w2),
        .wo_3(w3)
    );
    aes_cipher_top_us00 us00 (
        .a(sa00),
        .d(sa00_sub)
    );
    aes_cipher_top_us01 us01 (
        .a(sa01),
        .d(sa01_sub)
    );
    aes_cipher_top_us02 us02 (
        .a(sa02),
        .d(sa02_sub)
    );
    aes_cipher_top_us03 us03 (
        .a(sa03),
        .d(sa03_sub)
    );
    aes_cipher_top_us10 us10 (
        .a(sa10),
        .d(sa10_sub)
    );
    aes_cipher_top_us11 us11 (
        .a(sa11),
        .d(sa11_sub)
    );
    aes_cipher_top_us12 us12 (
        .a(sa12),
        .d(sa12_sub)
    );
    aes_cipher_top_us13 us13 (
        .a(sa13),
        .d(sa13_sub)
    );
    aes_cipher_top_us20 us20 (
        .a(sa20),
        .d(sa20_sub)
    );
    aes_cipher_top_us21 us21 (
        .a(sa21),
        .d(sa21_sub)
    );
    aes_cipher_top_us22 us22 (
        .a(sa22),
        .d(sa22_sub)
    );
    aes_cipher_top_us23 us23 (
        .a(sa23),
        .d(sa23_sub)
    );
    aes_cipher_top_us30 us30 (
        .a(sa30),
        .d(sa30_sub)
    );
    aes_cipher_top_us31 us31 (
        .a(sa31),
        .d(sa31_sub)
    );
    aes_cipher_top_us32 us32 (
        .a(sa32),
        .d(sa32_sub)
    );
    aes_cipher_top_us33 us33 (
        .a(sa33),
        .d(sa33_sub)
    );
endmodule