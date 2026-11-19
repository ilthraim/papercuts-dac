module kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_mac_muladd_7ns_7ns_7ns_13_4_1_U8_kernel_gemm_mac_muladd_7ns_7ns_7ns_13_4_1_DSP48_0_U (
    input logic clk,
    input logic rst,
    input logic ce,
    input logic[6:0] in0,
    input logic[6:0] in1,
    input logic[6:0] in2,
    output logic[12:0] dout
);
    wire logic signed[7:0] a;
    wire logic signed[7:0] b;
    wire logic signed[7:0] c;
    wire logic signed[12:0] m;
    wire logic signed[12:0] p;
    reg signed[12:0] m_reg;
    reg signed[7:0] a_reg;
    reg signed[7:0] b_reg;
    reg signed[12:0] p_reg;
    assign a = $unsigned(in0);
    assign b = $unsigned(in1);
    assign c = $unsigned(in2);
    assign m = (a_reg * b_reg);
    assign p = (m_reg + c);
    always @(posedge clk) begin
        m_reg <= m;
        a_reg <= a;
        b_reg <= b;
        p_reg <= p;
    end
    assign dout = p_reg;
endmodule
