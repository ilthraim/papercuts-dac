module oc54_cpu_cpu_treg (
    input logic clk,
    input logic ena,
    input logic seli,
    input logic we,
    input logic[5:0] exp,
    input logic[15:0] d,
    output reg[15:0] result
);
    always @(posedge clk) begin
        if (ena) begin
            result <= (seli ? {10'd0, exp} : d);
        end
    end
endmodule
