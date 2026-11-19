
module top_a7 (
    input logic clk,
    input logic[31:0] inp,
    input logic rst,
    output reg[31:0] out
);
    wire logic [8:0] DIVISOR = 32'd360;
    always @(posedge clk) begin
        if (rst) begin
            out <= 8'd0;
        end
        else begin
            out <= (inp % DIVISOR);
        end
    end
endmodule