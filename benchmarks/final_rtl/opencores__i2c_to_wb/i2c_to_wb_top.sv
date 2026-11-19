module i2c_to_wb_top #(
    parameter logic signed[31:0] DW = 32,
    parameter logic signed[31:0] AW = 8
) (
    input logic i2c_data_in,
    input logic i2c_clk_in,
    output logic i2c_data_out,
    output logic i2c_clk_out,
    output logic i2c_data_oe,
    output logic i2c_clk_oe,
    input logic[31:0] wb_data_i,
    output logic[31:0] wb_data_o,
    output logic[7:0] wb_addr_o,
    output logic[3:0] wb_sel_o,
    output logic wb_we_o,
    output logic wb_cyc_o,
    output logic wb_stb_o,
    input logic wb_ack_i,
    input logic wb_err_i,
    input logic wb_rty_i,
    input logic wb_clk_i,
    input logic wb_rst_i
);
    wire logic tip_addr_byte;
    wire logic tip_read_byte;
    wire logic tip_write_byte;
    wire logic tip_wr_ack;
    wire logic tip_rd_ack;
    wire logic tip_addr_ack;
    wire logic i2c_ack_out;
    wire logic i2c_ack_done;
    wire logic[7:0] i2c_byte_out;
    wire logic i2c_parallel_load;
    wire logic gf_i2c_data_in;
    wire logic gf_i2c_data_in_rise;
    wire logic gf_i2c_data_in_fall;
    i2c_to_wb_top_i_gf_i2c_data_in #(
        .SIZE(3)
    ) i_gf_i2c_data_in (
        .in(i2c_data_in),
        .out(gf_i2c_data_in),
        .rise(gf_i2c_data_in_rise),
        .fall(gf_i2c_data_in_fall),
        .clk(wb_clk_i),
        .rst(wb_rst_i)
    );
    wire logic gf_i2c_clk_in;
    wire logic gf_i2c_clk_in_rise;
    wire logic gf_i2c_clk_in_fall;
    i2c_to_wb_top_i_gf_i2c_clk_in #(
        .SIZE(3)
    ) i_gf_i2c_clk_in (
        .in(i2c_clk_in),
        .out(gf_i2c_clk_in),
        .rise(gf_i2c_clk_in_rise),
        .fall(gf_i2c_clk_in_fall),
        .clk(wb_clk_i),
        .rst(wb_rst_i)
    );
    reg[8:0] i2c_data_in_r;
    wire logic serial_out = i2c_data_in_r[8];
    always @(posedge wb_clk_i) begin
        if (i2c_parallel_load) begin
            i2c_data_in_r[7:0] <= i2c_byte_out;
        end
        else if (((tip_write_byte & gf_i2c_clk_in_rise) | (tip_read_byte & gf_i2c_clk_in_fall))) begin
            i2c_data_in_r <= {i2c_data_in_r[7:0], gf_i2c_data_in};
        end
    end
    i2c_to_wb_top_i_i2c_to_wb_fsm i_i2c_to_wb_fsm (
        .i2c_data(gf_i2c_data_in),
        .i2c_data_rise(gf_i2c_data_in_rise),
        .i2c_data_fall(gf_i2c_data_in_fall),
        .i2c_clk(gf_i2c_clk_in),
        .i2c_clk_rise(gf_i2c_clk_in_rise),
        .i2c_clk_fall(gf_i2c_clk_in_fall),
        .i2c_r_w_bit(i2c_data_in_r[0]),
        .i2c_ack_out(i2c_ack_out),
        .i2c_ack_done(i2c_ack_done),
        .tip_addr_byte(tip_addr_byte),
        .tip_read_byte(tip_read_byte),
        .tip_write_byte(tip_write_byte),
        .tip_wr_ack(tip_wr_ack),
        .tip_rd_ack(tip_rd_ack),
        .tip_addr_ack(tip_addr_ack),
        .state_out(),
        .i2c_error(),
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i)
    );
    i2c_to_wb_top_i_i2c_to_wb_config i_i2c_to_wb_config (
        .i2c_byte_in(i2c_data_in_r[7:0]),
        .tip_addr_ack(tip_addr_ack),
        .i2c_ack_out(i2c_ack_out),
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i)
    );
    i2c_to_wb_top_i_i2c_to_wb_if #(
        .DW(32),
        .AW(8)
    ) i_i2c_to_wb_if (
        .i2c_data(gf_i2c_data_in),
        .i2c_ack_done(i2c_ack_done),
        .i2c_byte_in(i2c_data_in_r[7:0]),
        .i2c_byte_out(i2c_byte_out),
        .i2c_parallel_load(i2c_parallel_load),
        .tip_wr_ack(tip_wr_ack),
        .tip_rd_ack(tip_rd_ack),
        .tip_addr_ack(tip_addr_ack),
        .wb_data_i(wb_data_i),
        .wb_data_o(wb_data_o),
        .wb_addr_o(wb_addr_o),
        .wb_sel_o(wb_sel_o),
        .wb_we_o(wb_we_o),
        .wb_cyc_o(wb_cyc_o),
        .wb_stb_o(wb_stb_o),
        .wb_ack_i(wb_ack_i),
        .wb_err_i(wb_err_i),
        .wb_rty_i(wb_rty_i),
        .wb_clk_i(wb_clk_i),
        .wb_rst_i(wb_rst_i)
    );
    reg i2c_data_oe_r;
    always @(posedge wb_clk_i) begin
        if (wb_rst_i) begin
            i2c_data_oe_r <= 1'b0;
        end
        else if (gf_i2c_clk_in_fall) begin
            i2c_data_oe_r <= (tip_read_byte | tip_wr_ack);
        end
    end
    reg i2c_data_mux_select_r;
    always @(posedge wb_clk_i) begin
        if (gf_i2c_clk_in_fall) begin
            i2c_data_mux_select_r <= tip_wr_ack;
        end
    end
    assign i2c_data_out = (i2c_data_mux_select_r ? i2c_ack_out : serial_out);
    assign i2c_data_oe = i2c_data_oe_r;
    assign i2c_clk_out = 1'b1;
    assign i2c_clk_oe = 1'b0;
endmodule