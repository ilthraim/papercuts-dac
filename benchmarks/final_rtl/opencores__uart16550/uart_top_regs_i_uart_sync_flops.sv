module uart_top_regs_i_uart_sync_flops (
    input logic rst_i,
    input logic clk_i,
    input logic stage1_rst_i,
    input logic stage1_clk_en_i,
    input logic[0:0] async_dat_i,
    output reg[0:0] sync_dat_o
);
    reg[0:0] flop_0;
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            flop_0 <= 1'b1;
        end
        else begin
            flop_0 <= async_dat_i;
        end
    end
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            sync_dat_o <= 1'b1;
        end
        else begin
            sync_dat_o <= flop_0;
        end
    end
endmodule
