
module top_u_dp (
    input logic clk,
    input logic i_reset,
    input logic[15:0] i_features_0,
    input logic[7:0] i_weights_0,
    input logic[15:0] i_features_1,
    input logic[7:0] i_weights_1,
    input logic[15:0] i_features_2,
    input logic[7:0] i_weights_2,
    input logic[15:0] i_features_3,
    input logic[7:0] i_weights_3,
    output logic[23:0] o_result
);
    wire logic [23:0] chains_0;
    wire logic [0:0] chains_1;
    wire logic[23:0] res;
    reg[15:0] f_pipeline_0_0;
    reg[7:0] w_pipeline_0_0;
    reg[15:0] f_pipeline_1_0;
    reg[7:0] w_pipeline_1_0;
    reg[15:0] f_pipeline_2_0;
    reg[7:0] w_pipeline_2_0;
    reg[15:0] f_pipeline_2_1;
    reg[7:0] w_pipeline_2_1;
    reg[15:0] f_pipeline_3_0;
    reg[7:0] w_pipeline_3_0;
    reg[15:0] f_pipeline_3_1;
    reg[7:0] w_pipeline_3_1;
    reg r_pipeline_0;
    reg r_pipeline_1;
    always @(posedge clk) begin
        r_pipeline_0 <= i_reset;
        if ((i_reset == 1'b1)) begin
            f_pipeline_0_0 <= 0;
            w_pipeline_0_0 <= 0;
            f_pipeline_1_0 <= 0;
            w_pipeline_1_0 <= 0;
            f_pipeline_2_0 <= 0;
            w_pipeline_2_0 <= 0;
            f_pipeline_3_0 <= 0;
            w_pipeline_3_0 <= 0;
            f_pipeline_2_1 <= 0;
            w_pipeline_2_1 <= 0;
            f_pipeline_3_1 <= 0;
            w_pipeline_3_1 <= 0;
            r_pipeline_1 <= 1'b1;
        end
        else begin
            f_pipeline_0_0 <= i_features_0;
            w_pipeline_0_0 <= i_weights_0;
            f_pipeline_1_0 <= i_features_1;
            w_pipeline_1_0 <= i_weights_1;
            f_pipeline_2_0 <= i_features_2;
            w_pipeline_2_0 <= i_weights_2;
            f_pipeline_3_0 <= i_features_3;
            w_pipeline_3_0 <= i_weights_3;
            r_pipeline_1 <= 1'b0;
            f_pipeline_2_1 <= f_pipeline_2_0;
            w_pipeline_2_1 <= w_pipeline_2_0;
            f_pipeline_3_1 <= f_pipeline_3_0;
            w_pipeline_3_1 <= w_pipeline_3_0;
        end
    end
    wire logic [0:0] dummy_res_0;
    top_u_dp_dsp_block_16_8_false_inst_0 dsp_block_16_8_false_inst_0 (
        .clk(clk),
        .ena(1'b1),
        .aclr(1'b0),
        .ax(f_pipeline_0_0),
        .ay(w_pipeline_0_0),
        .bx(f_pipeline_1_0),
        .by(w_pipeline_1_0),
        .chainin(64'h0),
        .chainout(chains_0),
        .resulta(dummy_res_0)
    );
    top_u_dp_dsp_block_16_8_true_inst_2 dsp_block_16_8_true_inst_2 (
        .clk(clk),
        .ena(1'b1),
        .aclr(1'b0),
        .ax(f_pipeline_2_1),
        .ay(w_pipeline_2_1),
        .bx(f_pipeline_3_1),
        .by(w_pipeline_3_1),
        .chainin({40'b0, chains_0}),
        .chainout(chains_1),
        .resulta(res)
    );
    assign o_result = res;
endmodule