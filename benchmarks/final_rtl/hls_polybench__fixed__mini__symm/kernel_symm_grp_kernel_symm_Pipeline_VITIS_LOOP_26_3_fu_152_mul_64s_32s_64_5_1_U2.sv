module kernel_symm_grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_mul_64s_32s_64_5_1_U2 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[63:0] din0,
    input logic[31:0] din1,
    output logic[63:0] dout
);
    wire logic signed[63:0] tmp_product;
    reg signed[63:0] buff0;
    reg[63:0] din0_reg;
    reg[31:0] din1_reg;
    reg signed[63:0] buff1;
    reg signed[63:0] buff2;
    assign tmp_product = ($signed(din0_reg) * $signed(din1_reg));
    always @(posedge clk) begin
        buff0 <= tmp_product;
        din0_reg <= din0;
        din1_reg <= din1;
        buff1 <= buff0;
        buff2 <= buff1;
    end
    assign dout = buff2;
endmodule
