module top (
    input logic[31:0] a,
    input logic[31:0] b,
    output logic[31:0] c1,
    output logic[31:0] c2,
    output logic[31:0] c3,
    input logic clk,
    input logic start
);
    top_uut_0 #(
        .Q(23),
        .N(32)
    ) uut_0 (
        .a(a),
        .b(b),
        .c(c1)
    );
    top_uut_1 #(
        .Q(23),
        .N(32)
    ) uut_1 (
        .a(a),
        .b(b),
        .c(c2)
    );
    top_uut_2 #(
        .Q(15),
        .N(32)
    ) uut_2 (
        .dividend(a),
        .divisor(b),
        .start(start),
        .clk(clk),
        .quotient_out(c3),
        .complete()
    );
endmodule