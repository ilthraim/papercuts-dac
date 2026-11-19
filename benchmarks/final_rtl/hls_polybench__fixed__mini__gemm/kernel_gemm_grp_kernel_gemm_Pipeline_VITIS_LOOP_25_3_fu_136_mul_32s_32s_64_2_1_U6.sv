module kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_mul_32s_32s_64_2_1_U6 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[31:0] din0,
    input logic[31:0] din1,
    output logic[63:0] dout
);
    wire logic signed[63:0] tmp_product;
    reg signed[63:0] buff0;
    assign tmp_product = ($signed(din0) * $signed(din1));
    always @(posedge clk) begin
        buff0 <= tmp_product;
    end
    assign dout = buff0;
endmodule
