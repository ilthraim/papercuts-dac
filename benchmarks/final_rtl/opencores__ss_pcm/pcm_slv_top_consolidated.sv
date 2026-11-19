module pcm_slv_top (
    input logic clk,
    input logic rst,
    input logic[2:0] ssel,
    input logic pcm_clk_i,
    input logic pcm_sync_i,
    input logic pcm_din_i,
    output logic pcm_dout_o,
    input logic[7:0] din_i,
    output logic[7:0] dout_o,
    input logic re_i,
    input logic[1:0] we_i
);
    reg pclk_t;
    reg pclk_s;
    reg pclk_r;
    wire logic pclk_ris;
    wire logic pclk_fal;
    reg psync;
    reg pcm_sync_r1;
    reg pcm_sync_r2;
    reg pcm_sync_r3;
    reg tx_go;
    wire logic tx_data_le;
    reg[15:0] tx_hold_reg;
    reg[7:0] tx_hold_byte_h;
    reg[7:0] tx_hold_byte_l;
    reg[3:0] tx_cnt;
    wire logic tx_done;
    reg[15:0] rx_hold_reg;
    reg[15:0] rx_reg;
    wire logic rx_data_le;
    reg rxd_t;
    reg rxd;
    reg tx_go_r1;
    reg[7:0] psa;
    always @(posedge clk) begin
        pclk_t <= pcm_clk_i;
    end
    always @(posedge clk) begin
        pclk_s <= pclk_t;
    end
    always @(posedge clk) begin
        pclk_r <= pclk_s;
    end
    assign pclk_ris = (!(pclk_r) & pclk_s);
    assign pclk_fal = (pclk_r & !(pclk_s));
    always @(posedge clk) begin
        if (pclk_fal) begin
            pcm_sync_r1 <= pcm_sync_i;
        end
    end
    always @(posedge clk) begin
        if (pclk_ris) begin
            psa <= {psa[6:0], pcm_sync_r1};
        end
    end
    always @(posedge clk) begin
        pcm_sync_r2 <= psa[ssel];
    end
    always @(posedge clk) begin
        pcm_sync_r3 <= pcm_sync_r2;
    end
    always @(posedge clk) begin
        psync <= (!(pcm_sync_r3) & pcm_sync_r2);
    end
    assign tx_data_le = (tx_go & pclk_ris);
    always @(posedge clk) begin
        if (we_i[1]) begin
            tx_hold_byte_h <= din_i;
        end
    end
    always @(posedge clk) begin
        if (we_i[0]) begin
            tx_hold_byte_l <= din_i;
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            tx_go <= 1'b0;
        end
        else if (psync) begin
            tx_go <= 1'b1;
        end
        else if (tx_done) begin
            tx_go <= 1'b0;
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            tx_hold_reg <= 16'd0;
        end
        else if (psync) begin
            tx_hold_reg <= {tx_hold_byte_h, tx_hold_byte_l};
        end
        else if (tx_data_le) begin
            tx_hold_reg <= {tx_hold_reg[14:0], 1'b0};
        end
    end
    assign pcm_dout_o = tx_hold_reg[15];
    always @(posedge clk) begin
        if (!(rst)) begin
            tx_cnt <= 4'b0;
        end
        else if (tx_data_le) begin
            tx_cnt <= (tx_cnt + 4'b1);
        end
    end
    assign tx_done = ((tx_cnt == 4'b1111) & tx_data_le);
    always @(posedge clk) begin
        if (pclk_ris) begin
            tx_go_r1 <= tx_go;
        end
    end
    always @(posedge clk) begin
        if (pclk_fal) begin
            rxd_t <= pcm_din_i;
        end
    end
    always @(posedge clk) begin
        rxd <= rxd_t;
    end
    assign rx_data_le = ((tx_go_r1) & pclk_fal);
    always @(posedge clk) begin
        if (!(rst)) begin
            rx_hold_reg <= 16'd0;
        end
        else if (rx_data_le) begin
            rx_hold_reg <= {rx_hold_reg[14:0], rxd};
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            rx_reg <= 16'd0;
        end
        else if ((( !(tx_go)) & pclk_ris)) begin
            rx_reg <= rx_hold_reg;
        end
    end
    assign dout_o = (re_i ? rx_reg[15:8] : rx_reg[7:0]);
endmodule