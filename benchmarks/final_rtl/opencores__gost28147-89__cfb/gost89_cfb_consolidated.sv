module gost89_cfb (
    input logic clk,
    input logic reset,
    input logic mode,
    input logic load_data,
    input logic[511:0] sbox,
    input logic[255:0] key,
    input logic[63:0] in,
    output reg[63:0] out,
    output reg busy
);
    reg[63:0] gamma;
    reg[63:0] in_value;
    wire logic[63:0] out_ecb;
    wire logic reset_ecb;
    wire logic load_ecb;
    wire logic busy_ecb;
    assign load_ecb = (!(reset) && load_data);
    assign reset_ecb = load_ecb;
    gost89_cfb_ecb_encrypt ecb_encrypt (
        .clk(clk),
        .reset(1'b0),
        .load_data(load_ecb),
        .sbox(sbox),
        .key(key),
        .in(gamma),
        .out(out_ecb),
        .busy(busy_ecb)
    );
    always @(posedge clk) begin
        if ((reset && !(load_data))) begin
            gamma <= in;
            busy <= 0;
        end
        if ((!(reset) & load_data)) begin
            in_value <= in;
            busy <= 1;
        end
        if ((((!(reset) && !(load_data)) && !(busy_ecb)) && busy)) begin
            if (mode) begin
                gamma <= in_value;
            end
            else begin
                gamma <= (out_ecb ^ in_value);
            end
            out <= (out_ecb ^ in_value);
            busy <= 0;
        end
    end
endmodule

module gost89_cfb_ecb_encrypt (
    input logic clk,
    input logic reset,
    input logic load_data,
    input logic[511:0] sbox,
    input logic[255:0] key,
    input logic[63:0] in,
    output reg[63:0] out,
    output reg busy
);
    reg[5:0] round_num;
    reg[31:0] n1;
    reg[31:0] n2;
    reg[31:0] round_key;
    wire logic[31:0] out1;
    wire logic[31:0] out2;
    gost89_cfb_ecb_encrypt_rnd rnd (
        .clk(clk),
        .sbox(sbox),
        .key(round_key),
        .n1(n1),
        .n2(n2),
        .out1(out1),
        .out2(out2)
    );
    always @(posedge clk) begin
        if (load_data) begin
            n1 <= in[63:32];
            n2 <= in[31:0];
            busy <= 1;
            round_num <= 0;
        end
        begin end
        if (( !(load_data))) begin
            if ((round_num < 32)) begin
                round_num <= (round_num + 1);
            end
            if (((round_num > 0) && (round_num < 32))) begin
                n1 <= out1;
                n2 <= out2;
            end
            if ((round_num == 32)) begin
                out[63:32] <= out2;
                out[31:0] <= out1;
                busy <= 0;
            end
        end
    end
    always @(posedge clk) begin
        case (round_num)
            0: begin
                round_key <= key[255:224];
            end
            1: begin
                round_key <= key[223:192];
            end
            2: begin
                round_key <= key[191:160];
            end
            3: begin
                round_key <= key[159:128];
            end
            4: begin
                round_key <= key[127:96];
            end
            5: begin
                round_key <= key[95:64];
            end
            6: begin
                round_key <= key[63:32];
            end
            7: begin
                round_key <= key[31:0];
            end
            8: begin
                round_key <= key[255:224];
            end
            9: begin
                round_key <= key[223:192];
            end
            10: begin
                round_key <= key[191:160];
            end
            11: begin
                round_key <= key[159:128];
            end
            12: begin
                round_key <= key[127:96];
            end
            13: begin
                round_key <= key[95:64];
            end
            14: begin
                round_key <= key[63:32];
            end
            15: begin
                round_key <= key[31:0];
            end
            16: begin
                round_key <= key[255:224];
            end
            17: begin
                round_key <= key[223:192];
            end
            18: begin
                round_key <= key[191:160];
            end
            19: begin
                round_key <= key[159:128];
            end
            20: begin
                round_key <= key[127:96];
            end
            21: begin
                round_key <= key[95:64];
            end
            22: begin
                round_key <= key[63:32];
            end
            23: begin
                round_key <= key[31:0];
            end
            24: begin
                round_key <= key[31:0];
            end
            25: begin
                round_key <= key[63:32];
            end
            26: begin
                round_key <= key[95:64];
            end
            27: begin
                round_key <= key[127:96];
            end
            28: begin
                round_key <= key[159:128];
            end
            29: begin
                round_key <= key[191:160];
            end
            30: begin
                round_key <= key[223:192];
            end
            31: begin
                round_key <= key[255:224];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd (
    input logic clk,
    input logic[511:0] sbox,
    input logic[31:0] key,
    input logic[31:0] n1,
    input logic[31:0] n2,
    output logic[31:0] out1,
    output logic[31:0] out2
);
    wire logic[31:0] tmp1;
    wire logic[31:0] tmp2;
    assign tmp1 = (n1 + key);
    gost89_cfb_ecb_encrypt_rnd_sbox1 sbox1 (
        .sbox(sbox[511:448]),
        .in(tmp1[3:0]),
        .out(tmp2[3:0])
    );
    gost89_cfb_ecb_encrypt_rnd_sbox2 sbox2 (
        .sbox(sbox[447:384]),
        .in(tmp1[7:4]),
        .out(tmp2[7:4])
    );
    gost89_cfb_ecb_encrypt_rnd_sbox3 sbox3 (
        .sbox(sbox[383:320]),
        .in(tmp1[11:8]),
        .out(tmp2[11:8])
    );
    gost89_cfb_ecb_encrypt_rnd_sbox4 sbox4 (
        .sbox(sbox[319:256]),
        .in(tmp1[15:12]),
        .out(tmp2[15:12])
    );
    gost89_cfb_ecb_encrypt_rnd_sbox5 sbox5 (
        .sbox(sbox[255:192]),
        .in(tmp1[19:16]),
        .out(tmp2[19:16])
    );
    gost89_cfb_ecb_encrypt_rnd_sbox6 sbox6 (
        .sbox(sbox[191:128]),
        .in(tmp1[23:20]),
        .out(tmp2[23:20])
    );
    gost89_cfb_ecb_encrypt_rnd_sbox7 sbox7 (
        .sbox(sbox[127:64]),
        .in(tmp1[27:24]),
        .out(tmp2[27:24])
    );
    gost89_cfb_ecb_encrypt_rnd_sbox8 sbox8 (
        .sbox(sbox[63:0]),
        .in(tmp1[31:28]),
        .out(tmp2[31:28])
    );
    assign out1[10:0] = (tmp2[31:21] ^ n2[10:0]);
    assign out1[31:11] = (tmp2[20:0] ^ n2[31:11]);
    assign out2 = n1;
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox1 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox2 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox3 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox4 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox5 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox6 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox7 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule

module gost89_cfb_ecb_encrypt_rnd_sbox8 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule