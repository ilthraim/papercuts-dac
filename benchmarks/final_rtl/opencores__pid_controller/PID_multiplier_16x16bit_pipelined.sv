
module PID_multiplier_16x16bit_pipelined (
    input logic i_clk,
    input logic i_rst,
    input logic i_start,
    input logic[15:0] i_md,
    input logic[15:0] i_mr,
    output logic[31:0] o_product,
    output logic o_ready
);
    reg[15:0] md;
    reg[15:0] mr;
    reg stage_0_ready;
    always @(posedge i_clk or negedge i_rst) begin
        if (!(i_rst)) begin
            md <= 0;
            mr <= 0;
            stage_0_ready <= 0;
        end
        else begin begin
                md <= i_md;
                mr <= i_mr;
            end
            stage_0_ready <= i_start;
        end
    end
    wire logic[7:0] zero;
    wire logic[7:0] double;
    wire logic[7:0] negation;
    PID_multiplier_16x16bit_pipelined_booth_array_0 booth_array_0 (
        .multiplier(mr),
        .zero(zero),
        .double(double),
        .negation(negation)
    );
    wire logic layer_0_w0[1:0];
    wire logic layer_0_w1;
    wire logic layer_0_w2[2:0];
    wire logic layer_0_w3[1:0];
    wire logic layer_0_w4[3:0];
    wire logic layer_0_w5[2:0];
    wire logic layer_0_w6[4:0];
    wire logic layer_0_w7[3:0];
    wire logic layer_0_w8[5:0];
    wire logic layer_0_w9[4:0];
    wire logic layer_0_w10[6:0];
    wire logic layer_0_w11[5:0];
    wire logic layer_0_w12[7:0];
    wire logic layer_0_w13[6:0];
    wire logic layer_0_w14[8:0];
    wire logic layer_0_w15[7:0];
    wire logic layer_0_w16[8:0];
    wire logic layer_0_w17[7:0];
    wire logic layer_0_w18[6:0];
    wire logic layer_0_w19[6:0];
    wire logic layer_0_w20[5:0];
    wire logic layer_0_w21[5:0];
    wire logic layer_0_w22[4:0];
    wire logic layer_0_w23[4:0];
    wire logic layer_0_w24[3:0];
    wire logic layer_0_w25[3:0];
    wire logic layer_0_w26[2:0];
    wire logic layer_0_w27[2:0];
    wire logic layer_0_w28[1:0];
    wire logic layer_0_w29[1:0];
    wire logic layer_0_w30;
    wire logic layer_0_w31;
    PID_multiplier_16x16bit_pipelined_partial_product_gen_0 partial_product_gen_0 (
        .md(md),
        .zero(zero[0]),
        .double(double[0]),
        .negation(negation[0]),
        .pp({layer_0_w16[0], layer_0_w15[0], layer_0_w14[0], layer_0_w13[0], layer_0_w12[0], layer_0_w11[0], layer_0_w10[0], layer_0_w9[0], layer_0_w8[0], layer_0_w7[0], layer_0_w6[0], layer_0_w5[0], layer_0_w4[0], layer_0_w3[0], layer_0_w2[0], layer_0_w1, layer_0_w0[0]})
    );
    PID_multiplier_16x16bit_pipelined_partial_product_gen_1 partial_product_gen_1 (
        .md(md),
        .zero(zero[1]),
        .double(double[1]),
        .negation(negation[1]),
        .pp({layer_0_w18[0], layer_0_w17[0], layer_0_w16[1], layer_0_w15[1], layer_0_w14[1], layer_0_w13[1], layer_0_w12[1], layer_0_w11[1], layer_0_w10[1], layer_0_w9[1], layer_0_w8[1], layer_0_w7[1], layer_0_w6[1], layer_0_w5[1], layer_0_w4[1], layer_0_w3[1], layer_0_w2[1]})
    );
    PID_multiplier_16x16bit_pipelined_partial_product_gen_2 partial_product_gen_2 (
        .md(md),
        .zero(zero[2]),
        .double(double[2]),
        .negation(negation[2]),
        .pp({layer_0_w20[0], layer_0_w19[0], layer_0_w18[1], layer_0_w17[1], layer_0_w16[2], layer_0_w15[2], layer_0_w14[2], layer_0_w13[2], layer_0_w12[2], layer_0_w11[2], layer_0_w10[2], layer_0_w9[2], layer_0_w8[2], layer_0_w7[2], layer_0_w6[2], layer_0_w5[2], layer_0_w4[2]})
    );
    PID_multiplier_16x16bit_pipelined_partial_product_gen_3 partial_product_gen_3 (
        .md(md),
        .zero(zero[3]),
        .double(double[3]),
        .negation(negation[3]),
        .pp({layer_0_w22[0], layer_0_w21[0], layer_0_w20[1], layer_0_w19[1], layer_0_w18[2], layer_0_w17[2], layer_0_w16[3], layer_0_w15[3], layer_0_w14[3], layer_0_w13[3], layer_0_w12[3], layer_0_w11[3], layer_0_w10[3], layer_0_w9[3], layer_0_w8[3], layer_0_w7[3], layer_0_w6[3]})
    );
    PID_multiplier_16x16bit_pipelined_partial_product_gen_4 partial_product_gen_4 (
        .md(md),
        .zero(zero[4]),
        .double(double[4]),
        .negation(negation[4]),
        .pp({layer_0_w24[0], layer_0_w23[0], layer_0_w22[1], layer_0_w21[1], layer_0_w20[2], layer_0_w19[2], layer_0_w18[3], layer_0_w17[3], layer_0_w16[4], layer_0_w15[4], layer_0_w14[4], layer_0_w13[4], layer_0_w12[4], layer_0_w11[4], layer_0_w10[4], layer_0_w9[4], layer_0_w8[4]})
    );
    PID_multiplier_16x16bit_pipelined_partial_product_gen_5 partial_product_gen_5 (
        .md(md),
        .zero(zero[5]),
        .double(double[5]),
        .negation(negation[5]),
        .pp({layer_0_w26[0], layer_0_w25[0], layer_0_w24[1], layer_0_w23[1], layer_0_w22[2], layer_0_w21[2], layer_0_w20[3], layer_0_w19[3], layer_0_w18[4], layer_0_w17[4], layer_0_w16[5], layer_0_w15[5], layer_0_w14[5], layer_0_w13[5], layer_0_w12[5], layer_0_w11[5], layer_0_w10[5]})
    );
    PID_multiplier_16x16bit_pipelined_partial_product_gen_6 partial_product_gen_6 (
        .md(md),
        .zero(zero[6]),
        .double(double[6]),
        .negation(negation[6]),
        .pp({layer_0_w28[0], layer_0_w27[0], layer_0_w26[1], layer_0_w25[1], layer_0_w24[2], layer_0_w23[2], layer_0_w22[3], layer_0_w21[3], layer_0_w20[4], layer_0_w19[4], layer_0_w18[5], layer_0_w17[5], layer_0_w16[6], layer_0_w15[6], layer_0_w14[6], layer_0_w13[6], layer_0_w12[6]})
    );
    PID_multiplier_16x16bit_pipelined_partial_product_gen_7 partial_product_gen_7 (
        .md(md),
        .zero(zero[7]),
        .double(double[7]),
        .negation(negation[7]),
        .pp({layer_0_w30, layer_0_w29[0], layer_0_w28[1], layer_0_w27[1], layer_0_w26[2], layer_0_w25[2], layer_0_w24[3], layer_0_w23[3], layer_0_w22[4], layer_0_w21[4], layer_0_w20[5], layer_0_w19[5], layer_0_w18[6], layer_0_w17[6], layer_0_w16[7], layer_0_w15[7], layer_0_w14[7]})
    );
    assign layer_0_w0[1] = negation[0];
    assign layer_0_w16[8] = 1;
    assign layer_0_w17[7] = 1;
    assign layer_0_w2[2] = negation[1];
    assign layer_0_w19[6] = 1;
    assign layer_0_w4[3] = negation[2];
    assign layer_0_w21[5] = 1;
    assign layer_0_w6[4] = negation[3];
    assign layer_0_w23[4] = 1;
    assign layer_0_w8[5] = negation[4];
    assign layer_0_w25[3] = 1;
    assign layer_0_w10[6] = negation[5];
    assign layer_0_w27[2] = 1;
    assign layer_0_w12[7] = negation[6];
    assign layer_0_w29[1] = 1;
    assign layer_0_w14[8] = negation[7];
    assign layer_0_w31 = 1;
    wire logic layer_1_w0[1:0];
    wire logic layer_1_w1;
    wire logic layer_1_w2[2:0];
    wire logic layer_1_w3[1:0];
    wire logic layer_1_w4[1:0];
    wire logic layer_1_w5[1:0];
    wire logic layer_1_w6[1:0];
    wire logic layer_1_w7[3:0];
    wire logic layer_1_w8[2:0];
    wire logic layer_1_w9[2:0];
    wire logic layer_1_w10[4:0];
    wire logic layer_1_w11[3:0];
    wire logic layer_1_w12[3:0];
    wire logic layer_1_w13[5:0];
    wire logic layer_1_w14[4:0];
    wire logic layer_1_w15[4:0];
    wire logic layer_1_w16[5:0];
    wire logic layer_1_w17[4:0];
    wire logic layer_1_w18[5:0];
    wire logic layer_1_w19[4:0];
    wire logic layer_1_w20[3:0];
    wire logic layer_1_w21[3:0];
    wire logic layer_1_w22[2:0];
    wire logic layer_1_w23[2:0];
    wire logic layer_1_w24[3:0];
    wire logic layer_1_w25[2:0];
    wire logic layer_1_w26[1:0];
    wire logic layer_1_w27[1:0];
    wire logic layer_1_w28[2:0];
    wire logic layer_1_w29[1:0];
    wire logic layer_1_w30;
    wire logic layer_1_w31;
    assign layer_1_w0[0] = layer_0_w0[0];
    assign layer_1_w0[1] = layer_0_w0[1];
    assign layer_1_w1 = layer_0_w1;
    assign layer_1_w2[0] = layer_0_w2[0];
    assign layer_1_w2[1] = layer_0_w2[1];
    assign layer_1_w2[2] = layer_0_w2[2];
    assign layer_1_w3[0] = layer_0_w3[0];
    assign layer_1_w3[1] = layer_0_w3[1];
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_0 layer_1_full_adder_0 (
        .A(layer_0_w4[0]),
        .B(layer_0_w4[1]),
        .cin(layer_0_w4[2]),
        .S(layer_1_w4[0]),
        .cout(layer_1_w5[0])
    );
    assign layer_1_w4[1] = layer_0_w4[3];
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_1 layer_1_full_adder_1 (
        .A(layer_0_w5[0]),
        .B(layer_0_w5[1]),
        .cin(layer_0_w5[2]),
        .S(layer_1_w5[1]),
        .cout(layer_1_w6[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_0 layer_1_compressor42_0 (
        .A(layer_0_w6[0]),
        .B(layer_0_w6[1]),
        .C(layer_0_w6[2]),
        .D(layer_0_w6[3]),
        .cin(layer_0_w6[4]),
        .S(layer_1_w6[1]),
        .carry(layer_1_w7[0]),
        .cout(layer_1_w7[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_2 layer_1_full_adder_2 (
        .A(layer_0_w7[0]),
        .B(layer_0_w7[1]),
        .cin(layer_0_w7[2]),
        .S(layer_1_w7[2]),
        .cout(layer_1_w8[0])
    );
    assign layer_1_w7[3] = layer_0_w7[3];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_1 layer_1_compressor42_1 (
        .A(layer_0_w8[0]),
        .B(layer_0_w8[1]),
        .C(layer_0_w8[2]),
        .D(layer_0_w8[3]),
        .cin(layer_0_w8[4]),
        .S(layer_1_w8[1]),
        .carry(layer_1_w9[0]),
        .cout(layer_1_w9[1])
    );
    assign layer_1_w8[2] = layer_0_w8[5];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_2 layer_1_compressor42_2 (
        .A(layer_0_w9[0]),
        .B(layer_0_w9[1]),
        .C(layer_0_w9[2]),
        .D(layer_0_w9[3]),
        .cin(layer_0_w9[4]),
        .S(layer_1_w9[2]),
        .carry(layer_1_w10[0]),
        .cout(layer_1_w10[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_3 layer_1_compressor42_3 (
        .A(layer_0_w10[0]),
        .B(layer_0_w10[1]),
        .C(layer_0_w10[2]),
        .D(layer_0_w10[3]),
        .cin(layer_0_w10[4]),
        .S(layer_1_w10[2]),
        .carry(layer_1_w11[0]),
        .cout(layer_1_w11[1])
    );
    assign layer_1_w10[3] = layer_0_w10[5];
    assign layer_1_w10[4] = layer_0_w10[6];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_4 layer_1_compressor42_4 (
        .A(layer_0_w11[0]),
        .B(layer_0_w11[1]),
        .C(layer_0_w11[2]),
        .D(layer_0_w11[3]),
        .cin(layer_0_w11[4]),
        .S(layer_1_w11[2]),
        .carry(layer_1_w12[0]),
        .cout(layer_1_w12[1])
    );
    assign layer_1_w11[3] = layer_0_w11[5];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_5 layer_1_compressor42_5 (
        .A(layer_0_w12[0]),
        .B(layer_0_w12[1]),
        .C(layer_0_w12[2]),
        .D(layer_0_w12[3]),
        .cin(layer_0_w12[4]),
        .S(layer_1_w12[2]),
        .carry(layer_1_w13[0]),
        .cout(layer_1_w13[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_3 layer_1_full_adder_3 (
        .A(layer_0_w12[5]),
        .B(layer_0_w12[6]),
        .cin(layer_0_w12[7]),
        .S(layer_1_w12[3]),
        .cout(layer_1_w13[2])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_6 layer_1_compressor42_6 (
        .A(layer_0_w13[0]),
        .B(layer_0_w13[1]),
        .C(layer_0_w13[2]),
        .D(layer_0_w13[3]),
        .cin(layer_0_w13[4]),
        .S(layer_1_w13[3]),
        .carry(layer_1_w14[0]),
        .cout(layer_1_w14[1])
    );
    assign layer_1_w13[4] = layer_0_w13[5];
    assign layer_1_w13[5] = layer_0_w13[6];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_7 layer_1_compressor42_7 (
        .A(layer_0_w14[0]),
        .B(layer_0_w14[1]),
        .C(layer_0_w14[2]),
        .D(layer_0_w14[3]),
        .cin(layer_0_w14[4]),
        .S(layer_1_w14[2]),
        .carry(layer_1_w15[0]),
        .cout(layer_1_w15[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_4 layer_1_full_adder_4 (
        .A(layer_0_w14[5]),
        .B(layer_0_w14[6]),
        .cin(layer_0_w14[7]),
        .S(layer_1_w14[3]),
        .cout(layer_1_w15[2])
    );
    assign layer_1_w14[4] = layer_0_w14[8];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_8 layer_1_compressor42_8 (
        .A(layer_0_w15[0]),
        .B(layer_0_w15[1]),
        .C(layer_0_w15[2]),
        .D(layer_0_w15[3]),
        .cin(layer_0_w15[4]),
        .S(layer_1_w15[3]),
        .carry(layer_1_w16[0]),
        .cout(layer_1_w16[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_5 layer_1_full_adder_5 (
        .A(layer_0_w15[5]),
        .B(layer_0_w15[6]),
        .cin(layer_0_w15[7]),
        .S(layer_1_w15[4]),
        .cout(layer_1_w16[2])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_9 layer_1_compressor42_9 (
        .A(layer_0_w16[0]),
        .B(layer_0_w16[1]),
        .C(layer_0_w16[2]),
        .D(layer_0_w16[3]),
        .cin(layer_0_w16[4]),
        .S(layer_1_w16[3]),
        .carry(layer_1_w17[0]),
        .cout(layer_1_w17[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_6 layer_1_full_adder_6 (
        .A(layer_0_w16[5]),
        .B(layer_0_w16[6]),
        .cin(layer_0_w16[7]),
        .S(layer_1_w16[4]),
        .cout(layer_1_w17[2])
    );
    assign layer_1_w16[5] = layer_0_w16[8];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_10 layer_1_compressor42_10 (
        .A(layer_0_w17[0]),
        .B(layer_0_w17[1]),
        .C(layer_0_w17[2]),
        .D(layer_0_w17[3]),
        .cin(layer_0_w17[4]),
        .S(layer_1_w17[3]),
        .carry(layer_1_w18[0]),
        .cout(layer_1_w18[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_7 layer_1_full_adder_7 (
        .A(layer_0_w17[5]),
        .B(layer_0_w17[6]),
        .cin(layer_0_w17[7]),
        .S(layer_1_w17[4]),
        .cout(layer_1_w18[2])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_11 layer_1_compressor42_11 (
        .A(layer_0_w18[0]),
        .B(layer_0_w18[1]),
        .C(layer_0_w18[2]),
        .D(layer_0_w18[3]),
        .cin(layer_0_w18[4]),
        .S(layer_1_w18[3]),
        .carry(layer_1_w19[0]),
        .cout(layer_1_w19[1])
    );
    assign layer_1_w18[4] = layer_0_w18[5];
    assign layer_1_w18[5] = layer_0_w18[6];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_12 layer_1_compressor42_12 (
        .A(layer_0_w19[0]),
        .B(layer_0_w19[1]),
        .C(layer_0_w19[2]),
        .D(layer_0_w19[3]),
        .cin(layer_0_w19[4]),
        .S(layer_1_w19[2]),
        .carry(layer_1_w20[0]),
        .cout(layer_1_w20[1])
    );
    assign layer_1_w19[3] = layer_0_w19[5];
    assign layer_1_w19[4] = layer_0_w19[6];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_13 layer_1_compressor42_13 (
        .A(layer_0_w20[0]),
        .B(layer_0_w20[1]),
        .C(layer_0_w20[2]),
        .D(layer_0_w20[3]),
        .cin(layer_0_w20[4]),
        .S(layer_1_w20[2]),
        .carry(layer_1_w21[0]),
        .cout(layer_1_w21[1])
    );
    assign layer_1_w20[3] = layer_0_w20[5];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_14 layer_1_compressor42_14 (
        .A(layer_0_w21[0]),
        .B(layer_0_w21[1]),
        .C(layer_0_w21[2]),
        .D(layer_0_w21[3]),
        .cin(layer_0_w21[4]),
        .S(layer_1_w21[2]),
        .carry(layer_1_w22[0]),
        .cout(layer_1_w22[1])
    );
    assign layer_1_w21[3] = layer_0_w21[5];
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_15 layer_1_compressor42_15 (
        .A(layer_0_w22[0]),
        .B(layer_0_w22[1]),
        .C(layer_0_w22[2]),
        .D(layer_0_w22[3]),
        .cin(layer_0_w22[4]),
        .S(layer_1_w22[2]),
        .carry(layer_1_w23[0]),
        .cout(layer_1_w23[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_compressor42_16 layer_1_compressor42_16 (
        .A(layer_0_w23[0]),
        .B(layer_0_w23[1]),
        .C(layer_0_w23[2]),
        .D(layer_0_w23[3]),
        .cin(layer_0_w23[4]),
        .S(layer_1_w23[2]),
        .carry(layer_1_w24[0]),
        .cout(layer_1_w24[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_8 layer_1_full_adder_8 (
        .A(layer_0_w24[0]),
        .B(layer_0_w24[1]),
        .cin(layer_0_w24[2]),
        .S(layer_1_w24[2]),
        .cout(layer_1_w25[0])
    );
    assign layer_1_w24[3] = layer_0_w24[3];
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_9 layer_1_full_adder_9 (
        .A(layer_0_w25[0]),
        .B(layer_0_w25[1]),
        .cin(layer_0_w25[2]),
        .S(layer_1_w25[1]),
        .cout(layer_1_w26[0])
    );
    assign layer_1_w25[2] = layer_0_w25[3];
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_10 layer_1_full_adder_10 (
        .A(layer_0_w26[0]),
        .B(layer_0_w26[1]),
        .cin(layer_0_w26[2]),
        .S(layer_1_w26[1]),
        .cout(layer_1_w27[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_1_full_adder_11 layer_1_full_adder_11 (
        .A(layer_0_w27[0]),
        .B(layer_0_w27[1]),
        .cin(layer_0_w27[2]),
        .S(layer_1_w27[1]),
        .cout(layer_1_w28[0])
    );
    assign layer_1_w28[1] = layer_0_w28[0];
    assign layer_1_w28[2] = layer_0_w28[1];
    assign layer_1_w29[0] = layer_0_w29[0];
    assign layer_1_w29[1] = layer_0_w29[1];
    assign layer_1_w30 = layer_0_w30;
    assign layer_1_w31 = 1'b1;
    wire logic[1:0] layer_2_w0;
    wire logic layer_2_w1;
    wire logic[2:0] layer_2_w2;
    wire logic[1:0] layer_2_w3;
    wire logic[1:0] layer_2_w4;
    wire logic[1:0] layer_2_w5;
    wire logic[1:0] layer_2_w6;
    wire logic[1:0] layer_2_w7;
    wire logic[1:0] layer_2_w8;
    wire logic[1:0] layer_2_w9;
    wire logic[1:0] layer_2_w10;
    wire logic[3:0] layer_2_w11;
    wire logic[2:0] layer_2_w12;
    wire logic[2:0] layer_2_w13;
    wire logic[2:0] layer_2_w14;
    wire logic[2:0] layer_2_w15;
    wire logic[3:0] layer_2_w16;
    wire logic[2:0] layer_2_w17;
    wire logic[3:0] layer_2_w18;
    wire logic[2:0] layer_2_w19;
    wire logic[3:0] layer_2_w20;
    wire logic[2:0] layer_2_w21;
    wire logic[1:0] layer_2_w22;
    wire logic[1:0] layer_2_w23;
    wire logic[2:0] layer_2_w24;
    wire logic[1:0] layer_2_w25;
    wire logic[2:0] layer_2_w26;
    wire logic[1:0] layer_2_w27;
    wire logic layer_2_w28;
    wire logic[2:0] layer_2_w29;
    wire logic layer_2_w30;
    wire logic layer_2_w31;
    assign layer_2_w0[0] = layer_1_w0[0];
    assign layer_2_w0[1] = layer_1_w0[1];
    assign layer_2_w1 = layer_1_w1;
    assign layer_2_w2[0] = layer_1_w2[0];
    assign layer_2_w2[1] = layer_1_w2[1];
    assign layer_2_w2[2] = layer_1_w2[2];
    assign layer_2_w3[0] = layer_1_w3[0];
    assign layer_2_w3[1] = layer_1_w3[1];
    assign layer_2_w4[0] = layer_1_w4[0];
    assign layer_2_w4[1] = layer_1_w4[1];
    assign layer_2_w5[0] = layer_1_w5[0];
    assign layer_2_w5[1] = layer_1_w5[1];
    assign layer_2_w6[0] = layer_1_w6[0];
    assign layer_2_w6[1] = layer_1_w6[1];
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_0 layer_2_full_adder_0 (
        .A(layer_1_w7[0]),
        .B(layer_1_w7[1]),
        .cin(layer_1_w7[2]),
        .S(layer_2_w7[0]),
        .cout(layer_2_w8[0])
    );
    assign layer_2_w7[1] = layer_1_w7[3];
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_1 layer_2_full_adder_1 (
        .A(layer_1_w8[0]),
        .B(layer_1_w8[1]),
        .cin(layer_1_w8[2]),
        .S(layer_2_w8[1]),
        .cout(layer_2_w9[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_2 layer_2_full_adder_2 (
        .A(layer_1_w9[0]),
        .B(layer_1_w9[1]),
        .cin(layer_1_w9[2]),
        .S(layer_2_w9[1]),
        .cout(layer_2_w10[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_0 layer_2_compressor42_0 (
        .A(layer_1_w10[0]),
        .B(layer_1_w10[1]),
        .C(layer_1_w10[2]),
        .D(layer_1_w10[3]),
        .cin(layer_1_w10[4]),
        .S(layer_2_w10[1]),
        .carry(layer_2_w11[0]),
        .cout(layer_2_w11[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_3 layer_2_full_adder_3 (
        .A(layer_1_w11[0]),
        .B(layer_1_w11[1]),
        .cin(layer_1_w11[2]),
        .S(layer_2_w11[2]),
        .cout(layer_2_w12[0])
    );
    assign layer_2_w11[3] = layer_1_w11[3];
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_4 layer_2_full_adder_4 (
        .A(layer_1_w12[0]),
        .B(layer_1_w12[1]),
        .cin(layer_1_w12[2]),
        .S(layer_2_w12[1]),
        .cout(layer_2_w13[0])
    );
    assign layer_2_w12[2] = layer_1_w12[3];
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_1 layer_2_compressor42_1 (
        .A(layer_1_w13[0]),
        .B(layer_1_w13[1]),
        .C(layer_1_w13[2]),
        .D(layer_1_w13[3]),
        .cin(layer_1_w13[4]),
        .S(layer_2_w13[1]),
        .carry(layer_2_w14[0]),
        .cout(layer_2_w14[1])
    );
    assign layer_2_w13[2] = layer_1_w13[5];
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_2 layer_2_compressor42_2 (
        .A(layer_1_w14[0]),
        .B(layer_1_w14[1]),
        .C(layer_1_w14[2]),
        .D(layer_1_w14[3]),
        .cin(layer_1_w14[4]),
        .S(layer_2_w14[2]),
        .carry(layer_2_w15[0]),
        .cout(layer_2_w15[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_3 layer_2_compressor42_3 (
        .A(layer_1_w15[0]),
        .B(layer_1_w15[1]),
        .C(layer_1_w15[2]),
        .D(layer_1_w15[3]),
        .cin(layer_1_w15[4]),
        .S(layer_2_w15[2]),
        .carry(layer_2_w16[0]),
        .cout(layer_2_w16[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_4 layer_2_compressor42_4 (
        .A(layer_1_w16[0]),
        .B(layer_1_w16[1]),
        .C(layer_1_w16[2]),
        .D(layer_1_w16[3]),
        .cin(layer_1_w16[4]),
        .S(layer_2_w16[2]),
        .carry(layer_2_w17[0]),
        .cout(layer_2_w17[1])
    );
    assign layer_2_w16[3] = layer_1_w16[5];
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_5 layer_2_compressor42_5 (
        .A(layer_1_w17[0]),
        .B(layer_1_w17[1]),
        .C(layer_1_w17[2]),
        .D(layer_1_w17[3]),
        .cin(layer_1_w17[4]),
        .S(layer_2_w17[2]),
        .carry(layer_2_w18[0]),
        .cout(layer_2_w18[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_6 layer_2_compressor42_6 (
        .A(layer_1_w18[0]),
        .B(layer_1_w18[1]),
        .C(layer_1_w18[2]),
        .D(layer_1_w18[3]),
        .cin(layer_1_w18[4]),
        .S(layer_2_w18[2]),
        .carry(layer_2_w19[0]),
        .cout(layer_2_w19[1])
    );
    assign layer_2_w18[3] = layer_1_w18[5];
    PID_multiplier_16x16bit_pipelined_layer_2_compressor42_7 layer_2_compressor42_7 (
        .A(layer_1_w19[0]),
        .B(layer_1_w19[1]),
        .C(layer_1_w19[2]),
        .D(layer_1_w19[3]),
        .cin(layer_1_w19[4]),
        .S(layer_2_w19[2]),
        .carry(layer_2_w20[0]),
        .cout(layer_2_w20[1])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_5 layer_2_full_adder_5 (
        .A(layer_1_w20[0]),
        .B(layer_1_w20[1]),
        .cin(layer_1_w20[2]),
        .S(layer_2_w20[2]),
        .cout(layer_2_w21[0])
    );
    assign layer_2_w20[3] = layer_1_w20[3];
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_6 layer_2_full_adder_6 (
        .A(layer_1_w21[0]),
        .B(layer_1_w21[1]),
        .cin(layer_1_w21[2]),
        .S(layer_2_w21[1]),
        .cout(layer_2_w22[0])
    );
    assign layer_2_w21[2] = layer_1_w21[3];
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_7 layer_2_full_adder_7 (
        .A(layer_1_w22[0]),
        .B(layer_1_w22[1]),
        .cin(layer_1_w22[2]),
        .S(layer_2_w22[1]),
        .cout(layer_2_w23[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_8 layer_2_full_adder_8 (
        .A(layer_1_w23[0]),
        .B(layer_1_w23[1]),
        .cin(layer_1_w23[2]),
        .S(layer_2_w23[1]),
        .cout(layer_2_w24[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_9 layer_2_full_adder_9 (
        .A(layer_1_w24[0]),
        .B(layer_1_w24[1]),
        .cin(layer_1_w24[2]),
        .S(layer_2_w24[1]),
        .cout(layer_2_w25[0])
    );
    assign layer_2_w24[2] = layer_1_w24[3];
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_10 layer_2_full_adder_10 (
        .A(layer_1_w25[0]),
        .B(layer_1_w25[1]),
        .cin(layer_1_w25[2]),
        .S(layer_2_w25[1]),
        .cout(layer_2_w26[0])
    );
    assign layer_2_w26[1] = layer_1_w26[0];
    assign layer_2_w26[2] = layer_1_w26[1];
    assign layer_2_w27[0] = layer_1_w27[0];
    assign layer_2_w27[1] = layer_1_w27[1];
    PID_multiplier_16x16bit_pipelined_layer_2_full_adder_11 layer_2_full_adder_11 (
        .A(layer_1_w28[0]),
        .B(layer_1_w28[1]),
        .cin(layer_1_w28[2]),
        .S(layer_2_w28),
        .cout(layer_2_w29[0])
    );
    assign layer_2_w29[1] = layer_1_w29[0];
    assign layer_2_w29[2] = layer_1_w29[1];
    assign layer_2_w30 = layer_1_w30;
    assign layer_2_w31 = 1'b1;
    reg[1:0] reg_layer_2_w0;
    reg reg_layer_2_w1;
    reg[2:0] reg_layer_2_w2;
    reg[1:0] reg_layer_2_w3;
    reg[1:0] reg_layer_2_w4;
    reg[1:0] reg_layer_2_w5;
    reg[1:0] reg_layer_2_w6;
    reg[1:0] reg_layer_2_w7;
    reg[1:0] reg_layer_2_w8;
    reg[1:0] reg_layer_2_w9;
    reg[1:0] reg_layer_2_w10;
    reg[3:0] reg_layer_2_w11;
    reg[2:0] reg_layer_2_w12;
    reg[2:0] reg_layer_2_w13;
    reg[2:0] reg_layer_2_w14;
    reg[2:0] reg_layer_2_w15;
    reg[3:0] reg_layer_2_w16;
    reg[2:0] reg_layer_2_w17;
    reg[3:0] reg_layer_2_w18;
    reg[2:0] reg_layer_2_w19;
    reg[3:0] reg_layer_2_w20;
    reg[2:0] reg_layer_2_w21;
    reg[1:0] reg_layer_2_w22;
    reg[1:0] reg_layer_2_w23;
    reg[2:0] reg_layer_2_w24;
    reg[1:0] reg_layer_2_w25;
    reg[2:0] reg_layer_2_w26;
    reg[1:0] reg_layer_2_w27;
    reg reg_layer_2_w28;
    reg[2:0] reg_layer_2_w29;
    reg reg_layer_2_w30;
    reg reg_layer_2_w31;
    reg stage_1_ready;
    assign o_ready = 1'b1;
    always @(posedge i_clk or negedge i_rst) begin
        if (!(i_rst)) begin
            stage_1_ready <= 0;
            reg_layer_2_w0 <= 0;
            reg_layer_2_w1 <= 0;
            reg_layer_2_w2 <= 0;
            reg_layer_2_w3 <= 0;
            reg_layer_2_w4 <= 0;
            reg_layer_2_w5 <= 0;
            reg_layer_2_w6 <= 0;
            reg_layer_2_w7 <= 0;
            reg_layer_2_w8 <= 0;
            reg_layer_2_w9 <= 0;
            reg_layer_2_w10 <= 0;
            reg_layer_2_w11 <= 0;
            reg_layer_2_w12 <= 0;
            reg_layer_2_w13 <= 0;
            reg_layer_2_w14 <= 0;
            reg_layer_2_w15 <= 0;
            reg_layer_2_w16 <= 0;
            reg_layer_2_w17 <= 0;
            reg_layer_2_w18 <= 0;
            reg_layer_2_w19 <= 0;
            reg_layer_2_w20 <= 0;
            reg_layer_2_w21 <= 0;
            reg_layer_2_w22 <= 0;
            reg_layer_2_w23 <= 0;
            reg_layer_2_w24 <= 0;
            reg_layer_2_w25 <= 0;
            reg_layer_2_w26 <= 0;
            reg_layer_2_w27 <= 0;
            reg_layer_2_w28 <= 0;
            reg_layer_2_w29 <= 0;
            reg_layer_2_w30 <= 0;
            reg_layer_2_w31 <= 0;
        end
        else begin begin
                reg_layer_2_w0 <= layer_2_w0;
                reg_layer_2_w1 <= layer_2_w1;
                reg_layer_2_w2 <= layer_2_w2;
                reg_layer_2_w3 <= layer_2_w3;
                reg_layer_2_w4 <= layer_2_w4;
                reg_layer_2_w5 <= layer_2_w5;
                reg_layer_2_w6 <= layer_2_w6;
                reg_layer_2_w7 <= layer_2_w7;
                reg_layer_2_w8 <= layer_2_w8;
                reg_layer_2_w9 <= layer_2_w9;
                reg_layer_2_w10 <= layer_2_w10;
                reg_layer_2_w11 <= layer_2_w11;
                reg_layer_2_w12 <= layer_2_w12;
                reg_layer_2_w13 <= layer_2_w13;
                reg_layer_2_w14 <= layer_2_w14;
                reg_layer_2_w15 <= layer_2_w15;
                reg_layer_2_w16 <= layer_2_w16;
                reg_layer_2_w17 <= layer_2_w17;
                reg_layer_2_w18 <= layer_2_w18;
                reg_layer_2_w19 <= layer_2_w19;
                reg_layer_2_w20 <= layer_2_w20;
                reg_layer_2_w21 <= layer_2_w21;
                reg_layer_2_w22 <= layer_2_w22;
                reg_layer_2_w23 <= layer_2_w23;
                reg_layer_2_w24 <= layer_2_w24;
                reg_layer_2_w25 <= layer_2_w25;
                reg_layer_2_w26 <= layer_2_w26;
                reg_layer_2_w27 <= layer_2_w27;
                reg_layer_2_w28 <= layer_2_w28;
                reg_layer_2_w29 <= layer_2_w29;
                reg_layer_2_w30 <= layer_2_w30;
                reg_layer_2_w31 <= 1'b1;
            end
            stage_1_ready <= 1'b1;
        end
    end
    wire logic layer_3_w0[1:0];
    wire logic layer_3_w1;
    wire logic layer_3_w2[2:0];
    wire logic layer_3_w3[1:0];
    wire logic layer_3_w4[1:0];
    wire logic layer_3_w5[1:0];
    wire logic layer_3_w6[1:0];
    wire logic layer_3_w7[1:0];
    wire logic layer_3_w8[1:0];
    wire logic layer_3_w9[1:0];
    wire logic layer_3_w10[1:0];
    wire logic layer_3_w11[1:0];
    wire logic layer_3_w12[1:0];
    wire logic layer_3_w13[1:0];
    wire logic layer_3_w14[1:0];
    wire logic layer_3_w15[1:0];
    wire logic layer_3_w16[2:0];
    wire logic layer_3_w17[1:0];
    wire logic layer_3_w18[2:0];
    wire logic layer_3_w19[1:0];
    wire logic layer_3_w20[2:0];
    wire logic layer_3_w21[1:0];
    wire logic layer_3_w22[2:0];
    wire logic layer_3_w23[1:0];
    wire logic layer_3_w24;
    wire logic layer_3_w25[2:0];
    wire logic layer_3_w26;
    wire logic layer_3_w27[2:0];
    wire logic layer_3_w28;
    wire logic layer_3_w29;
    wire logic layer_3_w30[1:0];
    wire logic layer_3_w31;
    assign layer_3_w0[0] = reg_layer_2_w0[0];
    assign layer_3_w0[1] = reg_layer_2_w0[1];
    assign layer_3_w1 = reg_layer_2_w1;
    assign layer_3_w2[0] = reg_layer_2_w2[0];
    assign layer_3_w2[1] = reg_layer_2_w2[1];
    assign layer_3_w2[2] = reg_layer_2_w2[2];
    assign layer_3_w3[0] = reg_layer_2_w3[0];
    assign layer_3_w3[1] = reg_layer_2_w3[1];
    assign layer_3_w4[0] = reg_layer_2_w4[0];
    assign layer_3_w4[1] = reg_layer_2_w4[1];
    assign layer_3_w5[0] = reg_layer_2_w5[0];
    assign layer_3_w5[1] = reg_layer_2_w5[1];
    assign layer_3_w6[0] = reg_layer_2_w6[0];
    assign layer_3_w6[1] = reg_layer_2_w6[1];
    assign layer_3_w7[0] = reg_layer_2_w7[0];
    assign layer_3_w7[1] = reg_layer_2_w7[1];
    assign layer_3_w8[0] = reg_layer_2_w8[0];
    assign layer_3_w8[1] = reg_layer_2_w8[1];
    assign layer_3_w9[0] = reg_layer_2_w9[0];
    assign layer_3_w9[1] = reg_layer_2_w9[1];
    assign layer_3_w10[0] = reg_layer_2_w10[0];
    assign layer_3_w10[1] = reg_layer_2_w10[1];
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_0 layer_3_full_adder_0 (
        .A(reg_layer_2_w11[0]),
        .B(reg_layer_2_w11[1]),
        .cin(reg_layer_2_w11[2]),
        .S(layer_3_w11[0]),
        .cout(layer_3_w12[0])
    );
    assign layer_3_w11[1] = reg_layer_2_w11[3];
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_1 layer_3_full_adder_1 (
        .A(reg_layer_2_w12[0]),
        .B(reg_layer_2_w12[1]),
        .cin(reg_layer_2_w12[2]),
        .S(layer_3_w12[1]),
        .cout(layer_3_w13[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_2 layer_3_full_adder_2 (
        .A(reg_layer_2_w13[0]),
        .B(reg_layer_2_w13[1]),
        .cin(reg_layer_2_w13[2]),
        .S(layer_3_w13[1]),
        .cout(layer_3_w14[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_3 layer_3_full_adder_3 (
        .A(reg_layer_2_w14[0]),
        .B(reg_layer_2_w14[1]),
        .cin(reg_layer_2_w14[2]),
        .S(layer_3_w14[1]),
        .cout(layer_3_w15[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_4 layer_3_full_adder_4 (
        .A(reg_layer_2_w15[0]),
        .B(reg_layer_2_w15[1]),
        .cin(reg_layer_2_w15[2]),
        .S(layer_3_w15[1]),
        .cout(layer_3_w16[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_5 layer_3_full_adder_5 (
        .A(reg_layer_2_w16[0]),
        .B(reg_layer_2_w16[1]),
        .cin(reg_layer_2_w16[2]),
        .S(layer_3_w16[1]),
        .cout(layer_3_w17[0])
    );
    assign layer_3_w16[2] = reg_layer_2_w16[3];
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_6 layer_3_full_adder_6 (
        .A(reg_layer_2_w17[0]),
        .B(reg_layer_2_w17[1]),
        .cin(reg_layer_2_w17[2]),
        .S(layer_3_w17[1]),
        .cout(layer_3_w18[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_7 layer_3_full_adder_7 (
        .A(reg_layer_2_w18[0]),
        .B(reg_layer_2_w18[1]),
        .cin(reg_layer_2_w18[2]),
        .S(layer_3_w18[1]),
        .cout(layer_3_w19[0])
    );
    assign layer_3_w18[2] = reg_layer_2_w18[3];
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_8 layer_3_full_adder_8 (
        .A(reg_layer_2_w19[0]),
        .B(reg_layer_2_w19[1]),
        .cin(reg_layer_2_w19[2]),
        .S(layer_3_w19[1]),
        .cout(layer_3_w20[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_9 layer_3_full_adder_9 (
        .A(reg_layer_2_w20[0]),
        .B(reg_layer_2_w20[1]),
        .cin(reg_layer_2_w20[2]),
        .S(layer_3_w20[1]),
        .cout(layer_3_w21[0])
    );
    assign layer_3_w20[2] = reg_layer_2_w20[3];
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_10 layer_3_full_adder_10 (
        .A(reg_layer_2_w21[0]),
        .B(reg_layer_2_w21[1]),
        .cin(reg_layer_2_w21[2]),
        .S(layer_3_w21[1]),
        .cout(layer_3_w22[0])
    );
    assign layer_3_w22[1] = reg_layer_2_w22[0];
    assign layer_3_w22[2] = reg_layer_2_w22[1];
    assign layer_3_w23[0] = reg_layer_2_w23[0];
    assign layer_3_w23[1] = reg_layer_2_w23[1];
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_11 layer_3_full_adder_11 (
        .A(reg_layer_2_w24[0]),
        .B(reg_layer_2_w24[1]),
        .cin(reg_layer_2_w24[2]),
        .S(layer_3_w24),
        .cout(layer_3_w25[0])
    );
    assign layer_3_w25[1] = reg_layer_2_w25[0];
    assign layer_3_w25[2] = reg_layer_2_w25[1];
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_12 layer_3_full_adder_12 (
        .A(reg_layer_2_w26[0]),
        .B(reg_layer_2_w26[1]),
        .cin(reg_layer_2_w26[2]),
        .S(layer_3_w26),
        .cout(layer_3_w27[0])
    );
    assign layer_3_w27[1] = reg_layer_2_w27[0];
    assign layer_3_w27[2] = reg_layer_2_w27[1];
    assign layer_3_w28 = reg_layer_2_w28;
    PID_multiplier_16x16bit_pipelined_layer_3_full_adder_13 layer_3_full_adder_13 (
        .A(reg_layer_2_w29[0]),
        .B(reg_layer_2_w29[1]),
        .cin(reg_layer_2_w29[2]),
        .S(layer_3_w29),
        .cout(layer_3_w30[0])
    );
    assign layer_3_w30[1] = reg_layer_2_w30;
    assign layer_3_w31 = 1'b1;
    wire logic layer_4_w0[1:0];
    wire logic layer_4_w1;
    wire logic layer_4_w2;
    wire logic layer_4_w3[1:0];
    wire logic layer_4_w4[1:0];
    wire logic layer_4_w5[1:0];
    wire logic layer_4_w6[1:0];
    wire logic layer_4_w7[1:0];
    wire logic layer_4_w8[1:0];
    wire logic layer_4_w9[1:0];
    wire logic layer_4_w10[1:0];
    wire logic layer_4_w11[1:0];
    wire logic layer_4_w12[1:0];
    wire logic layer_4_w13[1:0];
    wire logic layer_4_w14[1:0];
    wire logic layer_4_w15[1:0];
    wire logic layer_4_w16[1:0];
    wire logic layer_4_w17[1:0];
    wire logic layer_4_w18[1:0];
    wire logic layer_4_w19[1:0];
    wire logic layer_4_w20[1:0];
    wire logic layer_4_w21[1:0];
    wire logic layer_4_w22[1:0];
    wire logic layer_4_w23[1:0];
    wire logic layer_4_w24[1:0];
    wire logic layer_4_w25;
    wire logic layer_4_w26[1:0];
    wire logic layer_4_w27;
    wire logic layer_4_w28[1:0];
    wire logic layer_4_w29;
    wire logic layer_4_w30[1:0];
    wire logic layer_4_w31;
    assign layer_4_w0[0] = layer_3_w0[0];
    assign layer_4_w0[1] = layer_3_w0[1];
    assign layer_4_w1 = layer_3_w1;
    PID_multiplier_16x16bit_pipelined_layer_4_full_adder_0 layer_4_full_adder_0 (
        .A(layer_3_w2[0]),
        .B(layer_3_w2[1]),
        .cin(layer_3_w2[2]),
        .S(layer_4_w2),
        .cout(layer_4_w3[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_0 layer_4_half_adder_0 (
        .A(layer_3_w3[0]),
        .B(layer_3_w3[1]),
        .S(layer_4_w3[1]),
        .carry(layer_4_w4[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_1 layer_4_half_adder_1 (
        .A(layer_3_w4[0]),
        .B(layer_3_w4[1]),
        .S(layer_4_w4[1]),
        .carry(layer_4_w5[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_2 layer_4_half_adder_2 (
        .A(layer_3_w5[0]),
        .B(layer_3_w5[1]),
        .S(layer_4_w5[1]),
        .carry(layer_4_w6[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_3 layer_4_half_adder_3 (
        .A(layer_3_w6[0]),
        .B(layer_3_w6[1]),
        .S(layer_4_w6[1]),
        .carry(layer_4_w7[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_4 layer_4_half_adder_4 (
        .A(layer_3_w7[0]),
        .B(layer_3_w7[1]),
        .S(layer_4_w7[1]),
        .carry(layer_4_w8[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_5 layer_4_half_adder_5 (
        .A(layer_3_w8[0]),
        .B(layer_3_w8[1]),
        .S(layer_4_w8[1]),
        .carry(layer_4_w9[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_6 layer_4_half_adder_6 (
        .A(layer_3_w9[0]),
        .B(layer_3_w9[1]),
        .S(layer_4_w9[1]),
        .carry(layer_4_w10[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_7 layer_4_half_adder_7 (
        .A(layer_3_w10[0]),
        .B(layer_3_w10[1]),
        .S(layer_4_w10[1]),
        .carry(layer_4_w11[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_8 layer_4_half_adder_8 (
        .A(layer_3_w11[0]),
        .B(layer_3_w11[1]),
        .S(layer_4_w11[1]),
        .carry(layer_4_w12[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_9 layer_4_half_adder_9 (
        .A(layer_3_w12[0]),
        .B(layer_3_w12[1]),
        .S(layer_4_w12[1]),
        .carry(layer_4_w13[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_10 layer_4_half_adder_10 (
        .A(layer_3_w13[0]),
        .B(layer_3_w13[1]),
        .S(layer_4_w13[1]),
        .carry(layer_4_w14[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_11 layer_4_half_adder_11 (
        .A(layer_3_w14[0]),
        .B(layer_3_w14[1]),
        .S(layer_4_w14[1]),
        .carry(layer_4_w15[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_12 layer_4_half_adder_12 (
        .A(layer_3_w15[0]),
        .B(layer_3_w15[1]),
        .S(layer_4_w15[1]),
        .carry(layer_4_w16[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_full_adder_1 layer_4_full_adder_1 (
        .A(layer_3_w16[0]),
        .B(layer_3_w16[1]),
        .cin(layer_3_w16[2]),
        .S(layer_4_w16[1]),
        .cout(layer_4_w17[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_13 layer_4_half_adder_13 (
        .A(layer_3_w17[0]),
        .B(layer_3_w17[1]),
        .S(layer_4_w17[1]),
        .carry(layer_4_w18[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_full_adder_2 layer_4_full_adder_2 (
        .A(layer_3_w18[0]),
        .B(layer_3_w18[1]),
        .cin(layer_3_w18[2]),
        .S(layer_4_w18[1]),
        .cout(layer_4_w19[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_14 layer_4_half_adder_14 (
        .A(layer_3_w19[0]),
        .B(layer_3_w19[1]),
        .S(layer_4_w19[1]),
        .carry(layer_4_w20[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_full_adder_3 layer_4_full_adder_3 (
        .A(layer_3_w20[0]),
        .B(layer_3_w20[1]),
        .cin(layer_3_w20[2]),
        .S(layer_4_w20[1]),
        .cout(layer_4_w21[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_15 layer_4_half_adder_15 (
        .A(layer_3_w21[0]),
        .B(layer_3_w21[1]),
        .S(layer_4_w21[1]),
        .carry(layer_4_w22[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_full_adder_4 layer_4_full_adder_4 (
        .A(layer_3_w22[0]),
        .B(layer_3_w22[1]),
        .cin(layer_3_w22[2]),
        .S(layer_4_w22[1]),
        .cout(layer_4_w23[0])
    );
    PID_multiplier_16x16bit_pipelined_layer_4_half_adder_16 layer_4_half_adder_16 (
        .A(layer_3_w23[0]),
        .B(layer_3_w23[1]),
        .S(layer_4_w23[1]),
        .carry(layer_4_w24[0])
    );
    assign layer_4_w24[1] = layer_3_w24;
    PID_multiplier_16x16bit_pipelined_layer_4_full_adder_5 layer_4_full_adder_5 (
        .A(layer_3_w25[0]),
        .B(layer_3_w25[1]),
        .cin(layer_3_w25[2]),
        .S(layer_4_w25),
        .cout(layer_4_w26[0])
    );
    assign layer_4_w26[1] = layer_3_w26;
    PID_multiplier_16x16bit_pipelined_layer_4_full_adder_6 layer_4_full_adder_6 (
        .A(layer_3_w27[0]),
        .B(layer_3_w27[1]),
        .cin(layer_3_w27[2]),
        .S(layer_4_w27),
        .cout(layer_4_w28[0])
    );
    assign layer_4_w28[1] = layer_3_w28;
    assign layer_4_w29 = layer_3_w29;
    assign layer_4_w30[0] = layer_3_w30[0];
    assign layer_4_w30[1] = layer_3_w30[1];
    assign layer_4_w31 = 1'b1;
    wire logic[31:0] A;
    wire logic [30:0] B;
    assign A[0] = layer_4_w0[0];
    assign B[0] = layer_4_w0[1];
    assign A[1] = layer_4_w1;
    assign B[1] = 0;
    assign A[2] = layer_4_w2;
    assign B[2] = 0;
    assign A[3] = layer_4_w3[0];
    assign B[3] = layer_4_w3[1];
    assign A[4] = layer_4_w4[0];
    assign B[4] = layer_4_w4[1];
    assign A[5] = layer_4_w5[0];
    assign B[5] = layer_4_w5[1];
    assign A[6] = layer_4_w6[0];
    assign B[6] = layer_4_w6[1];
    assign A[7] = layer_4_w7[0];
    assign B[7] = layer_4_w7[1];
    assign A[8] = layer_4_w8[0];
    assign B[8] = layer_4_w8[1];
    assign A[9] = layer_4_w9[0];
    assign B[9] = layer_4_w9[1];
    assign A[10] = layer_4_w10[0];
    assign B[10] = layer_4_w10[1];
    assign A[11] = layer_4_w11[0];
    assign B[11] = layer_4_w11[1];
    assign A[12] = layer_4_w12[0];
    assign B[12] = layer_4_w12[1];
    assign A[13] = layer_4_w13[0];
    assign B[13] = layer_4_w13[1];
    assign A[14] = layer_4_w14[0];
    assign B[14] = layer_4_w14[1];
    assign A[15] = layer_4_w15[0];
    assign B[15] = layer_4_w15[1];
    assign A[16] = layer_4_w16[0];
    assign B[16] = layer_4_w16[1];
    assign A[17] = layer_4_w17[0];
    assign B[17] = layer_4_w17[1];
    assign A[18] = layer_4_w18[0];
    assign B[18] = layer_4_w18[1];
    assign A[19] = layer_4_w19[0];
    assign B[19] = layer_4_w19[1];
    assign A[20] = layer_4_w20[0];
    assign B[20] = layer_4_w20[1];
    assign A[21] = layer_4_w21[0];
    assign B[21] = layer_4_w21[1];
    assign A[22] = layer_4_w22[0];
    assign B[22] = layer_4_w22[1];
    assign A[23] = layer_4_w23[0];
    assign B[23] = layer_4_w23[1];
    assign A[24] = layer_4_w24[0];
    assign B[24] = layer_4_w24[1];
    assign A[25] = layer_4_w25;
    assign B[25] = 0;
    assign A[26] = layer_4_w26[0];
    assign B[26] = layer_4_w26[1];
    assign A[27] = layer_4_w27;
    assign B[27] = 0;
    assign A[28] = layer_4_w28[0];
    assign B[28] = layer_4_w28[1];
    assign A[29] = layer_4_w29;
    assign B[29] = 0;
    assign A[30] = layer_4_w30[0];
    assign B[30] = layer_4_w30[1];
    assign A[31] = 1'b1;
    wire logic carry;
    PID_multiplier_16x16bit_pipelined_adder_32bit adder_32bit (
        .i_a(A),
        .i_b({1'b0, B}),
        .i_c(1'b0),
        .o_s(o_product),
        .o_c(carry)
    );
endmodule