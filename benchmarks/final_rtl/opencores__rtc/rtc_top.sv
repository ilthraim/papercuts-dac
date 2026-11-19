module rtc_top (
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
    input logic clk_rtc_pad_i
);
    reg[3:0] time_tos;
    reg[3:0] time_s;
    reg[2:0] time_ts;
    reg[3:0] time_m;
    reg[2:0] time_tm;
    reg[3:0] time_h;
    reg[1:0] time_th;
    reg[2:0] time_dow;
    reg[3:0] date_d;
    reg[1:0] date_td;
    reg[3:0] date_m;
    reg date_tm;
    reg[3:0] date_y;
    reg[3:0] date_ty;
    reg[3:0] date_c;
    reg[3:0] date_tc;
    reg[26:0] cntr_div;
    reg div_clk;
    reg[31:0] rrtc_talrm;
    reg[30:0] rrtc_dalrm;
    reg[31:0] rrtc_ctrl;
    wire logic [26:0] rrtc_time;
    wire logic [26:0] rrtc_date;
    wire logic rrtc_time_sel;
    wire logic rrtc_date_sel;
    wire logic rrtc_talrm_sel;
    wire logic rrtc_dalrm_sel;
    wire logic rrtc_ctrl_sel;
    wire logic match_tos;
    wire logic match_secs;
    wire logic match_mins;
    wire logic match_hrs;
    wire logic match_dow;
    wire logic match_days;
    wire logic match_months;
    wire logic match_yrs;
    wire logic match_cents;
    wire logic rst_time_tos;
    wire logic rst_time_s;
    wire logic rst_time_ts;
    wire logic rst_time_m;
    wire logic rst_time_tm;
    wire logic rst_time_h;
    wire logic rst_time_th;
    wire logic rst_time_dow;
    wire logic rst_date_d;
    wire logic rst_date_td;
    wire logic rst_date_m;
    wire logic rst_date_tm;
    wire logic rst_date_y;
    wire logic rst_date_ty;
    wire logic rst_date_c;
    wire logic rst_date_tc;
    wire logic inc_time_tos;
    wire logic inc_time_s;
    wire logic inc_time_ts;
    wire logic inc_time_m;
    wire logic inc_time_tm;
    wire logic inc_time_h;
    wire logic inc_time_th;
    wire logic inc_time_dow;
    wire logic inc_date_d;
    wire logic inc_date_td;
    wire logic inc_date_m;
    wire logic inc_date_tm;
    wire logic inc_date_y;
    wire logic inc_date_ty;
    wire logic inc_date_c;
    wire logic inc_date_tc;
    wire logic one_date_d;
    wire logic one_date_m;
    wire logic hi_clk;
    wire logic lo_clk;
    wire logic alarm;
    wire logic leapyear;
    wire logic full_decoding;
    assign wb_ack_o = ((wb_cyc_i & wb_stb_i) & !(wb_err_o));
    assign wb_err_o = ((wb_cyc_i & wb_stb_i) & (!(full_decoding) | (wb_sel_i != 4'b1111)));
    assign hi_clk = (rrtc_ctrl[28] ? clk_rtc_pad_i : wb_clk_i);
    assign lo_clk = (rrtc_ctrl[31] ? div_clk : wb_clk_i);
    assign full_decoding = ((wb_adr_i[15:5] == 11'd0) & (wb_adr_i[1:0] == 2'b0));
    assign rrtc_time_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 3'b0)) & full_decoding);
    assign rrtc_date_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 3'b1)) & full_decoding);
    assign rrtc_talrm_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 3'b10)) & full_decoding);
    assign rrtc_dalrm_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 3'b11)) & full_decoding);
    assign rrtc_ctrl_sel = (((wb_cyc_i & wb_stb_i) & (wb_adr_i[4:2] == 3'b100)) & full_decoding);
    assign rrtc_time = {5'b0, time_dow, time_th, time_h, time_tm, time_m, time_ts, time_s, time_tos};
    assign rrtc_date = {5'b0, date_tc, date_c, date_ty, date_y, date_tm, date_m, date_td, date_d};
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rrtc_ctrl <= 32'd0;
        end
        else if ((rrtc_ctrl_sel && wb_we_i)) begin
            rrtc_ctrl <= wb_dat_i;
        end
        else if (rrtc_ctrl[31]) begin
            rrtc_ctrl[30] <= (rrtc_ctrl[30] | alarm);
        end
    end
    always @(posedge hi_clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            cntr_div <= 27'd0;
            div_clk <= 1'b0;
        end
        else if (!(cntr_div)) begin
            cntr_div <= rrtc_ctrl[26:0];
            div_clk <= ~(div_clk);
        end
        else if (rrtc_ctrl[31]) begin
            cntr_div <= (cntr_div - 1);
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rrtc_talrm <= 32'd0;
        end
        else if ((rrtc_talrm_sel && wb_we_i)) begin
            rrtc_talrm <= wb_dat_i;
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rrtc_dalrm <= 31'd0;
        end
        else if ((rrtc_dalrm_sel && wb_we_i)) begin
            rrtc_dalrm <= wb_dat_i[30:0];
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_tos <= wb_dat_i[3:0];
        end
        else if (rst_time_tos) begin
            time_tos <= 4'b0;
        end
        else if (inc_time_tos) begin
            time_tos <= (time_tos + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_s <= wb_dat_i[7:4];
        end
        else if (rst_time_s) begin
            time_s <= 4'b0;
        end
        else if (inc_time_s) begin
            time_s <= (time_s + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_ts <= wb_dat_i[10:8];
        end
        else if (rst_time_ts) begin
            time_ts <= 3'b0;
        end
        else if (inc_time_ts) begin
            time_ts <= (time_ts + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_m <= wb_dat_i[14:11];
        end
        else if (rst_time_m) begin
            time_m <= 4'b0;
        end
        else if (inc_time_m) begin
            time_m <= (time_m + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_tm <= wb_dat_i[17:15];
        end
        else if (rst_time_tm) begin
            time_tm <= 3'b0;
        end
        else if (inc_time_tm) begin
            time_tm <= (time_tm + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_h <= wb_dat_i[21:18];
        end
        else if (rst_time_h) begin
            time_h <= 4'b0;
        end
        else if (inc_time_h) begin
            time_h <= (time_h + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_th <= wb_dat_i[23:22];
        end
        else if (rst_time_th) begin
            time_th <= 2'b0;
        end
        else if (inc_time_th) begin
            time_th <= (time_th + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_time_sel && wb_we_i)) begin
            time_dow <= wb_dat_i[26:24];
        end
        else if (rst_time_dow) begin
            time_dow <= 3'b1;
        end
        else if (inc_time_dow) begin
            time_dow <= (time_dow + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_d <= wb_dat_i[3:0];
        end
        else if (one_date_d) begin
            date_d <= 4'b1;
        end
        else if (rst_date_d) begin
            date_d <= 4'b0;
        end
        else if (inc_date_d) begin
            date_d <= (date_d + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_td <= wb_dat_i[5:4];
        end
        else if (rst_date_td) begin
            date_td <= 2'b0;
        end
        else if (inc_date_td) begin
            date_td <= (date_td + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_m <= wb_dat_i[9:6];
        end
        else if (one_date_m) begin
            date_m <= 4'b1;
        end
        else if (rst_date_m) begin
            date_m <= 4'b0;
        end
        else if (inc_date_m) begin
            date_m <= (date_m + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_tm <= wb_dat_i[10];
        end
        else if (rst_date_tm) begin
            date_tm <= 1'b0;
        end
        else if (inc_date_tm) begin
            date_tm <= (date_tm + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_y <= wb_dat_i[14:11];
        end
        else if (rst_date_y) begin
            date_y <= 4'b0;
        end
        else if (inc_date_y) begin
            date_y <= (date_y + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_ty <= wb_dat_i[18:15];
        end
        else if (rst_date_ty) begin
            date_ty <= 4'b0;
        end
        else if (inc_date_ty) begin
            date_ty <= (date_ty + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_c <= wb_dat_i[22:19];
        end
        else if (rst_date_c) begin
            date_c <= 4'b0;
        end
        else if (inc_date_c) begin
            date_c <= (date_c + 1);
        end
    end
    always @(posedge lo_clk) begin
        if ((rrtc_date_sel && wb_we_i)) begin
            date_tc <= wb_dat_i[26:23];
        end
        else if (rst_date_tc) begin
            date_tc <= 4'b0;
        end
        else if (inc_date_tc) begin
            date_tc <= (date_tc + 1);
        end
    end
    always @(wb_adr_i or rrtc_time or rrtc_date or rrtc_talrm or rrtc_dalrm or rrtc_ctrl) begin
        case (wb_adr_i[4:2])  // synopsys full_case parallel_case
            3'b0: begin
                wb_dat_o[31:0] <= {5'b0, rrtc_time};
            end
            3'b1: begin
                wb_dat_o[31:0] <= {5'b0, rrtc_date};
            end
            3'b10: begin
                wb_dat_o[31:0] <= rrtc_talrm;
            end
            3'b11: begin
                wb_dat_o[31:0] <= {1'b0, rrtc_dalrm};
            end
            default: begin
                wb_dat_o <= rrtc_ctrl;
            end
        endcase
    end
    assign match_tos = (time_tos == rrtc_talrm[3:0]);
    assign match_secs = ((time_s == rrtc_talrm[7:4]) & (time_ts == rrtc_talrm[10:8]));
    assign match_mins = ((time_m == rrtc_talrm[14:11]) & (time_tm == rrtc_talrm[17:15]));
    assign match_hrs = ((time_h == rrtc_talrm[21:18]) & (time_th == rrtc_talrm[23:22]));
    assign match_dow = (time_dow == rrtc_talrm[26:24]);
    assign match_days = ((date_d == rrtc_dalrm[3:0]) & (date_td == rrtc_dalrm[5:4]));
    assign match_months = ((date_m == rrtc_dalrm[9:6]) & (date_tm == rrtc_dalrm[10]));
    assign match_yrs = ((date_y == rrtc_dalrm[14:11]) & (date_ty == rrtc_dalrm[18:15]));
    assign match_cents = ((date_c == rrtc_dalrm[22:19]) & (date_tc == rrtc_dalrm[26:23]));
    assign alarm = ((((((((((match_tos | ~(rrtc_talrm[27])) & (match_secs | ~(rrtc_talrm[28]))) & (match_mins | ~(rrtc_talrm[29]))) & (match_hrs | ~(rrtc_talrm[30]))) & (match_dow | ~(rrtc_talrm[31]))) & (match_days | ~(rrtc_dalrm[27]))) & (match_months | ~(rrtc_dalrm[28]))) & (match_yrs | ~(rrtc_dalrm[29]))) & (match_cents | ~(rrtc_dalrm[30]))) & ((((((((rrtc_talrm[27] | rrtc_talrm[28]) | rrtc_talrm[29]) | rrtc_talrm[30]) | rrtc_talrm[31]) | rrtc_dalrm[27]) | rrtc_dalrm[28]) | rrtc_dalrm[29]) | rrtc_dalrm[30]));
    assign wb_inta_o = (rrtc_ctrl[30] & rrtc_ctrl[29]);
    assign rst_time_tos = (((time_tos == 4'b1001) | rrtc_ctrl[27]));
    assign rst_time_s = (((time_s == 4'b1001) & rst_time_tos));
    assign rst_time_ts = (((time_ts == 3'b101) & rst_time_s));
    assign rst_time_m = (((time_m == 4'b1001) & rst_time_ts));
    assign rst_time_tm = (((time_tm == 3'b101) & rst_time_m));
    assign rst_time_h = ((((time_h == 4'b1001) & rst_time_tm) | (((time_th == 2'b10) & (time_h == 4'b11)) & rst_time_tm)));
    assign rst_time_th = (((time_th == 2'b10) & rst_time_h));
    assign rst_time_dow = (((time_dow == 3'b111) & rst_time_th));
    assign one_date_d = ((((((((((((((((({date_tm, date_m} == 8'd1) & (date_td == 2'b11)) & (date_d == 4'b1)) | (((({date_tm, date_m} == 8'd2) & (date_td == 2'b10)) & (date_d == 4'b1000)) & ~(leapyear))) | (((({date_tm, date_m} == 8'd2) & (date_td == 2'b10)) & (date_d == 4'b1001)) & leapyear)) | ((({date_tm, date_m} == 8'd3) & (date_td == 2'b11)) & (date_d == 4'b1))) | ((({date_tm, date_m} == 8'd4)) & (date_d == 4'b0))) | ((({date_tm, date_m} == 8'd5) & (date_td == 2'b11)) & (date_d == 4'b1))) | ((({date_tm, date_m} == 8'd6)) & (date_d == 4'b0))) | ((({date_tm, date_m} == 8'd7) & (date_td == 2'b11)) & (date_d == 4'b1))) | ((({date_tm, date_m} == 8'd8) & (date_td == 2'b11)) & (date_d == 4'b1))) | ((({date_tm, date_m} == 8'd9)) & (date_d == 4'b0))) | ((({date_tm, date_m} == 8'd16) & (date_td == 2'b11)) & (date_d == 4'b1))) | ((({date_tm, date_m} == 8'd17)) & (date_d == 4'b0))) | ((({date_tm, date_m} == 8'd18) & (date_td == 2'b11)) & (date_d == 4'b1))) & rst_time_th));
    assign rst_date_d = ((date_d == 4'b1001) & rst_time_th);
    assign rst_date_td = ((((({date_tm, date_m} == 8'd2) & date_td[1]) | (date_td == 2'b11)) & (rst_date_d | one_date_d)));
    assign one_date_m = (((date_tm & (date_m == 4'b10)) & rst_date_td));
    assign rst_date_m = ((~(date_tm) & (date_m == 4'b1001)) & rst_date_td);
    assign rst_date_tm = ((date_tm & ( one_date_m)));
    assign rst_date_y = (((date_y == 4'b1001) & rst_date_tm));
    assign rst_date_ty = (((date_ty == 4'b1001) & rst_date_y));
    assign rst_date_c = (((date_c == 4'b1001) & rst_date_ty));
    assign rst_date_tc = (((date_tc == 4'b1001) & rst_date_c));
    assign inc_time_tos = (rrtc_ctrl[31]);
    assign inc_time_s = (rst_time_tos);
    assign inc_time_ts = rst_time_s;
    assign inc_time_m = rst_time_ts;
    assign inc_time_tm = rst_time_m;
    assign inc_time_h = rst_time_tm;
    assign inc_time_th = rst_time_h;
    assign inc_time_dow = rst_time_th;
    assign inc_date_d = rst_time_th;
    assign inc_date_td = rst_date_d;
    assign inc_date_m = rst_date_td;
    assign inc_date_tm = rst_date_m;
    assign inc_date_y = rst_date_tm;
    assign inc_date_ty = rst_date_y;
    assign inc_date_c = rst_date_ty;
    assign inc_date_tc = rst_date_c;
    assign leapyear = (((({date_ty, date_y} == 8'd0) & (((date_tc[0] & ~(date_c[3])) & (date_c[1:0] == 2'b10)) | ((~(date_tc[0]) & (date_c[1:0] == 2'b0)) & ((date_c[3:2] == 2'b1) | ~(date_c[2]))))) | ((~(date_ty[0]) & (date_y[1:0] == 2'b0)) & ({date_ty, date_y} != 8'd0))) | (date_ty[0] & (date_y[1:0] == 2'b10)));
endmodule