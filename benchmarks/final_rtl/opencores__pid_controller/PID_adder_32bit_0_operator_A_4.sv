
module PID_adder_32bit_0_operator_A_4 (
    input logic A,
    input logic B,
    output logic P,
    output logic G
);
    assign P = (A ^ B);
    assign G = (A & B);
endmodule