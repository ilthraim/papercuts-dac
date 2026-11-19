
module sv_chip2_hierarchy_no_mem_v_fltr_4_right (
    input logic tm3_clk_v0,
    input logic vidin_new_data,
    input logic[7:0] vidin_in,
    output logic[15:0] vidin_out_f1,
    output logic[15:0] vidin_out_f2,
    output logic[15:0] vidin_out_f3,
    output logic[15:0] vidin_out_h1,
    output logic[15:0] vidin_out_h2,
    output logic[15:0] vidin_out_h3,
    output logic[15:0] vidin_out_h4
);
    wire logic[7:0] buff_out0;
    wire logic[7:0] buff_out1;
    wire logic[7:0] buff_out2;
    wire logic[7:0] buff_out3;
    wire logic[7:0] buff_out4;
    wire logic[7:0] buff_out5;
    wire logic[7:0] buff_out6;
    wire logic[7:0] buff_out7;
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_fifo0 fifo0 (
        .clk(tm3_clk_v0),
        .wen(vidin_new_data),
        .din(buff_out0),
        .dout(buff_out1)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_fifo1 fifo1 (
        .clk(tm3_clk_v0),
        .wen(vidin_new_data),
        .din(buff_out1),
        .dout(buff_out2)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_fifo2 fifo2 (
        .clk(tm3_clk_v0),
        .wen(vidin_new_data),
        .din(buff_out2),
        .dout(buff_out3)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_fifo3 fifo3 (
        .clk(tm3_clk_v0),
        .wen(vidin_new_data),
        .din(buff_out3),
        .dout(buff_out4)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_fifo4 fifo4 (
        .clk(tm3_clk_v0),
        .wen(vidin_new_data),
        .din(buff_out4),
        .dout(buff_out5)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_fifo5 fifo5 (
        .clk(tm3_clk_v0),
        .wen(vidin_new_data),
        .din(buff_out5),
        .dout(buff_out6)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_fifo6 fifo6 (
        .clk(tm3_clk_v0),
        .wen(vidin_new_data),
        .din(buff_out6),
        .dout(buff_out7)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_f1 inst_fltr_compute_f1 (
        .clk(tm3_clk_v0),
        .din({buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}),
        .dout(vidin_out_f1)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_f2 inst_fltr_compute_f2 (
        .clk(tm3_clk_v0),
        .din({buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}),
        .dout(vidin_out_f2)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_f3 inst_fltr_compute_f3 (
        .clk(tm3_clk_v0),
        .din({buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}),
        .dout(vidin_out_f3)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_h1 inst_fltr_compute_h1 (
        .clk(tm3_clk_v0),
        .din({buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}),
        .dout(vidin_out_h1)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_h2 inst_fltr_compute_h2 (
        .clk(tm3_clk_v0),
        .din({buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}),
        .dout(vidin_out_h2)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_h3 inst_fltr_compute_h3 (
        .clk(tm3_clk_v0),
        .din({buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}),
        .dout(vidin_out_h3)
    );
    sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_h4 inst_fltr_compute_h4 (
        .clk(tm3_clk_v0),
        .din({buff_out1, buff_out2, buff_out3, buff_out4, buff_out5, buff_out6, buff_out7}),
        .dout(vidin_out_h4)
    );
    assign buff_out0 = vidin_in;
endmodule