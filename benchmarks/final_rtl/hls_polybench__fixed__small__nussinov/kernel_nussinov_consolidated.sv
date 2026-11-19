module kernel_nussinov (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output reg[7:0] seq_address0,
    output reg seq_ce0,
    input logic[7:0] seq_q0,
    output reg[14:0] table_r_address0,
    output reg table_r_ce0,
    output reg table_r_we0,
    output logic[31:0] table_r_d0,
    input logic[31:0] table_r_q0,
    output reg[14:0] table_r_address1,
    output reg table_r_ce1,
    input logic[31:0] table_r_q1
);
    reg[7:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic ap_CS_fsm_state2;
    wire logic[0:0] tmp_fu_173_p3;
    wire logic[14:0] mul_ln17_fu_189_p2;
    reg[14:0] mul_ln17_reg_444;
    wire logic ap_CS_fsm_state3;
    wire logic [7:0] zext_ln17_2_fu_195_p1;
    wire logic[14:0] mul_ln28_fu_212_p2;
    reg[14:0] mul_ln28_reg_456;
    wire logic signed [7:0] sext_ln18_fu_218_p1;
    reg signed [7:0] sext_ln18_reg_462;
    wire logic[14:0] add_ln21_fu_237_p2;
    reg[14:0] add_ln21_reg_470;
    wire logic ap_CS_fsm_state4;
    wire logic[0:0] icmp_ln18_fu_222_p2;
    wire logic[14:0] add_ln23_fu_247_p2;
    reg[14:0] add_ln23_reg_480;
    wire logic[14:0] add_ln28_2_fu_272_p2;
    reg[14:0] add_ln28_2_reg_490;
    wire logic[0:0] icmp_ln27_fu_277_p2;
    reg[0:0] icmp_ln27_reg_495;
    wire logic[8:0] add_ln18_1_fu_282_p2;
    reg[8:0] add_ln18_1_reg_505;
    wire logic ap_CS_fsm_state5;
    wire logic[31:0] select_ln21_fu_329_p3;
    reg[31:0] select_ln21_reg_520;
    wire logic[0:0] icmp_ln28_fu_346_p2;
    reg[0:0] icmp_ln28_reg_526;
    wire logic[31:0] select_ln23_fu_363_p3;
    reg[31:0] select_ln23_reg_531;
    wire logic ap_CS_fsm_state6;
    reg[31:0] table_r_load_3_reg_539;
    wire logic[31:0] add_ln28_1_fu_373_p2;
    reg[31:0] add_ln28_1_reg_545;
    reg[7:0] indvars_iv_load_2_reg_551;
    wire logic ap_CS_fsm_state7;
    wire logic[31:0] select_ln27_fu_411_p3;
    reg[31:0] select_ln27_reg_556;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_done;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_idle;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_ready;
    wire logic[14:0] grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_address0;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_ce0;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_we0;
    wire logic[31:0] grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_d0;
    wire logic[14:0] grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_address1;
    wire logic grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_ce1;
    reg[8:0] j_reg_134;
    wire logic ap_CS_fsm_state8;
    reg grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start_reg;
    wire logic [7:0] zext_ln17_fu_181_p1;
    wire logic [14:0] zext_ln21_1_fu_242_p1;
    wire logic [14:0] zext_ln21_3_fu_267_p1;
    wire logic [7:0] zext_ln18_fu_228_p1;
    wire logic [14:0] zext_ln23_fu_309_p1;
    wire logic [14:0] zext_ln28_2_fu_313_p1;
    reg[7:0] indvars_iv_fu_64;
    wire logic[7:0] add_ln17_1_fu_293_p2;
    reg[8:0] i_fu_68;
    wire logic[8:0] add_ln17_fu_288_p2;
    wire logic [7:0] mul_ln17_fu_189_p0;
    wire logic [7:0] mul_ln17_fu_189_p1;
    wire logic[7:0] trunc_ln17_fu_199_p1;
    wire logic[7:0] add_ln18_fu_202_p2;
    wire logic[7:0] mul_ln28_fu_212_p0;
    wire logic [7:0] mul_ln28_fu_212_p1;
    wire logic [8:0] zext_ln21_fu_233_p1;
    wire logic[8:0] add_ln20_fu_252_p2;
    wire logic [8:0] zext_ln21_2_fu_258_p1;
    wire logic[14:0] add_ln21_1_fu_262_p2;
    wire logic[0:0] icmp_ln21_fu_317_p2;
    wire logic[0:0] xor_ln21_fu_323_p2;
    wire logic signed [7:0] sext_ln28_fu_337_p1;
    wire logic[8:0] add_ln28_fu_341_p2;
    wire logic[0:0] icmp_ln23_fu_352_p2;
    wire logic[0:0] xor_ln23_fu_357_p2;
    wire logic [0:0] zext_ln28_fu_370_p1;
    wire logic[0:0] icmp_ln28_1_fu_379_p2;
    wire logic[0:0] xor_ln28_fu_383_p2;
    wire logic[0:0] icmp_ln30_fu_395_p2;
    wire logic[0:0] xor_ln30_fu_399_p2;
    wire logic[31:0] select_ln28_fu_389_p3;
    wire logic[31:0] select_ln30_fu_405_p3;
    reg[7:0] ap_NS_fsm;
    wire logic [7:0] mul_ln17_fu_189_p00;
    wire logic [7:0] mul_ln28_fu_212_p00;
    initial begin
        ap_CS_fsm = 8'd1;
        grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start_reg = 1'b0;
    end
    kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144 grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start),
        .ap_done(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_done),
        .ap_idle(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_idle),
        .ap_ready(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_ready),
        .select_ln27(select_ln27_reg_556),
        .zext_ln17(indvars_iv_load_2_reg_551),
        .table_r_address0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_address0),
        .table_r_ce0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_ce0),
        .table_r_we0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_we0),
        .table_r_d0(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_d0),
        .table_r_q0(table_r_q0),
        .table_r_address1(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_address1),
        .table_r_ce1(grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_ce1),
        .table_r_q1(table_r_q1),
        .add_ln21(add_ln21_reg_470),
        .mul_ln21(mul_ln17_reg_444),
        .zext_ln18(j_reg_134)
    );
    kernel_nussinov_mul_9ns_9ns_15_1_1_U9 mul_9ns_9ns_15_1_1_U9 (
        .din0({1'b0, mul_ln17_fu_189_p0}),
        .din1({1'b0, mul_ln17_fu_189_p1}),
        .dout(mul_ln17_fu_189_p2)
    );
    kernel_nussinov_mul_8ns_9ns_15_1_1_U10 mul_8ns_9ns_15_1_1_U10 (
        .din0(mul_ln28_fu_212_p0),
        .din1({1'b0, mul_ln28_fu_212_p1}),
        .dout(mul_ln28_fu_212_p2)
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
            grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state7)) begin
                grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_ready == 1'b1)) begin
                grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            i_fu_68 <= 9'd179;
        end
        else if (((icmp_ln18_fu_222_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            i_fu_68 <= add_ln17_fu_288_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            indvars_iv_fu_64 <= 8'd180;
        end
        else if (((icmp_ln18_fu_222_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            indvars_iv_fu_64 <= add_ln17_1_fu_293_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state8) & (grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_done == 1'b1))) begin
            j_reg_134 <= add_ln18_1_reg_505;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            j_reg_134 <= zext_ln17_2_fu_195_p1;
        end
    end
    always @(posedge ap_clk) begin
        if (( (1'b1 == ap_CS_fsm_state4))) begin
            add_ln18_1_reg_505 <= add_ln18_1_fu_282_p2;
            add_ln21_reg_470 <= add_ln21_fu_237_p2;
            add_ln23_reg_480 <= add_ln23_fu_247_p2;
            add_ln28_2_reg_490 <= add_ln28_2_fu_272_p2;
            icmp_ln27_reg_495 <= icmp_ln27_fu_277_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln28_1_reg_545 <= add_ln28_1_fu_373_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            icmp_ln28_reg_526 <= icmp_ln28_fu_346_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            indvars_iv_load_2_reg_551 <= indvars_iv_fu_64;
            select_ln27_reg_556 <= select_ln27_fu_411_p3;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            mul_ln17_reg_444 <= mul_ln17_fu_189_p2;
            mul_ln28_reg_456 <= mul_ln28_fu_212_p2;
            sext_ln18_reg_462 <= sext_ln18_fu_218_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            select_ln21_reg_520 <= select_ln21_fu_329_p3;
        end
    end
    always @(posedge ap_clk) begin begin
            select_ln23_reg_531 <= select_ln23_fu_363_p3;
            table_r_load_3_reg_539 <= table_r_q0;
        end
    end
    always @* begin
        if (((tmp_fu_173_p3 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
        if (((tmp_fu_173_p3 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            seq_address0 = zext_ln18_fu_228_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            seq_address0 = zext_ln17_fu_181_p1;
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
            table_r_address0 = zext_ln28_2_fu_313_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            table_r_address0 = zext_ln21_3_fu_267_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            table_r_address0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_address0;
        end
        else begin
            table_r_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            table_r_address1 = zext_ln23_fu_309_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            table_r_address1 = zext_ln21_1_fu_242_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            table_r_address1 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_address1;
        end
        else begin
            table_r_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
            table_r_ce0 = 1'b1;
        end
        else begin
            table_r_ce0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_ce0;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state5) | (1'b1 == ap_CS_fsm_state4))) begin
            table_r_ce1 = 1'b1;
        end
        else begin
            table_r_ce1 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_ce1;
        end
    end
    always @* begin begin
            table_r_we0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_we0;
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
                if (((tmp_fu_173_p3 == 1'b1))) begin
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
                if (((icmp_ln18_fu_222_p2 == 1'b1))) begin
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
                if (( (grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_done == 1'b1))) begin
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
    assign add_ln17_1_fu_293_p2 = ($signed(indvars_iv_fu_64) + $signed(8'd255));
    assign add_ln17_fu_288_p2 = ($signed(i_fu_68) + $signed(9'd511));
    assign add_ln18_1_fu_282_p2 = (j_reg_134 + 9'd1);
    assign add_ln18_fu_202_p2 = (trunc_ln17_fu_199_p1 + 8'd1);
    assign add_ln20_fu_252_p2 = ($signed(j_reg_134) + $signed(9'd511));
    assign add_ln21_1_fu_262_p2 = (mul_ln17_reg_444 + zext_ln21_2_fu_258_p1);
    assign add_ln21_fu_237_p2 = (mul_ln17_reg_444 + zext_ln21_fu_233_p1);
    assign add_ln23_fu_247_p2 = (mul_ln28_reg_456 + zext_ln21_fu_233_p1);
    assign add_ln28_1_fu_373_p2 = (table_r_q0 + zext_ln28_fu_370_p1);
    assign add_ln28_2_fu_272_p2 = (mul_ln28_reg_456 + zext_ln21_2_fu_258_p1);
    assign add_ln28_fu_341_p2 = ($signed(sext_ln28_fu_337_p1) + $signed(sext_ln18_reg_462));
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
    assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
    assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
    assign grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_ap_start_reg;
    assign icmp_ln18_fu_222_p2 = ((j_reg_134 == 9'd180) ? 1'b1 : 1'b0);
    assign icmp_ln21_fu_317_p2 = (($signed(table_r_q1) < $signed(table_r_q0)) ? 1'b1 : 1'b0);
    assign icmp_ln23_fu_352_p2 = (($signed(select_ln21_reg_520) < $signed(table_r_q1)) ? 1'b1 : 1'b0);
    assign icmp_ln27_fu_277_p2 = ((i_fu_68 < add_ln20_fu_252_p2) ? 1'b1 : 1'b0);
    assign icmp_ln28_1_fu_379_p2 = (($signed(select_ln23_reg_531) < $signed(add_ln28_1_reg_545)) ? 1'b1 : 1'b0);
    assign icmp_ln28_fu_346_p2 = ((add_ln28_fu_341_p2 == 9'd3) ? 1'b1 : 1'b0);
    assign icmp_ln30_fu_395_p2 = (($signed(select_ln23_reg_531) < $signed(table_r_load_3_reg_539)) ? 1'b1 : 1'b0);
    assign mul_ln17_fu_189_p0 = mul_ln17_fu_189_p00;
    assign mul_ln17_fu_189_p00 = i_fu_68;
    assign mul_ln17_fu_189_p1 = 15'd180;
    assign mul_ln28_fu_212_p0 = mul_ln28_fu_212_p00;
    assign mul_ln28_fu_212_p00 = add_ln18_fu_202_p2;
    assign mul_ln28_fu_212_p1 = 15'd180;
    assign select_ln21_fu_329_p3 = ((xor_ln21_fu_323_p2[0:0] == 1'b1) ? table_r_q1 : table_r_q0);
    assign select_ln23_fu_363_p3 = ((xor_ln23_fu_357_p2[0:0] == 1'b1) ? select_ln21_reg_520 : table_r_q1);
    assign select_ln27_fu_411_p3 = ((icmp_ln27_reg_495[0:0] == 1'b1) ? select_ln28_fu_389_p3 : select_ln30_fu_405_p3);
    assign select_ln28_fu_389_p3 = ((xor_ln28_fu_383_p2[0:0] == 1'b1) ? select_ln23_reg_531 : add_ln28_1_reg_545);
    assign select_ln30_fu_405_p3 = ((xor_ln30_fu_399_p2[0:0] == 1'b1) ? select_ln23_reg_531 : table_r_load_3_reg_539);
    assign sext_ln18_fu_218_p1 = $signed(seq_q0);
    assign sext_ln28_fu_337_p1 = $signed(seq_q0);
    assign table_r_d0 = grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_table_r_d0;
    assign tmp_fu_173_p3 = i_fu_68[32'd8];
    assign trunc_ln17_fu_199_p1 = i_fu_68[7:0];
    assign xor_ln21_fu_323_p2 = (icmp_ln21_fu_317_p2 ^ 1'b1);
    assign xor_ln23_fu_357_p2 = (icmp_ln23_fu_352_p2 ^ 1'b1);
    assign xor_ln28_fu_383_p2 = (icmp_ln28_1_fu_379_p2 ^ 1'b1);
    assign xor_ln30_fu_399_p2 = (icmp_ln30_fu_395_p2 ^ 1'b1);
    assign zext_ln17_2_fu_195_p1 = indvars_iv_fu_64;
    assign zext_ln17_fu_181_p1 = i_fu_68;
    assign zext_ln18_fu_228_p1 = j_reg_134;
    assign zext_ln21_1_fu_242_p1 = add_ln21_fu_237_p2;
    assign zext_ln21_2_fu_258_p1 = add_ln20_fu_252_p2;
    assign zext_ln21_3_fu_267_p1 = add_ln21_1_fu_262_p2;
    assign zext_ln21_fu_233_p1 = j_reg_134;
    assign zext_ln23_fu_309_p1 = add_ln23_reg_480;
    assign zext_ln28_2_fu_313_p1 = add_ln28_2_reg_490;
    assign zext_ln28_fu_370_p1 = icmp_ln28_reg_526;
endmodule

module kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[31:0] select_ln27,
    input logic[7:0] zext_ln17,
    output reg[14:0] table_r_address0,
    output reg table_r_ce0,
    output reg table_r_we0,
    output logic[31:0] table_r_d0,
    input logic[31:0] table_r_q0,
    output logic[14:0] table_r_address1,
    output reg table_r_ce1,
    input logic[31:0] table_r_q1,
    input logic[14:0] add_ln21,
    input logic[14:0] mul_ln21,
    input logic[8:0] zext_ln18
);
    reg[3:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    reg ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_idle_pp0;
    wire logic ap_CS_fsm_pp0_stage3;
    wire logic ap_block_pp0_stage3_subdone;
    reg[0:0] icmp_ln33_reg_268;
    reg ap_condition_exit_pp0_iter0_stage3;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic [8:0] zext_ln18_cast1_fu_124_p1;
    reg [9:0] zext_ln18_cast1_reg_248;
    wire logic [14:0] add_ln21_cast_fu_128_p1;
    reg [14:0] add_ln21_cast_reg_253;
    wire logic [8:0] zext_ln18_cast_fu_136_p1;
    reg [8:0] zext_ln18_cast_reg_258;
    wire logic[14:0] add_ln34_2_fu_157_p2;
    reg[14:0] add_ln34_2_reg_263;
    wire logic ap_CS_fsm_pp0_stage1;
    wire logic ap_block_pp0_stage1_11001;
    wire logic[0:0] icmp_ln33_fu_162_p2;
    reg[31:0] p_load_reg_277;
    wire logic ap_block_pp0_stage3_11001;
    reg[14:0] table_r_addr_1_reg_283;
    wire logic[31:0] add_ln34_1_fu_194_p2;
    reg[31:0] add_ln34_1_reg_293;
    reg ap_enable_reg_pp0_iter0_reg;
    wire logic ap_CS_fsm_pp0_stage2;
    wire logic ap_block_pp0_stage2_subdone;
    wire logic ap_block_pp0_stage3;
    wire logic [14:0] zext_ln34_fu_186_p1;
    wire logic [14:0] zext_ln34_1_fu_190_p1;
    wire logic ap_block_pp0_stage0;
    reg [9:0] k_fu_54;
    wire logic [8:0] add_ln34_fu_167_p2;
    wire logic [7:0] zext_ln17_cast_fu_132_p1;
    wire logic ap_loop_init;
    reg[31:0] empty_fu_58;
    wire logic[31:0] select_ln34_fu_210_p3;
    wire logic ap_block_pp0_stage2_11001;
    wire logic [8:0] trunc_ln21_fu_153_p1;
    wire logic signed[14:0] zext_ln34_1_fu_190_p0;
    wire logic[14:0] grp_fu_221_p3;
    wire logic[0:0] icmp_ln34_fu_200_p2;
    wire logic[0:0] xor_ln34_fu_204_p2;
    wire logic signed [9:0] grp_fu_221_p0;
    wire logic[7:0] grp_fu_221_p1;
    wire logic[8:0] grp_fu_221_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg[3:0] ap_NS_fsm;
    wire logic ap_block_pp0_stage0_subdone;
    reg ap_idle_pp0_1to1;
    wire logic ap_block_pp0_stage1_subdone;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 4'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter0_reg = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_mac_muladd_15s_8ns_9ns_15_4_1_U1 mac_muladd_15s_8ns_9ns_15_4_1_U1 (
        .clk(ap_clk),
        .reset(ap_rst),
        .ce(1'b1),
        .din0($signed({{5{grp_fu_221_p0[9]}}, grp_fu_221_p0})),
        .din1(grp_fu_221_p1),
        .din2(grp_fu_221_p2),
        .dout(grp_fu_221_p3)
    );
    kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
        .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage3),
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
            if (((1'b1 == ap_condition_exit_pp0_iter0_stage3) | (((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage2)))) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
                ap_enable_reg_pp0_iter1 <= 1'b1;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0)) & (ap_loop_init == 1'b1))) begin
            empty_fu_58 <= select_ln27;
        end
        else if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            empty_fu_58 <= select_ln34_fu_210_p3;
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (ap_loop_init == 1'b1))) begin
            k_fu_54 <= zext_ln17_cast_fu_132_p1;
        end
        else if (((((icmp_ln33_fu_162_p2 == 1'b1) & (1'b0 == 1'b0)) & (1'b1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            k_fu_54 <= add_ln34_fu_167_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln21_cast_reg_253[14:0] <= add_ln21_cast_fu_128_p1[14:0];
            zext_ln18_cast1_reg_248[8:0] <= zext_ln18_cast1_fu_124_p1[8:0];
            zext_ln18_cast_reg_258[8:0] <= zext_ln18_cast_fu_136_p1[8:0];
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            add_ln34_1_reg_293 <= add_ln34_1_fu_194_p2;
            add_ln34_2_reg_263 <= add_ln34_2_fu_157_p2;
            icmp_ln33_reg_268 <= icmp_ln33_fu_162_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            p_load_reg_277 <= empty_fu_58;
            table_r_addr_1_reg_283 <= zext_ln34_fu_186_p1;
        end
    end
    always @* begin
        if (((((icmp_ln33_reg_268 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_condition_exit_pp0_iter0_stage3 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage3 = 1'b0;
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
            ap_enable_reg_pp0_iter0 = 1'b1;
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
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            table_r_address0 = zext_ln34_1_fu_190_p1;
        end
        else if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            table_r_address0 = add_ln21_cast_reg_253;
        end
        else begin
            table_r_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage3)))) begin
            table_r_ce0 = 1'b1;
        end
        else begin
            table_r_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            table_r_ce1 = 1'b1;
        end
        else begin
            table_r_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
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
    assign add_ln21_cast_fu_128_p1 = add_ln21;
    assign add_ln34_1_fu_194_p2 = (table_r_q0 + table_r_q1);
    assign add_ln34_2_fu_157_p2 = (mul_ln21 + trunc_ln21_fu_153_p1);
    assign add_ln34_fu_167_p2 = (k_fu_54 + 64'h1);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_block_pp0_stage1_11001 = 1'b0;
    assign ap_block_pp0_stage1_subdone = 1'b0;
    assign ap_block_pp0_stage2_11001 = 1'b0;
    assign ap_block_pp0_stage2_subdone = 1'b0;
    assign ap_block_pp0_stage3 = 1'b0;
    assign ap_block_pp0_stage3_11001 = 1'b0;
    assign ap_block_pp0_stage3_subdone = 1'b0;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage3;
    assign grp_fu_221_p0 = {6'b0, add_ln34_fu_167_p2[8:0]};
    assign grp_fu_221_p1 = 15'd180;
    assign grp_fu_221_p2 = zext_ln18_cast_reg_258;
    assign icmp_ln33_fu_162_p2 = (($signed(k_fu_54) < $signed(zext_ln18_cast1_reg_248)) ? 1'b1 : 1'b0);
    assign icmp_ln34_fu_200_p2 = (($signed(p_load_reg_277) < $signed(add_ln34_1_reg_293)) ? 1'b1 : 1'b0);
    assign select_ln34_fu_210_p3 = ((xor_ln34_fu_204_p2[0:0] == 1'b1) ? p_load_reg_277 : add_ln34_1_reg_293);
    assign table_r_address1 = table_r_addr_1_reg_283;
    assign table_r_d0 = empty_fu_58;
    assign trunc_ln21_fu_153_p1 = {5'b0, k_fu_54[9:0]};
    assign xor_ln34_fu_204_p2 = (icmp_ln34_fu_200_p2 ^ 1'b1);
    assign zext_ln17_cast_fu_132_p1 = zext_ln17;
    assign zext_ln18_cast1_fu_124_p1 = zext_ln18;
    assign zext_ln18_cast_fu_136_p1 = zext_ln18;
    assign zext_ln34_1_fu_190_p0 = grp_fu_221_p3;
    assign zext_ln34_1_fu_190_p1 = $unsigned(zext_ln34_1_fu_190_p0);
    assign zext_ln34_fu_186_p1 = add_ln34_2_reg_263;
    always @(posedge ap_clk) begin
        zext_ln18_cast1_reg_248[9:9] <= 55'h0;
        begin end
        begin end
    end
endmodule

module kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_mac_muladd_15s_8ns_9ns_15_4_1_U1 (
    input logic clk,
    input logic reset,
    input logic ce,
    input logic[14:0] din0,
    input logic[7:0] din1,
    input logic[8:0] din2,
    output logic[14:0] dout
);
    kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_mac_muladd_15s_8ns_9ns_15_4_1_U1_kernel_nussinov_mac_muladd_15s_8ns_9ns_15_4_1_DSP48_0_U kernel_nussinov_mac_muladd_15s_8ns_9ns_15_4_1_DSP48_0_U (
        .clk(clk),
        .rst(reset),
        .ce(ce),
        .in0(din0),
        .in1(din1),
        .in2(din2),
        .dout(dout)
    );
endmodule
module kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_mac_muladd_15s_8ns_9ns_15_4_1_U1_kernel_nussinov_mac_muladd_15s_8ns_9ns_15_4_1_DSP48_0_U (
    input logic clk,
    input logic rst,
    input logic ce,
    input logic[14:0] in0,
    input logic[7:0] in1,
    input logic[8:0] in2,
    output logic[14:0] dout
);
    wire logic signed[9:0] a;
    wire logic signed[8:0] b;
    wire logic signed[9:0] c;
    wire logic signed[14:0] m;
    wire logic signed[14:0] p;
    reg signed[14:0] m_reg;
    reg signed[9:0] a_reg;
    reg signed[8:0] b_reg;
    reg signed[14:0] p_reg;
    assign a = $signed(in0);
    assign b = $unsigned(in1);
    assign c = $unsigned(in2);
    assign m = (a_reg * b_reg);
    assign p = (m_reg + c);
    always @(posedge clk) begin
        m_reg <= m;
        a_reg <= a;
        b_reg <= b;
        p_reg <= p;
    end
    assign dout = p_reg;
endmodule

module kernel_nussinov_grp_kernel_nussinov_Pipeline_VITIS_LOOP_33_3_fu_144_flow_control_loop_pipe_sequential_init_U (
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


module kernel_nussinov_mul_9ns_9ns_15_1_1_U9 (
    input logic[8:0] din0,
    input logic[8:0] din1,
    output logic[14:0] dout
);
    wire logic signed[14:0] tmp_product;
    assign tmp_product = ($signed({1'b0, din0}) * $signed({1'b0, din1}));
    assign dout = tmp_product;
endmodule

module kernel_nussinov_mul_8ns_9ns_15_1_1_U10 (
    input logic[7:0] din0,
    input logic[8:0] din1,
    output logic[14:0] dout
);
    wire logic signed[14:0] tmp_product;
    assign tmp_product = ($signed({1'b0, din0}) * $signed({1'b0, din1}));
    assign dout = tmp_product;
endmodule