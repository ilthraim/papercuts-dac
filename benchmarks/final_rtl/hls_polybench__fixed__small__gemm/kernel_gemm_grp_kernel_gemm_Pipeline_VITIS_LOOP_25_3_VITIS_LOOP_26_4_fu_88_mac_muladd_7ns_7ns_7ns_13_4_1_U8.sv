
module kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_mac_muladd_7ns_7ns_7ns_13_4_1_U8 (
    input logic clk,
    input logic reset,
    input logic ce,
    input logic[6:0] din0,
    input logic[6:0] din1,
    input logic[6:0] din2,
    output logic[12:0] dout
);
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_mac_muladd_7ns_7ns_7ns_13_4_1_U8_kernel_gemm_mac_muladd_7ns_7ns_7ns_13_4_1_DSP48_0_U kernel_gemm_mac_muladd_7ns_7ns_7ns_13_4_1_DSP48_0_U (
        .clk(clk),
        .rst(reset),
        .ce(ce),
        .in0(din0),
        .in1(din1),
        .in2(din2),
        .dout(dout)
    );
endmodule