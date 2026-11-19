module PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_0 (
    input logic[2:0] codes,
    output logic zero,
    output logic double,
    output logic negation
);
    wire logic A;
    assign A = codes[2];
    wire logic B;
    assign B = codes[1];
    wire logic nB;
    wire logic nA;
    assign nB = ~(B);
    assign nA = ~(A);
    wire logic nBnC;
    assign nBnC = (nB & 1'b1);
    assign double = (nBnC | 1'b0);
    assign negation = (A & 1'b1);
    assign zero = (1'b0 | (nA & nBnC));
endmodule
