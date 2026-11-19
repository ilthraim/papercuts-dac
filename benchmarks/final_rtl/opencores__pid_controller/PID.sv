module PID #(
    parameter logic signed[31:0] wb_nb = 32,
    parameter logic signed[31:0] adr_wb_nb = 16,
    parameter logic signed[31:0] kp_adr = 0,
    parameter logic signed[31:0] ki_adr = 1,
    parameter logic signed[31:0] kd_adr = 2,
    parameter logic signed[31:0] sp_adr = 3,
    parameter logic signed[31:0] pv_adr = 4,
    parameter logic signed[31:0] kpd_adr = 5,
    parameter logic signed[31:0] err_0_adr = 6,
    parameter logic signed[31:0] err_1_adr = 7,
    parameter logic signed[31:0] un_adr = 8,
    parameter logic signed[31:0] sigma_adr = 9,
    parameter logic signed[31:0] of_adr = 10,
    parameter logic signed[31:0] RS_adr = 11
) (
    input logic i_clk,
    input logic i_rst,
    input logic i_wb_cyc,
    input logic i_wb_stb,
    input logic i_wb_we,
    input logic[15:0] i_wb_adr,
    input logic[31:0] i_wb_data,
    output logic o_wb_ack,
    output logic[31:0] o_wb_data,
    output logic[31:0] o_un,
    output logic o_valid
);
    reg[15:0] kp;
    reg[15:0] ki;
    reg[15:0] kd;
    reg[15:0] sp;
    reg[15:0] pv;
    reg wla;
    reg wlb;
    wire logic wlRS;
    assign wlRS = (wla);
    wire logic[0:7] wl = {{3{wla}}, {2{wlb}}, 3'b0};
    reg wack;
    wire logic[2:0] adr;
    assign adr = i_wb_adr[4:2];
    wire logic[3:0] adr_1;
    assign adr_1 = i_wb_adr[5:2];
    wire logic we;
    assign we = ((i_wb_cyc & i_wb_we) & i_wb_stb);
    wire logic re;
    assign re = ((i_wb_cyc & ~(i_wb_we)));
    reg state_0;
    wire logic adr_check_1;
    assign adr_check_1 = (i_wb_adr[15:6] == 0);
    wire logic adr_check;
    assign adr_check = ((i_wb_adr[5] == 0) && adr_check_1);
    reg RS;
    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state_0 <= 0;
            wack <= 0;
            kp <= 0;
            ki <= 0;
            kd <= 0;
            sp <= 0;
            pv <= 0;
            RS <= 0;
        end
        else begin
            if (( !(i_wb_stb))) begin
                wack <= 0;
            end begin
                RS <= 0;
            end
            case (state_0)
                0: begin
                    if ((we && !(wack))) begin
                        state_0 <= 1;
                    end
                end
                1: begin
                    if (adr_check) begin
                        if (!(wl[adr])) begin
                            wack <= 1;
                            state_0 <= 0;
                            case (adr)
                                0: begin
                                    kp <= i_wb_data[15:0];
                                end
                                1: begin
                                    ki <= i_wb_data[15:0];
                                end
                                2: begin
                                    kd <= i_wb_data[15:0];
                                end
                                3: begin
                                    sp <= i_wb_data[15:0];
                                end
                                4: begin
                                    pv <= i_wb_data[15:0];
                                end
                            endcase
                        end
                    end
                    else if ((((adr_1 == 11) && !(wlRS)) && (i_wb_data == 0))) begin
                        wack <= 1;
                        state_0 <= 0;
                        RS <= 1;
                    end
                    else begin
                        wack <= 1;
                        state_0 <= 0;
                    end
                end
            endcase
        end
    end
    reg[9:0] state_1;
    wire logic update_kpd;
    assign update_kpd = (((wack && ~(adr[2])) && ~(adr[0])) && adr_check);
    wire logic update_esu;
    assign update_esu = ((wack && (adr == 4)) && adr_check);
    reg rla;
    reg rlb;
    reg[4:0] of;
    reg[15:0] kpd;
    reg[15:0] err[0:1];
    wire logic[15:0] mr;
    wire logic[15:0] md;
    reg[31:0] p;
    reg[31:0] a;
    reg[31:0] sigma;
    reg[31:0] un;
    reg cout;
    wire logic cin;
    wire logic[31:0] sum;
    wire logic[31:0] product;
    reg start;
    reg[1:0] mr_index;
    reg [0:0] md_index;
    assign mr = ((mr_index == 1) ? kpd : ((mr_index == 2) ? kd : ki));
    assign md = ( ((md_index == 1) ? err[0] : sum[15:0]));
    wire logic of_addition[0:1];
    assign of_addition[0] = (((p[15] && a[15]) && !(sum[15])) || ((!(p[15]) && !(a[15])) && sum[15]));
    assign of_addition[1] = (((p[31] && a[31]) && !(sum[31])) || ((!(p[31]) && !(a[31])) && sum[31]));
    always @(posedge i_clk or posedge i_rst) begin
        if (i_rst) begin
            state_1 <= 12'd1;
            wla <= 0;
            wlb <= 0;
            rla <= 0;
            rlb <= 0;
            of <= 0;
            kpd <= 0;
            err[0] <= 0;
            err[1] <= 0;
            p <= 0;
            a <= 0;
            sigma <= 0;
            un <= 0;
            start <= 0;
            mr_index <= 0;
            md_index <= 0;
            cout <= 0;
        end
        else begin
            case (state_1)
                10'd1: begin
                    if (update_kpd) begin
                        state_1 <= 10'd2;
                        wla <= 1;
                        rla <= 1;
                    end
                    else if (update_esu) begin
                        state_1 <= 10'd8;
                        wla <= 1;
                        wlb <= 1;
                        rlb <= 1;
                    end
                    else if (RS) begin
                        un <= 0;
                        sigma <= 0;
                        of <= 0;
                        err[0] <= 0;
                    end
                end
                10'd2: begin
                    p <= {{16{kp[15]}}, kp};
                    a <= {{16{kd[15]}}, kd};
                    state_1 <= 10'd4;
                end
                10'd4: begin
                    kpd <= sum[15:0];
                    wla <= 0;
                    rla <= 0;
                    of[0] <= of_addition[0];
                    state_1 <= 10'd1;
                end
                10'd8: begin
                    p <= {{16{sp[15]}}, sp};
                    a <= {{16{~(pv[15])}}, ~(pv)};
                    cout <= 1;
                    start <= 1;
                    state_1 <= 10'd16;
                end
                10'd16: begin
                    err[0] <= sum[15:0];
                    of[1] <= of_addition[0];
                    of[2] <= of[1];
                    p <= {{16{~(err[0][15])}}, ~(err[0])};
                    a <= 32'd1;
                    cout <= 0;
                    mr_index <= 1;
                    md_index <= 1;
                    state_1 <= 10'd32;
                end
                10'd32: begin
                    err[1] <= sum[15:0];
                    mr_index <= 2;
                    md_index <= 2;
                    state_1 <= 10'd64;
                end
                10'd64: begin
                    mr_index <= 0;
                    md_index <= 0;
                    start <= 0;
                    p <= product;
                    a <= sigma;
                    state_1 <= 10'd128;
                end
                10'd128: begin
                    a <= sum;
                    sigma <= sum;
                    of[3] <= (of[4] | of_addition[1]);
                    of[4] <= (of[4] | of_addition[1]);
                    p <= product;
                    state_1 <= 10'd256;
                end
                10'd256: begin
                    a <= sum;
                    of[3] <= (of[3] | of_addition[1]);
                    p <= product;
                    state_1 <= 10'd512;
                end
                10'd512: begin
                    un <= sum;
                    of[3] <= (of[3] | of_addition[1]);
                    state_1 <= 10'd1;
                    wla <= 0;
                    wlb <= 0;
                    rlb <= 0;
                end
            endcase
        end
    end
    wire logic ready;
    PID_multiplier_16x16bit_pipelined multiplier_16x16bit_pipelined (
        .i_clk(i_clk),
        .i_rst(~(i_rst)),
        .i_start(1'b1),
        .i_md(md),
        .i_mr(mr),
        .o_product(product),
        .o_ready(ready)
    );
    PID_adder_32bit_0 adder_32bit_0 (
        .i_a(a),
        .i_b(p),
        .i_c(cout),
        .o_s(sum),
        .o_c(cin)
    );
    wire logic[31:0] rdata[0:15];
    assign rdata[0] = {{16{kp[15]}}, kp};
    assign rdata[1] = {{16{ki[15]}}, ki};
    assign rdata[2] = {{16{kd[15]}}, kd};
    assign rdata[3] = {{16{sp[15]}}, sp};
    assign rdata[4] = {{16{pv[15]}}, pv};
    assign rdata[5] = {{16{kpd[15]}}, kpd};
    assign rdata[6] = {{16{err[0][15]}}, err[0]};
    assign rdata[7] = {{16{err[1][15]}}, err[1]};
    assign rdata[8] = un;
    assign rdata[9] = sigma;
    assign rdata[10] = {27'd0, of};
    assign rdata[11] = 0;
    assign rdata[12] = 0;
    assign rdata[13] = 0;
    assign rdata[14] = 0;
    assign rdata[15] = 0;
    wire logic[0:15] rl;
    assign rl = {5'b0, rla, {4{rlb}}, (rla | rlb), 5'b0};
    wire logic rack;
    assign rack = (((re) & ~(rl[adr_1])) | (re & ~(adr_check_1)));
    assign o_wb_ack = ((wack | rack) & i_wb_stb);
    assign o_wb_data = (adr_check_1 ? rdata[adr_1] : 0);
    assign o_un = un;
    assign o_valid = ~(rlb);
endmodule