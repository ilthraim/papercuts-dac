
module PID_adder_32bit_0_operator_C_stage_6_7 (
    input logic P,
    input logic G,
    input logic G1,
    output logic Go
);
    assign Go = (G | (P & G1));
endmodule