
module PID_multiplier_16x16bit_pipelined_layer_3_full_adder_9 (
    input logic A,
    input logic B,
    input logic cin,
    output logic S,
    output logic cout
);
    wire logic AB;
    assign AB = (A & B);
    wire logic AxorB;
    assign AxorB = (A ^ B);
    assign S = (AxorB ^ cin);
    assign cout = (AB | (AxorB & cin));
endmodule