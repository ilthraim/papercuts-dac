module gost89_ecb (
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
    reg[5:0] round_num;
    reg[31:0] n1;
    reg[31:0] n2;
    reg[31:0] round_key;
    wire logic[31:0] out1;
    wire logic[31:0] out2;
    gost89_ecb_rnd rnd (
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
        if (mode) begin
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
                    round_key <= key[31:0];
                end
                9: begin
                    round_key <= key[63:32];
                end
                10: begin
                    round_key <= key[95:64];
                end
                11: begin
                    round_key <= key[127:96];
                end
                12: begin
                    round_key <= key[159:128];
                end
                13: begin
                    round_key <= key[191:160];
                end
                14: begin
                    round_key <= key[223:192];
                end
                15: begin
                    round_key <= key[255:224];
                end
                16: begin
                    round_key <= key[31:0];
                end
                17: begin
                    round_key <= key[63:32];
                end
                18: begin
                    round_key <= key[95:64];
                end
                19: begin
                    round_key <= key[127:96];
                end
                20: begin
                    round_key <= key[159:128];
                end
                21: begin
                    round_key <= key[191:160];
                end
                22: begin
                    round_key <= key[223:192];
                end
                23: begin
                    round_key <= key[255:224];
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
        else begin
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
    end
endmodule