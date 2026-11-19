module ptc_top (
    input logic wb_clk_i,
    input logic wb_rst_i,
    input logic wb_cyc_i,
    input logic[15:0] wb_adr_i,
    input logic[31:0] wb_dat_i,
    input logic[3:0] wb_sel_i,
    input logic wb_we_i,
    input logic wb_stb_i,
    output reg[31:0] wb_dat_o,
    output logic wb_ack_o,
    output logic wb_err_o,
    output logic wb_inta_o,
    input logic gate_clk_pad_i,
    input logic capt_pad_i,
    output reg pwm_pad_o,
    output logic oen_padoen_o
);
    reg[31:0] rptc_cntr;
    reg[31:0] rptc_hrc;
    reg[31:0] rptc_lrc;
    reg[8:0] rptc_ctrl;
    wire logic rptc_cntr_sel;
    wire logic rptc_hrc_sel;
    wire logic rptc_lrc_sel;
    wire logic rptc_ctrl_sel;
    wire logic hrc_match;
    wire logic lrc_match;
    wire logic restart;
    wire logic stop;
    wire logic cntr_clk;
    wire logic cntr_rst;
    wire logic hrc_clk;
    wire logic lrc_clk;
    wire logic eclk_gate;
    wire logic gate;
    wire logic pwm_rst;
    reg int_sig;
    wire logic int_match;
    wire logic full_decoding;
    assign wb_ack_o = ((wb_cyc_i & wb_stb_i) & !(wb_err_o));
    assign wb_err_o = ((wb_cyc_i & wb_stb_i) & (!(full_decoding) | (wb_sel_i != 4'b1111)));
    assign cntr_clk = (rptc_ctrl[1] ? eclk_gate : wb_clk_i);
    assign cntr_rst = wb_rst_i;
    assign hrc_clk = (rptc_ctrl[8] ? capt_pad_i : wb_clk_i);
    assign lrc_clk = (rptc_ctrl[8] ? ~(capt_pad_i) : wb_clk_i);
    assign oen_padoen_o = ~(rptc_ctrl[3]);
    assign eclk_gate = (gate_clk_pad_i ^ rptc_ctrl[2]);
    assign gate = (eclk_gate);
    assign full_decoding = ((wb_adr_i[15:5] == 11'd0) & (wb_adr_i[1:0] == 2'b0));
    assign rptc_cntr_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 2'b0)) & full_decoding);
    assign rptc_hrc_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 2'b1)) & full_decoding);
    assign rptc_lrc_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 2'b10)) & full_decoding);
    assign rptc_ctrl_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 2'b11)) & full_decoding);
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rptc_ctrl <= 9'd0;
        end
        else if ((rptc_ctrl_sel && wb_we_i)) begin
            rptc_ctrl <= wb_dat_i[8:0];
        end
        else if (rptc_ctrl[5]) begin
            rptc_ctrl[6] <= (rptc_ctrl[6] | int_sig);
        end
    end
    always @(posedge hrc_clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rptc_hrc <= 32'd0;
        end
        else if ((rptc_hrc_sel && wb_we_i)) begin
            rptc_hrc <= wb_dat_i[31:0];
        end
        else if (rptc_ctrl[8]) begin
            rptc_hrc <= rptc_cntr;
        end
    end
    always @(posedge lrc_clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rptc_lrc <= 32'd0;
        end
        else if ((rptc_lrc_sel && wb_we_i)) begin
            rptc_lrc <= wb_dat_i[31:0];
        end
        else if (rptc_ctrl[8]) begin
            rptc_lrc <= rptc_cntr;
        end
    end
    always @(posedge cntr_clk or posedge cntr_rst) begin
        if (cntr_rst) begin
            rptc_cntr <= 32'd0;
        end
        else if ((rptc_cntr_sel && wb_we_i)) begin
            rptc_cntr <= wb_dat_i[31:0];
        end
        else if (restart) begin
            rptc_cntr <= 32'd0;
        end
        else if (((!(stop) && rptc_ctrl[0]) && !(gate))) begin
            rptc_cntr <= (rptc_cntr + 1);
        end
    end
    always @(wb_adr_i or rptc_hrc or rptc_lrc or rptc_ctrl or rptc_cntr) begin
        case (wb_adr_i[4:2])  // synopsys full_case parallel_case
            2'b1: begin
                wb_dat_o[31:0] = {rptc_hrc};
            end
            2'b10: begin
                wb_dat_o[31:0] = {rptc_lrc};
            end
            2'b11: begin
                wb_dat_o[31:0] = {23'd0, rptc_ctrl};
            end
            default: begin
                wb_dat_o[31:0] = {rptc_cntr};
            end
        endcase
    end
    assign hrc_match = (rptc_ctrl[0] & (rptc_cntr == rptc_hrc));
    assign lrc_match = (rptc_ctrl[0] & (rptc_cntr == rptc_lrc));
    assign restart = ((lrc_match & ~(rptc_ctrl[4])) | rptc_ctrl[7]);
    assign stop = (lrc_match);
    assign pwm_rst = (lrc_match | wb_rst_i);
    always @(posedge wb_clk_i) begin
        if (pwm_rst) begin
            pwm_pad_o <= 1'b0;
        end
        else if (hrc_match) begin
            pwm_pad_o <= 1'b1;
        end
    end
    assign int_match = ((lrc_match | hrc_match) & rptc_ctrl[5]);
    always @(posedge wb_rst_i or posedge wb_clk_i) begin
        if (wb_rst_i) begin
            int_sig <= 1'b0;
        end
        else if (int_match) begin
            int_sig <= 1'b1;
        end
        else begin
            int_sig <= 1'b0;
        end
    end
    assign wb_inta_o = rptc_ctrl[6];
endmodule