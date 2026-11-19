module top (
    input logic reset,
    input logic clk,
    input logic[15:0] a,
    input logic[15:0] b,
    output logic[15:0] out,
    input logic[15:0] i_features_0,
    input logic[7:0] i_weights_0,
    input logic[15:0] i_features_1,
    input logic[7:0] i_weights_1,
    input logic[15:0] i_features_2,
    input logic[7:0] i_weights_2,
    input logic[15:0] i_features_3,
    input logic[7:0] i_weights_3,
    output logic[23:0] o_result
);
    top_u_mul u_mul (
        .a(a),
        .b(b),
        .out(out),
        .reset(reset),
        .clk(clk)
    );
    top_u_dp u_dp (
        .clk(clk),
        .i_reset(reset),
        .i_features_0(i_features_0),
        .i_weights_0(i_weights_0),
        .i_features_1(i_features_1),
        .i_weights_1(i_weights_1),
        .i_features_2(i_features_2),
        .i_weights_2(i_weights_2),
        .i_features_3(i_features_3),
        .i_weights_3(i_weights_3),
        .o_result(o_result)
    );
endmodule