module kernel_nussinov (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output reg[5:0] seq_address0,
    output reg seq_ce0,
    input logic[7:0] seq_q0,
    output reg[11:0] table_r_address0,
    output reg table_r_ce0,
    output reg table_r_we0,
    output logic[31:0] table_r_d0,
    input logic[31:0] table_r_q0,
    output reg[11:0] table_r_address1,
    output reg table_r_ce1,
    input logic[31:0] table_r_q1
);
    reg[7:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic[5:0] trunc_ln17_fu_181_p1;
    reg[5:0] trunc_ln17_reg_475;
    wire logic ap_CS_fsm_state2;
    wire logic[0:0] tmp_4_fu_185_p3;
    wire logic[11:0] sub_ln21_fu_216_p2;
    reg[11:0] sub_ln21_reg_489;
    wire logic ap_CS_fsm_state3;
    wire logic [5:0] zext_ln17_1_fu_222_p1;
    wire logic[11:0] sub_ln23_fu_251_p2;
    reg[11:0] sub_ln23_reg_501;
    wire logic signed [7:0] sext_ln18_fu_257_p1;
    reg signed [7:0] sext_ln18_reg_507;
    wire logic[11:0] add_ln21_fu_276_p2;
    reg[11:0] add_ln21_reg_515;
    wire logic ap_CS_fsm_state4;
    wire logic[0:0] icmp_ln18_fu_261_p2;
    wire logic[11:0] add_ln23_fu_286_p2;
    reg[11:0] add_ln23_reg_525;
    wire logic[11:0] add_ln28_2_fu_311_p2;
    reg[11:0] add_ln28_2_reg_535;
    wire logic[0:0] icmp_ln27_fu_316_p2;
    reg[0:0] icmp_ln27_reg_540;
    wire logic[6:0] add_ln18_1_fu_321_p2;
    reg[6:0] add_ln18_1_reg_550;
    wire logic ap_CS_fsm_state5;
    wire logic[31:0] select_ln21_fu_368_p3;
    reg[31:0] select_ln21_reg_565;
    wire logic[0:0] icmp_ln28_fu_385_p2;
    reg[0:0] icmp_ln28_reg_571;
    wire logic[31:0] select_ln23_fu_402_p3;
    reg[31:0] select_ln23_reg_576;
    wire logic ap_CS_fsm_state6;
    reg[31:0] table_r_load_3_reg_584;
    wire logic[31:0] add_ln28_1_fu_412_p2;
    reg[31:0] add_ln28_1_reg_590;
    reg[5:0] indvars_iv_load_2_reg_596;
    wire logic ap_CS_fsm_state7;
    wire logic[31:0] select_ln27_fu_450_p3;
    reg[31:0] select_ln27_reg_601;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_done;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_idle;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_ready;
    wire logic[11:0] grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_address0;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_ce0;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_we0;
    wire logic[31:0] grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_d0;
    wire logic[11:0] grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_address1;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_ce1;
    reg[6:0] j_reg_142;
    wire logic ap_CS_fsm_state8;
    reg grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start_reg;
    wire logic [5:0] zext_ln17_fu_193_p1;
    wire logic [11:0] zext_ln21_2_fu_281_p1;
    wire logic [11:0] zext_ln21_4_fu_306_p1;
    wire logic [5:0] zext_ln18_fu_267_p1;
    wire logic [11:0] zext_ln23_1_fu_348_p1;
    wire logic [11:0] zext_ln28_1_fu_352_p1;
    reg[5:0] indvars_iv_fu_72;
    wire logic[5:0] add_ln17_1_fu_332_p2;
    reg[6:0] i_fu_76;
    wire logic[6:0] add_ln17_fu_327_p2;
    wire logic [7:0] tmp_1_fu_205_p3;
    wire logic[11:0] tmp_fu_198_p3;
    wire logic [7:0] zext_ln21_fu_212_p1;
    wire logic[5:0] add_ln18_fu_226_p2;
    wire logic[7:0] tmp_3_fu_239_p3;
    wire logic[11:0] tmp_2_fu_231_p3;
    wire logic [7:0] zext_ln23_fu_247_p1;
    wire logic [6:0] zext_ln21_1_fu_272_p1;
    wire logic[6:0] add_ln20_fu_291_p2;
    wire logic [6:0] zext_ln21_3_fu_297_p1;
    wire logic[11:0] add_ln21_1_fu_301_p2;
    wire logic[0:0] icmp_ln21_fu_356_p2;
    wire logic[0:0] xor_ln21_fu_362_p2;
    wire logic signed [7:0] sext_ln28_fu_376_p1;
    wire logic[8:0] add_ln28_fu_380_p2;
    wire logic[0:0] icmp_ln23_fu_391_p2;
    wire logic[0:0] xor_ln23_fu_396_p2;
    wire logic [0:0] zext_ln28_fu_409_p1;
    wire logic[0:0] icmp_ln28_1_fu_418_p2;
    wire logic[0:0] xor_ln28_fu_422_p2;
    wire logic[0:0] icmp_ln30_fu_434_p2;
    wire logic[0:0] xor_ln30_fu_438_p2;
    wire logic[31:0] select_ln28_fu_428_p3;
    wire logic[31:0] select_ln30_fu_444_p3;
    reg[7:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 8'd1;
        grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start_reg = 1'b0;
    end
    kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152 grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start),
        .ap_done(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_done),
        .ap_idle(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_idle),
        .ap_ready(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_ready),
        .select_ln27(select_ln27_reg_601),
        .zext_ln17(indvars_iv_load_2_reg_596),
        .table_r_address0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_address0),
        .table_r_ce0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_ce0),
        .table_r_we0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_we0),
        .table_r_d0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_d0),
        .table_r_q0(table_r_q0),
        .table_r_address1(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_address1),
        .table_r_ce1(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_ce1),
        .table_r_q1(table_r_q1),
        .add_ln21(add_ln21_reg_515),
        .sub_ln21(sub_ln21_reg_489),
        .zext_ln18(j_reg_142)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 8'd1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state7)) begin
                grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_ready == 1'b1)) begin
                grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            i_fu_76 <= 7'b111011;
        end
        else if (((icmp_ln18_fu_261_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            i_fu_76 <= add_ln17_fu_327_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            indvars_iv_fu_72 <= 6'b111100;
        end
        else if (((icmp_ln18_fu_261_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            indvars_iv_fu_72 <= add_ln17_1_fu_332_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state8) & (grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_done == 1'b1))) begin
            j_reg_142 <= add_ln18_1_reg_550;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            j_reg_142 <= zext_ln17_1_fu_222_p1;
        end
    end
    always @(posedge ap_clk) begin
        if (((icmp_ln18_fu_261_p2 == 1'b0))) begin
            add_ln18_1_reg_550 <= add_ln18_1_fu_321_p2;
            add_ln21_reg_515 <= add_ln21_fu_276_p2;
            add_ln23_reg_525 <= add_ln23_fu_286_p2;
            add_ln28_2_reg_535 <= add_ln28_2_fu_311_p2;
            icmp_ln27_reg_540 <= icmp_ln27_fu_316_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln28_1_reg_590 <= add_ln28_1_fu_412_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            icmp_ln28_reg_571 <= icmp_ln28_fu_385_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            indvars_iv_load_2_reg_596 <= indvars_iv_fu_72;
            select_ln27_reg_601 <= select_ln27_fu_450_p3;
        end
    end
    always @(posedge ap_clk) begin begin
            select_ln21_reg_565 <= select_ln21_fu_368_p3;
        end
    end
    always @(posedge ap_clk) begin begin
            select_ln23_reg_576 <= select_ln23_fu_402_p3;
            table_r_load_3_reg_584 <= table_r_q0;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            sext_ln18_reg_507 <= sext_ln18_fu_257_p1;
            sub_ln21_reg_489[11:2] <= sub_ln21_fu_216_p2[11:2];
            sub_ln23_reg_501[11:2] <= sub_ln23_fu_251_p2[11:2];
        end
    end
    always @(posedge ap_clk) begin begin
            trunc_ln17_reg_475 <= trunc_ln17_fu_181_p1;
        end
    end
    always @* begin
        if (((tmp_4_fu_185_p3 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_done = 1'b1;
        end
        else begin
            ap_done = 1'b0;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
            ap_idle = 1'b1;
        end
        else begin
            ap_idle = 1'b0;
        end
    end
    always @* begin
        if (((tmp_4_fu_185_p3 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            seq_address0 = zext_ln18_fu_267_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            seq_address0 = zext_ln17_fu_193_p1;
        end
        else begin
            seq_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state2))) begin
            seq_ce0 = 1'b1;
        end
        else begin
            seq_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            table_r_address0 = zext_ln28_1_fu_352_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            table_r_address0 = zext_ln21_4_fu_306_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            table_r_address0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_address0;
        end
        else begin
            table_r_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            table_r_address1 = zext_ln23_1_fu_348_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            table_r_address1 = zext_ln21_2_fu_281_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            table_r_address1 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_address1;
        end
        else begin
            table_r_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
            table_r_ce0 = 1'b1;
        end
        else begin
            table_r_ce0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_ce0;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state4) | (1'b1 == ap_CS_fsm_state5))) begin
            table_r_ce1 = 1'b1;
        end
        else begin
            table_r_ce1 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_ce1;
        end
    end
    always @* begin begin
            table_r_we0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_we0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            8'd1: begin
                if (( (ap_start == 1'b1))) begin
                    ap_NS_fsm = 8'd2;
                end
                else begin
                    ap_NS_fsm = 8'd1;
                end
            end
            8'd2: begin
                if (((tmp_4_fu_185_p3 == 1'b1))) begin
                    ap_NS_fsm = 8'd1;
                end
                else begin
                    ap_NS_fsm = 8'd4;
                end
            end
            8'd4: begin
                ap_NS_fsm = 8'd8;
            end
            8'd8: begin
                if (((icmp_ln18_fu_261_p2 == 1'b1))) begin
                    ap_NS_fsm = 8'd2;
                end
                else begin
                    ap_NS_fsm = 8'd16;
                end
            end
            8'd16: begin
                ap_NS_fsm = 8'd32;
            end
            8'd32: begin
                ap_NS_fsm = 8'd64;
            end
            8'd64: begin
                ap_NS_fsm = 8'd128;
            end
            8'd128: begin
                if (( (grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_done == 1'b1))) begin
                    ap_NS_fsm = 8'd8;
                end
                else begin
                    ap_NS_fsm = 8'd128;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln17_1_fu_332_p2 = ($signed(indvars_iv_fu_72) + $signed(6'b111111));
    assign add_ln17_fu_327_p2 = ($signed(i_fu_76) + $signed(7'b1111111));
    assign add_ln18_1_fu_321_p2 = (j_reg_142 + 7'b1);
    assign add_ln18_fu_226_p2 = (trunc_ln17_reg_475 + 6'b1);
    assign add_ln20_fu_291_p2 = ($signed(j_reg_142) + $signed(7'b1111111));
    assign add_ln21_1_fu_301_p2 = (sub_ln21_reg_489 + zext_ln21_3_fu_297_p1);
    assign add_ln21_fu_276_p2 = (sub_ln21_reg_489 + zext_ln21_1_fu_272_p1);
    assign add_ln23_fu_286_p2 = (sub_ln23_reg_501 + zext_ln21_1_fu_272_p1);
    assign add_ln28_1_fu_412_p2 = (table_r_q0 + zext_ln28_fu_409_p1);
    assign add_ln28_2_fu_311_p2 = (sub_ln23_reg_501 + zext_ln21_3_fu_297_p1);
    assign add_ln28_fu_380_p2 = ($signed(sext_ln28_fu_376_p1) + $signed(sext_ln18_reg_507));
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
    assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
    assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
    assign grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_ap_start_reg;
    assign icmp_ln18_fu_261_p2 = ((j_reg_142 == 7'b111100) ? 1'b1 : 1'b0);
    assign icmp_ln21_fu_356_p2 = (($signed(table_r_q1) < $signed(table_r_q0)) ? 1'b1 : 1'b0);
    assign icmp_ln23_fu_391_p2 = (($signed(select_ln21_reg_565) < $signed(table_r_q1)) ? 1'b1 : 1'b0);
    assign icmp_ln27_fu_316_p2 = ((i_fu_76 < add_ln20_fu_291_p2) ? 1'b1 : 1'b0);
    assign icmp_ln28_1_fu_418_p2 = (($signed(select_ln23_reg_576) < $signed(add_ln28_1_reg_590)) ? 1'b1 : 1'b0);
    assign icmp_ln28_fu_385_p2 = ((add_ln28_fu_380_p2 == 9'd3) ? 1'b1 : 1'b0);
    assign icmp_ln30_fu_434_p2 = (($signed(select_ln23_reg_576) < $signed(table_r_load_3_reg_584)) ? 1'b1 : 1'b0);
    assign select_ln21_fu_368_p3 = ((xor_ln21_fu_362_p2[0:0] == 1'b1) ? table_r_q1 : table_r_q0);
    assign select_ln23_fu_402_p3 = ((xor_ln23_fu_396_p2[0:0] == 1'b1) ? select_ln21_reg_565 : table_r_q1);
    assign select_ln27_fu_450_p3 = ((icmp_ln27_reg_540[0:0] == 1'b1) ? select_ln28_fu_428_p3 : select_ln30_fu_444_p3);
    assign select_ln28_fu_428_p3 = ((xor_ln28_fu_422_p2[0:0] == 1'b1) ? select_ln23_reg_576 : add_ln28_1_reg_590);
    assign select_ln30_fu_444_p3 = ((xor_ln30_fu_438_p2[0:0] == 1'b1) ? select_ln23_reg_576 : table_r_load_3_reg_584);
    assign sext_ln18_fu_257_p1 = $signed(seq_q0);
    assign sext_ln28_fu_376_p1 = $signed(seq_q0);
    assign sub_ln21_fu_216_p2 = (tmp_fu_198_p3 - zext_ln21_fu_212_p1);
    assign sub_ln23_fu_251_p2 = (tmp_2_fu_231_p3 - zext_ln23_fu_247_p1);
    assign table_r_d0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_table_r_d0;
    assign tmp_1_fu_205_p3 = {{i_fu_76}, 2'b0};
    assign tmp_2_fu_231_p3 = {{add_ln18_fu_226_p2}, 6'b0};
    assign tmp_3_fu_239_p3 = {{add_ln18_fu_226_p2}, 2'b0};
    assign tmp_4_fu_185_p3 = i_fu_76[32'd6];
    assign tmp_fu_198_p3 = {{trunc_ln17_reg_475}, 6'b0};
    assign trunc_ln17_fu_181_p1 = i_fu_76[5:0];
    assign xor_ln21_fu_362_p2 = (icmp_ln21_fu_356_p2 ^ 1'b1);
    assign xor_ln23_fu_396_p2 = (icmp_ln23_fu_391_p2 ^ 1'b1);
    assign xor_ln28_fu_422_p2 = (icmp_ln28_1_fu_418_p2 ^ 1'b1);
    assign xor_ln30_fu_438_p2 = (icmp_ln30_fu_434_p2 ^ 1'b1);
    assign zext_ln17_1_fu_222_p1 = indvars_iv_fu_72;
    assign zext_ln17_fu_193_p1 = i_fu_76;
    assign zext_ln18_fu_267_p1 = j_reg_142;
    assign zext_ln21_1_fu_272_p1 = j_reg_142;
    assign zext_ln21_2_fu_281_p1 = add_ln21_fu_276_p2;
    assign zext_ln21_3_fu_297_p1 = add_ln20_fu_291_p2;
    assign zext_ln21_4_fu_306_p1 = add_ln21_1_fu_301_p2;
    assign zext_ln21_fu_212_p1 = tmp_1_fu_205_p3;
    assign zext_ln23_1_fu_348_p1 = add_ln23_reg_525;
    assign zext_ln23_fu_247_p1 = tmp_3_fu_239_p3;
    assign zext_ln28_1_fu_352_p1 = add_ln28_2_reg_535;
    assign zext_ln28_fu_409_p1 = icmp_ln28_reg_571;
    always @(posedge ap_clk) begin
        sub_ln21_reg_489[1:0] <= 2'b0;
        sub_ln23_reg_501[1:0] <= 2'b0;
    end
endmodule

module kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[31:0] select_ln27,
    input logic[5:0] zext_ln17,
    output reg[11:0] table_r_address0,
    output reg table_r_ce0,
    output reg table_r_we0,
    output logic[31:0] table_r_d0,
    input logic[31:0] table_r_q0,
    output logic[11:0] table_r_address1,
    output reg table_r_ce1,
    input logic[31:0] table_r_q1,
    input logic[11:0] add_ln21,
    input logic[11:0] sub_ln21,
    input logic[6:0] zext_ln18
);
    reg[3:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    reg ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_idle_pp0;
    wire logic ap_CS_fsm_pp0_stage1;
    wire logic ap_block_pp0_stage1_subdone;
    wire logic[0:0] icmp_ln33_fu_177_p2;
    reg ap_condition_exit_pp0_iter0_stage1;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_CS_fsm_pp0_stage3;
    wire logic ap_block_pp0_stage3_subdone;
    wire logic ap_block_pp0_stage0_11001;
    wire logic [6:0] zext_ln18_cast1_fu_130_p1;
    reg [7:0] zext_ln18_cast1_reg_277;
    wire logic [11:0] add_ln21_cast_fu_134_p1;
    reg [11:0] add_ln21_cast_reg_282;
    wire logic [6:0] zext_ln18_cast_fu_142_p1;
    reg [6:0] zext_ln18_cast_reg_287;
    reg[31:0] p_load_reg_292;
    wire logic ap_block_pp0_stage1_11001;
    reg[11:0] table_r_addr_1_reg_298;
    wire logic[5:0] trunc_ln34_fu_188_p1;
    reg[5:0] trunc_ln34_reg_306;
    wire logic [6:0] trunc_ln34_1_fu_192_p1;
    reg [6:0] trunc_ln34_1_reg_311;
    wire logic ap_CS_fsm_pp0_stage2;
    wire logic ap_block_pp0_stage2_11001;
    wire logic[31:0] add_ln34_1_fu_231_p2;
    reg[31:0] add_ln34_1_reg_321;
    wire logic ap_block_pp0_stage3_11001;
    reg ap_enable_reg_pp0_iter0_reg;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic ap_block_pp0_stage1;
    wire logic [11:0] zext_ln34_fu_172_p1;
    wire logic [11:0] zext_ln34_1_fu_226_p1;
    wire logic ap_block_pp0_stage2;
    reg [7:0] k_fu_60;
    wire logic [6:0] add_ln34_fu_182_p2;
    wire logic [5:0] zext_ln17_cast_fu_138_p1;
    wire logic ap_loop_init;
    reg[31:0] empty_fu_64;
    wire logic[31:0] select_ln34_fu_247_p3;
    wire logic [6:0] trunc_ln21_fu_163_p1;
    wire logic[11:0] add_ln34_2_fu_167_p2;
    wire logic[11:0] p_shl4_fu_201_p3;
    wire logic [8:0] p_shl5_fu_208_p3;
    wire logic[11:0] sub_ln34_fu_215_p2;
    wire logic[11:0] add_ln34_3_fu_221_p2;
    wire logic[0:0] icmp_ln34_fu_237_p2;
    wire logic[0:0] xor_ln34_fu_241_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg[3:0] ap_NS_fsm;
    reg ap_idle_pp0_1to1;
    wire logic ap_block_pp0_stage2_subdone;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 4'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter0_reg = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_ready(ap_ready),
        .ap_done(ap_done),
        .ap_start_int(ap_start_int),
        .ap_ready_int(ap_ready_int),
        .ap_done_int(ap_done_int),
        .ap_continue_int(ap_continue_int),
        .ap_loop_init(ap_loop_init),
        .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage1),
        .ap_loop_exit_done(ap_done_int)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 4'b1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_done_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter0_reg <= ap_start_int;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
        else begin
            if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0))) begin
            if ((ap_loop_init == 1'b1)) begin
                empty_fu_64 <= select_ln27;
            end
            else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
                empty_fu_64 <= select_ln34_fu_247_p3;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (ap_loop_init == 1'b1))) begin
            k_fu_60 <= zext_ln17_cast_fu_138_p1;
        end
        else if (((((icmp_ln33_fu_177_p2 == 1'b1) & (1'b0 == 1'b0))) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            k_fu_60 <= add_ln34_fu_182_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln21_cast_reg_282[11:0] <= add_ln21_cast_fu_134_p1[11:0];
            zext_ln18_cast1_reg_277[6:0] <= zext_ln18_cast1_fu_130_p1[6:0];
            zext_ln18_cast_reg_287[6:0] <= zext_ln18_cast_fu_142_p1[6:0];
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln34_1_reg_321 <= add_ln34_1_fu_231_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            p_load_reg_292 <= empty_fu_64;
            table_r_addr_1_reg_298 <= zext_ln34_fu_172_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            trunc_ln34_1_reg_311 <= trunc_ln34_1_fu_192_p1;
            trunc_ln34_reg_306 <= trunc_ln34_fu_188_p1;
        end
    end
    always @* begin
        if (((((icmp_ln33_fu_177_p2 == 1'b0) & (1'b0 == 1'b0))) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b0;
        end
    end
    always @* begin
        if ((((ap_loop_exit_ready == 1'b1) & (1'b0 == 1'b0)))) begin
            ap_done_int = 1'b1;
        end
        else begin
            ap_done_int = 1'b0;
        end
    end
    always @* begin begin
            ap_enable_reg_pp0_iter0 = ap_start_int;
        end
    end
    always @* begin begin
            ap_idle = 1'b0;
        end
    end
    always @* begin begin
            ap_idle_pp0 = 1'b0;
        end
    end
    always @* begin begin
            ap_idle_pp0_1to1 = 1'b1;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
                table_r_address0 = zext_ln34_1_fu_226_p1;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                table_r_address0 = add_ln21_cast_reg_282;
            end
            else begin
                table_r_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        end
        else begin
            table_r_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1)) | (((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage2)))) begin
            table_r_ce0 = 1'b1;
        end
        else begin
            table_r_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            table_r_ce1 = 1'b1;
        end
        else begin
            table_r_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            table_r_we0 = 1'b1;
        end
        else begin
            table_r_we0 = 1'b0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            4'b1: begin
                if ((~(((ap_start_int == 1'b0) & (1'b1 == 1'b1))) & (1'b0 == 1'b0))) begin
                    ap_NS_fsm = 4'b10;
                end
                else begin
                    ap_NS_fsm = 4'b1;
                end
            end
            4'b10: begin begin
                    ap_NS_fsm = 4'b100;
                end
            end
            4'b100: begin begin
                    ap_NS_fsm = 4'b1000;
                end
            end
            4'b1000: begin begin
                    ap_NS_fsm = 4'b1;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln21_cast_fu_134_p1 = add_ln21;
    assign add_ln34_1_fu_231_p2 = (table_r_q0 + table_r_q1);
    assign add_ln34_2_fu_167_p2 = (sub_ln21 + trunc_ln21_fu_163_p1);
    assign add_ln34_3_fu_221_p2 = (sub_ln34_fu_215_p2 + zext_ln18_cast_reg_287);
    assign add_ln34_fu_182_p2 = (k_fu_60 + 64'h1);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_block_pp0_stage1 = 1'b0;
    assign ap_block_pp0_stage1_11001 = 1'b0;
    assign ap_block_pp0_stage1_subdone = 1'b0;
    assign ap_block_pp0_stage2 = 1'b0;
    assign ap_block_pp0_stage2_11001 = 1'b0;
    assign ap_block_pp0_stage2_subdone = 1'b0;
    assign ap_block_pp0_stage3_11001 = 1'b0;
    assign ap_block_pp0_stage3_subdone = 1'b0;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;
    assign icmp_ln33_fu_177_p2 = (($signed(k_fu_60) < $signed(zext_ln18_cast1_reg_277)) ? 1'b1 : 1'b0);
    assign icmp_ln34_fu_237_p2 = (($signed(p_load_reg_292) < $signed(add_ln34_1_reg_321)) ? 1'b1 : 1'b0);
    assign p_shl4_fu_201_p3 = {{trunc_ln34_reg_306}, 6'b0};
    assign p_shl5_fu_208_p3 = {{trunc_ln34_1_reg_311}, 2'b0};
    assign select_ln34_fu_247_p3 = ((xor_ln34_fu_241_p2[0:0] == 1'b1) ? p_load_reg_292 : add_ln34_1_reg_321);
    assign sub_ln34_fu_215_p2 = (p_shl4_fu_201_p3 - p_shl5_fu_208_p3);
    assign table_r_address1 = table_r_addr_1_reg_298;
    assign table_r_d0 = empty_fu_64;
    assign trunc_ln21_fu_163_p1 = {4'b0, k_fu_60[7:0]};
    assign trunc_ln34_1_fu_192_p1 = {3'b0, add_ln34_fu_182_p2[6:0]};
    assign trunc_ln34_fu_188_p1 = add_ln34_fu_182_p2[5:0];
    assign xor_ln34_fu_241_p2 = (icmp_ln34_fu_237_p2 ^ 1'b1);
    assign zext_ln17_cast_fu_138_p1 = zext_ln17;
    assign zext_ln18_cast1_fu_130_p1 = zext_ln18;
    assign zext_ln18_cast_fu_142_p1 = zext_ln18;
    assign zext_ln34_1_fu_226_p1 = add_ln34_3_fu_221_p2;
    assign zext_ln34_fu_172_p1 = add_ln34_2_fu_167_p2;
    always @(posedge ap_clk) begin
        zext_ln18_cast1_reg_277[7:7] <= 57'h0;
        begin end
        begin end
    end
endmodule
module kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_152_flow_control_loop_pipe_sequential_init_U (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_ready,
    output reg ap_done,
    output logic ap_start_int,
    input logic ap_ready_int,
    input logic ap_done_int,
    output logic ap_continue_int,
    output logic ap_loop_init,
    input logic ap_loop_exit_ready,
    input logic ap_loop_exit_done
);
    reg ap_loop_init_int;
    initial begin
        ap_loop_init_int = 1'b1;
    end
    assign ap_start_int = ap_start;
    assign ap_continue_int = 1'b1;
    assign ap_ready = ap_loop_exit_ready;
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_loop_init_int <= 1'b1;
        end
        else if ((ap_loop_exit_done == 1'b1)) begin
            ap_loop_init_int <= 1'b1;
        end
        else if ((ap_ready_int == 1'b1)) begin
            ap_loop_init_int <= 1'b0;
        end
    end
    assign ap_loop_init = (ap_loop_init_int & ap_start);
    always @(posedge ap_clk) begin
    end
    always @* begin
        if (((ap_done_int == 1'b1) || (1'b1 && (ap_start_int == 1'b0)))) begin
            ap_done = 1'b1;
        end
        else begin
            ap_done = 1'b0;
        end
    end
endmodule
