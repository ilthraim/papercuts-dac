
module sv_chip2_hierarchy_no_mem_h_fltr_4_right (
    input logic tm3_clk_v0,
    input logic vidin_new_data,
    input logic[15:0] vidin_in_f1,
    input logic[15:0] vidin_in_f2,
    input logic[15:0] vidin_in_f3,
    input logic[15:0] vidin_in_h1,
    input logic[15:0] vidin_in_h2,
    input logic[15:0] vidin_in_h3,
    input logic[15:0] vidin_in_h4,
    output reg[15:0] real_z_reg,
    output reg[15:0] imag_z_reg,
    output reg[15:0] real_p_reg,
    output reg[15:0] imag_p_reg,
    output reg[15:0] real_n_reg,
    output reg[15:0] imag_n_reg
);
    wire logic[27:0] vidin_out_temp_f1;
    reg[27:0] vidin_out_reg_f1;
    wire logic my_fir_rdy_f1;
    wire logic[27:0] vidin_out_temp_f2;
    reg[27:0] vidin_out_reg_f2;
    wire logic my_fir_rdy_f2;
    wire logic[27:0] vidin_out_temp_f3;
    reg[27:0] vidin_out_reg_f3;
    wire logic my_fir_rdy_f3;
    wire logic[27:0] vidin_out_temp_h1;
    reg[27:0] vidin_out_reg_h1;
    wire logic my_fir_rdy_h1;
    wire logic[27:0] vidin_out_temp_h2;
    reg[27:0] vidin_out_reg_h2;
    wire logic my_fir_rdy_h2;
    wire logic[27:0] vidin_out_temp_h3;
    reg[27:0] vidin_out_reg_h3;
    wire logic my_fir_rdy_h3;
    wire logic[27:0] vidin_out_temp_h4;
    reg[27:0] vidin_out_reg_h4;
    wire logic my_fir_rdy_h4;
    wire logic[15:0] real_p;
    wire logic[15:0] imag_p;
    wire logic [0:0] real_z;
    wire logic [0:0] imag_z;
    wire logic[15:0] real_n;
    wire logic[15:0] imag_n;
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_your_instance_name_f1 your_instance_name_f1 (
        .clk(tm3_clk_v0),
        .new_data_rdy(vidin_new_data),
        .output_data_ready(my_fir_rdy_f1),
        .din(vidin_in_f2),
        .dout(vidin_out_temp_f1)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_your_instance_name_f2 your_instance_name_f2 (
        .clk(tm3_clk_v0),
        .new_data_rdy(vidin_new_data),
        .output_data_ready(my_fir_rdy_f2),
        .din(vidin_in_f1),
        .dout(vidin_out_temp_f2)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_your_instance_name_f3 your_instance_name_f3 (
        .clk(tm3_clk_v0),
        .new_data_rdy(vidin_new_data),
        .output_data_ready(my_fir_rdy_f3),
        .din(vidin_in_f3),
        .dout(vidin_out_temp_f3)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_your_instance_name_h1 your_instance_name_h1 (
        .clk(tm3_clk_v0),
        .new_data_rdy(vidin_new_data),
        .output_data_ready(my_fir_rdy_h1),
        .din(vidin_in_h2),
        .dout(vidin_out_temp_h1)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_your_instance_name_h2 your_instance_name_h2 (
        .clk(tm3_clk_v0),
        .new_data_rdy(vidin_new_data),
        .output_data_ready(my_fir_rdy_h2),
        .din(vidin_in_h1),
        .dout(vidin_out_temp_h2)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_your_instance_name_h3 your_instance_name_h3 (
        .clk(tm3_clk_v0),
        .new_data_rdy(vidin_new_data),
        .output_data_ready(my_fir_rdy_h3),
        .din(vidin_in_h4),
        .dout(vidin_out_temp_h3)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_your_instance_name_h4 your_instance_name_h4 (
        .clk(tm3_clk_v0),
        .new_data_rdy(vidin_new_data),
        .output_data_ready(my_fir_rdy_h4),
        .din(vidin_in_h3),
        .dout(vidin_out_temp_h4)
    );
    sv_chip2_hierarchy_no_mem_h_fltr_4_right_my_steer_fltr_inst my_steer_fltr_inst (
        .clk(tm3_clk_v0),
        .new_data(vidin_new_data),
        .f1(vidin_out_reg_f1),
        .f2(vidin_out_reg_f2),
        .f3(vidin_out_reg_f3),
        .h1(vidin_out_reg_h1),
        .h2(vidin_out_reg_h2),
        .h3(vidin_out_reg_h3),
        .h4(vidin_out_reg_h4),
        .re_z(real_z),
        .im_z(imag_z),
        .re_p(real_p),
        .im_p(imag_p),
        .re_n(real_n),
        .im_n(imag_n)
    );
    always @(posedge tm3_clk_v0) begin
        if ((my_fir_rdy_f1 == 1'b1)) begin
            vidin_out_reg_f1 <= vidin_out_temp_f1;
        end
        if ((my_fir_rdy_f2 == 1'b1)) begin
            vidin_out_reg_f2 <= vidin_out_temp_f2;
        end
        if ((my_fir_rdy_f3 == 1'b1)) begin
            vidin_out_reg_f3 <= vidin_out_temp_f3;
        end
        if ((my_fir_rdy_h1 == 1'b1)) begin
            vidin_out_reg_h1 <= vidin_out_temp_h1;
        end
        if ((my_fir_rdy_h2 == 1'b1)) begin
            vidin_out_reg_h2 <= vidin_out_temp_h2;
        end
        if ((my_fir_rdy_h3 == 1'b1)) begin
            vidin_out_reg_h3 <= vidin_out_temp_h3;
        end
        if ((my_fir_rdy_h4 == 1'b1)) begin
            vidin_out_reg_h4 <= vidin_out_temp_h4;
        end
    end
    always @(posedge tm3_clk_v0) begin
        real_z_reg <= real_z;
        imag_z_reg <= imag_z;
        real_p_reg <= real_p;
        imag_p_reg <= imag_p;
        real_n_reg <= real_n;
        imag_n_reg <= imag_n;
    end
endmodule