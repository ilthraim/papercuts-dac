module spi_top (
    input logic wb_clk_i,
    input logic wb_rst_i,
    input logic[4:0] wb_adr_i,
    input logic[31:0] wb_dat_i,
    output reg[31:0] wb_dat_o,
    input logic[3:0] wb_sel_i,
    input logic wb_we_i,
    input logic wb_stb_i,
    input logic wb_cyc_i,
    output reg wb_ack_o,
    output logic wb_err_o,
    output reg wb_int_o,
    output logic[7:0] ss_pad_o,
    output logic sclk_pad_o,
    output logic mosi_pad_o,
    input logic miso_pad_i
);
    reg[15:0] divider;
    reg[13:0] ctrl;
    reg[7:0] ss;
    reg[31:0] wb_dat;
    wire logic[127:0] rx;
    wire logic rx_negedge;
    wire logic tx_negedge;
    wire logic[6:0] char_len;
    wire logic go;
    wire logic lsb;
    wire logic ie;
    wire logic ass;
    wire logic spi_divider_sel;
    wire logic spi_ctrl_sel;
    wire logic[3:0] spi_tx_sel;
    wire logic spi_ss_sel;
    wire logic tip;
    wire logic pos_edge;
    wire logic neg_edge;
    wire logic last_bit;
    assign spi_divider_sel = ((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 5));
    assign spi_ctrl_sel = ((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 4));
    assign spi_tx_sel[0] = ((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 0));
    assign spi_tx_sel[1] = ((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 1));
    assign spi_tx_sel[2] = ((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 2));
    assign spi_tx_sel[3] = ((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 3));
    assign spi_ss_sel = ((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 6));
    always @(wb_adr_i or rx or ctrl or divider or ss) begin
        case (wb_adr_i[4:2])
            0: begin
                wb_dat = rx[31:0];
            end
            1: begin
                wb_dat = rx[63:32];
            end
            2: begin
                wb_dat = rx[95:64];
            end
            3: begin
                wb_dat = {rx[127:96]};
            end
            4: begin
                wb_dat = {18'd0, ctrl};
            end
            5: begin
                wb_dat = {16'd0, divider};
            end
            6: begin
                wb_dat = {24'd0, ss};
            end
            default: begin
                wb_dat = 32'dx;
            end
        endcase
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_dat_o <= 32'd0;
        end
        else begin
            wb_dat_o <= wb_dat;
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_ack_o <= 1'b0;
        end
        else begin
            wb_ack_o <= ((wb_cyc_i & wb_stb_i) & ~(wb_ack_o));
        end
    end
    assign wb_err_o = 1'b0;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_int_o <= 1'b0;
        end
        else if ((((ie) && last_bit) && pos_edge)) begin
            wb_int_o <= 1'b1;
        end
        else if (wb_ack_o) begin
            wb_int_o <= 1'b0;
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            divider <= 16'd0;
        end
        else if (((spi_divider_sel && wb_we_i) && !(tip))) begin
            if (wb_sel_i[0]) begin
                divider[7:0] <= wb_dat_i[7:0];
            end
            if (wb_sel_i[1]) begin
                divider[15:8] <= wb_dat_i[15:8];
            end
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ctrl <= 14'd0;
        end
        else if (((spi_ctrl_sel && wb_we_i) && !(tip))) begin
            if (wb_sel_i[0]) begin
                ctrl[7:0] <= (wb_dat_i[7:0] | {7'b0, ctrl[0]});
            end
            if (wb_sel_i[1]) begin
                ctrl[13:8] <= wb_dat_i[13:8];
            end
        end
        else if ((( last_bit) && pos_edge)) begin
            ctrl[8] <= 1'b0;
        end
    end
    assign rx_negedge = ctrl[9];
    assign tx_negedge = ctrl[10];
    assign go = ctrl[8];
    assign char_len = ctrl[6:0];
    assign lsb = ctrl[11];
    assign ie = ctrl[12];
    assign ass = ctrl[13];
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ss <= 8'd0;
        end
        else if (((spi_ss_sel && wb_we_i) && !(tip))) begin
            if (wb_sel_i[0]) begin
                ss <= wb_dat_i[7:0];
            end
        end
    end
    assign ss_pad_o = ~(((ss & {8{(tip)}}) | (ss & {8{!(ass)}})));
    spi_top_clgen clgen (
        .clk_in(wb_clk_i),
        .rst(wb_rst_i),
        .go(go),
        .enable(tip),
        .last_clk(last_bit),
        .divider(divider),
        .clk_out(sclk_pad_o),
        .pos_edge(pos_edge),
        .neg_edge(neg_edge)
    );
    spi_top_shift shift (
        .clk(wb_clk_i),
        .rst(wb_rst_i),
        .latch((spi_tx_sel[3:0] & {4{wb_we_i}})),
        .byte_sel(wb_sel_i),
        .len(char_len[6:0]),
        .lsb(lsb),
        .go(go),
        .pos_edge(pos_edge),
        .neg_edge(neg_edge),
        .rx_negedge(rx_negedge),
        .tx_negedge(tx_negedge),
        .tip(tip),
        .last(last_bit),
        .p_in(wb_dat_i),
        .p_out(rx),
        .s_clk(sclk_pad_o),
        .s_in(miso_pad_i),
        .s_out(mosi_pad_o)
    );
endmodule