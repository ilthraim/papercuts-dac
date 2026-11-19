module sv_chip2_hierarchy_no_mem (
    input logic reset,
    input logic tm3_clk_v0,
    input logic vidin_new_data,
    input logic[7:0] vidin_rgb_reg,
    input logic[18:0] vidin_addr_reg,
    input logic svid_comp_switch,
    output logic[2:0] counter_out_2to1,
    output logic[15:0] bus_word_3_2to1,
    output logic[15:0] bus_word_4_2to1,
    output logic[15:0] bus_word_5_2to1,
    output logic[15:0] bus_word_6_2to1,
    output reg vidin_new_data_fifo,
    output reg[7:0] vidin_rgb_reg_fifo_left,
    output reg[7:0] vidin_rgb_reg_fifo_right,
    output reg[3:0] vidin_addr_reg_2to0,
    input logic v_nd_s1_left_2to0,
    input logic v_nd_s2_left_2to0,
    input logic v_nd_s4_left_2to0,
    input logic[7:0] v_d_reg_s1_left_2to0,
    input logic[7:0] v_d_reg_s2_left_2to0,
    input logic[7:0] v_d_reg_s4_left_2to0,
    input logic v_nd_s1_right_2to0,
    input logic v_nd_s2_right_2to0,
    input logic v_nd_s4_right_2to0,
    input logic[7:0] v_d_reg_s1_right_2to0,
    input logic[7:0] v_d_reg_s2_right_2to0,
    input logic[7:0] v_d_reg_s4_right_2to0,
    input logic[63:0] offchip_sram_data_in,
    output logic[18:0] offchip_sram_addr,
    output logic[63:0] offchip_sram_data_out,
    output logic[7:0] offchip_sram_we,
    output logic[1:0] offchip_sram_oe,
    output reg tm3_sram_adsp
);
    wire logic[63:0] tm3_sram_data_in;
    wire logic[63:0] tm3_sram_data_out;
    reg[63:0] tm3_sram_data_xhdl0;
    reg[18:0] tm3_sram_addr;
    reg[7:0] tm3_sram_we;
    reg[1:0] tm3_sram_oe;
    reg[9:0] horiz;
    reg[9:0] vert;
    reg[63:0] vidin_data_buf_sc_1;
    reg[55:0] vidin_data_buf_2_sc_1;
    reg[18:0] vidin_addr_buf_sc_1;
    reg[13:0] vidin_addr_buf_sc_1_fifo;
    reg video_state;
    reg[63:0] vidout_buf_fifo_1_left;
    reg[63:0] vidout_buf_fifo_1_right;
    reg[7:0] vidin_rgb_reg_tmp;
    reg[7:0] vidin_data_buf_fifo_sc_1_l;
    reg[7:0] vidin_data_buf_fifo_sc_1_r;
    reg[63:0] vidout_buf_fifo_2_1_left;
    reg[63:0] vidout_buf_fifo_2_1_right;
    reg [16:0] vidin_addr_reg_reg;
    reg v_nd_s1_left;
    reg v_nd_s1_right;
    reg v_nd_s2_left;
    reg v_nd_s2_right;
    reg v_nd_s4_left;
    reg v_nd_s4_right;
    reg[7:0] v_d_reg_s1_left;
    reg[7:0] v_d_reg_s1_right;
    reg[7:0] v_d_reg_s2_left;
    reg[7:0] v_d_reg_s2_right;
    reg[7:0] v_d_reg_s4_left;
    reg[7:0] v_d_reg_s4_right;
    wire logic[15:0] vidin_v_out_1_f1_left;
    wire logic[15:0] vidin_v_out_1_f2_left;
    wire logic[15:0] vidin_v_out_1_f3_left;
    wire logic[15:0] vidin_v_out_1_h1_left;
    wire logic[15:0] vidin_v_out_1_h2_left;
    wire logic[15:0] vidin_v_out_1_h3_left;
    wire logic[15:0] vidin_v_out_1_h4_left;
    wire logic[15:0] vidin_v_out_2_f1_left;
    wire logic[15:0] vidin_v_out_2_f2_left;
    wire logic[15:0] vidin_v_out_2_f3_left;
    wire logic[15:0] vidin_v_out_2_h1_left;
    wire logic[15:0] vidin_v_out_2_h2_left;
    wire logic[15:0] vidin_v_out_2_h3_left;
    wire logic[15:0] vidin_v_out_2_h4_left;
    wire logic[15:0] vidin_v_out_4_f1_left;
    wire logic[15:0] vidin_v_out_4_f2_left;
    wire logic[15:0] vidin_v_out_4_f3_left;
    wire logic[15:0] vidin_v_out_4_h1_left;
    wire logic[15:0] vidin_v_out_4_h2_left;
    wire logic[15:0] vidin_v_out_4_h3_left;
    wire logic[15:0] vidin_v_out_4_h4_left;
    wire logic[15:0] vidin_v_out_1_f1_right;
    wire logic[15:0] vidin_v_out_1_f2_right;
    wire logic[15:0] vidin_v_out_1_f3_right;
    wire logic[15:0] vidin_v_out_1_h1_right;
    wire logic[15:0] vidin_v_out_1_h2_right;
    wire logic[15:0] vidin_v_out_1_h3_right;
    wire logic[15:0] vidin_v_out_1_h4_right;
    wire logic[15:0] vidin_v_out_2_f1_right;
    wire logic[15:0] vidin_v_out_2_f2_right;
    wire logic[15:0] vidin_v_out_2_f3_right;
    wire logic[15:0] vidin_v_out_2_h1_right;
    wire logic[15:0] vidin_v_out_2_h2_right;
    wire logic[15:0] vidin_v_out_2_h3_right;
    wire logic[15:0] vidin_v_out_2_h4_right;
    wire logic[15:0] vidin_v_out_4_f1_right;
    wire logic[15:0] vidin_v_out_4_f2_right;
    wire logic[15:0] vidin_v_out_4_f3_right;
    wire logic[15:0] vidin_v_out_4_h1_right;
    wire logic[15:0] vidin_v_out_4_h2_right;
    wire logic[15:0] vidin_v_out_4_h3_right;
    wire logic[15:0] vidin_v_out_4_h4_right;
    reg[18:0] vidin_addr_reg_2to3;
    reg svid_comp_switch_2to3;
    wire logic [0:0] real_z_4_left;
    wire logic [0:0] imag_z_4_left;
    wire logic[15:0] real_p_4_left;
    wire logic[15:0] imag_p_4_left;
    wire logic[15:0] real_n_4_left;
    wire logic[15:0] imag_n_4_left;
    wire logic [0:0] real_z_4_right;
    wire logic [0:0] imag_z_4_right;
    wire logic[15:0] real_p_4_right;
    wire logic[15:0] imag_p_4_right;
    wire logic[15:0] real_n_4_right;
    wire logic[15:0] imag_n_4_right;
    wire logic [0:0] real_z_2_left;
    wire logic [0:0] imag_z_2_left;
    wire logic[15:0] real_p_2_left;
    wire logic[15:0] imag_p_2_left;
    wire logic[15:0] real_n_2_left;
    wire logic[15:0] imag_n_2_left;
    wire logic [0:0] real_z_2_right;
    wire logic [0:0] imag_z_2_right;
    wire logic[15:0] real_p_2_right;
    wire logic[15:0] imag_p_2_right;
    wire logic[15:0] real_n_2_right;
    wire logic[15:0] imag_n_2_right;
    wire logic [0:0] real_z_1_left;
    wire logic [0:0] imag_z_1_left;
    wire logic[15:0] real_p_1_left;
    wire logic[15:0] imag_p_1_left;
    wire logic[15:0] real_n_1_left;
    wire logic[15:0] imag_n_1_left;
    wire logic [0:0] real_z_1_right;
    wire logic [0:0] imag_z_1_right;
    wire logic[15:0] real_p_1_right;
    wire logic[15:0] imag_p_1_right;
    wire logic[15:0] real_n_1_right;
    wire logic[15:0] imag_n_1_right;
    assign tm3_sram_data_in = offchip_sram_data_in;
    assign offchip_sram_addr = tm3_sram_addr;
    assign offchip_sram_data_out = tm3_sram_data_out;
    assign offchip_sram_we = tm3_sram_we;
    assign offchip_sram_oe = tm3_sram_oe;
    assign tm3_sram_data_out = tm3_sram_data_xhdl0;
    sv_chip2_hierarchy_no_mem_v_fltr_1_left v_fltr_1_left (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s1_left),
        .vidin_in(v_d_reg_s1_left),
        .vidin_out_f1(vidin_v_out_1_f1_left),
        .vidin_out_f2(vidin_v_out_1_f2_left),
        .vidin_out_f3(vidin_v_out_1_f3_left),
        .vidin_out_h1(vidin_v_out_1_h1_left),
        .vidin_out_h2(vidin_v_out_1_h2_left),
        .vidin_out_h3(vidin_v_out_1_h3_left),
        .vidin_out_h4(vidin_v_out_1_h4_left)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_2_left v_fltr_2_left (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s2_left),
        .vidin_in(v_d_reg_s2_left),
        .vidin_out_f1(vidin_v_out_2_f1_left),
        .vidin_out_f2(vidin_v_out_2_f2_left),
        .vidin_out_f3(vidin_v_out_2_f3_left),
        .vidin_out_h1(vidin_v_out_2_h1_left),
        .vidin_out_h2(vidin_v_out_2_h2_left),
        .vidin_out_h3(vidin_v_out_2_h3_left),
        .vidin_out_h4(vidin_v_out_2_h4_left)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_left v_fltr_4_left (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s4_left),
        .vidin_in(v_d_reg_s4_left),
        .vidin_out_f1(vidin_v_out_4_f1_left),
        .vidin_out_f2(vidin_v_out_4_f2_left),
        .vidin_out_f3(vidin_v_out_4_f3_left),
        .vidin_out_h1(vidin_v_out_4_h1_left),
        .vidin_out_h2(vidin_v_out_4_h2_left),
        .vidin_out_h3(vidin_v_out_4_h3_left),
        .vidin_out_h4(vidin_v_out_4_h4_left)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_1_left h_fltr_1_left (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s1_left),
        .vidin_in_f1(vidin_v_out_1_f1_left),
        .vidin_in_f2(vidin_v_out_1_f2_left),
        .vidin_in_f3(vidin_v_out_1_f3_left),
        .vidin_in_h1(vidin_v_out_1_h1_left),
        .vidin_in_h2(vidin_v_out_1_h2_left),
        .vidin_in_h3(vidin_v_out_1_h3_left),
        .vidin_in_h4(vidin_v_out_1_h4_left),
        .real_z_reg(real_z_1_left),
        .imag_z_reg(imag_z_1_left),
        .real_p_reg(real_p_1_left),
        .imag_p_reg(imag_p_1_left),
        .real_n_reg(real_n_1_left),
        .imag_n_reg(imag_n_1_left)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_2_left h_fltr_2_left (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s2_left),
        .vidin_in_f1(vidin_v_out_2_f1_left),
        .vidin_in_f2(vidin_v_out_2_f2_left),
        .vidin_in_f3(vidin_v_out_2_f3_left),
        .vidin_in_h1(vidin_v_out_2_h1_left),
        .vidin_in_h2(vidin_v_out_2_h2_left),
        .vidin_in_h3(vidin_v_out_2_h3_left),
        .vidin_in_h4(vidin_v_out_2_h4_left),
        .real_z_reg(real_z_2_left),
        .imag_z_reg(imag_z_2_left),
        .real_p_reg(real_p_2_left),
        .imag_p_reg(imag_p_2_left),
        .real_n_reg(real_n_2_left),
        .imag_n_reg(imag_n_2_left)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_left h_fltr_4_left (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s4_left),
        .vidin_in_f1(vidin_v_out_4_f1_left),
        .vidin_in_f2(vidin_v_out_4_f2_left),
        .vidin_in_f3(vidin_v_out_4_f3_left),
        .vidin_in_h1(vidin_v_out_4_h1_left),
        .vidin_in_h2(vidin_v_out_4_h2_left),
        .vidin_in_h3(vidin_v_out_4_h3_left),
        .vidin_in_h4(vidin_v_out_4_h4_left),
        .real_z_reg(real_z_4_left),
        .imag_z_reg(imag_z_4_left),
        .real_p_reg(real_p_4_left),
        .imag_p_reg(imag_p_4_left),
        .real_n_reg(real_n_4_left),
        .imag_n_reg(imag_n_4_left)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_1_right v_fltr_1_right (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s1_right),
        .vidin_in(v_d_reg_s1_right),
        .vidin_out_f1(vidin_v_out_1_f1_right),
        .vidin_out_f2(vidin_v_out_1_f2_right),
        .vidin_out_f3(vidin_v_out_1_f3_right),
        .vidin_out_h1(vidin_v_out_1_h1_right),
        .vidin_out_h2(vidin_v_out_1_h2_right),
        .vidin_out_h3(vidin_v_out_1_h3_right),
        .vidin_out_h4(vidin_v_out_1_h4_right)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_2_right v_fltr_2_right (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s2_right),
        .vidin_in(v_d_reg_s2_right),
        .vidin_out_f1(vidin_v_out_2_f1_right),
        .vidin_out_f2(vidin_v_out_2_f2_right),
        .vidin_out_f3(vidin_v_out_2_f3_right),
        .vidin_out_h1(vidin_v_out_2_h1_right),
        .vidin_out_h2(vidin_v_out_2_h2_right),
        .vidin_out_h3(vidin_v_out_2_h3_right),
        .vidin_out_h4(vidin_v_out_2_h4_right)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right v_fltr_4_right (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s4_right),
        .vidin_in(v_d_reg_s4_right),
        .vidin_out_f1(vidin_v_out_4_f1_right),
        .vidin_out_f2(vidin_v_out_4_f2_right),
        .vidin_out_f3(vidin_v_out_4_f3_right),
        .vidin_out_h1(vidin_v_out_4_h1_right),
        .vidin_out_h2(vidin_v_out_4_h2_right),
        .vidin_out_h3(vidin_v_out_4_h3_right),
        .vidin_out_h4(vidin_v_out_4_h4_right)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_1_right h_fltr_1_right (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s1_right),
        .vidin_in_f1(vidin_v_out_1_f1_right),
        .vidin_in_f2(vidin_v_out_1_f2_right),
        .vidin_in_f3(vidin_v_out_1_f3_right),
        .vidin_in_h1(vidin_v_out_1_h1_right),
        .vidin_in_h2(vidin_v_out_1_h2_right),
        .vidin_in_h3(vidin_v_out_1_h3_right),
        .vidin_in_h4(vidin_v_out_1_h4_right),
        .real_z_reg(real_z_1_right),
        .imag_z_reg(imag_z_1_right),
        .real_p_reg(real_p_1_right),
        .imag_p_reg(imag_p_1_right),
        .real_n_reg(real_n_1_right),
        .imag_n_reg(imag_n_1_right)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_2_right h_fltr_2_right (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s2_right),
        .vidin_in_f1(vidin_v_out_2_f1_right),
        .vidin_in_f2(vidin_v_out_2_f2_right),
        .vidin_in_f3(vidin_v_out_2_f3_right),
        .vidin_in_h1(vidin_v_out_2_h1_right),
        .vidin_in_h2(vidin_v_out_2_h2_right),
        .vidin_in_h3(vidin_v_out_2_h3_right),
        .vidin_in_h4(vidin_v_out_2_h4_right),
        .real_z_reg(real_z_2_right),
        .imag_z_reg(imag_z_2_right),
        .real_p_reg(real_p_2_right),
        .imag_p_reg(imag_p_2_right),
        .real_n_reg(real_n_2_right),
        .imag_n_reg(imag_n_2_right)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right h_fltr_4_right (
        .tm3_clk_v0(tm3_clk_v0),
        .vidin_new_data(v_nd_s4_right),
        .vidin_in_f1(vidin_v_out_4_f1_right),
        .vidin_in_f2(vidin_v_out_4_f2_right),
        .vidin_in_f3(vidin_v_out_4_f3_right),
        .vidin_in_h1(vidin_v_out_4_h1_right),
        .vidin_in_h2(vidin_v_out_4_h2_right),
        .vidin_in_h3(vidin_v_out_4_h3_right),
        .vidin_in_h4(vidin_v_out_4_h4_right),
        .real_z_reg(real_z_4_right),
        .imag_z_reg(imag_z_4_right),
        .real_p_reg(real_p_4_right),
        .imag_p_reg(imag_p_4_right),
        .real_n_reg(real_n_4_right),
        .imag_n_reg(imag_n_4_right)
    );
    sv_chip2_hierarchy_no_mem_port_bus_2to1_inst port_bus_2to1_inst (
        .clk(tm3_clk_v0),
        .vidin_addr_reg(vidin_addr_reg_2to3),
        .svid_comp_switch(svid_comp_switch_2to3),
        .vidin_new_data_scld_1_2to3_left(v_nd_s1_left),
        .vidin_data_reg_scld_1_2to3_left_rp(real_p_1_left),
        .vidin_data_reg_scld_1_2to3_left_ip(imag_p_1_left),
        .vidin_data_reg_scld_1_2to3_left_rn(real_n_1_left),
        .vidin_data_reg_scld_1_2to3_left_in(imag_n_1_left),
        .vidin_data_reg_scld_2_2to3_left_rp(real_p_2_left),
        .vidin_data_reg_scld_2_2to3_left_ip(imag_p_2_left),
        .vidin_data_reg_scld_2_2to3_left_rn(real_n_2_left),
        .vidin_data_reg_scld_2_2to3_left_in(imag_n_2_left),
        .vidin_data_reg_scld_4_2to3_left_rp(real_p_4_left),
        .vidin_data_reg_scld_4_2to3_left_ip(imag_p_4_left),
        .vidin_data_reg_scld_4_2to3_left_rn(real_n_4_left),
        .vidin_data_reg_scld_4_2to3_left_in(imag_n_4_left),
        .vidin_data_reg_scld_1_2to3_right_rp(real_p_1_right),
        .vidin_data_reg_scld_1_2to3_right_ip(imag_p_1_right),
        .vidin_data_reg_scld_1_2to3_right_rn(real_n_1_right),
        .vidin_data_reg_scld_1_2to3_right_in(imag_n_1_right),
        .vidin_data_reg_scld_2_2to3_right_rp(real_p_2_right),
        .vidin_data_reg_scld_2_2to3_right_ip(imag_p_2_right),
        .vidin_data_reg_scld_2_2to3_right_rn(real_n_2_right),
        .vidin_data_reg_scld_2_2to3_right_in(imag_n_2_right),
        .vidin_data_reg_scld_4_2to3_right_rp(real_p_4_right),
        .vidin_data_reg_scld_4_2to3_right_ip(imag_p_4_right),
        .vidin_data_reg_scld_4_2to3_right_rn(real_n_4_right),
        .vidin_data_reg_scld_4_2to3_right_in(imag_n_4_right),
        .bus_word_3(bus_word_3_2to1),
        .bus_word_4(bus_word_4_2to1),
        .bus_word_5(bus_word_5_2to1),
        .bus_word_6(bus_word_6_2to1),
        .counter_out(counter_out_2to1)
    );
    always @(posedge tm3_clk_v0) begin
        if ((reset == 1'b0)) begin
            video_state <= 1'b0;
            tm3_sram_adsp <= 1'b0;
            horiz <= 10'd0;
            vert <= 10'd0;
        end
        else begin
            video_state <= ~(video_state);
            if ((video_state == 1'b0)) begin
                tm3_sram_data_xhdl0 <= 64'h0;
                if ((horiz == 800)) begin
                    horiz <= 10'd0;
                    if ((vert == 525)) begin
                        vert <= 10'd0;
                    end
                    else begin
                        vert <= (vert + 1);
                    end
                end
                else begin
                    horiz <= (horiz + 1);
                end
                tm3_sram_adsp <= 1'b1;
                tm3_sram_we <= 8'd255;
                case (horiz[2:0])
                    3'b0: begin
                        tm3_sram_oe <= 2'b10;
                    end
                    3'b1: begin
                        tm3_sram_oe <= 2'b11;
                    end
                    3'b10: begin
                        tm3_sram_oe <= 2'b10;
                    end
                    3'b11: begin
                        tm3_sram_oe <= 2'b11;
                    end
                    3'b100: begin
                        tm3_sram_oe <= 2'b11;
                    end
                    3'b101: begin
                        tm3_sram_oe <= 2'b11;
                    end
                    3'b110: begin
                        tm3_sram_oe <= 2'b11;
                    end
                    3'b111: begin
                        tm3_sram_oe <= 2'b11;
                    end
                endcase
            end
            else begin
                tm3_sram_adsp <= 1'b0;
                case (horiz[2:0])
                    3'b0: begin
                        tm3_sram_addr <= {5'b0, vidin_addr_buf_sc_1_fifo};
                        tm3_sram_we <= 8'd255;
                        tm3_sram_oe <= 2'b11;
                        tm3_sram_data_xhdl0 <= 0;
                    end
                    3'b1: begin
                        vidout_buf_fifo_1_left <= tm3_sram_data_in;
                        tm3_sram_addr <= vidin_addr_buf_sc_1;
                        tm3_sram_we <= 8'd255;
                        tm3_sram_oe <= 2'b11;
                        tm3_sram_data_xhdl0 <= vidin_data_buf_sc_1;
                    end
                    3'b10: begin
                        tm3_sram_addr <= {5'b1, vidin_addr_buf_sc_1_fifo};
                        tm3_sram_we <= 8'd255;
                        tm3_sram_oe <= 2'b11;
                        tm3_sram_data_xhdl0 <= 0;
                    end
                    3'b11: begin
                        vidout_buf_fifo_1_right <= tm3_sram_data_in;
                        tm3_sram_addr <= vidin_addr_buf_sc_1;
                        tm3_sram_we <= 8'd255;
                        tm3_sram_oe <= 2'b11;
                        tm3_sram_data_xhdl0 <= vidin_data_buf_sc_1;
                    end
                    3'b100: begin
                        tm3_sram_addr <= {5'b0, vidin_addr_buf_sc_1_fifo};
                        tm3_sram_we <= 8'd255;
                        tm3_sram_oe <= 2'b11;
                        tm3_sram_data_xhdl0 <= 0;
                    end
                    3'b101: begin
                        tm3_sram_addr <= vidin_addr_buf_sc_1;
                        tm3_sram_we <= 8'd255;
                        tm3_sram_oe <= 2'b11;
                        tm3_sram_data_xhdl0 <= vidin_data_buf_sc_1;
                    end
                    3'b110: begin
                        if ((vert[8] == 1'b0)) begin
                            tm3_sram_addr <= {5'b0, vert[7:0], horiz[8:3]};
                            tm3_sram_we <= 8'd255;
                            tm3_sram_oe <= 2'b11;
                            tm3_sram_data_xhdl0 <= 0;
                        end
                        else begin
                            tm3_sram_addr <= {5'b1, vert[7:0], horiz[8:3]};
                            tm3_sram_we <= 8'd255;
                            tm3_sram_oe <= 2'b11;
                            tm3_sram_data_xhdl0 <= 0;
                        end
                    end
                    3'b111: begin
                        tm3_sram_addr <= vidin_addr_buf_sc_1;
                        tm3_sram_we <= 8'd255;
                        tm3_sram_oe <= 2'b11;
                        tm3_sram_data_xhdl0 <= vidin_data_buf_sc_1;
                    end
                endcase
            end
            if ((vidin_new_data_fifo == 1'b1)) begin
                case (vidin_addr_reg_reg[2:0])
                    3'b0: begin
                        vidin_data_buf_2_sc_1[7:0] <= vidin_rgb_reg_tmp;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[7:0];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[7:0];
                    end
                    3'b1: begin
                        vidin_data_buf_2_sc_1[15:8] <= vidin_rgb_reg_tmp;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[15:8];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[15:8];
                    end
                    3'b10: begin
                        vidin_data_buf_2_sc_1[23:16] <= vidin_rgb_reg_tmp;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[23:16];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[23:16];
                    end
                    3'b11: begin
                        vidin_data_buf_2_sc_1[31:24] <= vidin_rgb_reg_tmp;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[31:24];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[31:24];
                    end
                    3'b100: begin
                        vidin_data_buf_2_sc_1[39:32] <= vidin_rgb_reg_tmp;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[39:32];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[39:32];
                    end
                    3'b101: begin
                        vidin_data_buf_2_sc_1[47:40] <= vidin_rgb_reg_tmp;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[47:40];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[47:40];
                    end
                    3'b110: begin
                        vidin_data_buf_2_sc_1[55:48] <= vidin_rgb_reg_tmp;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[55:48];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[55:48];
                    end
                    3'b111: begin
                        vidin_data_buf_sc_1 <= {vidin_rgb_reg_tmp, vidin_data_buf_2_sc_1[55:0]};
                        vidout_buf_fifo_2_1_left <= vidout_buf_fifo_1_left;
                        vidout_buf_fifo_2_1_right <= vidout_buf_fifo_1_right;
                        vidin_data_buf_fifo_sc_1_l <= vidout_buf_fifo_2_1_left[63:56];
                        vidin_data_buf_fifo_sc_1_r <= vidout_buf_fifo_2_1_right[63:56];
                        vidin_addr_buf_sc_1 <= {4'b0, svid_comp_switch, vidin_addr_reg_reg[16:3]};
                        if ((vidin_addr_reg_reg[8:3] == 43)) begin
                            vidin_addr_buf_sc_1_fifo <= {(vidin_addr_reg_reg[16:9] + 8'd1), 6'b0};
                        end
                        else begin
                            if ((vidin_addr_reg_reg[8:3] == 44)) begin
                                vidin_addr_buf_sc_1_fifo <= {(vidin_addr_reg_reg[16:9] + 8'd1), 6'b1};
                            end
                            else begin
                                vidin_addr_buf_sc_1_fifo <= (vidin_addr_reg_reg[16:3] + 2);
                            end
                        end
                    end
                endcase
            end
        end
    end
    always @(posedge tm3_clk_v0) begin
        vidin_rgb_reg_tmp <= vidin_rgb_reg;
        vidin_addr_reg_2to3 <= vidin_addr_reg;
        vidin_addr_reg_reg <= vidin_addr_reg;
        vidin_addr_reg_2to0 <= {vidin_addr_reg[1:0], vidin_addr_reg[10:9]};
        vidin_new_data_fifo <= vidin_new_data;
        svid_comp_switch_2to3 <= svid_comp_switch;
        vidin_rgb_reg_fifo_left <= vidin_data_buf_fifo_sc_1_l;
        vidin_rgb_reg_fifo_right <= vidin_data_buf_fifo_sc_1_r;
        v_nd_s1_left <= v_nd_s1_left_2to0;
        v_nd_s2_left <= v_nd_s2_left_2to0;
        v_nd_s4_left <= v_nd_s4_left_2to0;
        v_d_reg_s1_left <= v_d_reg_s1_left_2to0;
        v_d_reg_s2_left <= v_d_reg_s2_left_2to0;
        v_d_reg_s4_left <= v_d_reg_s4_left_2to0;
        v_nd_s1_right <= v_nd_s1_right_2to0;
        v_nd_s2_right <= v_nd_s2_right_2to0;
        v_nd_s4_right <= v_nd_s4_right_2to0;
        v_d_reg_s1_right <= v_d_reg_s1_right_2to0;
        v_d_reg_s2_right <= v_d_reg_s2_right_2to0;
        v_d_reg_s4_right <= v_d_reg_s4_right_2to0;
    end
endmodule