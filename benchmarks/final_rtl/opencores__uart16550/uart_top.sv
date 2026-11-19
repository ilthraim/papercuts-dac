module uart_top (
    input logic wb_clk_i,
    input logic wb_rst_i,
    input logic[4:0] wb_adr_i,
    input logic[31:0] wb_dat_i,
    output logic[31:0] wb_dat_o,
    input logic wb_we_i,
    input logic wb_stb_i,
    input logic wb_cyc_i,
    output logic wb_ack_o,
    input logic[3:0] wb_sel_i,
    output logic int_o,
    output logic stx_pad_o,
    input logic srx_pad_i,
    output logic rts_pad_o,
    input logic cts_pad_i,
    output logic dtr_pad_o,
    input logic dsr_pad_i,
    input logic ri_pad_i,
    input logic dcd_pad_i
);
    wire logic[7:0] wb_dat8_i;
    wire logic[7:0] wb_dat8_o;
    wire logic[31:0] wb_dat32_o;
    wire logic[4:0] wb_adr_int;
    wire logic we_o;
    wire logic re_o;
    wire logic[3:0] ier;
    wire logic[3:0] iir;
    wire logic[1:0] fcr;
    wire logic[4:0] mcr;
    wire logic[7:0] lcr;
    wire logic[7:0] msr;
    wire logic[7:0] lsr;
    wire logic[4:0] rf_count;
    wire logic[4:0] tf_count;
    wire logic[2:0] tstate;
    wire logic[3:0] rstate;
    uart_top_wb_interface wb_interface (
        .clk(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wb_we_i(wb_we_i),
        .wb_stb_i(wb_stb_i),
        .wb_cyc_i(wb_cyc_i),
        .wb_ack_o(wb_ack_o),
        .wb_adr_i(wb_adr_i),
        .wb_adr_int(wb_adr_int),
        .wb_dat_i(wb_dat_i),
        .wb_dat_o(wb_dat_o),
        .wb_dat8_i(wb_dat8_i),
        .wb_dat8_o(wb_dat8_o),
        .wb_dat32_o(wb_dat32_o),
        .wb_sel_i(wb_sel_i),
        .we_o(we_o),
        .re_o(re_o)
    );
    uart_top_regs regs (
        .clk(wb_clk_i),
        .wb_rst_i(wb_rst_i),
        .wb_addr_i(wb_adr_int),
        .wb_dat_i(wb_dat8_i),
        .wb_dat_o(wb_dat8_o),
        .wb_we_i(we_o),
        .wb_re_i(re_o),
        .modem_inputs({cts_pad_i, dsr_pad_i, ri_pad_i, dcd_pad_i}),
        .stx_pad_o(stx_pad_o),
        .srx_pad_i(srx_pad_i),
        .ier(ier),
        .iir(iir),
        .fcr(fcr),
        .mcr(mcr),
        .lcr(lcr),
        .msr(msr),
        .lsr(lsr),
        .rf_count(rf_count),
        .tf_count(tf_count),
        .tstate(tstate),
        .rstate(rstate),
        .rts_pad_o(rts_pad_o),
        .dtr_pad_o(dtr_pad_o),
        .int_o(int_o)
    );
    uart_top_dbg dbg (
        .wb_dat32_o(wb_dat32_o[31:0]),
        .wb_adr_i(wb_adr_int[4:0]),
        .ier(ier[3:0]),
        .iir(iir[3:0]),
        .fcr(fcr[1:0]),
        .mcr(mcr[4:0]),
        .lcr(lcr[7:0]),
        .msr(msr[7:0]),
        .lsr(lsr[7:0]),
        .rf_count(rf_count[4:0]),
        .tf_count(tf_count[4:0]),
        .tstate(tstate[2:0]),
        .rstate(rstate[3:0])
    );
    initial begin
        $display("(%m) UART INFO: Data bus width is 32. Debug Interface present.\n");
        $display("(%m) UART INFO: Doesn't have baudrate output\n");
    end
endmodule