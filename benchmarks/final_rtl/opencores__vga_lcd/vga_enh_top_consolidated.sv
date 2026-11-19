module vga_enh_top (
    input logic wb_clk_i,
    input logic wb_rst_i,
    input logic rst_i,
    output logic wb_inta_o,
    input logic[11:0] wbs_adr_i,
    input logic[31:0] wbs_dat_i,
    output logic[31:0] wbs_dat_o,
    input logic[3:0] wbs_sel_i,
    input logic wbs_we_i,
    input logic wbs_stb_i,
    input logic wbs_cyc_i,
    output logic wbs_ack_o,
    output logic wbs_rty_o,
    output logic wbs_err_o,
    output logic[31:0] wbm_adr_o,
    input logic[31:0] wbm_dat_i,
    output logic[2:0] wbm_cti_o,
    output logic[1:0] wbm_bte_o,
    output logic[3:0] wbm_sel_o,
    output logic wbm_we_o,
    output logic wbm_stb_o,
    output logic wbm_cyc_o,
    input logic wbm_ack_i,
    input logic wbm_err_i,
    input logic clk_p_i,
    output logic clk_p_o,
    output logic hsync_pad_o,
    output logic vsync_pad_o,
    output logic csync_pad_o,
    output logic blank_pad_o,
    output logic[7:0] r_pad_o,
    output logic[7:0] g_pad_o,
    output logic[7:0] b_pad_o
);
    wire logic arst = (rst_i);
    wire logic ctrl_bl;
    wire logic ctrl_csl;
    wire logic ctrl_vsl;
    wire logic ctrl_hsl;
    wire logic ctrl_pc;
    wire logic ctrl_cbsw;
    wire logic ctrl_vbsw;
    wire logic ctrl_ven;
    wire logic[1:0] ctrl_cd;
    wire logic[1:0] ctrl_vbl;
    wire logic [0:0] ctrl_dvi_odf;
    wire logic[7:0] Thsync;
    wire logic[7:0] Thgdel;
    wire logic[7:0] Tvsync;
    wire logic[7:0] Tvgdel;
    wire logic[15:0] Thgate;
    wire logic[15:0] Thlen;
    wire logic[15:0] Tvgate;
    wire logic[15:0] Tvlen;
    wire logic[31:2] VBARa;
    wire logic[31:2] VBARb;
    wire logic [0:0] cursor_adr;
    wire logic [0:0] cursor0_xy;
    wire logic [0:0] cursor1_xy;
    wire logic cursor0_en;
    wire logic cursor1_en;
    wire logic[31:11] cursor0_ba;
    wire logic[31:11] cursor1_ba;
    wire logic cursor0_ld;
    wire logic cursor1_ld;
    wire logic cursor0_res;
    wire logic cursor1_res;
    wire logic [0:0] cc0_dat_o;
    wire logic [0:0] cc1_dat_o;
    wire logic stat_avmp;
    wire logic stat_acmp;
    wire logic vmem_swint;
    wire logic clut_swint;
    wire logic hint;
    wire logic vint;
    wire logic sint;
    reg luint;
    wire logic [0:0] cc0_adr_i;
    wire logic [0:0] cc1_adr_i;
    wire logic fb_data_fifo_rreq;
    wire logic fb_data_fifo_empty;
    wire logic[31:0] fb_data_fifo_q;
    wire logic ImDoneFifoQ;
    wire logic line_fifo_wreq;
    wire logic line_fifo_rreq;
    wire logic line_fifo_empty_rd;
    wire logic[23:0] line_fifo_d;
    wire logic[23:0] line_fifo_q;
    wire logic ext_clut_req;
    wire logic ext_clut_ack;
    wire logic[23:0] ext_clut_q;
    wire logic cp_clut_req;
    wire logic cp_clut_ack;
    wire logic[8:0] cp_clut_adr;
    wire logic[23:0] cp_clut_q;
    wire logic wbm_busy;
    vga_enh_top_wbs wbs (
        .clk_i(wb_clk_i),
        .rst_i(wb_rst_i),
        .arst_i(arst),
        .adr_i(wbs_adr_i[11:2]),
        .dat_i(wbs_dat_i),
        .dat_o(wbs_dat_o),
        .sel_i(wbs_sel_i),
        .we_i(wbs_we_i),
        .stb_i(wbs_stb_i),
        .cyc_i(wbs_cyc_i),
        .ack_o(wbs_ack_o),
        .rty_o(wbs_rty_o),
        .err_o(wbs_err_o),
        .inta_o(wb_inta_o),
        .wbm_busy(wbm_busy),
        .dvi_odf(ctrl_dvi_odf),
        .bl(ctrl_bl),
        .csl(ctrl_csl),
        .vsl(ctrl_vsl),
        .hsl(ctrl_hsl),
        .pc(ctrl_pc),
        .cd(ctrl_cd),
        .vbl(ctrl_vbl),
        .cbsw(ctrl_cbsw),
        .vbsw(ctrl_vbsw),
        .ven(ctrl_ven),
        .avmp(stat_avmp),
        .acmp(stat_acmp),
        .cursor0_res(cursor0_res),
        .cursor0_en(cursor0_en),
        .cursor0_xy(cursor0_xy),
        .cursor0_ba(cursor0_ba),
        .cursor0_ld(cursor0_ld),
        .cc0_adr_i({3'b0, cc0_adr_i}),
        .cc0_dat_o(cc0_dat_o),
        .cursor1_res(cursor1_res),
        .cursor1_en(cursor1_en),
        .cursor1_xy(cursor1_xy),
        .cursor1_ba(cursor1_ba),
        .cursor1_ld(cursor1_ld),
        .cc1_adr_i({3'b0, cc1_adr_i}),
        .cc1_dat_o(cc1_dat_o),
        .vbsint_in(vmem_swint),
        .cbsint_in(clut_swint),
        .hint_in(hint),
        .vint_in(vint),
        .luint_in(luint),
        .sint_in(sint),
        .Thsync(Thsync),
        .Thgdel(Thgdel),
        .Thgate(Thgate),
        .Thlen(Thlen),
        .Tvsync(Tvsync),
        .Tvgdel(Tvgdel),
        .Tvgate(Tvgate),
        .Tvlen(Tvlen),
        .VBARa(VBARa),
        .VBARb(VBARb),
        .clut_acc(ext_clut_req),
        .clut_ack(ext_clut_ack),
        .clut_q(ext_clut_q)
    );
    vga_enh_top_wbm wbm (
        .clk_i(wb_clk_i),
        .rst_i(wb_rst_i),
        .nrst_i(arst),
        .cyc_o(wbm_cyc_o),
        .stb_o(wbm_stb_o),
        .cti_o(wbm_cti_o),
        .bte_o(wbm_bte_o),
        .we_o(wbm_we_o),
        .adr_o(wbm_adr_o),
        .sel_o(wbm_sel_o),
        .ack_i(wbm_ack_i),
        .err_i(wbm_err_i),
        .dat_i(wbm_dat_i),
        .sint(sint),
        .ctrl_ven(ctrl_ven),
        .ctrl_cd(ctrl_cd),
        .ctrl_vbl(ctrl_vbl),
        .ctrl_vbsw(ctrl_vbsw),
        .busy(wbm_busy),
        .VBAa(VBARa),
        .VBAb(VBARb),
        .Thgate(Thgate),
        .Tvgate(Tvgate),
        .stat_avmp(stat_avmp),
        .vmem_switch(vmem_swint),
        .ImDoneFifoQ(ImDoneFifoQ),
        .cursor_adr(cursor_adr),
        .cursor0_ba(cursor0_ba),
        .cursor1_ba(cursor1_ba),
        .cursor0_ld(cursor0_ld),
        .cursor1_ld(cursor1_ld),
        .fb_data_fifo_rreq(fb_data_fifo_rreq),
        .fb_data_fifo_q(fb_data_fifo_q),
        .fb_data_fifo_empty(fb_data_fifo_empty)
    );
    vga_enh_top_clut_mem clut_mem (
        .clk_i(wb_clk_i),
        .req0_i(cp_clut_req),
        .ack0_o(cp_clut_ack),
        .adr0_i(cp_clut_adr),
        .dat0_i(24'd0),
        .dat0_o(cp_clut_q),
        .we0_i(1'b0),
        .req1_i(ext_clut_req),
        .ack1_o(ext_clut_ack),
        .adr1_i(wbs_adr_i[10:2]),
        .dat1_i(wbs_dat_i[23:0]),
        .dat1_o(ext_clut_q),
        .we1_i(wbs_we_i)
    );
    wire logic line_fifo_full_wr;
    vga_enh_top_pixel_generator pixel_generator (
        .clk_i(wb_clk_i),
        .ctrl_ven(ctrl_ven),
        .ctrl_HSyncL(ctrl_hsl),
        .Thsync(Thsync),
        .Thgdel(Thgdel),
        .Thgate(Thgate),
        .Thlen(Thlen),
        .ctrl_VSyncL(ctrl_vsl),
        .Tvsync(Tvsync),
        .Tvgdel(Tvgdel),
        .Tvgate(Tvgate),
        .Tvlen(Tvlen),
        .ctrl_CSyncL(ctrl_csl),
        .ctrl_BlankL(ctrl_bl),
        .eoh(hint),
        .eov(vint),
        .ctrl_dvi_odf({1'b0, ctrl_dvi_odf}),
        .ctrl_cd(ctrl_cd),
        .ctrl_pc(ctrl_pc),
        .fb_data_fifo_rreq(fb_data_fifo_rreq),
        .fb_data_fifo_empty(fb_data_fifo_empty),
        .fb_data_fifo_q(fb_data_fifo_q),
        .ImDoneFifoQ(ImDoneFifoQ),
        .stat_acmp(stat_acmp),
        .clut_req(cp_clut_req),
        .clut_adr(cp_clut_adr),
        .clut_q(cp_clut_q),
        .clut_ack(cp_clut_ack),
        .ctrl_cbsw(ctrl_cbsw),
        .clut_switch(clut_swint),
        .cursor_adr({8'b0, cursor_adr}),
        .cursor0_en(1'b1),
        .cursor0_res(1'b1),
        .cursor0_xy({31'b0, cursor0_xy}),
        .cc0_adr_o(cc0_adr_i),
        .cc0_dat_i({15'b0, cc0_dat_o}),
        .cursor1_en(1'b1),
        .cursor1_res(1'b1),
        .cursor1_xy({31'b0, cursor1_xy}),
        .cc1_adr_o(cc1_adr_i),
        .cc1_dat_i({15'b0, cc1_dat_o}),
        .line_fifo_wreq(line_fifo_wreq),
        .line_fifo_full(line_fifo_full_wr),
        .line_fifo_d(line_fifo_d),
        .line_fifo_rreq(line_fifo_rreq),
        .line_fifo_q(line_fifo_q),
        .pclk_i(clk_p_i),
        .pclk_o(clk_p_o),
        .hsync_o(hsync_pad_o),
        .vsync_o(vsync_pad_o),
        .csync_o(csync_pad_o),
        .blank_o(blank_pad_o),
        .r_o(r_pad_o),
        .g_o(g_pad_o),
        .b_o(b_pad_o)
    );
    wire logic ctrl_ven_not = ~(ctrl_ven);
    vga_enh_top_line_fifo line_fifo (
        .rclk(clk_p_i),
        .wclk(wb_clk_i),
        .rclr(1'b0),
        .wclr(ctrl_ven_not),
        .wreq(line_fifo_wreq),
        .d(line_fifo_d),
        .rreq(line_fifo_rreq),
        .q(line_fifo_q),
        .empty(line_fifo_empty_rd),
        .full(line_fifo_full_wr)
    );
    reg luint_pclk;
    reg sluint;
    always @(posedge clk_p_i) begin
        luint_pclk <= (line_fifo_rreq & line_fifo_empty_rd);
    end
    always @(posedge wb_clk_i) begin
        if (!(ctrl_ven)) begin
            sluint <= 1'b0;
            luint <= 1'b0;
        end
        else begin
            sluint <= luint_pclk;
            luint <= sluint;
        end
    end
endmodule
module vga_enh_top_wbs (
    input logic clk_i,
    input logic rst_i,
    input logic arst_i,
    input logic[11:2] adr_i,
    input logic[31:0] dat_i,
    output reg[31:0] dat_o,
    input logic[3:0] sel_i,
    input logic we_i,
    input logic stb_i,
    input logic cyc_i,
    output reg ack_o,
    output reg rty_o,
    output reg err_o,
    output reg inta_o,
    input logic wbm_busy,
    output logic[1:0] dvi_odf,
    output logic bl,
    output logic csl,
    output logic vsl,
    output logic hsl,
    output logic pc,
    output logic[1:0] cd,
    output logic[1:0] vbl,
    output logic cbsw,
    output logic vbsw,
    output logic ven,
    input logic avmp,
    input logic acmp,
    output logic cursor0_res,
    output logic cursor0_en,
    output reg[31:0] cursor0_xy,
    output reg[31:11] cursor0_ba,
    output reg cursor0_ld,
    input logic[3:0] cc0_adr_i,
    output logic[15:0] cc0_dat_o,
    output logic cursor1_res,
    output logic cursor1_en,
    output reg[31:0] cursor1_xy,
    output reg[31:11] cursor1_ba,
    output reg cursor1_ld,
    input logic[3:0] cc1_adr_i,
    output logic[15:0] cc1_dat_o,
    input logic vbsint_in,
    input logic cbsint_in,
    input logic hint_in,
    input logic vint_in,
    input logic luint_in,
    input logic sint_in,
    output logic[7:0] Thsync,
    output logic[7:0] Thgdel,
    output logic[15:0] Thgate,
    output logic[15:0] Thlen,
    output logic[7:0] Tvsync,
    output logic[7:0] Tvgdel,
    output logic[15:0] Tvgate,
    output logic[15:0] Tvlen,
    output reg[31:2] VBARa,
    output reg[31:2] VBARb,
    output logic clut_acc,
    input logic clut_ack,
    input logic[23:0] clut_q
);
    wire logic[5:0] REG_ADR = adr_i[7:2];
    wire logic CLUT_ADR = adr_i[11];
    reg[31:0] ctrl;
    reg[17:0] stat;
    reg[31:0] htim;
    reg[31:0] vtim;
    reg[31:0] hvlen;
    wire logic hint;
    wire logic vint;
    wire logic vbsint;
    wire logic cbsint;
    wire logic luint;
    wire logic sint;
    wire logic hie;
    wire logic vie;
    wire logic vbsie;
    wire logic cbsie;
    wire logic acc;
    wire logic acc32;
    wire logic reg_acc;
    wire logic reg_wacc;
    wire logic[0:0] ccr0_dat_o;
    wire logic[0:0] ccr1_dat_o;
    reg[31:0] reg_dato;
    assign acc = (cyc_i & stb_i);
    assign acc32 = (sel_i == 4'b1111);
    assign clut_acc = ((CLUT_ADR & acc) & acc32);
    assign reg_acc = ((~(CLUT_ADR) & acc) & acc32);
    assign reg_wacc = (reg_acc & we_i);
    always @(posedge clk_i) begin
        ack_o <= (((reg_acc | clut_ack) & ~((wbm_busy & (REG_ADR == 8'd0)))) & ~(ack_o));
    end
    always @(posedge clk_i) begin
        rty_o <= (((reg_acc | clut_ack) & (wbm_busy & (REG_ADR == 8'd0))) & ~(rty_o));
    end
    always @(posedge clk_i) begin
        err_o <= ((acc & ~(acc32)) & ~(err_o));
    end
    always @(posedge clk_i or negedge arst_i) begin
        if (!(arst_i)) begin
            htim <= 0;
            vtim <= 0;
            hvlen <= 0;
            VBARa <= 0;
            VBARb <= 0;
            cursor0_xy <= 0;
            cursor0_ba <= 0;
            cursor1_xy <= 0;
            cursor1_ba <= 0;
        end
        else if (rst_i) begin
            htim <= 0;
            vtim <= 0;
            hvlen <= 0;
            VBARa <= 0;
            VBARb <= 0;
            cursor0_xy <= 0;
            cursor0_ba <= 0;
            cursor1_xy <= 0;
            cursor1_ba <= 0;
        end
        else if (reg_wacc) begin
            case (adr_i)
                8'd2: begin
                    htim <= dat_i;
                end
                8'd3: begin
                    vtim <= dat_i;
                end
                8'd4: begin
                    hvlen <= dat_i;
                end
                8'd5: begin
                    VBARa <= dat_i[31:2];
                end
                8'd6: begin
                    VBARb <= dat_i[31:2];
                end
                8'd12: begin
                    cursor0_xy <= dat_i[31:0];
                end
                8'd13: begin
                    cursor0_ba <= dat_i[31:11];
                end
                8'd28: begin
                    cursor1_xy <= dat_i[31:0];
                end
                8'd29: begin
                    cursor1_ba <= dat_i[31:11];
                end
            endcase
        end
    end
    always @(posedge clk_i) begin
        cursor0_ld <= (reg_wacc && (adr_i == 8'd13));
        cursor1_ld <= (reg_wacc && (adr_i == 8'd29));
    end
    always @(posedge clk_i or negedge arst_i) begin
        if (!(arst_i)) begin
            ctrl <= 0;
        end
        else if (rst_i) begin
            ctrl <= 0;
        end
        else if (((reg_wacc & (REG_ADR == 8'd0)) & ~(wbm_busy))) begin
            ctrl <= dat_i;
        end
        else begin
            ctrl[6] <= (ctrl[6] & !(cbsint_in));
            ctrl[5] <= (ctrl[5] & !(vbsint_in));
        end
    end
    always @(posedge clk_i or negedge arst_i) begin
        if (!(arst_i)) begin
            stat <= 0;
        end
        else if (rst_i) begin
            stat <= 0;
        end
        else begin
            begin
            end
            begin
            end
            stat[17] <= acmp;
            stat[16] <= avmp;
            if ((reg_wacc & (REG_ADR == 8'd1))) begin
                stat[7] <= (cbsint_in | (stat[7] & !(dat_i[7])));
                stat[6] <= (vbsint_in | (stat[6] & !(dat_i[6])));
                stat[5] <= (hint_in | (stat[5] & !(dat_i[5])));
                stat[4] <= (vint_in | (stat[4] & !(dat_i[4])));
                stat[1] <= luint_in;
                stat[0] <= (sint_in | (stat[0] & !(dat_i[0])));
            end
            else begin
                stat[7] <= (stat[7] | cbsint_in);
                stat[6] <= (stat[6] | vbsint_in);
                stat[5] <= (stat[5] | hint_in);
                stat[4] <= (stat[4] | vint_in);
                stat[1] <= (stat[1] | luint_in);
                stat[0] <= (stat[0] | sint_in);
            end
        end
    end
    assign dvi_odf = ctrl[29:28];
    assign cursor1_res = ctrl[25];
    assign cursor1_en = ctrl[24];
    assign cursor0_res = ctrl[23];
    assign cursor0_en = ctrl[20];
    assign bl = ctrl[15];
    assign csl = ctrl[14];
    assign vsl = ctrl[13];
    assign hsl = ctrl[12];
    assign pc = ctrl[11];
    assign cd = ctrl[10:9];
    assign vbl = ctrl[8:7];
    assign cbsw = ctrl[6];
    assign vbsw = ctrl[5];
    assign cbsie = ctrl[4];
    assign vbsie = ctrl[3];
    assign hie = ctrl[2];
    assign vie = ctrl[1];
    assign ven = ctrl[0];
    assign cbsint = stat[7];
    assign vbsint = stat[6];
    assign hint = stat[5];
    assign vint = stat[4];
    assign luint = stat[1];
    assign sint = stat[0];
    assign Thsync = htim[31:24];
    assign Thgdel = htim[23:16];
    assign Thgate = htim[15:0];
    assign Thlen = hvlen[31:16];
    assign Tvsync = vtim[31:24];
    assign Tvgdel = vtim[23:16];
    assign Tvgate = vtim[15:0];
    assign Tvlen = hvlen[15:0];
    assign ccr0_dat_o = 32'd0;
    assign cc0_dat_o = 32'd0;
    assign ccr1_dat_o = 32'd0;
    assign cc1_dat_o = 32'd0;
    always @(REG_ADR or ctrl or stat or htim or vtim or hvlen or VBARa or VBARb or acmp or cursor0_xy or cursor0_ba or cursor1_xy or cursor1_ba or ccr0_dat_o or ccr1_dat_o) begin
        casez (REG_ADR)
            8'd0: begin
                reg_dato = ctrl;
            end
            8'd1: begin
                reg_dato = stat;
            end
            8'd2: begin
                reg_dato = htim;
            end
            8'd3: begin
                reg_dato = vtim;
            end
            8'd4: begin
                reg_dato = hvlen;
            end
            8'd5: begin
                reg_dato = {VBARa, 2'b0};
            end
            8'd6: begin
                reg_dato = {VBARb, 2'b0};
            end
            8'd12: begin
                reg_dato = cursor0_xy;
            end
            8'd13: begin
                reg_dato = {cursor0_ba, 11'd0};
            end
            8'd28: begin
                reg_dato = cursor1_xy;
            end
            8'd29: begin
                reg_dato = {cursor1_ba, 11'd0};
            end
            default: begin
                reg_dato = 32'd0;
            end
        endcase
    end
    always @(posedge clk_i) begin
        dat_o <= (reg_acc ? reg_dato : {8'd0, clut_q});
    end
    always @(posedge clk_i) begin
        inta_o <= ((((((hint & hie) | (vint & vie)) | (vbsint & vbsie)) | (cbsint & cbsie)) | luint) | sint);
    end
endmodule


module vga_enh_top_wbm (
    input logic clk_i,
    input logic rst_i,
    input logic nrst_i,
    output reg cyc_o,
    output reg stb_o,
    output reg[2:0] cti_o,
    output reg[1:0] bte_o,
    output reg we_o,
    output logic[31:0] adr_o,
    output reg[3:0] sel_o,
    input logic ack_i,
    input logic err_i,
    input logic[31:0] dat_i,
    output logic sint,
    input logic ctrl_ven,
    input logic[1:0] ctrl_cd,
    input logic[1:0] ctrl_vbl,
    input logic ctrl_vbsw,
    output logic busy,
    input logic[31:2] VBAa,
    input logic[31:2] VBAb,
    input logic[15:0] Thgate,
    input logic[15:0] Tvgate,
    output logic stat_avmp,
    output logic vmem_switch,
    output logic ImDoneFifoQ,
    output reg[8:0] cursor_adr,
    input logic[31:11] cursor0_ba,
    input logic[31:11] cursor1_ba,
    input logic cursor0_ld,
    input logic cursor1_ld,
    input logic fb_data_fifo_rreq,
    output logic[31:0] fb_data_fifo_q,
    output logic fb_data_fifo_empty
);
    reg vmem_acc;
    wire logic vmem_req;
    wire logic vmem_ack;
    wire logic ImDone;
    reg dImDone;
    wire logic ImDoneStrb;
    reg dImDoneStrb;
    reg sclr;
    reg[31:11] cursor_ba;
    reg ld_cursor0;
    reg ld_cursor1;
    reg cur_acc;
    reg cur_acc_sel;
    wire logic cur_ack;
    wire logic cur_done;
    always @(posedge clk_i) begin
        sclr <= ~(ctrl_ven);
    end
    reg[2:0] burst_cnt;
    wire logic burst_done;
    reg sel_VBA;
    reg[31:2] vmemA;
    always @(posedge clk_i) begin
        if (sclr) begin
            vmem_acc <= 1'b0;
        end
        else begin
            vmem_acc <= (((vmem_req | (vmem_acc & !((burst_done & vmem_ack)))) & !(ImDone)) & !(cur_acc));
        end
    end
    always @(posedge clk_i) begin
        if (sclr) begin
            cur_acc <= 1'b0;
        end
        else begin
            cur_acc <= ((cur_acc | (ImDone & (ld_cursor0 | ld_cursor1))) & !(cur_done));
        end
    end
    assign busy = (vmem_acc | cur_acc);
    assign vmem_ack = ((ack_i & stb_o) & vmem_acc);
    assign cur_ack = ((ack_i & stb_o));
    assign sint = err_i;
    assign vmem_switch = ImDoneStrb;
    always @(posedge clk_i) begin
        if (sclr) begin
            sel_VBA <= 1'b0;
        end
        else if (ctrl_vbsw) begin
            sel_VBA <= (sel_VBA ^ vmem_switch);
        end
    end
    assign stat_avmp = sel_VBA;
    vga_enh_top_wbm_clut_sw_fifo clut_sw_fifo (
        .clk(clk_i),
        .aclr(1'b1),
        .sclr(sclr),
        .wreq(vmem_ack),
        .rreq(fb_data_fifo_rreq),
        .d(ImDone),
        .q(ImDoneFifoQ),
        .nword(),
        .empty(),
        .full(),
        .aempty(),
        .afull()
    );
    wire logic[3:0] burst_cnt_val;
    assign burst_cnt_val = ({1'b0, burst_cnt} - 4'b1);
    assign burst_done = burst_cnt_val[3];
    always @(posedge clk_i) begin
        if (((burst_done & vmem_ack) | !(vmem_acc))) begin
            case (ctrl_vbl)
                2'b0: begin
                    burst_cnt <= 3'b0;
                end
                2'b1: begin
                    burst_cnt <= 3'b1;
                end
                2'b10: begin
                    burst_cnt <= 3'b11;
                end
                2'b11: begin
                    burst_cnt <= 3'b111;
                end
            endcase
        end
        else if (vmem_ack) begin
            burst_cnt <= burst_cnt_val[2:0];
        end
    end
    reg[15:0] hgate_cnt;
    reg[16:0] hgate_cnt_val;
    reg[1:0] hgate_div_cnt;
    reg[2:0] hgate_div_val;
    wire logic hdone = (hgate_cnt_val[16] & vmem_ack);
    always @(hgate_cnt or hgate_div_cnt or ctrl_cd) begin
        hgate_div_val = ({1'b0, hgate_div_cnt} - 3'b1);
        if ((ctrl_cd != 2'b10)) begin
            hgate_cnt_val = ({1'b0, hgate_cnt} - 17'd1);
        end
        else if (hgate_div_val[2]) begin
            hgate_cnt_val = ({1'b0, hgate_cnt} - 17'd1);
        end
        else begin
            hgate_cnt_val = {1'b0, hgate_cnt};
        end
    end
    always @(posedge clk_i) begin
        if (sclr) begin
            case (ctrl_cd)  // synopsys full_case parallel_case
                2'b0: begin
                    hgate_cnt <= (Thgate >> 2);
                end
                2'b1: begin
                    hgate_cnt <= (Thgate >> 1);
                end
                2'b10: begin
                    hgate_cnt <= (Thgate >> 2);
                end
                2'b11: begin
                    hgate_cnt <= Thgate;
                end
            endcase
            hgate_div_cnt <= 2'b10;
        end
        else if (vmem_ack) begin
            if (hdone) begin
                case (ctrl_cd)  // synopsys full_case parallel_case
                    2'b0: begin
                        hgate_cnt <= (Thgate >> 2);
                    end
                    2'b1: begin
                        hgate_cnt <= (Thgate >> 1);
                    end
                    2'b10: begin
                        hgate_cnt <= (Thgate >> 2);
                    end
                    2'b11: begin
                        hgate_cnt <= Thgate;
                    end
                endcase
                hgate_div_cnt <= 2'b10;
            end
            else begin
                hgate_cnt <= hgate_cnt_val[15:0];
                if (hgate_div_val[2]) begin
                    hgate_div_cnt <= 2'b10;
                end
                else begin
                    hgate_div_cnt <= hgate_div_val[1:0];
                end
            end
        end
    end
    reg[15:0] vgate_cnt;
    wire logic[16:0] vgate_cnt_val;
    wire logic vdone;
    assign vgate_cnt_val = ({1'b0, vgate_cnt} - 17'd1);
    assign vdone = vgate_cnt_val[16];
    always @(posedge clk_i) begin
        if ((sclr | ImDoneStrb)) begin
            vgate_cnt <= Tvgate;
        end
        else if (hdone) begin
            vgate_cnt <= vgate_cnt_val[15:0];
        end
    end
    assign ImDone = (hdone & vdone);
    assign ImDoneStrb = (ImDone & !(1'b0));
    always @(posedge clk_i) begin
        dImDone <= ImDone;
        dImDoneStrb <= ImDoneStrb;
    end
    always @(posedge clk_i) begin
        if ((sclr | dImDoneStrb)) begin
            if (!(sel_VBA)) begin
                vmemA <= VBAa;
            end
            else begin
                vmemA <= VBAb;
            end
        end
        else if (vmem_ack) begin
            vmemA <= (vmemA + 30'd1);
        end
    end
    always @(posedge clk_i) begin
        if (ImDone) begin
            cur_acc_sel <= ld_cursor0;
        end
    end
    always @(posedge clk_i) begin
        if (sclr) begin
            ld_cursor0 <= 1'b0;
            ld_cursor1 <= 1'b0;
        end
        else begin
            ld_cursor0 <= (cursor0_ld | (ld_cursor0 & !((cur_done & cur_acc_sel))));
            ld_cursor1 <= (cursor1_ld | (ld_cursor1 & !((cur_done & !(cur_acc_sel)))));
        end
    end
    always @(posedge clk_i) begin
        if (!(cur_acc)) begin
            cursor_ba <= (ld_cursor0 ? cursor0_ba : cursor1_ba);
        end
    end
    wire logic[9:0] next_cursor_adr = ({1'b0, cursor_adr} + 10'd1);
    assign cur_done = (next_cursor_adr[9] & cur_ack);
    always @(posedge clk_i) begin
        if (!(cur_acc)) begin
            cursor_adr <= 9'd0;
        end
        else if (cur_ack) begin
            cursor_adr <= next_cursor_adr;
        end
    end
    assign adr_o = (cur_acc ? {cursor_ba, cursor_adr, 2'b0} : {vmemA, 2'b0});
    wire logic wb_cycle = (((vmem_acc & !(((burst_done & vmem_ack) & !(vmem_req)))) & !(ImDone)) || (cur_acc & !(cur_done)));
    always @(posedge clk_i or negedge nrst_i) begin
        if (!(nrst_i)) begin
            cyc_o <= 1'b0;
            stb_o <= 1'b0;
            sel_o <= 4'b1111;
            cti_o <= 3'b0;
            bte_o <= 2'b0;
            we_o <= 1'b0;
        end
        else if (rst_i) begin
            cyc_o <= 1'b0;
            stb_o <= 1'b0;
            sel_o <= 4'b1111;
            cti_o <= 3'b0;
            bte_o <= 2'b0;
            we_o <= 1'b0;
        end
        else begin
            cyc_o <= wb_cycle;
            stb_o <= wb_cycle;
            sel_o <= 4'b1111;
            if (wb_cycle) begin
                if (cur_acc) begin
                    cti_o <= (&(next_cursor_adr[8:0]) ? 3'b111 : 3'b10);
                end
                else if ((ctrl_vbl == 2'b0)) begin
                    cti_o <= 3'b0;
                end
                else if (vmem_ack) begin
                    cti_o <= ((burst_cnt == 3'b1) ? 3'b111 : 3'b10);
                end
            end
            else begin
                cti_o <= ((ctrl_vbl == 2'b0) ? 3'b0 : 3'b10);
            end
            bte_o <= 2'b0;
            we_o <= 1'b0;
        end
    end
    wire logic[4:0] fb_data_fifo_nword;
    vga_enh_top_wbm_data_fifo data_fifo (
        .clk(clk_i),
        .aclr(1'b1),
        .sclr(sclr),
        .wreq(vmem_ack),
        .rreq(fb_data_fifo_rreq),
        .d(dat_i),
        .q(fb_data_fifo_q),
        .nword(fb_data_fifo_nword),
        .empty(fb_data_fifo_empty),
        .full(),
        .aempty(),
        .afull()
    );
    assign vmem_req = (~(fb_data_fifo_nword[4]) & ~(fb_data_fifo_nword[3]));
endmodule

module vga_enh_top_wbm_clut_sw_fifo (
    input logic clk,
    input logic aclr,
    input logic sclr,
    input logic wreq,
    input logic rreq,
    input logic[1:1] d,
    output logic[1:1] q,
    output reg[4:0] nword,
    output reg empty,
    output reg full,
    output logic aempty,
    output logic afull
);
    reg[4:1] rp;
    reg[4:1] wp;
    wire logic fwreq;
    wire logic frreq;
    function logic lsb(input logic[4:1] q);
        reg [4:1] qx;
        begin
            qx = q;
            case (4)
                2: begin
                    lsb = ~(qx[2]);
                end
                3: begin
                    lsb = (&(q[3:1]));
                end
                4: begin
                    lsb = (&(q[3:1]) ^ ~((qx[4] ^ qx[3])));
                end
                5: begin
                    lsb = (&(q[3:1]));
                end
                6: begin
                    lsb = (&(q[3:1]));
                end
                7: begin
                    lsb = (&(q[3:1]));
                end
                8: begin
                    lsb = (&(q[3:1]));
                end
                9: begin
                    lsb = (&(q[3:1]));
                end
                10: begin
                    lsb = (&(q[3:1]));
                end
                11: begin
                    lsb = (&(q[3:1]));
                end
                12: begin
                    lsb = (&(q[3:1]));
                end
                13: begin
                    lsb = (&(q[3:1]));
                end
                14: begin
                    lsb = (&(q[3:1]));
                end
                15: begin
                    lsb = (&(q[3:1]));
                end
                16: begin
                    lsb = (&(q[3:1]));
                end
            endcase
        end
    endfunction
    assign fwreq = wreq;
    assign frreq = rreq;
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            rp <= 0;
        end
        else if (sclr) begin
            rp <= 0;
        end
        else if (frreq) begin
            rp <= {rp[3:1], lsb(rp)};
        end
    end
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            wp <= 0;
        end
        else if (sclr) begin
            wp <= 0;
        end
        else if (fwreq) begin
            wp <= {wp[3:1], lsb(wp)};
        end
    end
    reg[1:1] mem[15:0];
    always @(posedge clk) begin
        if (fwreq) begin
            mem[wp] <= d;
        end
    end
    assign q = mem[rp];
    assign aempty = ((((rp[3:1] == wp[4:2]))));
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            empty <= 1'b1;
        end
        else begin
            empty <= (aempty);
        end
    end
    assign afull = ((((wp[3:1] == rp[4:2]))));
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            full <= 1'b0;
        end
        else begin
            full <= (afull);
        end
    end
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            nword <= 0;
        end
        else begin begin end
        end
    end
endmodule

module vga_enh_top_wbm_data_fifo (
    input logic clk,
    input logic aclr,
    input logic sclr,
    input logic wreq,
    input logic rreq,
    input logic[32:1] d,
    output logic[32:1] q,
    output reg[4:0] nword,
    output reg empty,
    output reg full,
    output logic aempty,
    output logic afull
);
    reg[4:1] rp;
    reg[4:1] wp;
    wire logic fwreq;
    wire logic frreq;
    function logic lsb(input logic[4:1] q);
        reg [4:1] qx;
        begin
            qx = q;
            case (4)
                2: begin
                    lsb = ~(qx[2]);
                end
                3: begin
                    lsb = (&(q[3:1]));
                end
                4: begin
                    lsb = (&(q[3:1]) ^ ~((qx[4] ^ qx[3])));
                end
                5: begin
                    lsb = (&(q[3:1]));
                end
                6: begin
                    lsb = (&(q[3:1]));
                end
                7: begin
                    lsb = (&(q[3:1]));
                end
                8: begin
                    lsb = (&(q[3:1]));
                end
                9: begin
                    lsb = (&(q[3:1]));
                end
                10: begin
                    lsb = (&(q[3:1]));
                end
                11: begin
                    lsb = (&(q[3:1]));
                end
                12: begin
                    lsb = (&(q[3:1]));
                end
                13: begin
                    lsb = (&(q[3:1]));
                end
                14: begin
                    lsb = (&(q[3:1]));
                end
                15: begin
                    lsb = (&(q[3:1]));
                end
                16: begin
                    lsb = (&(q[3:1]));
                end
            endcase
        end
    endfunction
    assign fwreq = wreq;
    assign frreq = rreq;
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            rp <= 0;
        end
        else if (sclr) begin
            rp <= 0;
        end
        else if (frreq) begin
            rp <= {rp[3:1], lsb(rp)};
        end
    end
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            wp <= 0;
        end
        else if (sclr) begin
            wp <= 0;
        end
        else if (fwreq) begin
            wp <= {wp[3:1], lsb(wp)};
        end
    end
    reg[32:1] mem[15:0];
    always @(posedge clk) begin
        if (fwreq) begin
            mem[wp] <= d;
        end
    end
    assign q = mem[rp];
    assign aempty = ((((rp[3:1] == wp[4:2]) & (lsb(rp) == wp[1])) & frreq) & ~(fwreq));
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            empty <= 1'b1;
        end
        else if (sclr) begin
            empty <= 1'b1;
        end
        else begin
            empty <= (aempty | (empty & (~(fwreq) + frreq)));
        end
    end
    assign afull = ((((wp[3:1] == rp[4:2]))));
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            full <= 1'b0;
        end
        else begin
            full <= (afull);
        end
    end
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            nword <= 0;
        end
        else if (sclr) begin
            nword <= 0;
        end
        else begin
            if ((wreq & !(rreq))) begin
                nword <= (nword + 1);
            end
            else if ((rreq & !(wreq))) begin
                nword <= (nword - 1);
            end
        end
    end
endmodule

module vga_enh_top_clut_mem (
    input logic clk_i,
    input logic req0_i,
    output logic ack0_o,
    input logic[8:0] adr0_i,
    input logic[23:0] dat0_i,
    output logic[23:0] dat0_o,
    input logic we0_i,
    input logic req1_i,
    output logic ack1_o,
    input logic[8:0] adr1_i,
    input logic[23:0] dat1_i,
    output logic[23:0] dat1_o,
    input logic we1_i
);
    wire logic acc0;
    wire logic acc1;
    reg dacc0;
    reg dacc1;
    wire logic sel0;
    wire logic sel1;
    reg ack0;
    reg ack1;
    wire logic[23:0] mem_q;
    assign acc0 = req0_i;
    assign acc1 = (req1_i && !(sel0));
    always @(posedge clk_i) begin
        dacc0 <= (acc0 & !(ack0_o));
        dacc1 <= (acc1 & !(ack1_o));
    end
    assign sel0 = (acc0 && !(dacc0));
    assign sel1 = (acc1 && !(dacc1));
    always @(posedge clk_i) begin
        ack0 <= (sel0);
        ack1 <= (sel1 && !(ack1_o));
    end
    wire logic[8:0] mem_adr = (sel0 ? adr0_i : adr1_i);
    wire logic[23:0] mem_d = ( dat1_i);
    wire logic mem_we = (sel0 ? ( we0_i) : (req1_i && we1_i));
    vga_enh_top_clut_mem_clut_mem clut_mem (
        .clk(clk_i),
        .rst(1'b0),
        .ce(1'b1),
        .we(mem_we),
        .oe(1'b1),
        .addr(mem_adr),
        .di(mem_d),
        .do_sig(mem_q)
    );
    assign dat0_o = mem_q;
    assign dat1_o = mem_q;
    assign ack0_o = ( ack0);
    assign ack1_o = ((sel1 && we1_i) || ack1);
endmodule
module vga_enh_top_clut_mem_clut_mem (
    input logic clk,
    input logic rst,
    input logic ce,
    input logic we,
    input logic oe,
    input logic[8:0] addr,
    input logic[23:0] di,
    output logic[23:0] do_sig
);
    reg[23:0] mem[511:0];
    reg[8:0] ra;
    always @(posedge clk) begin
        ra <= addr;
    end
    assign do_sig = mem[ra];
    always @(posedge clk) begin
        if (we) begin
            mem[addr] <= di;
        end
    end
endmodule


module vga_enh_top_pixel_generator (
    input logic clk_i,
    input logic ctrl_ven,
    input logic ctrl_HSyncL,
    input logic[7:0] Thsync,
    input logic[7:0] Thgdel,
    input logic[15:0] Thgate,
    input logic[15:0] Thlen,
    input logic ctrl_VSyncL,
    input logic[7:0] Tvsync,
    input logic[7:0] Tvgdel,
    input logic[15:0] Tvgate,
    input logic[15:0] Tvlen,
    input logic ctrl_CSyncL,
    input logic ctrl_BlankL,
    output reg eoh,
    output reg eov,
    input logic[1:0] ctrl_dvi_odf,
    input logic[1:0] ctrl_cd,
    input logic ctrl_pc,
    output logic fb_data_fifo_rreq,
    input logic fb_data_fifo_empty,
    input logic[31:0] fb_data_fifo_q,
    input logic ImDoneFifoQ,
    output reg stat_acmp,
    output logic clut_req,
    output logic[8:0] clut_adr,
    input logic[23:0] clut_q,
    input logic clut_ack,
    input logic ctrl_cbsw,
    output logic clut_switch,
    input logic[8:0] cursor_adr,
    input logic cursor0_en,
    input logic cursor0_res,
    input logic[31:0] cursor0_xy,
    output logic[3:0] cc0_adr_o,
    input logic[15:0] cc0_dat_i,
    input logic cursor1_en,
    input logic cursor1_res,
    input logic[31:0] cursor1_xy,
    output logic[3:0] cc1_adr_o,
    input logic[15:0] cc1_dat_i,
    output logic line_fifo_wreq,
    input logic line_fifo_full,
    output logic[23:0] line_fifo_d,
    output logic line_fifo_rreq,
    input logic[23:0] line_fifo_q,
    input logic pclk_i,
    output logic pclk_o,
    output reg hsync_o,
    output reg vsync_o,
    output reg csync_o,
    output reg blank_o,
    output reg[7:0] r_o,
    output reg[7:0] g_o,
    output reg[7:0] b_o
);
    reg nVen;
    wire logic eol;
    wire logic eof;
    wire logic ihsync;
    wire logic ivsync;
    wire logic icsync;
    wire logic iblank;
    wire logic pclk_ena;
    always @(posedge pclk_i) begin
        nVen <= ~(ctrl_ven);
    end
    wire logic dvi_pclk_p_o;
    wire logic dvi_pclk_m_o;
    vga_enh_top_pixel_generator_clk_gen clk_gen (
        .pclk_i(pclk_i),
        .rst_i(nVen),
        .pclk_o(pclk_o),
        .dvi_pclk_p_o(dvi_pclk_p_o),
        .dvi_pclk_m_o(dvi_pclk_m_o),
        .pclk_ena_o(pclk_ena)
    );
    wire logic gate;
    vga_enh_top_pixel_generator_vtgen vtgen (
        .clk(pclk_i),
        .clk_ena(1'b1),
        .rst(nVen),
        .Thsync(Thsync),
        .Thgdel(Thgdel),
        .Thgate(Thgate),
        .Thlen(Thlen),
        .Tvsync(Tvsync),
        .Tvgdel(Tvgdel),
        .Tvgate(Tvgate),
        .Tvlen(Tvlen),
        .eol(eol),
        .eof(eof),
        .gate(gate),
        .hsync(ihsync),
        .vsync(ivsync),
        .csync(icsync),
        .blank(iblank)
    );
    reg seol;
    reg seof;
    reg dseol;
    reg dseof;
    always @(posedge clk_i) begin
        if (~(ctrl_ven)) begin
            seol <= 1'b0;
            dseol <= 1'b0;
            seof <= 1'b0;
            dseof <= 1'b0;
            eoh <= 1'b0;
            eov <= 1'b0;
        end
        else begin
            seol <= eol;
            dseol <= seol;
            seof <= eof;
            dseof <= seof;
            eoh <= (seol & !(1'b0));
            eov <= (seof & !(dseof));
        end
    end
    reg hsync;
    reg vsync;
    reg csync;
    reg blank;
    always @(posedge pclk_i) begin
        hsync <= (ihsync ^ ctrl_HSyncL);
        vsync <= (ivsync ^ ctrl_VSyncL);
        csync <= (icsync ^ ctrl_CSyncL);
        blank <= (iblank ^ ctrl_BlankL);
        hsync_o <= hsync;
        vsync_o <= vsync;
        csync_o <= csync;
        blank_o <= blank;
    end
    wire logic[23:0] color_proc_q;
    wire logic color_proc_wreq;
    wire logic[7:0] clut_offs;
    reg dImDoneFifoQ;
    reg ddImDoneFifoQ;
    wire logic[23:0] cur1_q;
    wire logic cur1_wreq;
    wire logic[23:0] rgb_fifo_d;
    wire logic rgb_fifo_empty;
    wire logic rgb_fifo_full;
    wire logic rgb_fifo_rreq;
    wire logic rgb_fifo_wreq;
    wire logic sclr = ~(ctrl_ven);
    vga_enh_top_pixel_generator_color_proc color_proc (
        .clk(clk_i),
        .srst(sclr),
        .vdat_buffer_di(fb_data_fifo_q),
        .ColorDepth(ctrl_cd),
        .PseudoColor(ctrl_pc),
        .vdat_buffer_empty(fb_data_fifo_empty),
        .vdat_buffer_rreq(fb_data_fifo_rreq),
        .rgb_fifo_full(rgb_fifo_full),
        .rgb_fifo_wreq(color_proc_wreq),
        .r(color_proc_q[23:16]),
        .g(color_proc_q[15:8]),
        .b(color_proc_q[7:0]),
        .clut_req(clut_req),
        .clut_ack(clut_ack),
        .clut_offs(clut_offs),
        .clut_q(clut_q)
    );
    always @(posedge clk_i) begin
        if (sclr) begin
            dImDoneFifoQ <= 1'b0;
        end
        else if (fb_data_fifo_rreq) begin
            dImDoneFifoQ <= ImDoneFifoQ;
        end
    end
    always @(posedge clk_i) begin
        if (sclr) begin
            ddImDoneFifoQ <= 1'b0;
        end
        else begin
            ddImDoneFifoQ <= dImDoneFifoQ;
        end
    end
    assign clut_switch = (ddImDoneFifoQ & !(dImDoneFifoQ));
    always @(posedge clk_i) begin
        if (sclr) begin
            stat_acmp <= 1'b0;
        end
        else if (ctrl_cbsw) begin
            stat_acmp <= (stat_acmp ^ clut_switch);
        end
    end
    assign clut_adr = {stat_acmp, clut_offs};
    assign cur1_wreq = color_proc_wreq;
    assign cur1_q = color_proc_q;
    assign cc1_adr_o = 4'b0;
    assign rgb_fifo_wreq = cur1_wreq;
    assign rgb_fifo_d = cur1_q;
    assign cc0_adr_o = 4'b0;
    wire logic [3:0] rgb_fifo_nword;
    vga_enh_top_pixel_generator_rgb_fifo rgb_fifo (
        .clk(clk_i),
        .aclr(1'b1),
        .sclr(sclr),
        .wreq(rgb_fifo_wreq),
        .rreq(rgb_fifo_rreq),
        .d(rgb_fifo_d),
        .q(line_fifo_d),
        .nword(rgb_fifo_nword),
        .empty(rgb_fifo_empty),
        .full(),
        .aempty(),
        .afull()
    );
    assign rgb_fifo_full = rgb_fifo_nword[3];
    assign line_fifo_rreq = (gate & 1'b1);
    assign rgb_fifo_rreq = (~(line_fifo_full) & ~(rgb_fifo_empty));
    assign line_fifo_wreq = rgb_fifo_rreq;
    wire logic[7:0] r = line_fifo_q[23:16];
    wire logic[7:0] g = line_fifo_q[15:8];
    wire logic[7:0] b = line_fifo_q[7:0];
    always @(posedge pclk_i) begin begin
            r_o <= r;
            g_o <= g;
            b_o <= b;
        end
    end
endmodule
module vga_enh_top_pixel_generator_clk_gen (
    input logic pclk_i,
    input logic rst_i,
    output logic pclk_o,
    output reg dvi_pclk_p_o,
    output reg dvi_pclk_m_o,
    output logic pclk_ena_o
);
    always @(posedge pclk_i) begin
        dvi_pclk_p_o <= ~(dvi_pclk_p_o);
        dvi_pclk_m_o <= dvi_pclk_p_o;
    end
    assign pclk_o = pclk_i;
    assign pclk_ena_o = 1'b1;
endmodule


module vga_enh_top_pixel_generator_vtgen (
    input logic clk,
    input logic clk_ena,
    input logic rst,
    input logic[7:0] Thsync,
    input logic[7:0] Thgdel,
    input logic[15:0] Thgate,
    input logic[15:0] Thlen,
    input logic[7:0] Tvsync,
    input logic[7:0] Tvgdel,
    input logic[15:0] Tvgate,
    input logic[15:0] Tvlen,
    output logic eol,
    output logic eof,
    output logic gate,
    output logic hsync,
    output logic vsync,
    output logic csync,
    output logic blank
);
    wire logic Hgate;
    wire logic Vgate;
    wire logic Hdone;
    vga_enh_top_pixel_generator_vtgen_hor_gen hor_gen (
        .clk(clk),
        .ena(clk_ena),
        .rst(rst),
        .Tsync(Thsync),
        .Tgdel(Thgdel),
        .Tgate(Thgate),
        .Tlen(Thlen),
        .Sync(hsync),
        .Gate(Hgate),
        .Done(Hdone)
    );
    wire logic vclk_ena = (Hdone);
    vga_enh_top_pixel_generator_vtgen_ver_gen ver_gen (
        .clk(clk),
        .ena(vclk_ena),
        .rst(rst),
        .Tsync(Tvsync),
        .Tgdel(Tvgdel),
        .Tgate(Tvgate),
        .Tlen(Tvlen),
        .Sync(vsync),
        .Gate(Vgate),
        .Done(eof)
    );
    assign eol = Hdone;
    assign gate = (Hgate & Vgate);
    assign csync = (hsync | vsync);
    assign blank = ~(gate);
endmodule
module vga_enh_top_pixel_generator_vtgen_hor_gen (
    input logic clk,
    input logic ena,
    input logic rst,
    input logic[7:0] Tsync,
    input logic[7:0] Tgdel,
    input logic[15:0] Tgate,
    input logic[15:0] Tlen,
    output reg Sync,
    output reg Gate,
    output reg Done
);
    reg[15:0] cnt;
    reg[15:0] cnt_len;
    wire logic[16:0] cnt_nxt;
    wire logic[16:0] cnt_len_nxt;
    wire logic cnt_done;
    wire logic cnt_len_done;
    assign cnt_nxt = ({1'b0, cnt} - 17'd1);
    assign cnt_done = cnt_nxt[16];
    assign cnt_len_nxt = ({1'b0, cnt_len} - 17'd1);
    assign cnt_len_done = cnt_len_nxt[16];
    reg[4:0] state;
    always @(posedge clk) begin
        if (rst) begin
            state <= 5'b1;
            cnt <= 16'd0;
            cnt_len <= 16'd0;
            Sync <= 1'b0;
            Gate <= 1'b0;
            Done <= 1'b0;
        end
        else begin
            cnt <= cnt_nxt[15:0];
            cnt_len <= cnt_len_nxt[15:0];
            Done <= 1'b0;
            case (state)  // synopsys full_case parallel_case
                5'b1: begin
                    state <= 5'b10;
                    cnt <= Tsync;
                    cnt_len <= Tlen;
                    Sync <= 1'b1;
                end
                5'b10: begin
                    if (cnt_done) begin
                        state <= 5'b100;
                        cnt <= Tgdel;
                        Sync <= 1'b0;
                    end
                end
                5'b100: begin
                    if (cnt_done) begin
                        state <= 5'b1000;
                        cnt <= Tgate;
                        Gate <= 1'b1;
                    end
                end
                5'b1000: begin
                    if (cnt_done) begin
                        state <= 5'b10000;
                        Gate <= 1'b0;
                    end
                end
                5'b10000: begin
                    if (cnt_len_done) begin
                        state <= 5'b10;
                        cnt <= Tsync;
                        cnt_len <= Tlen;
                        Sync <= 1'b1;
                        Done <= 1'b1;
                    end
                end
            endcase
        end
    end
endmodule


module vga_enh_top_pixel_generator_vtgen_ver_gen (
    input logic clk,
    input logic ena,
    input logic rst,
    input logic[7:0] Tsync,
    input logic[7:0] Tgdel,
    input logic[15:0] Tgate,
    input logic[15:0] Tlen,
    output reg Sync,
    output reg Gate,
    output reg Done
);
    reg[15:0] cnt;
    reg[15:0] cnt_len;
    wire logic[16:0] cnt_nxt;
    wire logic[16:0] cnt_len_nxt;
    wire logic cnt_done;
    wire logic cnt_len_done;
    assign cnt_nxt = ({1'b0, cnt} - 17'd1);
    assign cnt_done = cnt_nxt[16];
    assign cnt_len_nxt = ({1'b0, cnt_len} - 17'd1);
    assign cnt_len_done = cnt_len_nxt[16];
    reg[4:0] state;
    always @(posedge clk) begin
        if (rst) begin
            state <= 5'b1;
            cnt <= 16'd0;
            cnt_len <= 16'd0;
            Sync <= 1'b0;
            Gate <= 1'b0;
            Done <= 1'b0;
        end
        else if (ena) begin
            cnt <= cnt_nxt[15:0];
            cnt_len <= cnt_len_nxt[15:0];
            Done <= 1'b0;
            case (state)  // synopsys full_case parallel_case
                5'b1: begin
                    state <= 5'b10;
                    cnt <= Tsync;
                    cnt_len <= Tlen;
                    Sync <= 1'b1;
                end
                5'b10: begin
                    if (cnt_done) begin
                        state <= 5'b100;
                        cnt <= Tgdel;
                        Sync <= 1'b0;
                    end
                end
                5'b100: begin
                    if (cnt_done) begin
                        state <= 5'b1000;
                        cnt <= Tgate;
                        Gate <= 1'b1;
                    end
                end
                5'b1000: begin
                    if (cnt_done) begin
                        state <= 5'b10000;
                        Gate <= 1'b0;
                    end
                end
                5'b10000: begin
                    if (cnt_len_done) begin
                        state <= 5'b10;
                        cnt <= Tsync;
                        cnt_len <= Tlen;
                        Sync <= 1'b1;
                        Done <= 1'b1;
                    end
                end
            endcase
        end
    end
endmodule

module vga_enh_top_pixel_generator_color_proc (
    input logic clk,
    input logic srst,
    input logic[31:0] vdat_buffer_di,
    input logic[1:0] ColorDepth,
    input logic PseudoColor,
    input logic vdat_buffer_empty,
    output reg vdat_buffer_rreq,
    input logic rgb_fifo_full,
    output reg rgb_fifo_wreq,
    output reg[7:0] r,
    output reg[7:0] g,
    output reg[7:0] b,
    output reg clut_req,
    input logic clut_ack,
    output reg[7:0] clut_offs,
    input logic[23:0] clut_q
);
    reg[31:0] DataBuffer;
    reg[7:0] Ra;
    reg[7:0] Ga;
    reg[7:0] Ba;
    reg[1:0] colcnt;
    reg RGBbuf_wreq;
    always @(posedge clk) begin
        if (vdat_buffer_rreq) begin
            DataBuffer <= vdat_buffer_di;
        end
    end
    reg[6:0] c_state;
    reg[6:0] nxt_state;
    always @(c_state or vdat_buffer_empty or ColorDepth or PseudoColor or rgb_fifo_full or colcnt or clut_ack) begin
        nxt_state = c_state;
        case (c_state)
            7'b0: begin
                if ((!(vdat_buffer_empty) && !(rgb_fifo_full))) begin
                    nxt_state = 7'b1;
                end
            end
            7'b1: begin
                case (ColorDepth)
                    2'b0: begin
                        if (PseudoColor) begin
                            nxt_state = 7'b100;
                        end
                        else begin
                            nxt_state = 7'b10;
                        end
                    end
                    2'b1: begin
                        nxt_state = 7'b1000;
                    end
                    2'b10: begin
                        nxt_state = 7'b100000;
                    end
                    2'b11: begin
                        nxt_state = 7'b1000000;
                    end
                endcase
            end
            7'b10: begin
                if ((!(rgb_fifo_full) && !(|(colcnt)))) begin
                    if (!(vdat_buffer_empty)) begin
                        nxt_state = 7'b1;
                    end
                    else begin
                        nxt_state = 7'b0;
                    end
                end
            end
            7'b100: begin
                if (!(|(colcnt))) begin
                    if ((!(vdat_buffer_empty) && !(rgb_fifo_full))) begin
                        nxt_state = 7'b1;
                    end
                    else begin
                        nxt_state = 7'b0;
                    end
                end
            end
            7'b1000: begin
                if (!(rgb_fifo_full)) begin
                    nxt_state = 7'b10000;
                end
            end
            7'b10000: begin
                if (!(rgb_fifo_full)) begin
                    if (!(vdat_buffer_empty)) begin
                        nxt_state = 7'b1;
                    end
                    else begin
                        nxt_state = 7'b0;
                    end
                end
            end
            7'b100000: begin
                if (!(rgb_fifo_full)) begin
                    if ((colcnt == 2'b1)) begin
                        nxt_state = 7'b100000;
                    end
                    else if (!(vdat_buffer_empty)) begin
                        nxt_state = 7'b1;
                    end
                    else begin
                        nxt_state = 7'b0;
                    end
                end
            end
            7'b1000000: begin
                if (!(rgb_fifo_full)) begin
                    if (!(vdat_buffer_empty)) begin
                        nxt_state = 7'b1;
                    end
                    else begin
                        nxt_state = 7'b0;
                    end
                end
            end
        endcase
    end
    always @(posedge clk) begin
        if (srst) begin
            c_state <= 7'b0;
        end
        else begin
            c_state <= nxt_state;
        end
    end
    reg iclut_req;
    reg ivdat_buf_rreq;
    reg[7:0] iR;
    reg[7:0] iG;
    reg[7:0] iB;
    reg[7:0] iRa;
    reg[7:0] iGa;
    reg[7:0] iBa;
    always @(c_state or vdat_buffer_empty or colcnt or DataBuffer or rgb_fifo_full or clut_ack or clut_q or Ba or Ga or Ra) begin
        ivdat_buf_rreq = 1'b0;
        RGBbuf_wreq = 1'b0;
        iclut_req = 1'b0;
        iR = 32'd0;
        iG = 32'd0;
        iB = 32'd0;
        iRa = 32'd0;
        iGa = 32'd0;
        iBa = 32'd0;
        case (c_state)
            7'b0: begin
                if (!(rgb_fifo_full)) begin
                    if (!(vdat_buffer_empty)) begin
                        ivdat_buf_rreq = 1'b1;
                    end
                end
                RGBbuf_wreq = clut_ack;
                iR = clut_q[23:16];
                iG = clut_q[15:8];
                iB = clut_q[7:0];
            end
            7'b1: begin
                RGBbuf_wreq = clut_ack;
                iR = clut_q[23:16];
                iG = clut_q[15:8];
                iB = clut_q[7:0];
            end
            7'b10: begin
                if (!(rgb_fifo_full)) begin
                    RGBbuf_wreq = 1'b1;
                    if ((!(vdat_buffer_empty) && !(|(colcnt)))) begin
                        ivdat_buf_rreq = 1'b1;
                    end
                end
                case (colcnt)
                    2'b11: begin
                        iR = DataBuffer[31:24];
                        iG = DataBuffer[31:24];
                        iB = DataBuffer[31:24];
                    end
                    2'b10: begin
                        iR = DataBuffer[23:16];
                        iG = DataBuffer[23:16];
                        iB = DataBuffer[23:16];
                    end
                    2'b1: begin
                        iR = DataBuffer[15:8];
                        iG = DataBuffer[15:8];
                        iB = DataBuffer[15:8];
                    end
                    default: begin
                        iR = DataBuffer[7:0];
                        iG = DataBuffer[7:0];
                        iB = DataBuffer[7:0];
                    end
                endcase
            end
            7'b100: begin
                if (!(|(colcnt))) begin
                    if ((!(vdat_buffer_empty) && !(rgb_fifo_full))) begin
                        ivdat_buf_rreq = 1'b1;
                    end
                end
                RGBbuf_wreq = clut_ack;
                iR = clut_q[23:16];
                iG = clut_q[15:8];
                iB = clut_q[7:0];
                iclut_req = (!(rgb_fifo_full) || (colcnt[1] ^ colcnt[0]));
            end
            7'b1000: begin
                if (!(rgb_fifo_full)) begin
                    RGBbuf_wreq = 1'b1;
                end
                iR[7:3] = DataBuffer[31:27];
                iG[7:2] = DataBuffer[26:21];
                iB[7:3] = DataBuffer[20:16];
            end
            7'b10000: begin
                if (!(rgb_fifo_full)) begin
                    RGBbuf_wreq = 1'b1;
                    if (!(vdat_buffer_empty)) begin
                        ivdat_buf_rreq = 1'b1;
                    end
                end
                iR[7:3] = DataBuffer[15:11];
                iG[7:2] = DataBuffer[10:5];
                iB[7:3] = DataBuffer[4:0];
            end
            7'b100000: begin
                if (!(rgb_fifo_full)) begin
                    RGBbuf_wreq = 1'b1;
                    if (((colcnt != 2'b1) && !(vdat_buffer_empty))) begin
                        ivdat_buf_rreq = 1'b1;
                    end
                end
                case (colcnt)
                    2'b11: begin
                        iR = DataBuffer[31:24];
                        iG = DataBuffer[23:16];
                        iB = DataBuffer[15:8];
                        iRa = DataBuffer[7:0];
                    end
                    2'b10: begin
                        iR = Ra;
                        iG = DataBuffer[31:24];
                        iB = DataBuffer[23:16];
                        iRa = DataBuffer[15:8];
                        iGa = DataBuffer[7:0];
                    end
                    2'b1: begin
                        iR = Ra;
                        iG = Ga;
                        iB = DataBuffer[31:24];
                        iRa = DataBuffer[23:16];
                        iGa = DataBuffer[15:8];
                        iBa = DataBuffer[7:0];
                    end
                    default: begin
                        iR = Ra;
                        iG = Ga;
                        iB = Ba;
                    end
                endcase
            end
            7'b1000000: begin
                if (!(rgb_fifo_full)) begin
                    RGBbuf_wreq = 1'b1;
                    if (!(vdat_buffer_empty)) begin
                        ivdat_buf_rreq = 1'b1;
                    end
                end
                iR[7:0] = DataBuffer[23:16];
                iG[7:0] = DataBuffer[15:8];
                iB[7:0] = DataBuffer[7:0];
            end
        endcase
    end
    always @(posedge clk) begin
        r <= iR;
        g <= iG;
        b <= iB;
        if (RGBbuf_wreq) begin
            Ra <= iRa;
            Ba <= iBa;
            Ga <= iGa;
        end
        if (srst) begin
            vdat_buffer_rreq <= 1'b0;
            rgb_fifo_wreq <= 1'b0;
            clut_req <= 1'b0;
        end
        else begin
            vdat_buffer_rreq <= ivdat_buf_rreq;
            rgb_fifo_wreq <= RGBbuf_wreq;
            clut_req <= iclut_req;
        end
    end
    always @(colcnt or DataBuffer) begin
        case (colcnt)
            2'b11: begin
                clut_offs = DataBuffer[31:24];
            end
            2'b10: begin
                clut_offs = DataBuffer[23:16];
            end
            2'b1: begin
                clut_offs = DataBuffer[15:8];
            end
            2'b0: begin
                clut_offs = DataBuffer[7:0];
            end
        endcase
    end
    always @(posedge clk) begin
        if (srst) begin
            colcnt <= 2'b11;
        end
        else if (RGBbuf_wreq) begin
            colcnt <= (colcnt - 2'b1);
        end
    end
endmodule

module vga_enh_top_pixel_generator_rgb_fifo (
    input logic clk,
    input logic aclr,
    input logic sclr,
    input logic wreq,
    input logic rreq,
    input logic[24:1] d,
    output logic[24:1] q,
    output reg[4:0] nword,
    output reg empty,
    output reg full,
    output logic aempty,
    output logic afull
);
    reg[4:1] rp;
    reg[4:1] wp;
    wire logic fwreq;
    wire logic frreq;
    function logic lsb(input logic[4:1] q);
        reg [4:1] qx;
        begin
            qx = q;
            case (4)
                2: begin
                    lsb = ~(qx[2]);
                end
                3: begin
                    lsb = (&(q[3:1]));
                end
                4: begin
                    lsb = (&(q[3:1]) ^ ~((qx[4] ^ qx[3])));
                end
                5: begin
                    lsb = (&(q[3:1]));
                end
                6: begin
                    lsb = (&(q[3:1]));
                end
                7: begin
                    lsb = (&(q[3:1]));
                end
                8: begin
                    lsb = (&(q[3:1]));
                end
                9: begin
                    lsb = (&(q[3:1]));
                end
                10: begin
                    lsb = (&(q[3:1]));
                end
                11: begin
                    lsb = (&(q[3:1]));
                end
                12: begin
                    lsb = (&(q[3:1]));
                end
                13: begin
                    lsb = (&(q[3:1]));
                end
                14: begin
                    lsb = (&(q[3:1]));
                end
                15: begin
                    lsb = (&(q[3:1]));
                end
                16: begin
                    lsb = (&(q[3:1]));
                end
            endcase
        end
    endfunction
    assign fwreq = wreq;
    assign frreq = rreq;
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            rp <= 0;
        end
        else if (sclr) begin
            rp <= 0;
        end
        else if (frreq) begin
            rp <= {rp[3:1], lsb(rp)};
        end
    end
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            wp <= 0;
        end
        else if (sclr) begin
            wp <= 0;
        end
        else if (fwreq) begin
            wp <= {wp[3:1], lsb(wp)};
        end
    end
    reg[24:1] mem[15:0];
    always @(posedge clk) begin
        if (fwreq) begin
            mem[wp] <= d;
        end
    end
    assign q = mem[rp];
    assign aempty = ((((rp[3:1] == wp[4:2]) & (lsb(rp) == wp[1])) & frreq) & ~(fwreq));
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            empty <= 1'b1;
        end
        else if (sclr) begin
            empty <= 1'b1;
        end
        else begin
            empty <= (aempty | (empty & (~(fwreq) + frreq)));
        end
    end
    assign afull = ((((wp[3:1] == rp[4:2]))));
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            full <= 1'b0;
        end
        else begin
            full <= (afull);
        end
    end
    always @(posedge clk or negedge aclr) begin
        if (~(aclr)) begin
            nword <= 0;
        end
        else if (sclr) begin
            nword <= 0;
        end
        else begin
            if ((wreq & !(rreq))) begin
                nword <= (nword + 1);
            end
            else if ((rreq & !(wreq))) begin
                nword <= (nword - 1);
            end
        end
    end
endmodule

module vga_enh_top_line_fifo (
    input logic rclk,
    input logic wclk,
    input logic rclr,
    input logic wclr,
    input logic wreq,
    input logic[23:0] d,
    input logic rreq,
    output logic[23:0] q,
    output reg empty,
    output reg full
);
    reg rrst;
    reg wrst;
    reg srclr;
    reg ssrclr;
    reg swclr;
    reg sswclr;
    reg[6:0] rptr;
    reg[6:0] wptr;
    reg[6:0] rptr_gray;
    reg[6:0] wptr_gray;
    function logic[7:1] bin2gray(input logic[7:1] bin);
        integer n;
        begin
            for (n = 1; (n < 7); n = (n + 1)) begin
                bin2gray[n] = ( bin[n]);
            end
            bin2gray[7] = bin[7];
        end
    endfunction
    function logic[7:1] gray2bin(input logic[7:1] gray);
        gray2bin = bin2gray(gray);
    endfunction
    always @(posedge rclk) begin
        swclr <= wclr;
        sswclr <= swclr;
        rrst <= ( sswclr);
    end
    always @(posedge wclk) begin
        srclr <= rclr;
        ssrclr <= 1'b0;
        wrst <= (wclr | 1'b0);
    end
    always @(posedge rclk) begin
        if (rrst) begin
            rptr <= 0;
            rptr_gray <= 0;
        end
        else if (rreq) begin
            rptr <= (rptr + 1'b1);
            rptr_gray <= bin2gray((rptr + 1'b1));
        end
    end
    always @(posedge wclk) begin
        if (wrst) begin
            wptr <= 0;
            wptr_gray <= 0;
        end
        else if (wreq) begin
            wptr <= (wptr + 1'b1);
            wptr_gray <= bin2gray((wptr + 1'b1));
        end
    end
    reg[6:0] srptr_gray;
    reg[6:0] ssrptr_gray;
    reg[6:0] swptr_gray;
    reg[6:0] sswptr_gray;
    always @(posedge rclk) begin
        swptr_gray <= wptr_gray;
        sswptr_gray <= swptr_gray;
    end
    always @(posedge wclk) begin
        srptr_gray <= rptr_gray;
        ssrptr_gray <= srptr_gray;
    end
    always @(posedge rclk) begin
        if (rrst) begin
            empty <= 1'b1;
        end
        else if (rreq) begin
            empty <= (bin2gray((rptr + 1'b1)) == sswptr_gray);
        end
        else begin
            empty <= (empty & (rptr_gray == sswptr_gray));
        end
    end
    always @(posedge wclk) begin
        if (wrst) begin
            full <= 1'b0;
        end
        else if (wreq) begin
            full <= (bin2gray((wptr + 2'b10)) == ssrptr_gray);
        end
        else begin
            full <= (full & (bin2gray((wptr + 2'b1)) == ssrptr_gray));
        end
    end
    vga_enh_top_line_fifo_fifo_dc_mem fifo_dc_mem (
        .rclk(rclk),
        .rrst(1'b0),
        .rce(1'b1),
        .oe(1'b1),
        .raddr(rptr),
        .do_sig(q),
        .wclk(wclk),
        .wrst(1'b0),
        .wce(1'b1),
        .we(wreq),
        .waddr(wptr),
        .di(d)
    );
endmodule
module vga_enh_top_line_fifo_fifo_dc_mem (
    input logic rclk,
    input logic rrst,
    input logic rce,
    input logic oe,
    input logic[6:0] raddr,
    output logic[23:0] do_sig,
    input logic wclk,
    input logic wrst,
    input logic wce,
    input logic we,
    input logic[6:0] waddr,
    input logic[23:0] di
);
    reg[23:0] mem[127:0];
    reg[6:0] ra;
    always @(posedge rclk) begin
        ra <= raddr;
    end
    assign do_sig = mem[ra];
    always @(posedge wclk) begin
        if (we) begin
            mem[waddr] <= di;
        end
    end
endmodule
