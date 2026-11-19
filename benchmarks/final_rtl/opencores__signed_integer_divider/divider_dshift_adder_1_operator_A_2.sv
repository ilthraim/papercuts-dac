
module divider_dshift_adder_1_operator_A_2 (
    input logic A,
    input logic B,
    output logic P,
    output logic G
);
    assign P = (A ^ B);
    assign G = (A & B);
endmodule