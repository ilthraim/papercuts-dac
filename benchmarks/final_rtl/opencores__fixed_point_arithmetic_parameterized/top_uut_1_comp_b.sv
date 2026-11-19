
module top_uut_1_comp_b #(
    parameter logic signed[31:0] Q = 23,
    parameter logic signed[31:0] N = 32
) (
    input logic[30:0] a,
    output logic[63:0] b
);
    reg [0:0] data;
    reg[63:0] flip;
    reg[63:0] out;
    assign b = out;
    always @(a) begin
        data <= a;
    end
    always @(data) begin
        flip <= ~(a);
    end
    always @(flip) begin
        out <= (flip + 1);
    end
endmodule