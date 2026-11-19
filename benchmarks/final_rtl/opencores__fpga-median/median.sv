module median #(
    parameter logic signed[31:0] MEM_DATA_WIDTH = 32,
    parameter logic signed[31:0] LUT_ADDR_WIDTH = 10,
    parameter logic signed[31:0] MEM_ADDR_WIDTH = 10,
    parameter logic signed[31:0] PIXEL_DATA_WIDTH = 8,
    parameter logic signed[31:0] IMG_WIDTH = 320,
    parameter logic signed[31:0] IMG_HEIGHT = 320
) (
    input logic clk,
    input logic rst_n,
    input logic[31:0] word0,
    input logic[31:0] word1,
    input logic[31:0] word2,
    output logic[7:0] pixel1,
    output logic[7:0] pixel2,
    output logic[7:0] pixel3,
    output logic[7:0] pixel4,
    output logic[9:0] raddr_a,
    output logic[9:0] raddr_b,
    output logic[9:0] raddr_c,
    output logic[9:0] waddr
);
    wire logic[7:0] x2_y1;
    wire logic[7:0] x2_y0;
    wire logic[7:0] x2_ym1;
    wire logic[7:0] x1_y1;
    wire logic[7:0] x1_y0;
    wire logic[7:0] x1_ym1;
    wire logic[7:0] x0_y1;
    wire logic[7:0] x0_y0;
    wire logic[7:0] x0_ym1;
    wire logic[7:0] xm1_y1;
    wire logic[7:0] xm1_y0;
    wire logic[7:0] xm1_ym1;
    assign x2_y1 = word0[7:0];
    assign x2_y0 = word1[7:0];
    assign x2_ym1 = word2[7:0];
    assign x1_y1 = word0[15:8];
    assign x1_y0 = word1[15:8];
    assign x1_ym1 = word2[15:8];
    assign x0_y1 = word0[23:16];
    assign x0_y0 = word1[23:16];
    assign x0_ym1 = word2[23:16];
    assign xm1_y1 = word0[31:24];
    assign xm1_y0 = word1[31:24];
    assign xm1_ym1 = word2[31:24];
    wire logic[7:0] c3l;
    wire logic[7:0] c3h;
    wire logic[7:0] c3m;
    wire logic[7:0] c3l_reg;
    wire logic[7:0] c3h_reg;
    wire logic[7:0] c3m_reg;
    wire logic[7:0] c2l;
    wire logic[7:0] c2h;
    wire logic[7:0] c2m;
    wire logic[7:0] c2l_reg;
    wire logic[7:0] c2h_reg;
    wire logic[7:0] c2m_reg;
    wire logic[7:0] c1l;
    wire logic[7:0] c1h;
    wire logic[7:0] c1m;
    wire logic[7:0] c0h;
    wire logic[7:0] c0m;
    wire logic[7:0] c0l;
    wire logic[7:0] p1_sig;
    wire logic[7:0] p2_sig;
    wire logic[7:0] p3_sig;
    median_window_contol #(
        .LUT_ADDR_WIDTH(10),
        .IMG_WIDTH(320),
        .IMG_HEIGHT(320)
    ) window_contol (
        .clk(clk),
        .rst_n(rst_n),
        .raddr_a(raddr_a),
        .raddr_b(raddr_b),
        .raddr_c(raddr_c),
        .waddr(waddr),
        .window_line_counter(),
        .window_column_counter(),
        .memory_shift()
    );
    median_common_network_u0 #(
        .DATA_WIDTH(8)
    ) common_network_u0 (
        .x2_y1(x2_y1),
        .x2_y0(x2_y0),
        .x2_ym1(x2_ym1),
        .x1_y1(x1_y1),
        .x1_y0(x1_y0),
        .x1_ym1(x1_ym1),
        .x0_y1(x0_y1),
        .x0_y0(x0_y0),
        .x0_ym1(x0_ym1),
        .xm1_y1(xm1_y1),
        .xm1_y0(xm1_y0),
        .xm1_ym1(xm1_ym1),
        .c3l(c3l),
        .c3h(c3h),
        .c3m(c3m),
        .c2l(c2l),
        .c2h(c2h),
        .c2m(c2m),
        .c1l(c1l),
        .c1h(c1h),
        .c1m(c1m),
        .c0h(c0h),
        .c0m(c0m),
        .c0l(c0l)
    );
    median_dff_c3_pipe #(
        .DATA_WIDTH(8)
    ) dff_c3_pipe (
        .clk(clk),
        .rst_n(rst_n),
        .d0(c3h),
        .d1(c3m),
        .d2(c3l),
        .q0(c3h_reg),
        .q1(c3m_reg),
        .q2(c3l_reg)
    );
    median_dff_c2_pipe #(
        .DATA_WIDTH(8)
    ) dff_c2_pipe (
        .clk(clk),
        .rst_n(rst_n),
        .d0(c2h),
        .d1(c2m),
        .d2(c2l),
        .q0(c2h_reg),
        .q1(c2m_reg),
        .q2(c2l_reg)
    );
    median_dff_out_pipe #(
        .DATA_WIDTH(8)
    ) dff_out_pipe (
        .clk(clk),
        .rst_n(rst_n),
        .d0(p1_sig),
        .d1(p2_sig),
        .d2(p3_sig),
        .q0(pixel1),
        .q1(pixel2),
        .q2(pixel3)
    );
    median_pixel_network_u0 #(
        .DATA_WIDTH(8)
    ) pixel_network_u0 (
        .c3h(c1h),
        .c3m(c1m),
        .c3l(c1l),
        .c2h(c0h),
        .c2m(c0m),
        .c2l(c0l),
        .c1h(c3h_reg),
        .c1m(c3m_reg),
        .c1l(c3l_reg),
        .median(p1_sig)
    );
    median_pixel_network_u1 #(
        .DATA_WIDTH(8)
    ) pixel_network_u1 (
        .c3h(c2h),
        .c3m(c2m),
        .c3l(c2l),
        .c2h(c1h),
        .c2m(c1m),
        .c2l(c1l),
        .c1h(c0h),
        .c1m(c0m),
        .c1l(c0l),
        .median(p2_sig)
    );
    median_pixel_network_u2 #(
        .DATA_WIDTH(8)
    ) pixel_network_u2 (
        .c3h(c3h),
        .c3m(c3m),
        .c3l(c3l),
        .c2h(c2h),
        .c2m(c2m),
        .c2l(c2l),
        .c1h(c1h),
        .c1m(c1m),
        .c1l(c1l),
        .median(p3_sig)
    );
    median_pixel_network_u3 #(
        .DATA_WIDTH(8)
    ) pixel_network_u3 (
        .c3h(c0h),
        .c3m(c0m),
        .c3l(c0l),
        .c2h(c3h_reg),
        .c2m(c3m_reg),
        .c2l(c3l_reg),
        .c1h(c2h_reg),
        .c1m(c2m_reg),
        .c1l(c2l_reg),
        .median(pixel4)
    );
endmodule