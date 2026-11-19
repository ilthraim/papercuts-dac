
module PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_7 (
    input logic[2:0] codes,
    output logic zero,
    output logic double,
    output logic negation
);
    wire logic A;
    assign A = codes[2];
    wire logic B;
    assign B = codes[1];
    wire logic C;
    assign C = codes[0];
    wire logic nB;
    wire logic nC;
    wire logic nA;
    assign nB = ~(B);
    assign nC = ~(C);
    assign nA = ~(A);
    wire logic BC;
    assign BC = (B & C);
    wire logic nBnC;
    assign nBnC = (nB & nC);
    wire logic nBanC;
    assign nBanC = (nB | nC);
    assign double = ((nBnC) | (BC));
    assign negation = (A & nBanC);
    assign zero = ((A & BC) | (nA & nBnC));
endmodule