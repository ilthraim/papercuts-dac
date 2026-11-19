
module PID_adder_32bit_0_operator_B_stage_4_14 (
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