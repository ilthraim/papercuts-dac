module sv_chip2_hierarchy_no_mem_h_fltr_1_left_my_steer_fltr_inst (
    input logic clk,
    input logic new_data,
    input logic[27:0] f1,
    input logic[27:0] f2,
    input logic[27:0] f3,
    input logic[27:0] h1,
    input logic[27:0] h2,
    input logic[27:0] h3,
    input logic[27:0] h4,
    output reg[15:0] re_z,
    output reg[15:0] im_z,
    output reg[15:0] re_p,
    output reg[15:0] im_p,
    output reg[15:0] re_n,
    output reg[15:0] im_n
);
    reg[27:0] f1_reg;
    reg[27:0] f2_reg;
    reg[27:0] f3_reg;
    reg[27:0] h1_reg;
    reg[27:0] h2_reg;
    reg[27:0] h3_reg;
    reg[27:0] h4_reg;
    reg[28:0] re_p_tmp_1;
    reg[28:0] re_p_tmp_2;
    reg[28:0] re_p_tmp_3;
    reg[28:0] im_p_tmp_1;
    reg[28:0] im_p_tmp_2;
    reg[28:0] im_p_tmp_3;
    reg[28:0] im_p_tmp_4;
    reg[30:0] re_p_tmp;
    reg[30:0] im_p_tmp;
    reg[30:0] re_n_tmp;
    reg[30:0] im_n_tmp;
    always @(posedge clk) begin
        if ((new_data == 1'b1)) begin
            f1_reg <= f1;
            f2_reg <= f2;
            f3_reg <= f3;
            h1_reg <= h1;
            h2_reg <= h2;
            h3_reg <= h3;
            h4_reg <= h4;
        end
    end
    always @(posedge clk) begin
        re_p_tmp_1 <= {f1_reg[27], f1_reg[27], f1_reg[27:1]};
        re_p_tmp_2 <= {f3_reg[27], f3_reg[27:0]};
        re_p_tmp_3 <= {f2_reg[27], f2_reg[27], f2_reg[27:1]};
        im_p_tmp_1 <= ({h1_reg[27], h1_reg[27], h1_reg[27], h1_reg[27:2]} + {h1_reg[27], h1_reg[27], h1_reg[27], h1_reg[27], h1_reg[27:3]});
        im_p_tmp_2 <= ({h4_reg[27], h4_reg} + {h4_reg[27], h4_reg[27], h4_reg[27], h4_reg[27], h4_reg[27], h4_reg[27:4]});
        im_p_tmp_3 <= ({h3_reg[27], h3_reg} + {h3_reg[27], h3_reg[27], h3_reg[27], h3_reg[27], h3_reg[27], h3_reg[27:4]});
        im_p_tmp_4 <= ({h2_reg[27], h2_reg[27], h2_reg[27], h2_reg[27:2]} + {h2_reg[27], h2_reg[27], h2_reg[27], h2_reg[27], h2_reg[27:3]});
        re_p_tmp <= (({re_p_tmp_1[28], re_p_tmp_1[28], re_p_tmp_1} - {re_p_tmp_2[28], re_p_tmp_2[28], re_p_tmp_2}) + {re_p_tmp_3[28], re_p_tmp_3[28], re_p_tmp_3});
        im_p_tmp <= ((({im_p_tmp_1[28], im_p_tmp_1[28], im_p_tmp_1} - {im_p_tmp_2[28], im_p_tmp_2[28], im_p_tmp_2}) + {im_p_tmp_3[28], im_p_tmp_3[28], im_p_tmp_3}) - {im_p_tmp_4[28], im_p_tmp_4[28], im_p_tmp_4});
        re_n_tmp <= (({re_p_tmp_1[28], re_p_tmp_1[28], re_p_tmp_1} + {re_p_tmp_2[28], re_p_tmp_2[28], re_p_tmp_2}) + {re_p_tmp_3[28], re_p_tmp_3[28], re_p_tmp_3});
        im_n_tmp <= ((({im_p_tmp_1[28], im_p_tmp_1[28], im_p_tmp_1} + {im_p_tmp_2[28], im_p_tmp_2[28], im_p_tmp_2}) + {im_p_tmp_3[28], im_p_tmp_3[28], im_p_tmp_3}) + {im_p_tmp_4[28], im_p_tmp_4[28], im_p_tmp_4});
        re_z <= 16'd0;
        im_z <= 16'd0;
        re_p <= re_p_tmp[30:15];
        im_p <= im_p_tmp[30:15];
        re_n <= re_n_tmp[30:15];
        im_n <= im_n_tmp[30:15];
    end
endmodule
