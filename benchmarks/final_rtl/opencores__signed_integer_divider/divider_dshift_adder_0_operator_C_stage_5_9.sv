
module divider_dshift_adder_0_operator_C_stage_5_9 (
    input logic P,
    input logic G,
    input logic G1,
    output logic Go
);
    assign Go = (G | (P & G1));
endmodule