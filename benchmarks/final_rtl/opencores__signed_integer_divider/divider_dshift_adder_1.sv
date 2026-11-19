
module divider_dshift_adder_1 (
    input logic[31:0] i_a,
    input logic[31:0] i_b,
    input logic i_c,
    output logic[31:0] o_s,
    output logic o_c
);
    wire logic [5:0] P0;
    wire logic [4:0] G0;
    divider_dshift_adder_1_operator_A_0 operator_A_0 (
        .A(i_a[0]),
        .B(i_b[0]),
        .P(P0[0]),
        .G(G0[0])
    );
    divider_dshift_adder_1_operator_A_1 operator_A_1 (
        .A(i_a[1]),
        .B(i_b[1]),
        .P(P0[1]),
        .G(G0[1])
    );
    divider_dshift_adder_1_operator_A_2 operator_A_2 (
        .A(i_a[2]),
        .B(i_b[2]),
        .P(P0[2]),
        .G(G0[2])
    );
    divider_dshift_adder_1_operator_A_3 operator_A_3 (
        .A(i_a[3]),
        .B(i_b[3]),
        .P(P0[3]),
        .G(G0[3])
    );
    divider_dshift_adder_1_operator_A_4 operator_A_4 (
        .A(i_a[4]),
        .B(i_b[4]),
        .P(P0[4]),
        .G(G0[4])
    );
    divider_dshift_adder_1_operator_A_5 operator_A_5 (
        .A(i_a[5]),
        .B(i_b[5]),
        .P(P0[5]),
        .G()
    );
    divider_dshift_adder_1_operator_A_6 operator_A_6 (
        .A(i_a[6]),
        .B(i_b[6]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_7 operator_A_7 (
        .A(i_a[7]),
        .B(i_b[7]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_8 operator_A_8 (
        .A(i_a[8]),
        .B(i_b[8]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_9 operator_A_9 (
        .A(i_a[9]),
        .B(i_b[9]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_10 operator_A_10 (
        .A(i_a[10]),
        .B(i_b[10]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_11 operator_A_11 (
        .A(i_a[11]),
        .B(i_b[11]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_12 operator_A_12 (
        .A(i_a[12]),
        .B(i_b[12]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_13 operator_A_13 (
        .A(i_a[13]),
        .B(i_b[13]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_14 operator_A_14 (
        .A(i_a[14]),
        .B(i_b[14]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_15 operator_A_15 (
        .A(i_a[15]),
        .B(i_b[15]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_16 operator_A_16 (
        .A(i_a[16]),
        .B(i_b[16]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_17 operator_A_17 (
        .A(i_a[17]),
        .B(i_b[17]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_18 operator_A_18 (
        .A(i_a[18]),
        .B(i_b[18]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_19 operator_A_19 (
        .A(i_a[19]),
        .B(i_b[19]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_20 operator_A_20 (
        .A(i_a[20]),
        .B(i_b[20]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_21 operator_A_21 (
        .A(i_a[21]),
        .B(i_b[21]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_22 operator_A_22 (
        .A(i_a[22]),
        .B(i_b[22]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_23 operator_A_23 (
        .A(i_a[23]),
        .B(i_b[23]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_24 operator_A_24 (
        .A(i_a[24]),
        .B(i_b[24]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_25 operator_A_25 (
        .A(i_a[25]),
        .B(i_b[25]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_26 operator_A_26 (
        .A(i_a[26]),
        .B(i_b[26]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_27 operator_A_27 (
        .A(i_a[27]),
        .B(i_b[27]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_28 operator_A_28 (
        .A(i_a[28]),
        .B(i_b[28]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_29 operator_A_29 (
        .A(i_a[29]),
        .B(i_b[29]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_30 operator_A_30 (
        .A(i_a[30]),
        .B(i_b[30]),
        .P(),
        .G()
    );
    divider_dshift_adder_1_operator_A_31 operator_A_31 (
        .A(i_a[31]),
        .B(i_b[31]),
        .P(),
        .G()
    );
    wire logic [2:0] G1;
    wire logic [2:1] P1;
    divider_dshift_adder_1_operator_C_stage_1_0 operator_C_stage_1_0 (
        .P(P0[0]),
        .G(G0[0]),
        .G1(i_c),
        .Go(G1[0])
    );
    divider_dshift_adder_1_operator_B_stage_1_1 operator_B_stage_1_1 (
        .P(P0[2]),
        .G(G0[2]),
        .P1(P0[1]),
        .G1(G0[1]),
        .Po(P1[1]),
        .Go(G1[1])
    );
    divider_dshift_adder_1_operator_B_stage_1_2 operator_B_stage_1_2 (
        .P(P0[4]),
        .G(G0[4]),
        .P1(P0[3]),
        .G1(G0[3]),
        .Po(P1[2]),
        .Go(G1[2])
    );
    divider_dshift_adder_1_operator_B_stage_1_3 operator_B_stage_1_3 (
        .P(1'b0),
        .G(1'b0),
        .P1(P0[5]),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_4 operator_B_stage_1_4 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_5 operator_B_stage_1_5 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_6 operator_B_stage_1_6 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_7 operator_B_stage_1_7 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_8 operator_B_stage_1_8 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_9 operator_B_stage_1_9 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_10 operator_B_stage_1_10 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_11 operator_B_stage_1_11 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_12 operator_B_stage_1_12 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_13 operator_B_stage_1_13 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_14 operator_B_stage_1_14 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_1_15 operator_B_stage_1_15 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    wire logic [2:0] G2;
    wire logic [2:2] P2;
    assign G2[0] = G1[0];
    divider_dshift_adder_1_operator_C_stage_2_1 operator_C_stage_2_1 (
        .P(P1[1]),
        .G(G1[1]),
        .G1(G1[0]),
        .Go(G2[1])
    );
    divider_dshift_adder_1_operator_B_stage_2_2 operator_B_stage_2_2 (
        .P(P1[2]),
        .G(G1[2]),
        .P1(P1[1]),
        .G1(G1[1]),
        .Po(P2[2]),
        .Go(G2[2])
    );
    divider_dshift_adder_1_operator_B_stage_2_3 operator_B_stage_2_3 (
        .P(1'b0),
        .G(1'b0),
        .P1(P1[2]),
        .G1(G1[2]),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_4 operator_B_stage_2_4 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_5 operator_B_stage_2_5 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_6 operator_B_stage_2_6 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_7 operator_B_stage_2_7 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_8 operator_B_stage_2_8 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_9 operator_B_stage_2_9 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_10 operator_B_stage_2_10 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_11 operator_B_stage_2_11 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_12 operator_B_stage_2_12 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_13 operator_B_stage_2_13 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_14 operator_B_stage_2_14 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_2_15 operator_B_stage_2_15 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    wire logic [2:0] G3;
    wire logic [4:4] P3;
    assign G3[0] = G2[0];
    assign G3[1] = G2[1];
    divider_dshift_adder_1_operator_C_stage_3_2 operator_C_stage_3_2 (
        .P(P2[2]),
        .G(G2[2]),
        .G1(G2[0]),
        .Go(G3[2])
    );
    divider_dshift_adder_1_operator_C_stage_3_3 operator_C_stage_3_3 (
        .P(1'b0),
        .G(1'b0),
        .G1(G2[1]),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_4 operator_B_stage_3_4 (
        .P(1'b0),
        .G(1'b0),
        .P1(P2[2]),
        .G1(G2[2]),
        .Po(P3[4]),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_5 operator_B_stage_3_5 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_6 operator_B_stage_3_6 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_7 operator_B_stage_3_7 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_8 operator_B_stage_3_8 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_9 operator_B_stage_3_9 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_10 operator_B_stage_3_10 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_11 operator_B_stage_3_11 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_12 operator_B_stage_3_12 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_13 operator_B_stage_3_13 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_14 operator_B_stage_3_14 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_3_15 operator_B_stage_3_15 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    wire logic [2:0] G4;
    wire logic [8:8] P4;
    assign G4[0] = G3[0];
    assign G4[1] = G3[1];
    assign G4[2] = G3[2];
    divider_dshift_adder_1_operator_C_stage_4_4 operator_C_stage_4_4 (
        .P(P3[4]),
        .G(1'b0),
        .G1(G3[0]),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_4_5 operator_C_stage_4_5 (
        .P(1'b0),
        .G(1'b0),
        .G1(G3[1]),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_4_6 operator_C_stage_4_6 (
        .P(1'b0),
        .G(1'b0),
        .G1(G3[2]),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_4_7 operator_C_stage_4_7 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_8 operator_B_stage_4_8 (
        .P(1'b0),
        .G(1'b0),
        .P1(P3[4]),
        .G1(1'b0),
        .Po(P4[8]),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_9 operator_B_stage_4_9 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_10 operator_B_stage_4_10 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_11 operator_B_stage_4_11 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_12 operator_B_stage_4_12 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_13 operator_B_stage_4_13 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_14 operator_B_stage_4_14 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    divider_dshift_adder_1_operator_B_stage_4_15 operator_B_stage_4_15 (
        .P(1'b0),
        .G(1'b0),
        .P1(1'b0),
        .G1(1'b0),
        .Po(),
        .Go()
    );
    wire logic [2:0] G5;
    assign G5[0] = G4[0];
    assign G5[1] = G4[1];
    assign G5[2] = G4[2];
    divider_dshift_adder_1_operator_C_stage_5_8 operator_C_stage_5_8 (
        .P(P4[8]),
        .G(1'b0),
        .G1(G4[0]),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_5_9 operator_C_stage_5_9 (
        .P(1'b0),
        .G(1'b0),
        .G1(G4[1]),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_5_10 operator_C_stage_5_10 (
        .P(1'b0),
        .G(1'b0),
        .G1(G4[2]),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_5_11 operator_C_stage_5_11 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_5_12 operator_C_stage_5_12 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_5_13 operator_C_stage_5_13 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_5_14 operator_C_stage_5_14 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_5_15 operator_C_stage_5_15 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    wire logic [4:0] G6;
    assign G6[0] = G5[0];
    assign G6[2] = G5[1];
    assign G6[4] = G5[2];
    divider_dshift_adder_1_operator_C_stage_6_0 operator_C_stage_6_0 (
        .P(P0[1]),
        .G(G0[1]),
        .G1(G5[0]),
        .Go(G6[1])
    );
    divider_dshift_adder_1_operator_C_stage_6_1 operator_C_stage_6_1 (
        .P(P0[3]),
        .G(G0[3]),
        .G1(G5[1]),
        .Go(G6[3])
    );
    divider_dshift_adder_1_operator_C_stage_6_2 operator_C_stage_6_2 (
        .P(P0[5]),
        .G(1'b0),
        .G1(G5[2]),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_3 operator_C_stage_6_3 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_4 operator_C_stage_6_4 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_5 operator_C_stage_6_5 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_6 operator_C_stage_6_6 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_7 operator_C_stage_6_7 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_8 operator_C_stage_6_8 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_9 operator_C_stage_6_9 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_10 operator_C_stage_6_10 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_11 operator_C_stage_6_11 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_12 operator_C_stage_6_12 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_13 operator_C_stage_6_13 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_14 operator_C_stage_6_14 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    divider_dshift_adder_1_operator_C_stage_6_15 operator_C_stage_6_15 (
        .P(1'b0),
        .G(1'b0),
        .G1(1'b0),
        .Go()
    );
    assign o_s[0] = (P0[0] ^ i_c);
    assign o_s[1] = (P0[1] ^ G6[0]);
    assign o_s[2] = (P0[2] ^ G6[1]);
    assign o_s[3] = (P0[3] ^ G6[2]);
    assign o_s[4] = (P0[4] ^ G6[3]);
    assign o_s[5] = (P0[5] ^ G6[4]);
    assign o_s[6] = (1'b0);
    assign o_s[7] = (1'b0);
    assign o_s[8] = (1'b0);
    assign o_s[9] = (1'b0);
    assign o_s[10] = (1'b0);
    assign o_s[11] = (1'b0);
    assign o_s[12] = (1'b0);
    assign o_s[13] = (1'b0);
    assign o_s[14] = (1'b0);
    assign o_s[15] = (1'b0);
    assign o_s[16] = (1'b0);
    assign o_s[17] = (1'b0);
    assign o_s[18] = (1'b0);
    assign o_s[19] = (1'b0);
    assign o_s[20] = (1'b0);
    assign o_s[21] = (1'b0);
    assign o_s[22] = (1'b0);
    assign o_s[23] = (1'b0);
    assign o_s[24] = (1'b0);
    assign o_s[25] = (1'b0);
    assign o_s[26] = (1'b0);
    assign o_s[27] = (1'b0);
    assign o_s[28] = (1'b0);
    assign o_s[29] = (1'b0);
    assign o_s[30] = (1'b0);
    assign o_s[31] = (1'b0);
    assign o_c = 1'b0;
endmodule