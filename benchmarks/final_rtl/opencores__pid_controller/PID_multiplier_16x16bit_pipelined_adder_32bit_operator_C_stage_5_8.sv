
module PID_multiplier_16x16bit_pipelined_adder_32bit_operator_C_stage_5_8 (
    input logic P,
    input logic G,
    input logic G1,
    output logic Go
);
    assign Go = (G | (P & G1));
endmodule