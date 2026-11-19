
module PID_multiplier_16x16bit_pipelined_adder_32bit_operator_B_stage_3_15 (
    input logic P,
    input logic G,
    input logic P1,
    input logic G1,
    output logic Po,
    output logic Go
);
    assign Po = (P & P1);
    assign Go = (G | (P & G1));
endmodule