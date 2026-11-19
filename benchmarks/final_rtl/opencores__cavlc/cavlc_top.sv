module cavlc_top (
    input logic clk,
    input logic rst_n,
    input logic ena,
    input logic start,
    input logic[0:15] rbsp,
    input logic signed[5:0] nC,
    input logic[4:0] max_coeff_num,
    output logic signed[8:0] coeff_0,
    output logic signed[8:0] coeff_1,
    output logic signed[8:0] coeff_2,
    output logic signed[8:0] coeff_3,
    output logic signed[8:0] coeff_4,
    output logic signed[8:0] coeff_5,
    output logic signed[8:0] coeff_6,
    output logic signed[8:0] coeff_7,
    output logic signed[8:0] coeff_8,
    output logic signed[8:0] coeff_9,
    output logic signed[8:0] coeff_10,
    output logic signed[8:0] coeff_11,
    output logic signed[8:0] coeff_12,
    output logic signed[8:0] coeff_13,
    output logic signed[8:0] coeff_14,
    output logic signed[8:0] coeff_15,
    output logic[4:0] TotalCoeff,
    output logic[4:0] len_comb,
    output logic idle,
    output logic valid
);
    wire logic[1:0] TrailingOnes;
    wire logic[1:0] TrailingOnes_comb;
    wire logic[4:0] TotalCoeff_comb;
    wire logic[4:0] len_read_total_coeffs_comb;
    wire logic[7:0] cavlc_state;
    cavlc_top_cavlc_read_total_coeffs cavlc_read_total_coeffs (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .start(start),
        .sel(cavlc_state[1]),
        .rbsp(rbsp),
        .nC(nC),
        .TrailingOnes(TrailingOnes),
        .TotalCoeff(TotalCoeff),
        .TrailingOnes_comb(TrailingOnes_comb),
        .TotalCoeff_comb(TotalCoeff_comb),
        .len_comb(len_read_total_coeffs_comb)
    );
    wire logic[4:0] len_read_levels_comb;
    wire logic[3:0] i;
    wire logic[8:0] level_0;
    wire logic[8:0] level_1;
    wire logic[8:0] level_2;
    wire logic[8:0] level_3;
    wire logic[8:0] level_4;
    wire logic[8:0] level_5;
    wire logic[8:0] level_6;
    wire logic[8:0] level_7;
    wire logic[8:0] level_8;
    wire logic[8:0] level_9;
    wire logic[8:0] level_10;
    wire logic[8:0] level_11;
    wire logic[8:0] level_12;
    wire logic[8:0] level_13;
    wire logic[8:0] level_14;
    wire logic[8:0] level_15;
    cavlc_top_cavlc_read_levels cavlc_read_levels (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .t1s_sel(cavlc_state[2]),
        .prefix_sel(cavlc_state[3]),
        .suffix_sel(cavlc_state[4]),
        .calc_sel(cavlc_state[5]),
        .TrailingOnes(TrailingOnes),
        .TotalCoeff(TotalCoeff),
        .rbsp(rbsp),
        .i(i),
        .level_0(level_0),
        .level_1(level_1),
        .level_2(level_2),
        .level_3(level_3),
        .level_4(level_4),
        .level_5(level_5),
        .level_6(level_6),
        .level_7(level_7),
        .level_8(level_8),
        .level_9(level_9),
        .level_10(level_10),
        .level_11(level_11),
        .level_12(level_12),
        .level_13(level_13),
        .level_14(level_14),
        .level_15(level_15),
        .len_comb(len_read_levels_comb)
    );
    wire logic[3:0] TotalZeros_comb;
    wire logic[3:0] len_read_total_zeros_comb;
    cavlc_top_cavlc_read_total_zeros cavlc_read_total_zeros (
        .ena(ena),
        .sel(cavlc_state[6]),
        .chroma_DC_sel(nC[5]),
        .rbsp(rbsp[0:8]),
        .TotalCoeff(TotalCoeff[3:0]),
        .TotalZeros_comb(TotalZeros_comb),
        .len_comb(len_read_total_zeros_comb)
    );
    wire logic[3:0] ZeroLeft;
    wire logic[3:0] len_read_run_befores_comb;
    cavlc_top_cavlc_read_run_befores cavlc_read_run_befores (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .sel(cavlc_state[7]),
        .clr(cavlc_state[1]),
        .ZeroLeft_init(cavlc_state[6]),
        .rbsp(rbsp[0:10]),
        .i(i),
        .TotalZeros_comb(TotalZeros_comb),
        .level_0(level_0),
        .level_1(level_1),
        .level_2(level_2),
        .level_3(level_3),
        .level_4(level_4),
        .level_5(level_5),
        .level_6(level_6),
        .level_7(level_7),
        .level_8(level_8),
        .level_9(level_9),
        .level_10(level_10),
        .level_11(level_11),
        .level_12(level_12),
        .level_13(level_13),
        .level_14(level_14),
        .level_15(level_15),
        .coeff_0(coeff_0),
        .coeff_1(coeff_1),
        .coeff_2(coeff_2),
        .coeff_3(coeff_3),
        .coeff_4(coeff_4),
        .coeff_5(coeff_5),
        .coeff_6(coeff_6),
        .coeff_7(coeff_7),
        .coeff_8(coeff_8),
        .coeff_9(coeff_9),
        .coeff_10(coeff_10),
        .coeff_11(coeff_11),
        .coeff_12(coeff_12),
        .coeff_13(coeff_13),
        .coeff_14(coeff_14),
        .coeff_15(coeff_15),
        .ZeroLeft(ZeroLeft),
        .len_comb(len_read_run_befores_comb)
    );
    cavlc_top_cavlc_len_gen cavlc_len_gen (
        .cavlc_state(cavlc_state),
        .len_read_total_coeffs_comb(len_read_total_coeffs_comb),
        .len_read_levels_comb(len_read_levels_comb),
        .len_read_total_zeros_comb(len_read_total_zeros_comb),
        .len_read_run_befores_comb(len_read_run_befores_comb),
        .len_comb(len_comb)
    );
    cavlc_top_cavlc_fsm cavlc_fsm (
        .clk(clk),
        .rst_n(rst_n),
        .ena(ena),
        .start(start),
        .max_coeff_num(max_coeff_num),
        .TotalCoeff(TotalCoeff),
        .TotalCoeff_comb(TotalCoeff_comb),
        .TrailingOnes(TrailingOnes),
        .TrailingOnes_comb(TrailingOnes_comb),
        .ZeroLeft(ZeroLeft),
        .state(cavlc_state),
        .i(i),
        .idle(idle),
        .valid(valid)
    );
endmodule