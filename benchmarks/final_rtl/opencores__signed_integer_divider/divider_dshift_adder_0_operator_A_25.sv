
module divider_dshift_adder_0_operator_A_25 (
    input logic A,
    input logic B,
    output logic P,
    output logic G
);
    assign P = (A ^ B);
    assign G = (A & B);
endmodule