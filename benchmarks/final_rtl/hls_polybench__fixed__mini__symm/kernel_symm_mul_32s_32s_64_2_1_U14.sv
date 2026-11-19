module kernel_symm_mul_32s_32s_64_2_1_U14 (
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
