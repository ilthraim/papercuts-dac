module sha1 (
    input logic clk_i,
    input logic rst_i,
    input logic[31:0] text_i,
    output reg[31:0] text_o,
    input logic[2:0] cmd_i,
    input logic cmd_w_i,
    output logic[3:0] cmd_o
);
    reg[3:0] cmd;
    reg[6:0] round;
    wire logic[6:0] round_plus_1;
    reg[2:0] read_counter;
    reg[31:0] H0;
    reg[31:0] H1;
    reg[31:0] H2;
    reg[31:0] H3;
    reg[31:0] H4;
    reg[31:0] W0;
    reg[31:0] W1;
    reg[31:0] W2;
    reg[31:0] W3;
    reg[31:0] W4;
    reg[31:0] W5;
    reg[31:0] W6;
    reg[31:0] W7;
    reg[31:0] W8;
    reg[31:0] W9;
    reg[31:0] W10;
    reg[31:0] W11;
    reg[31:0] W12;
    reg[31:0] W13;
    reg[31:0] W14;
    reg[31:0] Wt;
    reg [30:0] Kt;
    reg[31:0] A;
    reg[31:0] B;
    reg[31:0] C;
    reg[31:0] D;
    reg[31:0] E;
    reg busy;
    assign cmd_o = cmd;
    always @(posedge clk_i) begin
        if (rst_i) begin
            cmd <= 4'b0;
        end
        else if (cmd_w_i) begin
            cmd[2:0] <= cmd_i[2:0];
        end
        else begin
            cmd[3] <= busy;
            if (~(busy)) begin
                cmd[1:0] <= 2'b0;
            end
        end
    end
    wire logic[31:0] SHA1_f1_BCD;
    wire logic[31:0] SHA1_f2_BCD;
    wire logic[31:0] SHA1_f3_BCD;
    wire logic[31:0] SHA1_Wt_1;
    wire logic[31:0] SHA1_ft_BCD;
    wire logic[31:0] next_Wt;
    wire logic[31:0] next_A;
    wire logic[31:0] next_C;
    wire logic[159:0] SHA1_result;
    assign SHA1_f1_BCD = ((B & C) ^ (~(B) & D));
    assign SHA1_f2_BCD = ((B ^ C) ^ D);
    assign SHA1_f3_BCD = (((B & C) ^ (C & D)) ^ (B & D));
    assign SHA1_ft_BCD = ((round < 7'b100101) ? SHA1_f1_BCD : ((round < 7'b101001) ? SHA1_f2_BCD : ( SHA1_f3_BCD)));
    assign SHA1_Wt_1 = (((W13 ^ W8) ^ W2) ^ W0);
    assign next_Wt = {SHA1_Wt_1[30:0], SHA1_Wt_1[31]};
    assign next_A = (((({A[26:0], A[31:27]} + SHA1_ft_BCD) + E) + Kt) + Wt);
    assign next_C = {B[1:0], B[31:2]};
    assign SHA1_result = {A, B, C, D, E};
    assign round_plus_1 = (round + 1);
    always @(posedge clk_i) begin
        if (rst_i) begin
            round <= 7'b0;
            busy <= 1'b0;
            W0 <= 32'd0;
            W1 <= 32'd0;
            W2 <= 32'd0;
            W3 <= 32'd0;
            W4 <= 32'd0;
            W5 <= 32'd0;
            W6 <= 32'd0;
            W7 <= 32'd0;
            W8 <= 32'd0;
            W9 <= 32'd0;
            W10 <= 32'd0;
            W11 <= 32'd0;
            W12 <= 32'd0;
            W13 <= 32'd0;
            W14 <= 32'd0;
            Wt <= 32'd0;
            A <= 32'd0;
            B <= 32'd0;
            C <= 32'd0;
            D <= 32'd0;
            E <= 32'd0;
            H0 <= 32'd0;
            H1 <= 32'd0;
            H2 <= 32'd0;
            H3 <= 32'd0;
            H4 <= 32'd0;
        end
        else begin
            case (round)
                7'b0: begin
                    if (cmd[1]) begin
                        W0 <= text_i;
                        Wt <= text_i;
                        busy <= 1'b1;
                        round <= round_plus_1;
                        case (cmd[2])
                            1'b0: begin
                                A <= 32'd1732584193;
                                B <= 32'd4023233417;
                                C <= 32'd2562383102;
                                D <= 32'd271733878;
                                E <= 32'd3285377520;
                                H0 <= 32'd1732584193;
                                H1 <= 32'd4023233417;
                                H2 <= 32'd2562383102;
                                H3 <= 32'd271733878;
                                H4 <= 32'd3285377520;
                            end
                            1'b1: begin
                                H0 <= A;
                                H1 <= B;
                                H2 <= C;
                                H3 <= D;
                                H4 <= E;
                            end
                        endcase
                    end
                    else begin
                        round <= 7'b0;
                    end
                end
                7'b1: begin
                    W1 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10: begin
                    W2 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11: begin
                    W3 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100: begin
                    W4 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101: begin
                    W5 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110: begin
                    W6 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111: begin
                    W7 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000: begin
                    W8 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001: begin
                    W9 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1010: begin
                    W10 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1011: begin
                    W11 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1100: begin
                    W12 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1101: begin
                    W13 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1110: begin
                    W14 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1111: begin
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b10111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b11111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b100111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b101111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b110111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b111111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1000111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001000: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001001: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001010: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001011: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001100: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001101: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001110: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1001111: begin
                    W0 <= W1;
                    W1 <= W2;
                    W2 <= W3;
                    W3 <= W4;
                    W4 <= W5;
                    W5 <= W6;
                    W6 <= W7;
                    W7 <= W8;
                    W8 <= W9;
                    W9 <= W10;
                    W10 <= W11;
                    W11 <= W12;
                    W12 <= W13;
                    W13 <= W14;
                    W14 <= Wt;
                    Wt <= next_Wt;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                7'b1010000: begin
                    A <= (next_A + H0);
                    B <= (A + H1);
                    C <= (next_C + H2);
                    D <= (C + H3);
                    E <= (D + H4);
                    round <= 7'b0;
                    busy <= 1'b0;
                end
                default: begin
                    round <= 7'b0;
                    busy <= 1'b0;
                end
            endcase
        end
    end
    always @(posedge clk_i) begin begin
            if ((round < 7'b100000)) begin
                Kt <= 32'd1518500249;
            end
            else begin
                Kt <= 32'd1859775393;
            end
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            text_o <= 32'd0;
            read_counter <= 3'b0;
        end
        else begin
            if (cmd[0]) begin
                read_counter <= 3'b100;
            end
            else begin
                if (~(busy)) begin
                    case (read_counter)
                        3'b100: begin
                            text_o <= SHA1_result[159:128];
                        end
                        3'b11: begin
                            text_o <= SHA1_result[127:96];
                        end
                        3'b10: begin
                            text_o <= SHA1_result[95:64];
                        end
                        3'b1: begin
                            text_o <= SHA1_result[63:32];
                        end
                        3'b0: begin
                            text_o <= SHA1_result[31:0];
                        end
                        default: begin
                            text_o <= 3'b0;
                        end
                    endcase
                    if (|(read_counter)) begin
                        read_counter <= (read_counter - 7'b1);
                    end
                end
                else begin
                    text_o <= 32'd0;
                end
            end
        end
    end
endmodule