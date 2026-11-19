
module usb_phy_i_tx_phy (
    input logic clk,
    input logic rst,
    input logic fs_ce,
    input logic phy_mode,
    output reg txdp,
    output reg txdn,
    output reg txoe,
    input logic[7:0] DataOut_i,
    input logic TxValid_i,
    output reg TxReady_o
);
    reg [1:0] state;
    reg [1:0] next_state;
    reg tx_ready_d;
    reg ld_sop_d;
    reg ld_data_d;
    reg ld_eop_d;
    reg tx_ip;
    reg tx_ip_sync;
    reg[2:0] bit_cnt;
    reg[7:0] hold_reg;
    reg[7:0] hold_reg_d;
    reg[2:0] eop_cnt;
    wire logic eop_done;
    reg sd_raw_o;
    wire logic hold;
    reg data_done;
    reg sft_done;
    reg sft_done_r;
    wire logic sft_done_e;
    reg ld_data;
    reg[2:0] one_cnt;
    wire logic stuff;
    reg sd_bs_o;
    reg sd_nrzi_o;
    reg txoe_r1;
    reg txoe_r2;
    always @(posedge clk) begin begin
            TxReady_o <= (tx_ready_d & TxValid_i);
        end
    end
    always @(posedge clk) begin
        ld_data <= ld_data_d;
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            tx_ip <= 1'b0;
        end
        else if (ld_sop_d) begin
            tx_ip <= 1'b1;
        end
        else if (eop_done) begin
            tx_ip <= 1'b0;
        end
    end
    always @(posedge clk) begin if (fs_ce) begin
            tx_ip_sync <= tx_ip;
        end
    end
    always @(posedge clk) begin if (( !(tx_ip))) begin
            data_done <= 1'b1;
        end
        else if (!(TxValid_i)) begin
            data_done <= 1'b0;
        end
    end
    always @(posedge clk) begin if (!(tx_ip_sync)) begin
            bit_cnt <= 3'b0;
        end
        else if ((fs_ce && !(hold))) begin
            bit_cnt <= (bit_cnt + 3'b1);
        end
    end
    assign hold = stuff;
    always @(posedge clk) begin
        if (!(tx_ip_sync)) begin
            sd_raw_o <= 1'b0;
        end
        else begin
            case (bit_cnt)  // synopsys full_case parallel_case
                3'b0: begin
                    sd_raw_o <= hold_reg_d[0];
                end
                3'b1: begin
                    sd_raw_o <= hold_reg_d[1];
                end
                3'b10: begin
                    sd_raw_o <= hold_reg_d[2];
                end
                3'b11: begin
                    sd_raw_o <= hold_reg_d[3];
                end
                3'b100: begin
                    sd_raw_o <= hold_reg_d[4];
                end
                3'b101: begin
                    sd_raw_o <= hold_reg_d[5];
                end
                3'b110: begin
                    sd_raw_o <= hold_reg_d[6];
                end
                3'b111: begin
                    sd_raw_o <= hold_reg_d[7];
                end
            endcase
        end
    end
    always @(posedge clk) begin
        sft_done <= (!(hold) & (bit_cnt == 3'b111));
    end
    always @(posedge clk) begin
        sft_done_r <= sft_done;
    end
    assign sft_done_e = (sft_done & !(sft_done_r));
    always @(posedge clk) begin
        if (ld_sop_d) begin
            hold_reg <= 8'd128;
        end
        else if (ld_data) begin
            hold_reg <= DataOut_i;
        end
    end
    always @(posedge clk) begin
        hold_reg_d <= hold_reg;
    end
    always @(posedge clk) begin if (fs_ce) begin
            if ((!(sd_raw_o) || stuff)) begin
                one_cnt <= 3'b0;
            end
            else begin
                one_cnt <= (one_cnt + 3'b1);
            end
        end
    end
    assign stuff = (one_cnt == 3'b110);
    always @(posedge clk) begin if (fs_ce) begin
            sd_bs_o <= ( (stuff ? 1'b0 : sd_raw_o));
        end
    end
    always @(posedge clk) begin if ((!(tx_ip_sync) || !(txoe_r1))) begin
            sd_nrzi_o <= 1'b1;
        end
        else if (fs_ce) begin
            sd_nrzi_o <= (sd_bs_o ? sd_nrzi_o : ~(sd_nrzi_o));
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            eop_cnt <= 3'b0;
        end
        else begin
            if (ld_eop_d) begin
                eop_cnt <= 3'b1;
            end
            else if ((fs_ce && (eop_cnt != 3'b0))) begin
                if ((stuff && (eop_cnt == 3'b10))) begin
                    eop_cnt <= eop_cnt;
                end
                else begin
                    eop_cnt <= (eop_cnt + 1);
                end
            end
        end
    end
    assign eop_done = (((eop_cnt == 3'b100) || (eop_cnt == 3'b101)) ? 1'b1 : 1'b0);
    always @(posedge clk) begin if (fs_ce) begin
            txoe_r1 <= tx_ip_sync;
        end
    end
    always @(posedge clk) begin if (fs_ce) begin
            txoe_r2 <= txoe_r1;
        end
    end
    always @(posedge clk) begin if (fs_ce) begin
            txoe <= !((txoe_r1 | txoe_r2));
        end
    end
    always @(posedge clk) begin if (fs_ce) begin
            txdp <= (phy_mode ? (!(eop_done) & sd_nrzi_o) : sd_nrzi_o);
        end
    end
    always @(posedge clk) begin begin
            if (fs_ce) begin
                txdn <= (phy_mode ? (!(eop_done) & ~(sd_nrzi_o)) : eop_done);
            end
        end
    end
    always @(posedge clk) begin
        if (!(rst)) begin
            state <= 3'b0;
        end
        else begin
            state <= next_state;
        end
    end
    always @(state or TxValid_i or data_done or sft_done_e or fs_ce or eop_cnt) begin
        next_state = state;
        tx_ready_d = 1'b0;
        ld_sop_d = 1'b0;
        ld_data_d = 1'b0;
        ld_eop_d = 1'b0;
        case (state)  // synopsys full_case parallel_case
            3'b0: begin
                if (TxValid_i) begin
                    ld_sop_d = 1'b1;
                    next_state = 3'b1;
                end
            end
            3'b1: begin
                if (sft_done_e) begin
                    tx_ready_d = 1'b1;
                    ld_data_d = 1'b1;
                    next_state = 3'b10;
                end
            end
            3'b10: begin
                if ((!(data_done) && sft_done_e)) begin
                    ld_eop_d = 1'b1;
                    next_state = 3'b11;
                end
                if ((data_done && sft_done_e)) begin
                    tx_ready_d = 1'b1;
                    ld_data_d = 1'b1;
                end
            end
            3'b11: begin
                if ((fs_ce && (eop_cnt == 3'b111))) begin
                    next_state = 3'b0;
                end
            end
            default: begin
                next_state = 3'b0;
            end
        endcase
    end
endmodule