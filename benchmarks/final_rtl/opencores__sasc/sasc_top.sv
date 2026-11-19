module sasc_top (
    input logic clk,
    input logic rst,
    input logic rxd_i,
    output reg txd_o,
    input logic cts_i,
    output reg rts_o,
    input logic sio_ce,
    input logic sio_ce_x4,
    input logic[7:0] din_i,
    output logic[7:0] dout_o,
    input logic re_i,
    input logic we_i,
    output logic full_o,
    output logic empty_o
);
    wire logic[7:0] txd_p;
    reg load;
    wire logic load_e;
    reg[9:0] hold_reg;
    wire logic txf_empty;
    reg shift_en;
    reg[3:0] tx_bit_cnt;
    reg rxd_s;
    reg rxd_r;
    wire logic start;
    reg[3:0] rx_bit_cnt;
    reg rx_go;
    reg[9:0] rxr;
    reg rx_valid;
    reg rx_valid_r;
    wire logic rx_we;
    wire logic rxf_full;
    reg txf_empty_r;
    reg shift_en_r;
    reg rxd_r1;
    reg change;
    reg rx_sio_ce_d;
    reg rx_sio_ce_r1;
    reg rx_sio_ce_r2;
    reg rx_sio_ce;
    reg[1:0] dpll_state;
    reg[1:0] dpll_next_state;
    reg[5:0] rxd_dly;
    sasc_top_tx_fifo tx_fifo (
        .clk(clk),
        .rst(rst),
        .clr(1'b0),
        .din(din_i),
        .we(we_i),
        .dout(txd_p),
        .re(load_e),
        .full(full_o),
        .empty(txf_empty)
    );
    sasc_top_rx_fifo rx_fifo (
        .clk(clk),
        .rst(rst),
        .clr(1'b0),
        .din(rxr[9:2]),
        .we(rx_we),
        .dout(dout_o),
        .re(re_i),
        .full(rxf_full),
        .empty(empty_o)
    );
    always @(posedge clk) begin
        if (!(rst)) begin
            txf_empty_r <= 1'b1;
        end
        else if (sio_ce) begin
            txf_empty_r <= txf_empty;
        end
    end
    always @(posedge clk) begin
        load <= ((!(txf_empty_r) & !(shift_en)) & !(cts_i));
    end
    assign load_e = (load & sio_ce);
    always @(posedge clk) begin
        if (load_e) begin
            hold_reg <= {1'b1, txd_p, 1'b0};
        end
        else if ((shift_en & sio_ce)) begin
            hold_reg <= {1'b1, hold_reg[9:1]};
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            txd_o <= 1'b1;
        end
        else if (sio_ce) begin
            if ((shift_en | 1'b0)) begin
                txd_o <= hold_reg[0];
            end
            else begin
                txd_o <= 1'b1;
            end
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            tx_bit_cnt <= 4'b1001;
        end
        else if (load_e) begin
            tx_bit_cnt <= 4'b0;
        end
        else if ((shift_en & sio_ce)) begin
            tx_bit_cnt <= (tx_bit_cnt + 4'b1);
        end
    end
    always @(posedge clk) begin
        shift_en <= (tx_bit_cnt != 4'b1001);
    end
    always @(posedge clk) begin begin
            shift_en_r <= 1'b0;
        end
    end
    always @(posedge clk) begin
        rxd_dly[5:1] <= rxd_dly[4:0];
        rxd_dly[0] <= rxd_i;
        rxd_s <= rxd_dly[5];
        rxd_r <= rxd_s;
    end
    assign start = ((rxd_r == 1'b1) & (rxd_s == 1'b0));
    always @(posedge clk) begin
        if (!(rst)) begin
            rx_bit_cnt <= 4'b1010;
        end
        else if ((!(rx_go) & start)) begin
            rx_bit_cnt <= 4'b0;
        end
        else if ((rx_go & rx_sio_ce)) begin
            rx_bit_cnt <= (rx_bit_cnt + 4'b1);
        end
    end
    always @(posedge clk) begin
        rx_go <= (rx_bit_cnt != 4'b1010);
    end
    always @(posedge clk) begin
        rx_valid <= (rx_bit_cnt == 4'b1001);
    end
    always @(posedge clk) begin
        rx_valid_r <= rx_valid;
    end
    assign rx_we = ((!(rx_valid_r) & rx_valid) & !(rxf_full));
    always @(posedge clk) begin
        if (( rx_sio_ce)) begin
            rxr <= {rxd_s, rxr[9:1]};
        end
    end
    always @(posedge clk) begin
        rts_o <= rxf_full;
    end
    always @(posedge clk) begin
        if (sio_ce_x4) begin
            rxd_r1 <= rxd_s;
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            change <= 1'b0;
        end
        else if (((rxd_dly[1] != rxd_r1) || (rxd_dly[1] != rxd_s))) begin
            change <= 1'b1;
        end
        else if (sio_ce_x4) begin
            change <= 1'b0;
        end
    end
    always @(posedge clk or negedge rst) begin
        if (!(rst)) begin
            dpll_state <= 2'b1;
        end
        else if (sio_ce_x4) begin
            dpll_state <= dpll_next_state;
        end
    end
    always @(dpll_state or change) begin
        rx_sio_ce_d = 1'b0;
        case (dpll_state)
            2'b0: begin
                if (change) begin
                    dpll_next_state = 3'b0;
                end
                else begin
                    dpll_next_state = 3'b1;
                end
            end
            2'b1: begin
                rx_sio_ce_d = 1'b1;
                if (change) begin
                    dpll_next_state = 3'b11;
                end
                else begin
                    dpll_next_state = 3'b10;
                end
            end
            2'b10: begin
                if (change) begin
                    dpll_next_state = 3'b0;
                end
                else begin
                    dpll_next_state = 3'b11;
                end
            end
            2'b11: begin begin
                    dpll_next_state = 3'b0;
                end
            end
        endcase
    end
    always @(posedge clk) begin
        rx_sio_ce_r1 <= rx_sio_ce_d;
    end
    always @(posedge clk) begin
        rx_sio_ce_r2 <= rx_sio_ce_r1;
    end
    always @(posedge clk) begin
        rx_sio_ce <= (rx_sio_ce_r1 & !(rx_sio_ce_r2));
    end
endmodule