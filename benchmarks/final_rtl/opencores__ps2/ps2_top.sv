module ps2_top (
    input logic wb_clk_i,
    input logic wb_rst_i,
    input logic wb_cyc_i,
    input logic wb_stb_i,
    input logic wb_we_i,
    input logic[3:0] wb_sel_i,
    input logic[3:0] wb_adr_i,
    input logic[31:0] wb_dat_i,
    output logic[31:0] wb_dat_o,
    output logic wb_ack_o,
    output logic wb_int_o,
    input logic ps2_kbd_clk_pad_i,
    input logic ps2_kbd_data_pad_i,
    output logic ps2_kbd_clk_pad_o,
    output logic ps2_kbd_data_pad_o,
    output logic ps2_kbd_clk_pad_oe_o,
    output logic ps2_kbd_data_pad_oe_o
);
    wire logic rx_released;
    wire logic rx_kbd_data_ready;
    wire logic rx_translated_data_ready;
    wire logic rx_kbd_read_wb;
    wire logic rx_kbd_read_tt;
    wire logic tx_kbd_write;
    wire logic tx_kbd_write_ack;
    wire logic tx_error_no_keyboard_ack;
    wire logic ps2_ctrl_kbd_data_en_;
    wire logic ps2_ctrl_kbd_clk_en_;
    wire logic ps2_ctrl_kbd_clk;
    wire logic inhibit_kbd_if;
    wire logic[15:0] divide_reg;
    wire logic[7:0] rx_scan_code;
    wire logic[7:0] rx_translated_scan_code;
    wire logic[7:0] tx_kbd_data;
    assign ps2_kbd_clk_pad_o = 1'b0;
    assign ps2_kbd_data_pad_o = 1'b0;
    ps2_top_i_ps2_io_ctrl_keyboard i_ps2_io_ctrl_keyboard (
        .clk_i(wb_clk_i),
        .rst_i(wb_rst_i),
        .ps2_ctrl_clk_en_i_(ps2_ctrl_kbd_clk_en_),
        .ps2_ctrl_data_en_i_(ps2_ctrl_kbd_data_en_),
        .ps2_clk_pad_i(ps2_kbd_clk_pad_i),
        .ps2_clk_pad_oe_o(ps2_kbd_clk_pad_oe_o),
        .ps2_data_pad_oe_o(ps2_kbd_data_pad_oe_o),
        .inhibit_if_i(inhibit_kbd_if),
        .ps2_ctrl_clk_o(ps2_ctrl_kbd_clk)
    );
    wire logic translate;
    ps2_top_i_ps2_keyboard i_ps2_keyboard (
        .clk(wb_clk_i),
        .reset(wb_rst_i),
        .ps2_clk_en_o_(ps2_ctrl_kbd_clk_en_),
        .ps2_data_en_o_(ps2_ctrl_kbd_data_en_),
        .ps2_clk_i(ps2_ctrl_kbd_clk),
        .ps2_data_i(ps2_kbd_data_pad_i),
        .rx_released(rx_released),
        .rx_scan_code(rx_scan_code),
        .rx_data_ready(rx_kbd_data_ready),
        .rx_read(rx_kbd_read_tt),
        .tx_data(tx_kbd_data),
        .tx_write(tx_kbd_write),
        .tx_write_ack_o(tx_kbd_write_ack),
        .tx_error_no_keyboard_ack(tx_error_no_keyboard_ack),
        .translate(translate),
        .divide_reg_i(divide_reg)
    );
    ps2_top_i_ps2_wb_if i_ps2_wb_if (
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wb_cyc_i(wb_cyc_i),
        .wb_stb_i(wb_stb_i),
        .wb_we_i(wb_we_i),
        .wb_sel_i(wb_sel_i),
        .wb_adr_i(wb_adr_i),
        .wb_dat_i(wb_dat_i),
        .wb_dat_o(wb_dat_o),
        .wb_ack_o(wb_ack_o),
        .wb_int_o(wb_int_o),
        .tx_kbd_write_ack_i(1'b1),
        .tx_kbd_data_o(tx_kbd_data),
        .tx_kbd_write_o(tx_kbd_write),
        .rx_scancode_i(rx_translated_scan_code),
        .rx_kbd_data_ready_i(rx_translated_data_ready),
        .rx_kbd_read_o(rx_kbd_read_wb),
        .translate_o(translate),
        .ps2_kbd_clk_i(ps2_kbd_clk_pad_i),
        .divide_reg_o(divide_reg),
        .inhibit_kbd_if_o(inhibit_kbd_if)
    );
    ps2_top_i_ps2_translation_table i_ps2_translation_table (
        .reset_i(wb_rst_i),
        .clock_i(wb_clk_i),
        .translate_i(translate),
        .code_i(rx_scan_code),
        .code_o(rx_translated_scan_code),
        .address_i(8'd0),
        .data_i(8'd0),
        .we_i(1'b0),
        .re_i(1'b0),
        .data_o(),
        .rx_data_ready_i(rx_kbd_data_ready),
        .rx_translated_data_ready_o(rx_translated_data_ready),
        .rx_read_i(rx_kbd_read_wb),
        .rx_read_o(rx_kbd_read_tt),
        .rx_released_i(rx_released)
    );
endmodule