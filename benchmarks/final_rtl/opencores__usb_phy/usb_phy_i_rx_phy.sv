
module usb_phy_i_rx_phy (
    input logic clk,
    input logic rst,
    output reg fs_ce,
    input logic rxd,
    input logic rxdp,
    input logic rxdn,
    output logic RxValid_o,
    output logic RxActive_o,
    output logic RxError_o,
    output logic[7:0] DataIn_o,
    input logic RxEn_i,
    output logic[1:0] LineState
);
    reg rxd_s0;
    reg rxd_s1;
    reg rxd_s;
    reg rxdp_s0;
    reg rxdp_s1;
    reg rxdp_s;
    reg rxdp_s_r;
    reg rxdn_s0;
    reg rxdn_s1;
    reg rxdn_s;
    reg rxdn_s_r;
    reg synced_d;
    wire logic k;
    wire logic j;
    wire logic se0;
    reg rxd_r;
    reg rx_en;
    reg rx_active;
    reg[2:0] bit_cnt;
    reg rx_valid1;
    reg rx_valid;
    reg shift_en;
    reg sd_r;
    reg sd_nrzi;
    reg[7:0] hold_reg;
    wire logic drop_bit;
    reg[2:0] one_cnt;
    reg[1:0] dpll_state;
    reg[1:0] dpll_next_state;
    reg fs_ce_d;
    wire logic change;
    wire logic lock_en;
    reg[2:0] fs_state;
    reg[2:0] fs_next_state;
    reg rx_valid_r;
    reg sync_err_d;
    reg sync_err;
    reg bit_stuff_err;
    reg se0_r;
    reg byte_err;
    reg se0_s;
    assign RxActive_o = rx_active;
    assign RxValid_o = rx_valid;
    assign RxError_o = ((sync_err | bit_stuff_err) | byte_err);
    assign DataIn_o = hold_reg;
    assign LineState = {rxdn_s1, rxdp_s1};
    always @(posedge clk) begin
        rx_en <= RxEn_i;
    end
    always @(posedge clk) begin
        sync_err <= ( sync_err_d);
    end
    always @(posedge clk) begin
        rxd_s0 <= rxd;
    end
    always @(posedge clk) begin
        rxd_s1 <= rxd_s0;
    end
    always @(posedge clk) begin
        if ((rxd_s0 && rxd_s1)) begin
            rxd_s <= 1'b1;
        end
        else if ((!(rxd_s0) && !(rxd_s1))) begin
            rxd_s <= 1'b0;
        end
    end
    always @(posedge clk) begin
        rxdp_s0 <= rxdp;
    end
    always @(posedge clk) begin
        rxdp_s1 <= rxdp_s0;
    end
    always @(posedge clk) begin
        rxdp_s_r <= (rxdp_s0 & rxdp_s1);
    end
    always @(posedge clk) begin
        rxdp_s <= ((rxdp_s0 & rxdp_s1) | rxdp_s_r);
    end
    always @(posedge clk) begin
        rxdn_s0 <= rxdn;
    end
    always @(posedge clk) begin
        rxdn_s1 <= rxdn_s0;
    end
    always @(posedge clk) begin
        rxdn_s_r <= (rxdn_s0 & rxdn_s1);
    end
    always @(posedge clk) begin
        rxdn_s <= ((rxdn_s0 & rxdn_s1) | rxdn_s_r);
    end
    assign k = (!(rxdp_s));
    assign j = ( !(rxdn_s));
    assign se0 = (!(rxdp_s) & !(rxdn_s));
    always @(posedge clk) begin
        if (fs_ce) begin
            se0_s <= se0;
        end
    end
    assign lock_en = rx_en;
    always @(posedge clk) begin
        rxd_r <= rxd_s;
    end
    assign change = (rxd_r != rxd_s);
    always @(posedge clk) begin
        if (!(rst)) begin
            dpll_state <= 2'b1;
        end
        else begin
            dpll_state <= dpll_next_state;
        end
    end
    always @(dpll_state or lock_en or change) begin
        fs_ce_d = 1'b0;
        case (dpll_state)  // synopsys full_case parallel_case
            2'b0: begin
                if ((lock_en && change)) begin
                    dpll_next_state = 2'b0;
                end
                else begin
                    dpll_next_state = 2'b1;
                end
            end
            2'b1: begin
                fs_ce_d = 1'b1;
                if ((lock_en && change)) begin
                    dpll_next_state = 2'b11;
                end
                else begin
                    dpll_next_state = 2'b10;
                end
            end
            2'b10: begin
                if ((lock_en && change)) begin
                    dpll_next_state = 2'b0;
                end
                else begin
                    dpll_next_state = 2'b11;
                end
            end
            2'b11: begin begin
                    dpll_next_state = 2'b0;
                end
            end
        endcase
    end
    reg fs_ce_r1;
    reg fs_ce_r2;
    always @(posedge clk) begin
        fs_ce_r1 <= fs_ce_d;
    end
    always @(posedge clk) begin
        fs_ce_r2 <= fs_ce_r1;
    end
    always @(posedge clk) begin
        fs_ce <= fs_ce_r2;
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            fs_state <= 3'b0;
        end
        else begin
            fs_state <= fs_next_state;
        end
    end
    always @(fs_state or fs_ce or k or j or rx_en or rx_active or se0 or se0_s) begin
        synced_d = 1'b0;
        sync_err_d = 1'b0;
        fs_next_state = fs_state;
        if ((((fs_ce && !(rx_active)) && !(se0)) && !(se0_s))) begin
            case (fs_state)  // synopsys full_case parallel_case
                3'b0: begin
                    if ((k && rx_en)) begin
                        fs_next_state = 3'b1;
                    end
                end
                3'b1: begin
                    if ((j && rx_en)) begin
                        fs_next_state = 3'b10;
                    end
                    else begin
                        sync_err_d = 1'b1;
                        fs_next_state = 3'b0;
                    end
                end
                3'b10: begin
                    if ((k && rx_en)) begin
                        fs_next_state = 3'b11;
                    end
                    else begin
                        sync_err_d = 1'b1;
                        fs_next_state = 3'b0;
                    end
                end
                3'b11: begin
                    if ((j && rx_en)) begin
                        fs_next_state = 3'b100;
                    end
                    else begin
                        sync_err_d = 1'b1;
                        fs_next_state = 3'b0;
                    end
                end
                3'b100: begin
                    if ((k && rx_en)) begin
                        fs_next_state = 3'b101;
                    end
                    else begin
                        sync_err_d = 1'b1;
                        fs_next_state = 3'b0;
                    end
                end
                3'b101: begin
                    if ((j && rx_en)) begin
                        fs_next_state = 3'b110;
                    end
                    else if ((k && rx_en)) begin
                        fs_next_state = 3'b0;
                        synced_d = 1'b1;
                    end
                    else begin
                        sync_err_d = 1'b1;
                        fs_next_state = 3'b0;
                    end
                end
                3'b110: begin
                    if ((k && rx_en)) begin
                        fs_next_state = 3'b111;
                    end
                    else begin
                        sync_err_d = 1'b1;
                        fs_next_state = 3'b0;
                    end
                end
                3'b111: begin
                    if (k) begin
                        synced_d = 1'b1;
                    end
                    fs_next_state = 3'b0;
                end
            endcase
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            rx_active <= 1'b0;
        end
        else if ((synced_d && rx_en)) begin
            rx_active <= 1'b1;
        end
        else if ((se0 && rx_valid_r)) begin
            rx_active <= 1'b0;
        end
    end
    always @(posedge clk) begin
        if (rx_valid) begin
            rx_valid_r <= 1'b1;
        end
        else if (fs_ce) begin
            rx_valid_r <= 1'b0;
        end
    end
    always @(posedge clk) begin
        if (fs_ce) begin
            sd_r <= rxd_s;
        end
    end
    always @(posedge clk) begin if (!(rx_active)) begin
            sd_nrzi <= 1'b1;
        end
        else if (( fs_ce)) begin
            sd_nrzi <= !((rxd_s ^ sd_r));
        end
    end
    always @(posedge clk) begin if (!(shift_en)) begin
            one_cnt <= 3'b0;
        end
        else if (fs_ce) begin
            if ((!(sd_nrzi) || drop_bit)) begin
                one_cnt <= 3'b0;
            end
            else begin
                one_cnt <= (one_cnt + 3'b1);
            end
        end
    end
    assign drop_bit = (one_cnt == 3'b110);
    always @(posedge clk) begin
        bit_stuff_err <= ((((drop_bit & sd_nrzi) & fs_ce) & !(se0)) & rx_active);
    end
    always @(posedge clk) begin
        if (fs_ce) begin
            shift_en <= (synced_d | rx_active);
        end
    end
    always @(posedge clk) begin
        if (((fs_ce && shift_en) && !(drop_bit))) begin
            hold_reg <= {sd_nrzi, hold_reg[7:1]};
        end
    end
    always @(posedge clk) begin if (!(shift_en)) begin
            bit_cnt <= 3'b0;
        end
        else if ((fs_ce && !(drop_bit))) begin
            bit_cnt <= (bit_cnt + 3'b1);
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            rx_valid1 <= 1'b0;
        end
        else if (((fs_ce && !(drop_bit)) && (bit_cnt == 3'b111))) begin
            rx_valid1 <= 1'b1;
        end
        else if ((( fs_ce) && !(drop_bit))) begin
            rx_valid1 <= 1'b0;
        end
    end
    always @(posedge clk) begin
        rx_valid <= ((!(drop_bit) & rx_valid1) & fs_ce);
    end
    always @(posedge clk) begin
        se0_r <= se0;
    end
    always @(posedge clk) begin
        byte_err <= (((se0 & !(se0_r)) & |(bit_cnt[2:1])) & rx_active);
    end
endmodule