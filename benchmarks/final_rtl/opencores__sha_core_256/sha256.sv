module sha256 (
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
    reg[31:0] H5;
    reg[31:0] H6;
    reg[31:0] H7;
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
    reg[31:0] F;
    reg[31:0] G;
    reg[31:0] H;
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
    wire logic[31:0] f1_EFG_32;
    wire logic[31:0] f2_ABC_32;
    wire logic[31:0] f3_A_32;
    wire logic[31:0] f4_E_32;
    wire logic[31:0] f5_W1_32;
    wire logic[31:0] f6_W14_32;
    wire logic[31:0] T1_32;
    wire logic[31:0] T2_32;
    wire logic[31:0] next_Wt;
    wire logic[31:0] next_E;
    wire logic[31:0] next_A;
    wire logic[255:0] SHA256_result;
    assign f1_EFG_32 = ((E & F) ^ (~(E) & G));
    assign f2_ABC_32 = (((A & B) ^ (B & C)) ^ (A & C));
    assign f3_A_32 = (({A[1:0], A[31:2]} ^ {A[12:0], A[31:13]}) ^ {A[21:0], A[31:22]});
    assign f4_E_32 = (({E[5:0], E[31:6]} ^ {E[10:0], E[31:11]}) ^ {E[24:0], E[31:25]});
    assign f5_W1_32 = (({W1[6:0], W1[31:7]} ^ {W1[17:0], W1[31:18]}) ^ {3'b0, W1[31:3]});
    assign f6_W14_32 = (({W14[16:0], W14[31:17]} ^ {W14[18:0], W14[31:19]}) ^ {10'd0, W14[31:10]});
    assign T1_32 = ((((H[31:0] + f4_E_32) + f1_EFG_32) + Kt) + Wt);
    assign T2_32 = (f3_A_32 + f2_ABC_32);
    assign next_Wt = (((f6_W14_32 + W9[31:0]) + f5_W1_32) + W0[31:0]);
    assign next_E = (D[31:0] + T1_32);
    assign next_A = (T1_32 + T2_32);
    assign SHA256_result = {A, B, C, D, E, F, G, H};
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
            F <= 32'd0;
            G <= 32'd0;
            H <= 32'd0;
            H0 <= 32'd0;
            H1 <= 32'd0;
            H2 <= 32'd0;
            H3 <= 32'd0;
            H4 <= 32'd0;
            H5 <= 32'd0;
            H6 <= 32'd0;
            H7 <= 32'd0;
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
                                A <= 32'd1779033703;
                                B <= 32'd3144134277;
                                C <= 32'd1013904242;
                                D <= 32'd2773480762;
                                E <= 32'd1359893119;
                                F <= 32'd2600822924;
                                G <= 32'd528734635;
                                H <= 32'd1541459225;
                                H0 <= 32'd1779033703;
                                H1 <= 32'd3144134277;
                                H2 <= 32'd1013904242;
                                H3 <= 32'd2773480762;
                                H4 <= 32'd1359893119;
                                H5 <= 32'd2600822924;
                                H6 <= 32'd528734635;
                                H7 <= 32'd1541459225;
                            end
                            1'b1: begin
                                H0 <= A;
                                H1 <= B;
                                H2 <= C;
                                H3 <= D;
                                H4 <= E;
                                H5 <= F;
                                H6 <= G;
                                H7 <= H;
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
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd2: begin
                    W2 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd3: begin
                    W3 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd4: begin
                    W4 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd5: begin
                    W5 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd6: begin
                    W6 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd7: begin
                    W7 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd8: begin
                    W8 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd9: begin
                    W9 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd10: begin
                    W10 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd11: begin
                    W11 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd12: begin
                    W12 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd13: begin
                    W13 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd14: begin
                    W14 <= text_i;
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd15: begin
                    Wt <= text_i;
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd16, 32'd17, 32'd18, 32'd19, 32'd20, 32'd21, 32'd22, 32'd23, 32'd24, 32'd25, 32'd26, 32'd27, 32'd28, 32'd29, 32'd30, 32'd31, 32'd32, 32'd33, 32'd34, 32'd35, 32'd36, 32'd37, 32'd38, 32'd39, 32'd40, 32'd41, 32'd42, 32'd43, 32'd44, 32'd45, 32'd46, 32'd47, 32'd48, 32'd49, 32'd50, 32'd51, 32'd52, 32'd53, 32'd54, 32'd55, 32'd56, 32'd57, 32'd58, 32'd59, 32'd60, 32'd61, 32'd62, 32'd63: begin
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
                    H <= G;
                    G <= F;
                    F <= E;
                    E <= next_E;
                    D <= C;
                    C <= B;
                    B <= A;
                    A <= next_A;
                    round <= round_plus_1;
                end
                32'd64: begin
                    A <= (next_A + H0);
                    B <= (A + H1);
                    C <= (B + H2);
                    D <= (C + H3);
                    E <= (next_E + H4);
                    F <= (E + H5);
                    G <= (F + H6);
                    H <= (G + H7);
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
            case (round)
                32'd0: begin
                    Kt <= 32'd1116352408;
                end
                32'd1: begin
                    Kt <= 32'd1899447441;
                end
                32'd2: begin
                    Kt <= 32'd3049323471;
                end
                32'd3: begin
                    Kt <= 32'd3921009573;
                end
                32'd4: begin
                    Kt <= 32'd961987163;
                end
                32'd5: begin
                    Kt <= 32'd1508970993;
                end
                32'd6: begin
                    Kt <= 32'd2453635748;
                end
                32'd7: begin
                    Kt <= 32'd2870763221;
                end
                32'd8: begin
                    Kt <= 32'd3624381080;
                end
                32'd9: begin
                    Kt <= 32'd310598401;
                end
                32'd10: begin
                    Kt <= 32'd607225278;
                end
                32'd11: begin
                    Kt <= 32'd1426881987;
                end
                32'd12: begin
                    Kt <= 32'd1925078388;
                end
                32'd13: begin
                    Kt <= 32'd2162078206;
                end
                32'd14: begin
                    Kt <= 32'd2614888103;
                end
                32'd15: begin
                    Kt <= 32'd3248222580;
                end
                32'd16: begin
                    Kt <= 32'd3835390401;
                end
                32'd17: begin
                    Kt <= 32'd4022224774;
                end
                32'd18: begin
                    Kt <= 32'd264347078;
                end
                32'd19: begin
                    Kt <= 32'd604807628;
                end
                32'd20: begin
                    Kt <= 32'd770255983;
                end
                32'd21: begin
                    Kt <= 32'd1249150122;
                end
                32'd22: begin
                    Kt <= 32'd1555081692;
                end
                32'd23: begin
                    Kt <= 32'd1996064986;
                end
                32'd24: begin
                    Kt <= 32'd2554220882;
                end
                32'd25: begin
                    Kt <= 32'd2821834349;
                end
                32'd26: begin
                    Kt <= 32'd2952996808;
                end
                32'd27: begin
                    Kt <= 32'd3210313671;
                end
                32'd28: begin
                    Kt <= 32'd3336571891;
                end
                32'd29: begin
                    Kt <= 32'd3584528711;
                end
                32'd30: begin
                    Kt <= 32'd113926993;
                end
                32'd31: begin
                    Kt <= 32'd338241895;
                end
                32'd32: begin
                    Kt <= 32'd666307205;
                end
                32'd33: begin
                    Kt <= 32'd773529912;
                end
                32'd34: begin
                    Kt <= 32'd1294757372;
                end
                32'd35: begin
                    Kt <= 32'd1396182291;
                end
                32'd36: begin
                    Kt <= 32'd1695183700;
                end
                32'd37: begin
                    Kt <= 32'd1986661051;
                end
                32'd38: begin
                    Kt <= 32'd2177026350;
                end
                32'd39: begin
                    Kt <= 32'd2456956037;
                end
                32'd40: begin
                    Kt <= 32'd2730485921;
                end
                32'd41: begin
                    Kt <= 32'd2820302411;
                end
                32'd42: begin
                    Kt <= 32'd3259730800;
                end
                32'd43: begin
                    Kt <= 32'd3345764771;
                end
                32'd44: begin
                    Kt <= 32'd3516065817;
                end
                32'd45: begin
                    Kt <= 32'd3600352804;
                end
                32'd46: begin
                    Kt <= 32'd4094571909;
                end
                32'd47: begin
                    Kt <= 32'd275423344;
                end
                32'd48: begin
                    Kt <= 32'd430227734;
                end
                32'd49: begin
                    Kt <= 32'd506948616;
                end
                32'd50: begin
                    Kt <= 32'd659060556;
                end
                32'd51: begin
                    Kt <= 32'd883997877;
                end
                32'd52: begin
                    Kt <= 32'd958139571;
                end
                32'd53: begin
                    Kt <= 32'd1322822218;
                end
                32'd54: begin
                    Kt <= 32'd1537002063;
                end
                32'd55: begin
                    Kt <= 32'd1747873779;
                end
                32'd56: begin
                    Kt <= 32'd1955562222;
                end
                32'd57: begin
                    Kt <= 32'd2024104815;
                end
                32'd58: begin
                    Kt <= 32'd2227730452;
                end
                32'd59: begin
                    Kt <= 32'd2361852424;
                end
                32'd60: begin
                    Kt <= 32'd2428436474;
                end
                32'd61: begin
                    Kt <= 32'd2756734187;
                end
                32'd62: begin
                    Kt <= 32'd3204031479;
                end
                32'd63: begin
                    Kt <= 32'd3329325298;
                end
                default: begin
                    Kt <= 32'd0;
                end
            endcase
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            text_o <= 32'd0;
            read_counter <= 32'd0;
        end
        else begin
            if (cmd[0]) begin
                read_counter <= 32'd7;
            end
            else begin
                if (~(busy)) begin
                    case (read_counter)
                        32'd7: begin
                            text_o <= SHA256_result[255:224];
                        end
                        32'd6: begin
                            text_o <= SHA256_result[223:192];
                        end
                        32'd5: begin
                            text_o <= SHA256_result[191:160];
                        end
                        32'd4: begin
                            text_o <= SHA256_result[159:128];
                        end
                        32'd3: begin
                            text_o <= SHA256_result[127:96];
                        end
                        32'd2: begin
                            text_o <= SHA256_result[95:64];
                        end
                        32'd1: begin
                            text_o <= SHA256_result[63:32];
                        end
                        32'd0: begin
                            text_o <= SHA256_result[31:0];
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