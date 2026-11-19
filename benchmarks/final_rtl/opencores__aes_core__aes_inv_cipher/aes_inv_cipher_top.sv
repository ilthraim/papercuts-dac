module aes_inv_cipher_top (
    input logic clk,
    input logic rst,
    input logic kld,
    input logic ld,
    output reg done,
    input logic[127:0] key,
    input logic[127:0] text_in,
    output reg[127:0] text_out
);
    wire logic[31:0] wk0;
    wire logic[31:0] wk1;
    wire logic[31:0] wk2;
    wire logic[31:0] wk3;
    reg[31:0] w0;
    reg[31:0] w1;
    reg[31:0] w2;
    reg[31:0] w3;
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
    wire logic[7:0] sa00_ark;
    wire logic[7:0] sa01_ark;
    wire logic[7:0] sa02_ark;
    wire logic[7:0] sa03_ark;
    wire logic[7:0] sa10_ark;
    wire logic[7:0] sa11_ark;
    wire logic[7:0] sa12_ark;
    wire logic[7:0] sa13_ark;
    wire logic[7:0] sa20_ark;
    wire logic[7:0] sa21_ark;
    wire logic[7:0] sa22_ark;
    wire logic[7:0] sa23_ark;
    wire logic[7:0] sa30_ark;
    wire logic[7:0] sa31_ark;
    wire logic[7:0] sa32_ark;
    wire logic[7:0] sa33_ark;
    reg ld_r;
    reg go;
    reg[3:0] dcnt;
    always @(posedge clk) begin
        if (!(rst)) begin
            dcnt <= 4'b0;
        end
        else if (done) begin
            dcnt <= 4'b0;
        end
        else if (ld) begin
            dcnt <= 4'b1;
        end
        else if (go) begin
            dcnt <= (dcnt + 4'b1);
        end
    end
    always @(posedge clk) begin
        done <= ((dcnt == 4'b1011) & !(ld));
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            go <= 1'b0;
        end
        else if (ld) begin
            go <= 1'b1;
        end
        else if (done) begin
            go <= 1'b0;
        end
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
    assign sa00_sr = sa00;
    assign sa01_sr = sa01;
    assign sa02_sr = sa02;
    assign sa03_sr = sa03;
    assign sa10_sr = sa13;
    assign sa11_sr = sa10;
    assign sa12_sr = sa11;
    assign sa13_sr = sa12;
    assign sa20_sr = sa22;
    assign sa21_sr = sa23;
    assign sa22_sr = sa20;
    assign sa23_sr = sa21;
    assign sa30_sr = sa31;
    assign sa31_sr = sa32;
    assign sa32_sr = sa33;
    assign sa33_sr = sa30;
    assign sa00_ark = (sa00_sub ^ w0[31:24]);
    assign sa01_ark = (sa01_sub ^ w1[31:24]);
    assign sa02_ark = (sa02_sub ^ w2[31:24]);
    assign sa03_ark = (sa03_sub ^ w3[31:24]);
    assign sa10_ark = (sa10_sub ^ w0[23:16]);
    assign sa11_ark = (sa11_sub ^ w1[23:16]);
    assign sa12_ark = (sa12_sub ^ w2[23:16]);
    assign sa13_ark = (sa13_sub ^ w3[23:16]);
    assign sa20_ark = (sa20_sub ^ w0[15:8]);
    assign sa21_ark = (sa21_sub ^ w1[15:8]);
    assign sa22_ark = (sa22_sub ^ w2[15:8]);
    assign sa23_ark = (sa23_sub ^ w3[15:8]);
    assign sa30_ark = (sa30_sub ^ w0[7:0]);
    assign sa31_ark = (sa31_sub ^ w1[7:0]);
    assign sa32_ark = (sa32_sub ^ w2[7:0]);
    assign sa33_ark = (sa33_sub ^ w3[7:0]);
    assign {sa00_next, sa10_next, sa20_next, sa30_next} = inv_mix_col(sa00_ark, sa10_ark, sa20_ark, sa30_ark);
    assign {sa01_next, sa11_next, sa21_next, sa31_next} = inv_mix_col(sa01_ark, sa11_ark, sa21_ark, sa31_ark);
    assign {sa02_next, sa12_next, sa22_next, sa32_next} = inv_mix_col(sa02_ark, sa12_ark, sa22_ark, sa32_ark);
    assign {sa03_next, sa13_next, sa23_next, sa33_next} = inv_mix_col(sa03_ark, sa13_ark, sa23_ark, sa33_ark);
    always @(posedge clk) begin
        text_out[127:120] <= sa00_ark;
    end
    always @(posedge clk) begin
        text_out[95:88] <= sa01_ark;
    end
    always @(posedge clk) begin
        text_out[63:56] <= sa02_ark;
    end
    always @(posedge clk) begin
        text_out[31:24] <= sa03_ark;
    end
    always @(posedge clk) begin
        text_out[119:112] <= sa10_ark;
    end
    always @(posedge clk) begin
        text_out[87:80] <= sa11_ark;
    end
    always @(posedge clk) begin
        text_out[55:48] <= sa12_ark;
    end
    always @(posedge clk) begin
        text_out[23:16] <= sa13_ark;
    end
    always @(posedge clk) begin
        text_out[111:104] <= sa20_ark;
    end
    always @(posedge clk) begin
        text_out[79:72] <= sa21_ark;
    end
    always @(posedge clk) begin
        text_out[47:40] <= sa22_ark;
    end
    always @(posedge clk) begin
        text_out[15:8] <= sa23_ark;
    end
    always @(posedge clk) begin
        text_out[103:96] <= sa30_ark;
    end
    always @(posedge clk) begin
        text_out[71:64] <= sa31_ark;
    end
    always @(posedge clk) begin
        text_out[39:32] <= sa32_ark;
    end
    always @(posedge clk) begin
        text_out[7:0] <= sa33_ark;
    end
    function logic[31:0] inv_mix_col(input logic[7:0] s0, input logic[7:0] s1, input logic[7:0] s2, input logic[7:0] s3);
        inv_mix_col[31:24] = (((pmul_e(s0) ^ pmul_b(s1)) ^ pmul_d(s2)) ^ pmul_9(s3));
        inv_mix_col[23:16] = (((pmul_9(s0) ^ pmul_e(s1)) ^ pmul_b(s2)) ^ pmul_d(s3));
        inv_mix_col[15:8] = (((pmul_d(s0) ^ pmul_9(s1)) ^ pmul_e(s2)) ^ pmul_b(s3));
        inv_mix_col[7:0] = (((pmul_b(s0) ^ pmul_d(s1)) ^ pmul_9(s2)) ^ pmul_e(s3));
    endfunction
    function logic[7:0] pmul_e(input logic[7:0] b);
        reg[7:0] two;
        reg[7:0] four;
        reg[7:0] eight;
        begin
            two = xtime(b);
            four = xtime(two);
            eight = xtime(four);
            pmul_e = ((eight ^ four) ^ two);
        end
    endfunction
    function logic[7:0] pmul_9(input logic[7:0] b);
        reg[7:0] two;
        reg[7:0] four;
        reg[7:0] eight;
        begin
            two = xtime(b);
            four = xtime(two);
            eight = xtime(four);
            pmul_9 = (eight ^ b);
        end
    endfunction
    function logic[7:0] pmul_d(input logic[7:0] b);
        reg[7:0] two;
        reg[7:0] four;
        reg[7:0] eight;
        begin
            two = xtime(b);
            four = xtime(two);
            eight = xtime(four);
            pmul_d = ((eight ^ four) ^ b);
        end
    endfunction
    function logic[7:0] pmul_b(input logic[7:0] b);
        reg[7:0] two;
        reg[7:0] four;
        reg[7:0] eight;
        begin
            two = xtime(b);
            four = xtime(two);
            eight = xtime(four);
            pmul_b = ((eight ^ two) ^ b);
        end
    endfunction
    function logic[7:0] xtime(input logic[7:0] b);
        xtime = ({b[6:0], 1'b0} ^ (8'd27 & {8{b[7]}}));
    endfunction
    reg[127:0] kb[10:0];
    reg[3:0] kcnt;
    reg kb_ld;
    always @(posedge clk) begin if (kld) begin
            kcnt <= 4'b1010;
        end
        else begin
            kcnt <= (kcnt - 4'b1);
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            kb_ld <= 1'b0;
        end
        else if (kld) begin
            kb_ld <= 1'b1;
        end
        else if ((kcnt == 4'b0)) begin
            kb_ld <= 1'b0;
        end
    end
    always @(posedge clk) begin
        if (kb_ld) begin
            kb[kcnt] <= {wk3, wk2, wk1, wk0};
        end
    end
    always @(posedge clk) begin
        {w3, w2, w1, w0} <= kb[dcnt];
    end
    aes_inv_cipher_top_u0 u0 (
        .clk(clk),
        .kld(kld),
        .key(key),
        .wo_0(wk0),
        .wo_1(wk1),
        .wo_2(wk2),
        .wo_3(wk3)
    );
    aes_inv_cipher_top_us00 us00 (
        .a(sa00_sr),
        .d(sa00_sub)
    );
    aes_inv_cipher_top_us01 us01 (
        .a(sa01_sr),
        .d(sa01_sub)
    );
    aes_inv_cipher_top_us02 us02 (
        .a(sa02_sr),
        .d(sa02_sub)
    );
    aes_inv_cipher_top_us03 us03 (
        .a(sa03_sr),
        .d(sa03_sub)
    );
    aes_inv_cipher_top_us10 us10 (
        .a(sa10_sr),
        .d(sa10_sub)
    );
    aes_inv_cipher_top_us11 us11 (
        .a(sa11_sr),
        .d(sa11_sub)
    );
    aes_inv_cipher_top_us12 us12 (
        .a(sa12_sr),
        .d(sa12_sub)
    );
    aes_inv_cipher_top_us13 us13 (
        .a(sa13_sr),
        .d(sa13_sub)
    );
    aes_inv_cipher_top_us20 us20 (
        .a(sa20_sr),
        .d(sa20_sub)
    );
    aes_inv_cipher_top_us21 us21 (
        .a(sa21_sr),
        .d(sa21_sub)
    );
    aes_inv_cipher_top_us22 us22 (
        .a(sa22_sr),
        .d(sa22_sub)
    );
    aes_inv_cipher_top_us23 us23 (
        .a(sa23_sr),
        .d(sa23_sub)
    );
    aes_inv_cipher_top_us30 us30 (
        .a(sa30_sr),
        .d(sa30_sub)
    );
    aes_inv_cipher_top_us31 us31 (
        .a(sa31_sr),
        .d(sa31_sub)
    );
    aes_inv_cipher_top_us32 us32 (
        .a(sa32_sr),
        .d(sa32_sub)
    );
    aes_inv_cipher_top_us33 us33 (
        .a(sa33_sr),
        .d(sa33_sub)
    );
endmodule