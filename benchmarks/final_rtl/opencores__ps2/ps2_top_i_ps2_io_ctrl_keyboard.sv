
module ps2_top_i_ps2_io_ctrl_keyboard (
    input logic clk_i,
    input logic rst_i,
    input logic ps2_ctrl_clk_en_i_,
    input logic ps2_ctrl_data_en_i_,
    input logic ps2_clk_pad_i,
    output reg ps2_clk_pad_oe_o,
    output reg ps2_data_pad_oe_o,
    input logic inhibit_if_i,
    output logic ps2_ctrl_clk_o
);
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            ps2_clk_pad_oe_o <= 1'b0;
            ps2_data_pad_oe_o <= 1'b0;
        end
        else begin
            ps2_clk_pad_oe_o <= (!(ps2_ctrl_clk_en_i_) || inhibit_if_i);
            ps2_data_pad_oe_o <= !(ps2_ctrl_data_en_i_);
        end
    end
    reg inhibit_if_previous;
    always @(posedge clk_i or posedge rst_i) begin
        if (rst_i) begin
            inhibit_if_previous <= 1'b1;
        end
        else begin
            inhibit_if_previous <= inhibit_if_i;
        end
    end
    assign ps2_ctrl_clk_o = (ps2_clk_pad_i || (ps2_clk_pad_oe_o && inhibit_if_previous));
endmodule