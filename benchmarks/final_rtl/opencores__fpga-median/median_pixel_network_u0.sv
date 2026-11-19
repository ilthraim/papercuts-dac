
module median_pixel_network_u0 #(
    parameter logic signed[31:0] DATA_WIDTH = 8
) (
    input logic[7:0] c3h,
    input logic[7:0] c3m,
    input logic[7:0] c3l,
    input logic[7:0] c2h,
    input logic[7:0] c2m,
    input logic[7:0] c2l,
    input logic[7:0] c1h,
    input logic[7:0] c1m,
    input logic[7:0] c1l,
    output logic[7:0] median
);
    wire logic[7:0] node_u0_lo;
    wire logic[7:0] node_u1_hi;
    wire logic[7:0] node_u1_lo;
    wire logic[7:0] node_u2_hi;
    wire logic[7:0] node_u3_lo;
    wire logic[7:0] node_u4_hi;
    wire logic[7:0] node_u5_hi;
    wire logic[7:0] node_u6_lo;
    wire logic[7:0] node_u7_hi;
    wire logic[7:0] node_u7_lo;
    wire logic[7:0] node_u8_hi;
    median_pixel_network_u0_node_u0 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(0)
    ) node_u0 (
        .data_a(c3h),
        .data_b(c2h),
        .data_hi(),
        .data_lo(node_u0_lo)
    );
    median_pixel_network_u0_node_u1 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u1 (
        .data_a(c3m),
        .data_b(c2m),
        .data_hi(node_u1_hi),
        .data_lo(node_u1_lo)
    );
    median_pixel_network_u0_node_u2 #(
        .DATA_WIDTH(8),
        .LOW_MUX(0),
        .HI_MUX(1)
    ) node_u2 (
        .data_a(c2l),
        .data_b(c1l),
        .data_hi(node_u2_hi),
        .data_lo()
    );
    median_pixel_network_u0_node_u3 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(0)
    ) node_u3 (
        .data_a(node_u0_lo),
        .data_b(c1h),
        .data_hi(),
        .data_lo(node_u3_lo)
    );
    median_pixel_network_u0_node_u4 #(
        .DATA_WIDTH(8),
        .LOW_MUX(0),
        .HI_MUX(1)
    ) node_u4 (
        .data_a(node_u1_lo),
        .data_b(c1m),
        .data_hi(node_u4_hi),
        .data_lo()
    );
    median_pixel_network_u0_node_u5 #(
        .DATA_WIDTH(8),
        .LOW_MUX(0),
        .HI_MUX(1)
    ) node_u5 (
        .data_a(c3l),
        .data_b(node_u2_hi),
        .data_hi(node_u5_hi),
        .data_lo()
    );
    median_pixel_network_u0_node_u6 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(0)
    ) node_u6 (
        .data_a(node_u1_hi),
        .data_b(node_u4_hi),
        .data_hi(),
        .data_lo(node_u6_lo)
    );
    median_pixel_network_u0_node_u7 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(1)
    ) node_u7 (
        .data_a(node_u3_lo),
        .data_b(node_u6_lo),
        .data_hi(node_u7_hi),
        .data_lo(node_u7_lo)
    );
    median_pixel_network_u0_node_u8 #(
        .DATA_WIDTH(8),
        .LOW_MUX(0),
        .HI_MUX(1)
    ) node_u8 (
        .data_a(node_u7_lo),
        .data_b(node_u5_hi),
        .data_hi(node_u8_hi),
        .data_lo()
    );
    median_pixel_network_u0_node_u9 #(
        .DATA_WIDTH(8),
        .LOW_MUX(1),
        .HI_MUX(0)
    ) node_u9 (
        .data_a(node_u7_hi),
        .data_b(node_u8_hi),
        .data_hi(),
        .data_lo(median)
    );
endmodule