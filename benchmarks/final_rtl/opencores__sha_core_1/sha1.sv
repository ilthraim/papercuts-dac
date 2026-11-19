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
    reg[31:0] Kt;
    reg[31:0] A;
    reg[31:0] B;
    reg[31:0] C;
    reg[31:0] D;
    reg[31:0] E;
    reg busy;
    assign cmd_o = cmd;
    always @(posedge clk_i) begin
        if (rst_i) begin
            cmd <= 32'd0;
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
    assign SHA1_ft_BCD = ((round < 32'd21) ? SHA1_f1_BCD : ((round < 32'd41) ? SHA1_f2_BCD : ((round < 32'd61) ? SHA1_f3_BCD : SHA1_f2_BCD)));
    assign SHA1_Wt_1 = {(((W13 ^ W8) ^ W2) ^ W0)};
    assign next_Wt = {SHA1_Wt_1[30:0], SHA1_Wt_1[31]};
    assign next_A = (((({A[26:0], A[31:27]} + SHA1_ft_BCD) + E) + Kt) + Wt);
    assign next_C = {B[1:0], B[31:2]};
    assign SHA1_result = {A, B, C, D, E};
    assign round_plus_1 = (round + 1);
    always @(posedge clk_i) begin
        if (rst_i) begin
            round <= 32'd0;
            busy <= 32'd0;
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
                32'd0: begin
                    if (cmd[1]) begin
                        W0 <= text_i;
                        Wt <= text_i;
                        busy <= 32'd1;
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
                        round <= 32'd0;
                    end
                end
                32'd1: begin
                    W1 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd2: begin
                    W2 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd3: begin
                    W3 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd4: begin
                    W4 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd5: begin
                    W5 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd6: begin
                    W6 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd7: begin
                    W7 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd8: begin
                    W8 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd9: begin
                    W9 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd10: begin
                    W10 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd11: begin
                    W11 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd12: begin
                    W12 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd13: begin
                    W13 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd14: begin
                    W14 <= text_i;
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd15: begin
                    Wt <= text_i;
                    E <= D;
                    D <= C;
                    C <= next_C;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd16, 32'd17, 32'd18, 32'd19, 32'd20, 32'd21, 32'd22, 32'd23, 32'd24, 32'd25, 32'd26, 32'd27, 32'd28, 32'd29, 32'd30, 32'd31, 32'd32, 32'd33, 32'd34, 32'd35, 32'd36, 32'd37, 32'd38, 32'd39, 32'd40, 32'd41, 32'd42, 32'd43, 32'd44, 32'd45, 32'd46, 32'd47, 32'd48, 32'd49, 32'd50, 32'd51, 32'd52, 32'd53, 32'd54, 32'd55, 32'd56, 32'd57, 32'd58, 32'd59, 32'd60, 32'd61, 32'd62, 32'd63, 32'd64, 32'd65, 32'd66, 32'd67, 32'd68, 32'd69, 32'd70, 32'd71, 32'd72, 32'd73, 32'd74, 32'd75, 32'd76, 32'd77, 32'd78, 32'd79: begin
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
                32'd80: begin
                    A <= (next_A + H0);
                    B <= (A + H1);
                    C <= (next_C + H2);
                    D <= (C + H3);
                    E <= (D + H4);
                    round <= 32'd0;
                    busy <= 32'd0;
                end
                default: begin
                    round <= 32'd0;
                    busy <= 32'd0;
                end
            endcase
        end
    end
    always @(posedge clk_i) begin begin
            if ((round < 32'd20)) begin
                Kt <= 32'd1518500249;
            end
            else if ((round < 32'd40)) begin
                Kt <= 32'd1859775393;
            end
            else if ((round < 32'd60)) begin
                Kt <= 32'd2400959708;
            end
            else begin
                Kt <= 32'd3395469782;
            end
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            text_o <= 32'd0;
            read_counter <= 32'd0;
        end
        else begin
            if (cmd[0]) begin
                read_counter <= 32'd4;
            end
            else begin
                if (~(busy)) begin
                    case (read_counter)
                        32'd4: begin
                            text_o <= SHA1_result[159:128];
                        end
                        32'd3: begin
                            text_o <= SHA1_result[127:96];
                        end
                        32'd2: begin
                            text_o <= SHA1_result[95:64];
                        end
                        32'd1: begin
                            text_o <= SHA1_result[63:32];
                        end
                        32'd0: begin
                            text_o <= SHA1_result[31:0];
                        end
                        default: begin
                            text_o <= 32'd0;
                        end
                    endcase
                    if (|(read_counter)) begin
                        read_counter <= (read_counter - 32'd1);
                    end
                end
                else begin
                    text_o <= 32'd0;
                end
            end
        end
    end
endmodule