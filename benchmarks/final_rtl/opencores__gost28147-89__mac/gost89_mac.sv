module gost89_mac (
    input logic clk,
    input logic reset,
    input logic load_data,
    input logic[511:0] sbox,
    input logic[255:0] key,
    input logic[63:0] in,
    output reg[31:0] out,
    output reg busy
);
    reg[4:0] counter;
    reg[31:0] round_key;
    reg need_xor;
    reg[31:0] n1;
    reg[31:0] n2;
    wire logic[31:0] out1;
    wire logic[31:0] out2;
    gost89_mac_rnd rnd (
        .clk(clk),
        .sbox(sbox),
        .key(round_key),
        .n1(n1),
        .n2(n2),
        .out1(out1),
        .out2(out2)
    );
    always @(posedge clk) begin
        if ((reset)) begin
            counter <= 17;
            need_xor <= 0;
            busy <= 0;
        end
        if (( load_data)) begin
            if (need_xor) begin
                n1 <= (in[63:32] ^ n2);
                n2 <= (in[31:0] ^ n1);
            end
            else begin
                n1 <= in[63:32];
                n2 <= in[31:0];
                need_xor <= 1;
            end
            counter <= 0;
            busy <= 1;
        end
        if ((reset && load_data)) begin
            n1 <= in[63:32];
            n2 <= in[31:0];
            counter <= 0;
            need_xor <= 1;
            busy <= 1;
        end
        if ((!(reset) && !(load_data))) begin
            if ((counter < 17)) begin
                counter <= (counter + 1);
            end
            if (((counter > 0) && (counter < 17))) begin
                n1 <= out1;
                n2 <= out2;
            end
            if ((counter == 16)) begin
                busy <= 0;
                out <= out2;
            end
        end
    end
    always @(posedge clk) begin
        case (counter)
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
        endcase
    end
endmodule