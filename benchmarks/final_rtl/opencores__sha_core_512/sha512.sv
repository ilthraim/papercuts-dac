module sha512 (
    input logic clk_i,
    input logic rst_i,
    input logic[31:0] text_i,
    output reg[31:0] text_o,
    input logic[3:0] cmd_i,
    input logic cmd_w_i,
    output logic[4:0] cmd_o
);
    reg[4:0] cmd;
    reg[6:0] round;
    wire logic[6:0] round_plus_1;
    reg [3:0] read_counter;
    reg[63:0] H0;
    reg[63:0] H1;
    reg[63:0] H2;
    reg[63:0] H3;
    reg[63:0] H4;
    reg[63:0] H5;
    reg[63:0] H6;
    reg[63:0] H7;
    reg[63:0] W0;
    reg[63:0] W1;
    reg[63:0] W2;
    reg[63:0] W3;
    reg[63:0] W4;
    reg[63:0] W5;
    reg[63:0] W6;
    reg[63:0] W7;
    reg[63:0] W8;
    reg[63:0] W9;
    reg[63:0] W10;
    reg[63:0] W11;
    reg[63:0] W12;
    reg[63:0] W13;
    reg[63:0] W14;
    reg[63:0] Wt;
    reg[63:0] Kt;
    reg[63:0] A;
    reg[63:0] B;
    reg[63:0] C;
    reg[63:0] D;
    reg[63:0] E;
    reg[63:0] F;
    reg[63:0] G;
    reg[63:0] H;
    reg busy;
    assign cmd_o = cmd;
    always @(posedge clk_i) begin
        if (rst_i) begin
            cmd <= 32'd0;
        end
        else if (cmd_w_i) begin
            cmd[3:0] <= cmd_i[3:0];
        end
        else begin
            cmd[4] <= busy;
            if (~(busy)) begin
                cmd[1:0] <= 2'b0;
            end
        end
    end
    wire logic[63:0] f1_EFG_64;
    wire logic[63:0] f2_ABC_64;
    wire logic[63:0] f3_A_64;
    wire logic[63:0] f4_E_64;
    wire logic[63:0] f5_W1_64;
    wire logic[63:0] f6_W14_64;
    wire logic[63:0] T1_64;
    wire logic[63:0] T2_64;
    wire logic[63:0] W1_swap;
    wire logic[63:0] W14_swap;
    wire logic[63:0] Wt_64_swap;
    wire logic[63:0] next_Wt;
    wire logic[63:0] next_E;
    wire logic[63:0] next_A;
    wire logic[383:0] SHA384_result;
    wire logic[511:0] SHA512_result;
    assign f1_EFG_64 = ((E & F) ^ (~(E) & G));
    assign f2_ABC_64 = (((A & B) ^ (B & C)) ^ (A & C));
    assign f3_A_64 = (({A[27:0], A[63:28]} ^ {A[33:0], A[63:34]}) ^ {A[38:0], A[63:39]});
    assign f4_E_64 = (({E[13:0], E[63:14]} ^ {E[17:0], E[63:18]}) ^ {E[40:0], E[63:41]});
    assign W1_swap = {W1[31:0], W1[63:32]};
    assign f5_W1_64 = (({W1_swap[0], W1_swap[63:1]} ^ {W1_swap[7:0], W1_swap[63:8]}) ^ {7'b0, W1_swap[63:7]});
    assign W14_swap = {W14[31:0], W14[63:32]};
    assign f6_W14_64 = (({W14_swap[18:0], W14_swap[63:19]} ^ {W14_swap[60:0], W14_swap[63:61]}) ^ {6'b0, W14_swap[63:6]});
    assign Wt_64_swap = (((f6_W14_64 + {W9[31:0], W9[63:32]}) + f5_W1_64) + {W0[31:0], W0[63:32]});
    assign T1_64 = ((((H[63:0] + f4_E_64) + f1_EFG_64) + Kt[63:0]) + {Wt[31:0], Wt[63:32]});
    assign T2_64 = (f3_A_64 + f2_ABC_64);
    assign next_Wt = {Wt_64_swap[31:0], Wt_64_swap[63:32]};
    assign next_E = (D[63:0] + T1_64);
    assign next_A = (T1_64 + T2_64);
    assign SHA384_result = {A, B, C, D, E, F};
    assign SHA512_result = {A, B, C, D, E, F, G, H};
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
                        W0[31:0] <= text_i;
                        Wt[31:0] <= text_i;
                        busy <= 32'd1;
                        round <= round_plus_1;
                        case (cmd[3:2])
                            2'b0: begin
                                A <= 64'hcbbb9d5dc1059ed8;
                                B <= 64'h629a292a367cd507;
                                C <= 64'h9159015a3070dd17;
                                D <= 64'h152fecd8f70e5939;
                                E <= 64'h67332667ffc00b31;
                                F <= 64'h8eb44a8768581511;
                                G <= 64'hdb0c2e0d64f98fa7;
                                H <= 64'h47b5481dbefa4fa4;
                                H0 <= 64'hcbbb9d5dc1059ed8;
                                H1 <= 64'h629a292a367cd507;
                                H2 <= 64'h9159015a3070dd17;
                                H3 <= 64'h152fecd8f70e5939;
                                H4 <= 64'h67332667ffc00b31;
                                H5 <= 64'h8eb44a8768581511;
                                H6 <= 64'hdb0c2e0d64f98fa7;
                                H7 <= 64'h47b5481dbefa4fa4;
                            end
                            2'b1: begin
                                H0 <= A;
                                H1 <= B;
                                H2 <= C;
                                H3 <= D;
                                H4 <= E;
                                H5 <= F;
                                H6 <= G;
                                H7 <= H;
                            end
                            2'b10: begin
                                A <= 64'h6a09e667f3bcc908;
                                B <= 64'hbb67ae8584caa73b;
                                C <= 64'h3c6ef372fe94f82b;
                                D <= 64'ha54ff53a5f1d36f1;
                                E <= 64'h510e527fade682d1;
                                F <= 64'h9b05688c2b3e6c1f;
                                G <= 64'h1f83d9abfb41bd6b;
                                H <= 64'h5be0cd19137e2179;
                                H0 <= 64'h6a09e667f3bcc908;
                                H1 <= 64'hbb67ae8584caa73b;
                                H2 <= 64'h3c6ef372fe94f82b;
                                H3 <= 64'ha54ff53a5f1d36f1;
                                H4 <= 64'h510e527fade682d1;
                                H5 <= 64'h9b05688c2b3e6c1f;
                                H6 <= 64'h1f83d9abfb41bd6b;
                                H7 <= 64'h5be0cd19137e2179;
                            end
                            2'b11: begin
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
                    W0[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd2: begin
                    W1[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                    W1[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd4: begin
                    W2[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                    W2[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd6: begin
                    W3[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                    W3[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd8: begin
                    W4[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                    W4[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd10: begin
                    W5[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                    W5[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd12: begin
                    W6[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                    W6[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd14: begin
                    W7[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                    W7[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd16: begin
                    W8[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                32'd17: begin
                    W8[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd18: begin
                    W9[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                32'd19: begin
                    W9[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd20: begin
                    W10[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                32'd21: begin
                    W10[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd22: begin
                    W11[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                32'd23: begin
                    W11[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd24: begin
                    W12[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                32'd25: begin
                    W12[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd26: begin
                    W13[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                32'd27: begin
                    W13[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd28: begin
                    W14[31:0] <= text_i;
                    Wt[31:0] <= text_i;
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
                32'd29: begin
                    W14[63:32] <= text_i;
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd30: begin
                    Wt[31:0] <= text_i;
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
                32'd31: begin
                    Wt[63:32] <= text_i;
                    round <= round_plus_1;
                end
                32'd32, 32'd33, 32'd34, 32'd35, 32'd36, 32'd37, 32'd38, 32'd39, 32'd40, 32'd41, 32'd42, 32'd43, 32'd44, 32'd45, 32'd46, 32'd47, 32'd48, 32'd49, 32'd50, 32'd51, 32'd52, 32'd53, 32'd54, 32'd55, 32'd56, 32'd57, 32'd58, 32'd59, 32'd60, 32'd61, 32'd62, 32'd63, 32'd64, 32'd65, 32'd66, 32'd67, 32'd68, 32'd69, 32'd70, 32'd71, 32'd72, 32'd73, 32'd74, 32'd75, 32'd76, 32'd77, 32'd78, 32'd79, 32'd80, 32'd81, 32'd82, 32'd83, 32'd84, 32'd85, 32'd86, 32'd87, 32'd88, 32'd89, 32'd90, 32'd91, 32'd92, 32'd93, 32'd94, 32'd95: begin
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
                32'd96: begin
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
                32'd1: begin
                    Kt <= 64'h428a2f98d728ae22;
                end
                32'd3: begin
                    Kt <= 64'h7137449123ef65cd;
                end
                32'd5: begin
                    Kt <= 64'hb5c0fbcfec4d3b2f;
                end
                32'd7: begin
                    Kt <= 64'he9b5dba58189dbbc;
                end
                32'd9: begin
                    Kt <= 64'h3956c25bf348b538;
                end
                32'd11: begin
                    Kt <= 64'h59f111f1b605d019;
                end
                32'd13: begin
                    Kt <= 64'h923f82a4af194f9b;
                end
                32'd15: begin
                    Kt <= 64'hab1c5ed5da6d8118;
                end
                32'd17: begin
                    Kt <= 64'hd807aa98a3030242;
                end
                32'd19: begin
                    Kt <= 64'h12835b0145706fbe;
                end
                32'd21: begin
                    Kt <= 64'h243185be4ee4b28c;
                end
                32'd23: begin
                    Kt <= 64'h550c7dc3d5ffb4e2;
                end
                32'd25: begin
                    Kt <= 64'h72be5d74f27b896f;
                end
                32'd27: begin
                    Kt <= 64'h80deb1fe3b1696b1;
                end
                32'd29: begin
                    Kt <= 64'h9bdc06a725c71235;
                end
                32'd31: begin
                    Kt <= 64'hc19bf174cf692694;
                end
                32'd32: begin
                    Kt <= 64'he49b69c19ef14ad2;
                end
                32'd33: begin
                    Kt <= 64'hefbe4786384f25e3;
                end
                32'd34: begin
                    Kt <= 64'hfc19dc68b8cd5b5;
                end
                32'd35: begin
                    Kt <= 64'h240ca1cc77ac9c65;
                end
                32'd36: begin
                    Kt <= 64'h2de92c6f592b0275;
                end
                32'd37: begin
                    Kt <= 64'h4a7484aa6ea6e483;
                end
                32'd38: begin
                    Kt <= 64'h5cb0a9dcbd41fbd4;
                end
                32'd39: begin
                    Kt <= 64'h76f988da831153b5;
                end
                32'd40: begin
                    Kt <= 64'h983e5152ee66dfab;
                end
                32'd41: begin
                    Kt <= 64'ha831c66d2db43210;
                end
                32'd42: begin
                    Kt <= 64'hb00327c898fb213f;
                end
                32'd43: begin
                    Kt <= 64'hbf597fc7beef0ee4;
                end
                32'd44: begin
                    Kt <= 64'hc6e00bf33da88fc2;
                end
                32'd45: begin
                    Kt <= 64'hd5a79147930aa725;
                end
                32'd46: begin
                    Kt <= 64'h6ca6351e003826f;
                end
                32'd47: begin
                    Kt <= 64'h142929670a0e6e70;
                end
                32'd48: begin
                    Kt <= 64'h27b70a8546d22ffc;
                end
                32'd49: begin
                    Kt <= 64'h2e1b21385c26c926;
                end
                32'd50: begin
                    Kt <= 64'h4d2c6dfc5ac42aed;
                end
                32'd51: begin
                    Kt <= 64'h53380d139d95b3df;
                end
                32'd52: begin
                    Kt <= 64'h650a73548baf63de;
                end
                32'd53: begin
                    Kt <= 64'h766a0abb3c77b2a8;
                end
                32'd54: begin
                    Kt <= 64'h81c2c92e47edaee6;
                end
                32'd55: begin
                    Kt <= 64'h92722c851482353b;
                end
                32'd56: begin
                    Kt <= 64'ha2bfe8a14cf10364;
                end
                32'd57: begin
                    Kt <= 64'ha81a664bbc423001;
                end
                32'd58: begin
                    Kt <= 64'hc24b8b70d0f89791;
                end
                32'd59: begin
                    Kt <= 64'hc76c51a30654be30;
                end
                32'd60: begin
                    Kt <= 64'hd192e819d6ef5218;
                end
                32'd61: begin
                    Kt <= 64'hd69906245565a910;
                end
                32'd62: begin
                    Kt <= 64'hf40e35855771202a;
                end
                32'd63: begin
                    Kt <= 64'h106aa07032bbd1b8;
                end
                32'd64: begin
                    Kt <= 64'h19a4c116b8d2d0c8;
                end
                32'd65: begin
                    Kt <= 64'h1e376c085141ab53;
                end
                32'd66: begin
                    Kt <= 64'h2748774cdf8eeb99;
                end
                32'd67: begin
                    Kt <= 64'h34b0bcb5e19b48a8;
                end
                32'd68: begin
                    Kt <= 64'h391c0cb3c5c95a63;
                end
                32'd69: begin
                    Kt <= 64'h4ed8aa4ae3418acb;
                end
                32'd70: begin
                    Kt <= 64'h5b9cca4f7763e373;
                end
                32'd71: begin
                    Kt <= 64'h682e6ff3d6b2b8a3;
                end
                32'd72: begin
                    Kt <= 64'h748f82ee5defb2fc;
                end
                32'd73: begin
                    Kt <= 64'h78a5636f43172f60;
                end
                32'd74: begin
                    Kt <= 64'h84c87814a1f0ab72;
                end
                32'd75: begin
                    Kt <= 64'h8cc702081a6439ec;
                end
                32'd76: begin
                    Kt <= 64'h90befffa23631e28;
                end
                32'd77: begin
                    Kt <= 64'ha4506cebde82bde9;
                end
                32'd78: begin
                    Kt <= 64'hbef9a3f7b2c67915;
                end
                32'd79: begin
                    Kt <= 64'hc67178f2e372532b;
                end
                32'd80: begin
                    Kt <= 64'hca273eceea26619c;
                end
                32'd81: begin
                    Kt <= 64'hd186b8c721c0c207;
                end
                32'd82: begin
                    Kt <= 64'heada7dd6cde0eb1e;
                end
                32'd83: begin
                    Kt <= 64'hf57d4f7fee6ed178;
                end
                32'd84: begin
                    Kt <= 64'h6f067aa72176fba;
                end
                32'd85: begin
                    Kt <= 64'ha637dc5a2c898a6;
                end
                32'd86: begin
                    Kt <= 64'h113f9804bef90dae;
                end
                32'd87: begin
                    Kt <= 64'h1b710b35131c471b;
                end
                32'd88: begin
                    Kt <= 64'h28db77f523047d84;
                end
                32'd89: begin
                    Kt <= 64'h32caab7b40c72493;
                end
                32'd90: begin
                    Kt <= 64'h3c9ebe0a15c9bebc;
                end
                32'd91: begin
                    Kt <= 64'h431d67c49c100d4c;
                end
                32'd92: begin
                    Kt <= 64'h4cc5d4becb3e42b6;
                end
                32'd93: begin
                    Kt <= 64'h597f299cfc657e2a;
                end
                32'd94: begin
                    Kt <= 64'h5fcb6fab3ad6faec;
                end
                32'd95: begin
                    Kt <= 64'h6c44198c4a475817;
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
                case (cmd[3])
                    1'b0: begin
                        read_counter <= 32'd11;
                    end
                    1'b1: begin
                        read_counter <= 32'd15;
                    end
                endcase
            end
            else begin
                if (~(busy)) begin
                    case (cmd[3])
                        1'b0: begin
                            case (read_counter)
                                32'd11: begin
                                    text_o <= SHA384_result[383:352];
                                end
                                32'd10: begin
                                    text_o <= SHA384_result[351:320];
                                end
                                32'd9: begin
                                    text_o <= SHA384_result[319:288];
                                end
                                32'd8: begin
                                    text_o <= SHA384_result[287:256];
                                end
                                32'd7: begin
                                    text_o <= SHA384_result[255:224];
                                end
                                32'd6: begin
                                    text_o <= SHA384_result[223:192];
                                end
                                32'd5: begin
                                    text_o <= SHA384_result[191:160];
                                end
                                32'd4: begin
                                    text_o <= SHA384_result[159:128];
                                end
                                32'd3: begin
                                    text_o <= SHA384_result[127:96];
                                end
                                32'd2: begin
                                    text_o <= SHA384_result[95:64];
                                end
                                32'd1: begin
                                    text_o <= SHA384_result[63:32];
                                end
                                32'd0: begin
                                    text_o <= SHA384_result[31:0];
                                end
                                default: begin
                                    text_o <= 32'd0;
                                end
                            endcase
                        end
                        1'b1: begin
                            case (read_counter)
                                32'd15: begin
                                    text_o <= SHA512_result[511:480];
                                end
                                32'd14: begin
                                    text_o <= SHA512_result[479:448];
                                end
                                32'd13: begin
                                    text_o <= SHA512_result[447:416];
                                end
                                32'd12: begin
                                    text_o <= SHA512_result[415:384];
                                end
                                32'd11: begin
                                    text_o <= SHA512_result[383:352];
                                end
                                32'd10: begin
                                    text_o <= SHA512_result[351:320];
                                end
                                32'd9: begin
                                    text_o <= SHA512_result[319:288];
                                end
                                32'd8: begin
                                    text_o <= SHA512_result[287:256];
                                end
                                32'd7: begin
                                    text_o <= SHA512_result[255:224];
                                end
                                32'd6: begin
                                    text_o <= SHA512_result[223:192];
                                end
                                32'd5: begin
                                    text_o <= SHA512_result[191:160];
                                end
                                32'd4: begin
                                    text_o <= SHA512_result[159:128];
                                end
                                32'd3: begin
                                    text_o <= SHA512_result[127:96];
                                end
                                32'd2: begin
                                    text_o <= SHA512_result[95:64];
                                end
                                32'd1: begin
                                    text_o <= SHA512_result[63:32];
                                end
                                32'd0: begin
                                    text_o <= SHA512_result[31:0];
                                end
                                default: begin
                                    text_o <= 32'd0;
                                end
                            endcase
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