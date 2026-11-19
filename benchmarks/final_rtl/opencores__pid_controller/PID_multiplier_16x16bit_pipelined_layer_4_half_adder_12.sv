
module PID_multiplier_16x16bit_pipelined_layer_4_half_adder_12 (
    input logic A,
    input logic B,
    output logic S,
    output logic carry
);
    assign S = (A ^ B);
    assign carry = (A & B);
endmodule