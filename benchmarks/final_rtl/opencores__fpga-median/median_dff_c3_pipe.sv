
module median_dff_c3_pipe #(
    parameter logic signed[31:0] DATA_WIDTH = 8
) (
    input logic clk,
    input logic rst_n,
    input logic[7:0] d0,
    input logic[7:0] d1,
    input logic[7:0] d2,
    output reg[7:0] q0,
    output reg[7:0] q1,
    output reg[7:0] q2
);
    always @(posedge clk or negedge rst_n) begin
        if (~(rst_n)) begin
            q0 <= 8'd0;
            q1 <= 8'd0;
            q2 <= 8'd0;
        end
        else begin
            q0 <= d0;
            q1 <= d1;
            q2 <= d2;
        end
    end
endmodule