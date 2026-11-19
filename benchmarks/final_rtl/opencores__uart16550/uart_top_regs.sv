
module uart_top_regs (
    input logic clk,
    input logic wb_rst_i,
    input logic[4:0] wb_addr_i,
    input logic[7:0] wb_dat_i,
    output reg[7:0] wb_dat_o,
    input logic wb_we_i,
    input logic wb_re_i,
    input logic[3:0] modem_inputs,
    output logic stx_pad_o,
    input logic srx_pad_i,
    output reg[3:0] ier,
    output reg[3:0] iir,
    output reg[1:0] fcr,
    output reg[4:0] mcr,
    output reg[7:0] lcr,
    output reg[7:0] msr,
    output logic[7:0] lsr,
    output logic[4:0] rf_count,
    output logic[4:0] tf_count,
    output logic[2:0] tstate,
    output logic[3:0] rstate,
    output logic rts_pad_o,
    output logic dtr_pad_o,
    output reg int_o
);
    reg enable;
    wire logic srx_pad;
    reg[15:0] dl;
    reg[7:0] scratch;
    reg start_dlc;
    reg lsr_mask_d;
    reg msi_reset;
    reg[15:0] dlc;
    reg[3:0] trigger_level;
    reg rx_reset;
    reg tx_reset;
    wire logic dlab;
    wire logic cts_pad_i;
    wire logic dsr_pad_i;
    wire logic ri_pad_i;
    wire logic dcd_pad_i;
    wire logic loopback;
    wire logic cts;
    wire logic dsr;
    wire logic ri;
    wire logic dcd;
    wire logic cts_c;
    wire logic dsr_c;
    wire logic ri_c;
    wire logic dcd_c;
    wire logic lsr0;
    wire logic lsr1;
    wire logic lsr2;
    wire logic lsr3;
    wire logic lsr4;
    wire logic lsr5;
    wire logic lsr6;
    wire logic lsr7;
    reg lsr0r;
    reg lsr1r;
    reg lsr2r;
    reg lsr3r;
    reg lsr4r;
    reg lsr5r;
    reg lsr6r;
    reg lsr7r;
    wire logic lsr_mask;
    assign lsr[7:0] = {lsr7r, lsr6r, lsr5r, lsr4r, lsr3r, lsr2r, lsr1r, lsr0r};
    assign {cts_pad_i, dsr_pad_i, ri_pad_i, dcd_pad_i} = modem_inputs;
    assign {cts, dsr, ri, dcd} = ~({cts_pad_i, dsr_pad_i, ri_pad_i, dcd_pad_i});
    assign {cts_c, dsr_c, ri_c, dcd_c} = (loopback ? {mcr[1], mcr[0], mcr[2], mcr[3]} : {cts_pad_i, dsr_pad_i, ri_pad_i, dcd_pad_i});
    assign dlab = lcr[7];
    assign loopback = mcr[4];
    assign rts_pad_o = mcr[1];
    assign dtr_pad_o = mcr[0];
    wire logic rls_int;
    wire logic rda_int;
    wire logic ti_int;
    wire logic thre_int;
    wire logic ms_int;
    reg tf_push;
    reg rf_pop;
    wire logic[10:0] rf_data_out;
    wire logic rf_error_bit;
    wire logic[9:0] counter_t;
    wire logic thre_set_en;
    reg[7:0] block_cnt;
    reg[7:0] block_value;
    wire logic serial_out;
    uart_top_regs_transmitter transmitter (
        .clk(clk),
        .wb_rst_i(wb_rst_i),
        .lcr(lcr),
        .tf_push(tf_push),
        .wb_dat_i(wb_dat_i),
        .enable(enable),
        .stx_pad_o(serial_out),
        .tstate(tstate),
        .tf_count(tf_count),
        .tx_reset(tx_reset),
        .lsr_mask(lsr_mask)
    );
    uart_top_regs_i_uart_sync_flops i_uart_sync_flops (
        .rst_i(wb_rst_i),
        .clk_i(clk),
        .stage1_rst_i(1'b0),
        .stage1_clk_en_i(1'b1),
        .async_dat_i(srx_pad_i),
        .sync_dat_o(srx_pad)
    );
    wire logic serial_in = (loopback ? serial_out : srx_pad);
    assign stx_pad_o = (loopback ? 1'b1 : serial_out);
    wire logic rf_overrun;
    wire logic rf_push_pulse;
    uart_top_regs_receiver receiver (
        .clk(clk),
        .wb_rst_i(wb_rst_i),
        .lcr(lcr),
        .rf_pop(rf_pop),
        .srx_pad_i(serial_in),
        .enable(enable),
        .counter_t(counter_t),
        .rf_count(rf_count),
        .rf_data_out(rf_data_out),
        .rf_error_bit(rf_error_bit),
        .rf_overrun(rf_overrun),
        .rx_reset(rx_reset),
        .lsr_mask(lsr_mask),
        .rstate(rstate),
        .rf_push_pulse(rf_push_pulse)
    );
    always @(dl or dlab or ier or iir or scratch or lcr or lsr or msr or rf_data_out or wb_addr_i or wb_re_i) begin
        case (wb_addr_i)
            5'b0: begin
                wb_dat_o = (dlab ? dl[7:0] : rf_data_out[10:3]);
            end
            5'b1: begin
                wb_dat_o = (dlab ? dl[15:8] : ier);
            end
            5'b10: begin
                wb_dat_o = {4'b1100, iir};
            end
            5'b11: begin
                wb_dat_o = lcr;
            end
            5'b101: begin
                wb_dat_o = lsr;
            end
            5'b110: begin
                wb_dat_o = msr;
            end
            5'b111: begin
                wb_dat_o = scratch;
            end
            default: begin
                wb_dat_o = 8'd0;
            end
        endcase
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rf_pop <= 0;
        end
        else if (rf_pop) begin
            rf_pop <= 0;
        end
        else if (((wb_re_i && (wb_addr_i == 5'b0)) && !(dlab))) begin
            rf_pop <= 1;
        end
    end
    wire logic lsr_mask_condition;
    wire logic iir_read;
    wire logic msr_read;
    wire logic fifo_read;
    wire logic fifo_write;
    assign lsr_mask_condition = ((wb_re_i && (wb_addr_i == 5'b101)) && !(dlab));
    assign iir_read = ((wb_re_i && (wb_addr_i == 5'b10)) && !(dlab));
    assign msr_read = ((wb_re_i && (wb_addr_i == 5'b110)) && !(dlab));
    assign fifo_read = ((wb_re_i && (wb_addr_i == 5'b0)) && !(dlab));
    assign fifo_write = ((wb_we_i && (wb_addr_i == 5'b0)) && !(dlab));
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr_mask_d <= 0;
        end
        else begin
            lsr_mask_d <= lsr_mask_condition;
        end
    end
    assign lsr_mask = (lsr_mask_condition && ~(1'b0));
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            msi_reset <= 1;
        end
        else if (msi_reset) begin
            msi_reset <= 0;
        end
        else if (msr_read) begin
            msi_reset <= 1;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lcr <= 8'd3;
        end
        else if ((wb_we_i && (wb_addr_i == 5'b11))) begin
            lcr <= wb_dat_i;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ier <= 4'b0;
            dl[15:8] <= 8'd0;
        end
        else if ((wb_we_i && (wb_addr_i == 5'b1))) begin
            if (dlab) begin
                dl[15:8] <= wb_dat_i;
            end
            else begin
                ier <= wb_dat_i[3:0];
            end
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            fcr <= 2'b11;
            rx_reset <= 0;
            tx_reset <= 0;
        end
        else if ((wb_we_i && (wb_addr_i == 5'b10))) begin
            fcr <= wb_dat_i[7:6];
            rx_reset <= wb_dat_i[1];
            tx_reset <= wb_dat_i[2];
        end
        else begin
            rx_reset <= 0;
            tx_reset <= 0;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            mcr <= 5'b0;
        end
        else if ((wb_we_i && (wb_addr_i == 5'b100))) begin
            mcr <= wb_dat_i[4:0];
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            scratch <= 0;
        end
        else if ((wb_we_i && (wb_addr_i == 5'b111))) begin
            scratch <= wb_dat_i;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            dl[7:0] <= 8'd0;
            tf_push <= 1'b0;
            start_dlc <= 1'b0;
        end
        else if ((wb_we_i && (wb_addr_i == 5'b0))) begin
            if (dlab) begin
                dl[7:0] <= wb_dat_i;
                start_dlc <= 1'b1;
                tf_push <= 1'b0;
            end
            else begin
                tf_push <= 1'b1;
                start_dlc <= 1'b0;
            end
        end
        else begin
            start_dlc <= 1'b0;
            tf_push <= 1'b0;
        end
    end
    always @(fcr) begin
        case (fcr[1:0])
            2'b0: begin
                trigger_level = 1;
            end
            2'b1: begin
                trigger_level = 4;
            end
            2'b10: begin
                trigger_level = 8;
            end
            2'b11: begin
                trigger_level = 14;
            end
        endcase
    end
    reg[3:0] delayed_modem_signals;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            msr <= 0;
            delayed_modem_signals[3:0] <= 0;
        end
        else begin
            msr[3:0] <= (msi_reset ? 4'b0 : (msr[3:0] | ({dcd, ri, dsr, cts} ^ delayed_modem_signals[3:0])));
            msr[7:4] <= {dcd_c, ri_c, dsr_c, cts_c};
            delayed_modem_signals[3:0] <= {dcd, ri, dsr, cts};
        end
    end
    assign lsr0 = ( rf_push_pulse);
    assign lsr1 = rf_overrun;
    assign lsr2 = rf_data_out[1];
    assign lsr3 = rf_data_out[0];
    assign lsr4 = rf_data_out[2];
    assign lsr5 = ((tf_count == 5'b0) && thre_set_en);
    assign lsr6 = (((tf_count == 5'b0) && thre_set_en) && (tstate == 0));
    assign lsr7 = (rf_error_bit | rf_overrun);
    reg lsr0_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr0_d <= 0;
        end
        else begin
            lsr0_d <= lsr0;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr0r <= 0;
        end
        else begin
            lsr0r <= (((((rf_count == 1) && rf_pop) && !(rf_push_pulse)) || rx_reset) ? 0 : (lsr0r || (lsr0 && ~(1'b0))));
        end
    end
    reg lsr1_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr1_d <= 0;
        end
        else begin
            lsr1_d <= lsr1;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr1r <= 0;
        end
        else begin
            lsr1r <= (lsr_mask ? 0 : (lsr1r || (lsr1 && ~(1'b0))));
        end
    end
    reg lsr2_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr2_d <= 0;
        end
        else begin
            lsr2_d <= lsr2;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr2r <= 0;
        end
        else begin
            lsr2r <= (lsr_mask ? 0 : (lsr2r || (lsr2 && ~(lsr2_d))));
        end
    end
    reg lsr3_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr3_d <= 0;
        end
        else begin
            lsr3_d <= lsr3;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr3r <= 0;
        end
        else begin
            lsr3r <= (lsr_mask ? 0 : (lsr3r || (lsr3 && ~(lsr3_d))));
        end
    end
    reg lsr4_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr4_d <= 0;
        end
        else begin
            lsr4_d <= lsr4;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr4r <= 0;
        end
        else begin
            lsr4r <= (lsr_mask ? 0 : (lsr4r || (lsr4 && ~(lsr4_d))));
        end
    end
    reg lsr5_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr5_d <= 1;
        end
        else begin
            lsr5_d <= lsr5;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr5r <= 1;
        end
        else begin
            lsr5r <= (fifo_write ? 0 : (lsr5r || (lsr5 && ~(lsr5_d))));
        end
    end
    reg lsr6_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr6_d <= 1;
        end
        else begin
            lsr6_d <= lsr6;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr6r <= 1;
        end
        else begin
            lsr6r <= (fifo_write ? 0 : (lsr6r || (lsr6 && ~(lsr6_d))));
        end
    end
    reg lsr7_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr7_d <= 0;
        end
        else begin
            lsr7_d <= lsr7;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            lsr7r <= 0;
        end
        else begin
            lsr7r <= (lsr_mask ? 0 : (lsr7r || (lsr7 && ~(lsr7_d))));
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            dlc <= 0;
        end
        else if ((start_dlc | ~(|(dlc)))) begin
            dlc <= (dl - 1);
        end
        else begin
            dlc <= (dlc - 1);
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            enable <= 1'b0;
        end
        else if ((|(dl) & ~(|(dlc)))) begin
            enable <= 1'b1;
        end
        else begin
            enable <= 1'b0;
        end
    end
    always @(lcr) begin
        case (lcr[3:0])
            4'b0: begin
                block_value = 95;
            end
            4'b100: begin
                block_value = 103;
            end
            4'b1, 4'b1000: begin
                block_value = 111;
            end
            4'b1100: begin
                block_value = 119;
            end
            4'b10, 4'b101, 4'b1001: begin
                block_value = 127;
            end
            4'b11, 4'b110, 4'b1010, 4'b1101: begin
                block_value = 143;
            end
            4'b111, 4'b1011, 4'b1110: begin
                block_value = 159;
            end
            4'b1111: begin
                block_value = 175;
            end
        endcase
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            block_cnt <= 8'd0;
        end
        else if ((lsr5r & fifo_write)) begin
            block_cnt <= block_value;
        end
        else if ((enable & (block_cnt != 8'd0))) begin
            block_cnt <= (block_cnt - 1);
        end
    end
    assign thre_set_en = ~(|(block_cnt));
    assign rls_int = (ier[2] && (((lsr[1] || lsr[2]) || lsr[3]) || lsr[4]));
    assign rda_int = (ier[0] && (rf_count >= {1'b0, trigger_level}));
    assign thre_int = (ier[1] && lsr[5]);
    assign ms_int = (ier[3] && |(msr[3:0]));
    assign ti_int = ((ier[0] && (counter_t == 10'd0)) && |(rf_count));
    reg rls_int_d;
    reg thre_int_d;
    reg ms_int_d;
    reg ti_int_d;
    reg rda_int_d;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rls_int_d <= 0;
        end
        else begin
            rls_int_d <= rls_int;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rda_int_d <= 0;
        end
        else begin
            rda_int_d <= rda_int;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            thre_int_d <= 0;
        end
        else begin
            thre_int_d <= thre_int;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ms_int_d <= 0;
        end
        else begin
            ms_int_d <= ms_int;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ti_int_d <= 0;
        end
        else begin
            ti_int_d <= ti_int;
        end
    end
    wire logic rls_int_rise;
    wire logic thre_int_rise;
    wire logic ms_int_rise;
    wire logic ti_int_rise;
    wire logic rda_int_rise;
    assign rda_int_rise = (rda_int & ~(rda_int_d));
    assign rls_int_rise = (rls_int & ~(1'b0));
    assign thre_int_rise = (thre_int & ~(thre_int_d));
    assign ms_int_rise = (ms_int & ~(ms_int_d));
    assign ti_int_rise = (ti_int & ~(ti_int_d));
    reg rls_int_pnd;
    reg rda_int_pnd;
    reg thre_int_pnd;
    reg ms_int_pnd;
    reg ti_int_pnd;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rls_int_pnd <= 0;
        end
        else begin
            rls_int_pnd <= (lsr_mask ? 0 : (rls_int_rise ? 1 : (rls_int_pnd && ier[2])));
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rda_int_pnd <= 0;
        end
        else begin
            rda_int_pnd <= (((rf_count == {1'b0, trigger_level}) && fifo_read) ? 0 : (rda_int_rise ? 1 : (rda_int_pnd && ier[0])));
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            thre_int_pnd <= 0;
        end
        else begin
            thre_int_pnd <= ((fifo_write || ((iir_read) & (iir[3:1] == 3'b1))) ? 0 : (thre_int_rise ? 1 : (thre_int_pnd && ier[1])));
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ms_int_pnd <= 0;
        end
        else begin
            ms_int_pnd <= (msr_read ? 0 : (ms_int_rise ? 1 : (ms_int_pnd && ier[3])));
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            ti_int_pnd <= 0;
        end
        else begin
            ti_int_pnd <= (fifo_read ? 0 : (ti_int_rise ? 1 : (ti_int_pnd && ier[0])));
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            int_o <= 1'b0;
        end
        else begin
            int_o <= (rls_int_pnd ? ~(lsr_mask) : (rda_int_pnd ? 1 : (ti_int_pnd ? ~(fifo_read) : (thre_int_pnd ? !((fifo_write & iir_read)) : (ms_int_pnd ? ~(msr_read) : 0)))));
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            iir <= 1;
        end
        else if (rls_int_pnd) begin
            iir[3:1] <= 3'b11;
            iir[0] <= 1'b0;
        end
        else if (rda_int) begin
            iir[3:1] <= 3'b10;
            iir[0] <= 1'b0;
        end
        else if (ti_int_pnd) begin
            iir[3:1] <= 3'b110;
            iir[0] <= 1'b0;
        end
        else if (thre_int_pnd) begin
            iir[3:1] <= 3'b1;
            iir[0] <= 1'b0;
        end
        else if (ms_int_pnd) begin
            iir[3:1] <= 3'b0;
            iir[0] <= 1'b0;
        end
        else begin
            iir[3:1] <= 0;
            iir[0] <= 1'b1;
        end
    end
endmodule