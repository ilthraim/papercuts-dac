
module PID_multiplier_16x16bit_pipelined_layer_4_full_adder_1 (
    input logic A,
    input logic B,
    input logic cin,
    output logic S,
    output logic cout
);
    wire logic AB;
    assign AB = (A);
    wire logic AxorB;
    assign AxorB = (A ^ B);
    assign S = (AxorB ^ cin);
    assign cout = (AB | (AxorB));
endmodule