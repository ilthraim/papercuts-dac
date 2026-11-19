
module kernel_symm_mul_5ns_6ns_10_1_1_U16 (
    input logic[4:0] din0,
    input logic[5:0] din1,
    output logic[9:0] dout
);
    wire logic signed [8:0] tmp_product;
    assign tmp_product = ($signed({1'b0, din0}) * $signed({1'b0, din1}));
    assign dout = tmp_product;
endmodule