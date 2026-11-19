
module spi_top_clgen (
    input logic clk_in,
    input logic rst,
    input logic go,
    input logic enable,
    input logic last_clk,
    input logic[15:0] divider,
    output reg clk_out,
    output reg pos_edge,
    output reg neg_edge
);
    reg[15:0] cnt;
    wire logic cnt_zero;
    wire logic cnt_one;
    assign cnt_zero = (cnt == 16'd0);
    assign cnt_one = (cnt == 16'd1);
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            cnt <= 16'd65535;
        end
        else begin
            if ((!(enable) || cnt_zero)) begin
                cnt <= divider;
            end
            else begin
                cnt <= (cnt - 16'd1);
            end
        end
    end
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            clk_out <= 1'b0;
        end
        else begin
            clk_out <= (((enable && cnt_zero) && (!(last_clk) || clk_out)) ? ~(clk_out) : clk_out);
        end
    end
    always @(posedge clk_in or posedge rst) begin
        if (rst) begin
            pos_edge <= 1'b0;
            neg_edge <= 1'b0;
        end
        else begin
            pos_edge <= ((((enable && !(clk_out)) && cnt_one) || (!(|(divider)) && clk_out)) || ((!(|(divider)) && go) && !(enable)));
            neg_edge <= ((( clk_out) && cnt_one) || ((!(|(divider)) && !(clk_out)) && enable));
        end
    end
endmodule