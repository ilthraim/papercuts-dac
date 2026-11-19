module top_u_dp_dsp_block_16_8_true_inst_2 (
    input logic clk,
    input logic ena,
    input logic aclr,
    input logic[15:0] ax,
    input logic[7:0] ay,
    input logic[15:0] bx,
    input logic[7:0] by,
    input logic[63:0] chainin,
    output logic[63:0] chainout,
    output logic[23:0] resulta
);
    reg[15:0] ax_reg;
    reg[7:0] ay_reg;
    reg[15:0] bx_reg;
    reg[7:0] by_reg;
    reg[23:0] resulta_reg;
    always @(posedge clk) begin
        ax_reg <= ax;
        ay_reg <= ay;
        bx_reg <= bx;
        by_reg <= by;
        resulta_reg <= (((ax_reg * ay_reg) + (bx_reg * by_reg)) + chainin);
    end
    assign resulta = resulta_reg;
    assign chainout = {40'h0, resulta};
endmodule
