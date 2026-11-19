
module PID_multiplier_16x16bit_pipelined_layer_1_compressor42_5 (
    input logic A,
    input logic B,
    input logic C,
    input logic D,
    input logic cin,
    output logic S,
    output logic carry,
    output logic cout
);
    wire logic AB;
    assign AB = (A & B);
    wire logic AxorB;
    assign AxorB = (A ^ B);
    wire logic CD;
    assign CD = (C & D);
    wire logic CxorD;
    assign CxorD = (C ^ D);
    wire logic AxBxCxD = (AxorB ^ CxorD);
    assign cout = (AB | CD);
    assign carry = (((AB & CD) | (AxorB & CxorD)) | (AxBxCxD & cin));
    assign S = (AxBxCxD ^ cin);
endmodule