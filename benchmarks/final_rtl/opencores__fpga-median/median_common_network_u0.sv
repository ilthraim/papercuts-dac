
module median_common_network_u0 #(
    parameter logic signed[31:0] DATA_WIDTH = 8
) (
    input logic[7:0] x2_y1,
    input logic[7:0] x2_y0,
    input logic[7:0] x2_ym1,
    input logic[7:0] x1_y1,
    input logic[7:0] x1_y0,
    input logic[7:0] x1_ym1,
    input logic[7:0] x0_y1,
    input logic[7:0] x0_y0,
    input logic[7:0] x0_ym1,
    input logic[7:0] xm1_y1,
    input logic[7:0] xm1_y0,
    input logic[7:0] xm1_ym1,
    output logic[7:0] c3l,
    output logic[7:0] c3h,
    output logic[7:0] c3m,
    output logic[7:0] c2l,
    output logic[7:0] c2h,
    output logic[7:0] c2m,
    output logic[7:0] c1l,
    output logic[7:0] c1h,
    output logic[7:0] c1m,
    output logic[7:0] c0h,
    output logic[7:0] c0m,
    output logic[7:0] c0l
);
    wire logic[7:0] node_u0_hi;
    wire logic[7:0] node_u0_lo;
    wire logic[7:0] node_u1_hi;
    wire logic[7:0] node_u1_lo;
    wire logic[7:0] node_u2_hi;
    wire logic[7:0] node_u2_lo;
    wire logic[7:0] node_u3_hi;
    wire logic[7:0] node_u3_lo;
    wire logic[7:0] node_u4_hi;
    wire logic[7:0] node_u4_lo;
    wire logic[7:0] node_u5_hi;
    wire logic[7:0] node_u5_lo;
    wire logic[7:0] node_u6_hi;
    wire logic[7:0] node_u6_lo;
    wire logic[7:0] node_u7_hi;
    wire logic[7:0] node_u7_lo;
    wire logic[7:0] node_u8_hi;
    wire logic[7:0] node_u8_lo;
    wire logic[7:0] node_u9_hi;
    wire logic[7:0] node_u9_lo;
    wire logic[7:0] node_u10_hi;
    wire logic[7:0] node_u10_lo;
    wire logic[7:0] node_u11_hi;
    wire logic[7:0] node_u11_lo;
    assign c3l = node_u4_lo;
    assign c3h = node_u8_hi;
    assign c3m = node_u8_lo;
    assign c2l = node_u5_lo;
    assign c2h = node_u9_hi;
    assign c2m = node_u9_lo;
    assign c1l = node_u6_lo;
    assign c1h = node_u10_hi;
    assign c1m = node_u10_lo;
    assign c0h = node_u11_hi;
    assign c0m = node_u11_lo;
    assign c0l = node_u7_lo;
    median_common_network_u0_node_u0 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u0 (
        .data_a(x2_y1),
        .data_b(x2_y0),
        .data_hi(node_u0_hi),
        .data_lo(node_u0_lo)
    );
    median_common_network_u0_node_u1 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u1 (
        .data_a(x1_y1),
        .data_b(x1_y0),
        .data_hi(node_u1_hi),
        .data_lo(node_u1_lo)
    );
    median_common_network_u0_node_u2 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u2 (
        .data_a(x0_y1),
        .data_b(x0_y0),
        .data_hi(node_u2_hi),
        .data_lo(node_u2_lo)
    );
    median_common_network_u0_node_u3 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u3 (
        .data_a(xm1_y1),
        .data_b(xm1_y0),
        .data_hi(node_u3_hi),
        .data_lo(node_u3_lo)
    );
    median_common_network_u0_node_u4 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u4 (
        .data_a(node_u0_lo),
        .data_b(x2_ym1),
        .data_hi(node_u4_hi),
        .data_lo(node_u4_lo)
    );
    median_common_network_u0_node_u5 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u5 (
        .data_a(node_u1_lo),
        .data_b(x1_ym1),
        .data_hi(node_u5_hi),
        .data_lo(node_u5_lo)
    );
    median_common_network_u0_node_u6 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u6 (
        .data_a(node_u2_lo),
        .data_b(x0_ym1),
        .data_hi(node_u6_hi),
        .data_lo(node_u6_lo)
    );
    median_common_network_u0_node_u7 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u7 (
        .data_a(node_u3_lo),
        .data_b(xm1_ym1),
        .data_hi(node_u7_hi),
        .data_lo(node_u7_lo)
    );
    median_common_network_u0_node_u8 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u8 (
        .data_a(node_u0_hi),
        .data_b(node_u4_hi),
        .data_hi(node_u8_hi),
        .data_lo(node_u8_lo)
    );
    median_common_network_u0_node_u9 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u9 (
        .data_a(node_u1_hi),
        .data_b(node_u5_hi),
        .data_hi(node_u9_hi),
        .data_lo(node_u9_lo)
    );
    median_common_network_u0_node_u10 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u10 (
        .data_a(node_u2_hi),
        .data_b(node_u6_hi),
        .data_hi(node_u10_hi),
        .data_lo(node_u10_lo)
    );
    median_common_network_u0_node_u11 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u11 (
        .data_a(node_u3_hi),
        .data_b(node_u7_hi),
        .data_hi(node_u11_hi),
        .data_lo(node_u11_lo)
    );
endmodule