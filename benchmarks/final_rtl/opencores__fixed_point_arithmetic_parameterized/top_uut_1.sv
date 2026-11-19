
module top_uut_1 #(
    parameter logic signed[31:0] Q = 23,
    parameter logic signed[31:0] N = 32
) (
    input logic[31:0] a,
    input logic[31:0] b,
    output logic[31:0] c
);
    wire logic[63:0] a_ext;
    wire logic[63:0] b_ext;
    wire logic [30:0] r_ext;
    reg[63:0] a_mult;
    reg[63:0] b_mult;
    reg [53:0] result;
    reg[31:0] retVal;
    top_uut_1_comp_a #(
        .Q(23),
        .N(32)
    ) comp_a (
        .a(a[30:0]),
        .b(a_ext)
    );
    top_uut_1_comp_b #(
        .Q(23),
        .N(32)
    ) comp_b (
        .a(b[30:0]),
        .b(b_ext)
    );
    top_uut_1_comp_r #(
        .Q(23),
        .N(32)
    ) comp_r (
        .a(result[53:23]),
        .b(r_ext)
    );
    assign c = retVal;
    always @(a_ext or b_ext) begin
        if ((a[31] == 1)) begin
            a_mult <= a_ext;
        end
        else begin
            a_mult <= a;
        end
        if ((b[31] == 1)) begin
            b_mult <= b_ext;
        end
        else begin
            b_mult <= b;
        end
    end
    always @(a_mult or b_mult) begin
        result <= (a_mult * b_mult);
    end
    always @(result or r_ext) begin
        if ((((a[31] == 1) && (b[31] == 0)) || ((a[31] == 0) && (b[31] == 1)))) begin
            retVal[31] <= 1;
            retVal[30:0] <= r_ext[30:0];
        end
        else begin
            retVal[31] <= 0;
            retVal[30:0] <= result[53:23];
        end
    end
endmodule