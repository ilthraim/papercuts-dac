module kernel_jacobi_1d (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output reg[4:0] A_address0,
    output reg A_ce0,
    output reg A_we0,
    output logic[31:0] A_d0,
    input logic[31:0] A_q0,
    output reg[4:0] A_address1,
    output reg A_ce1,
    output reg A_we1,
    output logic[31:0] A_d1,
    input logic[31:0] A_q1,
    output reg[4:0] B_address0,
    output reg B_ce0,
    output reg B_we0,
    output logic[31:0] B_d0,
    input logic[31:0] B_q0,
    output reg[4:0] B_address1,
    output reg B_ce1,
    output reg B_we1,
    output logic[31:0] B_d1,
    input logic[31:0] B_q1
);
    reg[3:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    reg[31:0] A_load_reg_112;
    wire logic ap_CS_fsm_state2;
    reg[31:0] A_load_28_reg_117;
    reg[31:0] B_load_reg_122;
    reg[31:0] B_load_1_reg_127;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_done;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_idle;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_ready;
    wire logic[4:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_address0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_ce0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_we0;
    wire logic[31:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_d0;
    wire logic[4:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_address1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_ce1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_we1;
    wire logic[31:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_d1;
    wire logic[4:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_address0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_ce0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_we0;
    wire logic[31:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_d0;
    wire logic[4:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_address1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_ce1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_we1;
    wire logic[31:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_d1;
    reg grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start_reg;
    wire logic ap_CS_fsm_state3;
    wire logic ap_CS_fsm_state4;
    reg[3:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 4'b1;
        grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start_reg = 1'b0;
    end
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80 grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start),
        .ap_done(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_done),
        .ap_idle(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_idle),
        .ap_ready(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_ready),
        .B_address0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_address0),
        .B_ce0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_ce0),
        .B_we0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_we0),
        .B_d0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_d0),
        .B_address1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_address1),
        .B_ce1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_ce1),
        .B_we1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_we1),
        .B_d1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_d1),
        .A_address0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_address0),
        .A_ce0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_ce0),
        .A_we0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_we0),
        .A_d0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_d0),
        .A_q0(A_q0),
        .A_address1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_address1),
        .A_ce1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_ce1),
        .A_we1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_we1),
        .A_d1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_d1),
        .A_q1(A_q1),
        .sext_ln23(A_load_reg_112),
        .sext_ln23_4(A_load_28_reg_117),
        .sext_ln25(B_load_reg_122),
        .sext_ln25_4(B_load_1_reg_127)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 4'b1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state3)) begin
                grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_ready == 1'b1)) begin
                grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            A_load_28_reg_117 <= A_q0;
            A_load_reg_112 <= A_q1;
            B_load_1_reg_127 <= B_q0;
            B_load_reg_122 <= B_q1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            A_address0 = 64'h1d;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            A_address0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_address0;
        end
        else begin
            A_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            A_address1 = 64'h0;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            A_address1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_address1;
        end
        else begin
            A_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            A_ce0 = 1'b1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            A_ce0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_ce0;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            A_ce1 = 1'b1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            A_ce1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_ce1;
        end
        else begin
            A_ce1 = 1'b0;
        end
    end
    always @* begin begin
            A_we0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_we0;
        end
    end
    always @* begin begin
            A_we1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_we1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            B_address0 = 64'h1d;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            B_address0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_address0;
        end
        else begin
            B_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            B_address1 = 64'h0;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            B_address1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_address1;
        end
        else begin
            B_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_ce0;
        end
    end
    always @* begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            B_ce1 = 1'b1;
        end
        else begin
            B_ce1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_ce1;
        end
    end
    always @* begin begin
            B_we0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_we0;
        end
    end
    always @* begin begin
            B_we1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_we1;
        end
    end
    always @* begin
        if (((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_done = 1'b1;
        end
        else begin
            ap_done = 1'b0;
        end
    end
    always @* begin
        if (((ap_start == 1'b0) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_idle = 1'b1;
        end
        else begin
            ap_idle = 1'b0;
        end
    end
    always @* begin
        if (((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            4'b1: begin
                if (((ap_start == 1'b1))) begin
                    ap_NS_fsm = 4'b10;
                end
                else begin
                    ap_NS_fsm = 4'b1;
                end
            end
            4'b10: begin
                ap_NS_fsm = 4'b100;
            end
            4'b100: begin
                ap_NS_fsm = 4'b1000;
            end
            4'b1000: begin
                if (((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_done == 1'b1))) begin
                    ap_NS_fsm = 4'b1;
                end
                else begin
                    ap_NS_fsm = 4'b1000;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign A_d0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_d0;
    assign A_d1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_A_d1;
    assign B_d0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_d0;
    assign B_d1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_B_d1;
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_ap_start_reg;
endmodule

module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output reg[4:0] B_address0,
    output reg B_ce0,
    output reg B_we0,
    output reg[31:0] B_d0,
    output reg[4:0] B_address1,
    output reg B_ce1,
    output reg B_we1,
    output reg[31:0] B_d1,
    output reg[4:0] A_address0,
    output reg A_ce0,
    output reg A_we0,
    output reg[31:0] A_d0,
    input logic[31:0] A_q0,
    output reg[4:0] A_address1,
    output reg A_ce1,
    output reg A_we1,
    output reg[31:0] A_d1,
    input logic[31:0] A_q1,
    input logic[31:0] sext_ln23,
    input logic[31:0] sext_ln23_4,
    input logic[31:0] sext_ln25,
    input logic[31:0] sext_ln25_4
);
    reg[27:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic[0:0] icmp_ln20_fu_747_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_CS_fsm_state28;
    reg signed[31:0] reg_649;
    wire logic ap_CS_fsm_state2;
    wire logic ap_CS_fsm_state3;
    wire logic ap_CS_fsm_state4;
    wire logic ap_CS_fsm_state5;
    wire logic ap_CS_fsm_state6;
    wire logic ap_CS_fsm_state7;
    wire logic ap_CS_fsm_state8;
    wire logic ap_CS_fsm_state9;
    wire logic ap_CS_fsm_state10;
    wire logic ap_CS_fsm_state11;
    wire logic ap_CS_fsm_state12;
    wire logic ap_CS_fsm_state13;
    wire logic ap_CS_fsm_state14;
    wire logic ap_CS_fsm_state15;
    reg signed[31:0] reg_653;
    reg signed[31:0] reg_657;
    wire logic ap_CS_fsm_state18;
    wire logic ap_CS_fsm_state19;
    wire logic ap_CS_fsm_state20;
    wire logic ap_CS_fsm_state22;
    reg signed[31:0] reg_664;
    wire logic ap_CS_fsm_state17;
    wire logic ap_CS_fsm_state21;
    wire logic ap_CS_fsm_state24;
    reg signed[31:0] reg_671;
    reg signed[31:0] reg_677;
    wire logic ap_CS_fsm_state16;
    wire logic ap_CS_fsm_state23;
    reg signed[31:0] reg_683;
    reg[31:0] reg_689;
    reg signed[31:0] reg_695;
    reg[31:0] reg_701;
    reg signed[31:0] reg_707;
    reg[31:0] reg_712;
    reg signed[31:0] reg_718;
    wire logic signed [31:0] sext_ln25_4_cast_fu_723_p1;
    reg signed [31:0] sext_ln25_4_cast_reg_2291;
    wire logic signed [31:0] sext_ln25_cast_fu_727_p1;
    reg signed [31:0] sext_ln25_cast_reg_2296;
    wire logic signed [31:0] sext_ln23_4_cast_fu_731_p1;
    reg signed [31:0] sext_ln23_4_cast_reg_2301;
    wire logic signed [31:0] sext_ln23_cast_fu_735_p1;
    reg signed [31:0] sext_ln23_cast_reg_2306;
    wire logic [1:0] A_addr_26_reg_2581;
    wire logic [0:0] A_addr_27_reg_2586;
    wire logic[33:0] add_ln23_1_fu_781_p2;
    reg[33:0] add_ln23_1_reg_2594;
    wire logic signed [31:0] sext_ln23_5_fu_787_p1;
    reg signed [31:0] sext_ln23_5_reg_2599;
    wire logic[33:0] add_ln23_3_fu_805_p2;
    reg[33:0] add_ln23_3_reg_2604;
    wire logic signed [33:0] sext_ln23_8_fu_811_p1;
    wire logic signed [33:0] sext_ln23_12_fu_815_p1;
    wire logic[33:0] add_ln23_5_fu_836_p2;
    reg[33:0] add_ln23_5_reg_2619;
    wire logic signed [31:0] sext_ln23_13_fu_842_p1;
    reg signed [31:0] sext_ln23_13_reg_2624;
    wire logic[33:0] add_ln23_7_fu_860_p2;
    reg[33:0] add_ln23_7_reg_2629;
    wire logic signed [33:0] sext_ln23_16_fu_866_p1;
    wire logic signed [33:0] sext_ln23_20_fu_870_p1;
    wire logic[33:0] add_ln23_9_fu_891_p2;
    reg[33:0] add_ln23_9_reg_2644;
    wire logic signed [31:0] sext_ln23_21_fu_897_p1;
    reg signed [31:0] sext_ln23_21_reg_2649;
    wire logic[33:0] add_ln23_11_fu_915_p2;
    reg[33:0] add_ln23_11_reg_2654;
    wire logic signed [33:0] sext_ln23_24_fu_921_p1;
    wire logic signed [33:0] sext_ln23_28_fu_925_p1;
    wire logic[33:0] add_ln23_13_fu_946_p2;
    reg[33:0] add_ln23_13_reg_2669;
    wire logic signed [31:0] sext_ln23_29_fu_952_p1;
    reg signed [31:0] sext_ln23_29_reg_2674;
    wire logic[33:0] add_ln23_15_fu_970_p2;
    reg[33:0] add_ln23_15_reg_2679;
    wire logic signed [31:0] sext_ln25_1_fu_976_p1;
    reg signed [31:0] sext_ln25_1_reg_2684;
    wire logic[33:0] add_ln25_1_fu_993_p2;
    reg[33:0] add_ln25_1_reg_2689;
    wire logic signed [33:0] sext_ln23_32_fu_999_p1;
    wire logic signed [33:0] sext_ln23_36_fu_1003_p1;
    wire logic[33:0] add_ln23_17_fu_1024_p2;
    reg[33:0] add_ln23_17_reg_2704;
    wire logic signed [31:0] sext_ln23_37_fu_1030_p1;
    reg signed [31:0] sext_ln23_37_reg_2709;
    wire logic[33:0] add_ln23_19_fu_1048_p2;
    reg[33:0] add_ln23_19_reg_2714;
    wire logic signed [33:0] sext_ln25_8_fu_1054_p1;
    wire logic signed [31:0] sext_ln25_5_fu_1058_p1;
    reg signed [31:0] sext_ln25_5_reg_2724;
    wire logic[33:0] add_ln25_3_fu_1075_p2;
    reg[33:0] add_ln25_3_reg_2729;
    wire logic signed [33:0] sext_ln23_40_fu_1081_p1;
    wire logic signed [33:0] sext_ln23_44_fu_1085_p1;
    wire logic[33:0] add_ln23_21_fu_1106_p2;
    reg[33:0] add_ln23_21_reg_2744;
    wire logic signed [31:0] sext_ln23_45_fu_1112_p1;
    reg signed [31:0] sext_ln23_45_reg_2749;
    wire logic[33:0] add_ln23_23_fu_1130_p2;
    reg[33:0] add_ln23_23_reg_2754;
    wire logic signed [33:0] sext_ln25_12_fu_1136_p1;
    wire logic signed [31:0] sext_ln25_9_fu_1140_p1;
    reg signed [31:0] sext_ln25_9_reg_2764;
    wire logic[33:0] add_ln25_5_fu_1157_p2;
    reg[33:0] add_ln25_5_reg_2769;
    wire logic signed [33:0] sext_ln23_48_fu_1163_p1;
    wire logic signed [33:0] sext_ln23_52_fu_1167_p1;
    wire logic[33:0] add_ln23_25_fu_1188_p2;
    reg[33:0] add_ln23_25_reg_2784;
    wire logic signed [31:0] sext_ln23_53_fu_1194_p1;
    reg signed [31:0] sext_ln23_53_reg_2789;
    wire logic[33:0] add_ln23_27_fu_1212_p2;
    reg[33:0] add_ln23_27_reg_2794;
    wire logic signed [33:0] sext_ln25_16_fu_1218_p1;
    wire logic signed [31:0] sext_ln25_13_fu_1222_p1;
    reg signed [31:0] sext_ln25_13_reg_2804;
    wire logic[33:0] add_ln25_7_fu_1239_p2;
    reg[33:0] add_ln25_7_reg_2809;
    wire logic signed [33:0] sext_ln23_56_fu_1245_p1;
    wire logic signed [33:0] sext_ln23_60_fu_1249_p1;
    wire logic[33:0] add_ln23_29_fu_1270_p2;
    reg[33:0] add_ln23_29_reg_2824;
    wire logic signed [31:0] sext_ln23_61_fu_1276_p1;
    reg signed [31:0] sext_ln23_61_reg_2829;
    wire logic[33:0] add_ln23_31_fu_1294_p2;
    reg[33:0] add_ln23_31_reg_2834;
    wire logic signed [33:0] sext_ln25_20_fu_1300_p1;
    wire logic signed [31:0] sext_ln25_17_fu_1304_p1;
    reg signed [31:0] sext_ln25_17_reg_2844;
    wire logic[33:0] add_ln25_9_fu_1321_p2;
    reg[33:0] add_ln25_9_reg_2849;
    wire logic signed [33:0] sext_ln23_64_fu_1327_p1;
    wire logic signed [33:0] sext_ln23_68_fu_1331_p1;
    wire logic[33:0] add_ln23_33_fu_1352_p2;
    reg[33:0] add_ln23_33_reg_2864;
    wire logic signed [31:0] sext_ln23_69_fu_1358_p1;
    reg signed [31:0] sext_ln23_69_reg_2869;
    wire logic[33:0] add_ln23_35_fu_1376_p2;
    reg[33:0] add_ln23_35_reg_2874;
    reg[31:0] trunc_ln25_3_reg_2879;
    wire logic signed [33:0] sext_ln25_24_fu_1382_p1;
    wire logic signed [31:0] sext_ln25_21_fu_1386_p1;
    reg signed [31:0] sext_ln25_21_reg_2889;
    wire logic[33:0] add_ln25_11_fu_1403_p2;
    reg[33:0] add_ln25_11_reg_2894;
    reg signed[31:0] trunc_ln23_14_reg_2899;
    wire logic signed [33:0] sext_ln23_72_fu_1409_p1;
    wire logic signed [33:0] sext_ln23_76_fu_1413_p1;
    wire logic[33:0] add_ln23_37_fu_1434_p2;
    reg[33:0] add_ln23_37_reg_2916;
    wire logic signed [31:0] sext_ln23_77_fu_1440_p1;
    reg signed [31:0] sext_ln23_77_reg_2921;
    wire logic[33:0] add_ln23_39_fu_1458_p2;
    reg[33:0] add_ln23_39_reg_2926;
    reg[31:0] trunc_ln25_4_reg_2931;
    wire logic signed [33:0] sext_ln25_28_fu_1464_p1;
    wire logic signed [31:0] sext_ln25_25_fu_1468_p1;
    reg signed [31:0] sext_ln25_25_reg_2941;
    wire logic[33:0] add_ln25_13_fu_1485_p2;
    reg[33:0] add_ln25_13_reg_2946;
    reg signed[31:0] trunc_ln23_15_reg_2951;
    wire logic signed [33:0] sext_ln23_80_fu_1491_p1;
    wire logic signed [33:0] sext_ln23_84_fu_1495_p1;
    wire logic[33:0] add_ln23_41_fu_1516_p2;
    reg[33:0] add_ln23_41_reg_2968;
    wire logic signed [31:0] sext_ln23_85_fu_1522_p1;
    reg signed [31:0] sext_ln23_85_reg_2973;
    wire logic[33:0] add_ln23_43_fu_1540_p2;
    reg[33:0] add_ln23_43_reg_2978;
    reg[31:0] trunc_ln25_5_reg_2983;
    wire logic signed [33:0] sext_ln25_32_fu_1546_p1;
    wire logic signed [31:0] sext_ln25_29_fu_1550_p1;
    reg signed [31:0] sext_ln25_29_reg_2993;
    wire logic[33:0] add_ln25_15_fu_1567_p2;
    reg[33:0] add_ln25_15_reg_2998;
    reg signed[31:0] trunc_ln23_18_reg_3003;
    wire logic signed [33:0] sext_ln23_88_fu_1573_p1;
    wire logic signed [33:0] sext_ln23_92_fu_1577_p1;
    wire logic[33:0] add_ln23_45_fu_1598_p2;
    reg[33:0] add_ln23_45_reg_3020;
    wire logic signed [31:0] sext_ln23_93_fu_1604_p1;
    reg signed [31:0] sext_ln23_93_reg_3025;
    wire logic[33:0] add_ln23_47_fu_1622_p2;
    reg[33:0] add_ln23_47_reg_3030;
    reg[31:0] trunc_ln25_6_reg_3035;
    wire logic signed [33:0] sext_ln25_36_fu_1628_p1;
    wire logic signed [31:0] sext_ln25_33_fu_1632_p1;
    reg signed [31:0] sext_ln25_33_reg_3045;
    wire logic[33:0] add_ln25_17_fu_1649_p2;
    reg[33:0] add_ln25_17_reg_3050;
    reg signed[31:0] trunc_ln23_19_reg_3055;
    wire logic signed [33:0] sext_ln23_96_fu_1655_p1;
    wire logic signed [33:0] sext_ln23_100_fu_1659_p1;
    wire logic[33:0] add_ln23_49_fu_1680_p2;
    reg[33:0] add_ln23_49_reg_3072;
    wire logic signed [31:0] sext_ln23_101_fu_1686_p1;
    reg signed [31:0] sext_ln23_101_reg_3077;
    wire logic[33:0] add_ln23_51_fu_1704_p2;
    reg[33:0] add_ln23_51_reg_3082;
    wire logic signed [33:0] sext_ln25_40_fu_1710_p1;
    wire logic signed [31:0] sext_ln25_37_fu_1714_p1;
    reg signed [31:0] sext_ln25_37_reg_3092;
    wire logic[33:0] add_ln25_19_fu_1731_p2;
    reg[33:0] add_ln25_19_reg_3097;
    reg signed[31:0] trunc_ln23_22_reg_3102;
    wire logic signed [33:0] sext_ln23_104_fu_1737_p1;
    wire logic signed [33:0] sext_ln23_108_fu_1741_p1;
    wire logic[33:0] add_ln23_53_fu_1762_p2;
    reg[33:0] add_ln23_53_reg_3119;
    wire logic[33:0] add_ln23_55_fu_1782_p2;
    reg[33:0] add_ln23_55_reg_3124;
    wire logic signed [33:0] sext_ln25_44_fu_1787_p1;
    wire logic signed [31:0] sext_ln25_41_fu_1791_p1;
    reg signed [31:0] sext_ln25_41_reg_3134;
    wire logic[33:0] add_ln25_21_fu_1808_p2;
    reg[33:0] add_ln25_21_reg_3139;
    wire logic signed [33:0] sext_ln23_111_fu_1814_p1;
    wire logic signed [33:0] sext_ln23_112_fu_1818_p1;
    wire logic signed [33:0] sext_ln25_48_fu_1822_p1;
    wire logic[33:0] add_ln25_23_fu_1843_p2;
    reg[33:0] add_ln25_23_reg_3159;
    wire logic[33:0] add_ln25_25_fu_1867_p2;
    reg[33:0] add_ln25_25_reg_3164;
    wire logic signed [31:0] sext_ln25_53_fu_1873_p1;
    reg signed [31:0] sext_ln25_53_reg_3169;
    wire logic[33:0] add_ln25_27_fu_1891_p2;
    reg[33:0] add_ln25_27_reg_3174;
    wire logic signed [33:0] sext_ln25_52_fu_1897_p1;
    wire logic signed [33:0] sext_ln25_56_fu_1901_p1;
    wire logic signed [33:0] sext_ln25_60_fu_1905_p1;
    wire logic[33:0] add_ln25_29_fu_1925_p2;
    reg[33:0] add_ln25_29_reg_3194;
    wire logic[33:0] add_ln25_31_fu_1947_p2;
    reg[33:0] add_ln25_31_reg_3199;
    wire logic signed [31:0] sext_ln25_65_fu_1953_p1;
    reg signed [31:0] sext_ln25_65_reg_3204;
    wire logic[33:0] add_ln25_33_fu_1970_p2;
    reg[33:0] add_ln25_33_reg_3209;
    wire logic signed [33:0] sext_ln25_64_fu_1976_p1;
    wire logic signed [33:0] sext_ln25_68_fu_1980_p1;
    wire logic signed [33:0] sext_ln25_72_fu_1984_p1;
    wire logic[33:0] add_ln25_35_fu_2005_p2;
    reg[33:0] add_ln25_35_reg_3229;
    wire logic[33:0] add_ln25_37_fu_2028_p2;
    reg[33:0] add_ln25_37_reg_3234;
    wire logic[33:0] add_ln25_39_fu_2050_p2;
    reg[33:0] add_ln25_39_reg_3239;
    wire logic[33:0] add_ln25_41_fu_2073_p2;
    reg[33:0] add_ln25_41_reg_3244;
    wire logic[33:0] add_ln25_43_fu_2097_p2;
    reg[33:0] add_ln25_43_reg_3249;
    wire logic[33:0] add_ln25_45_fu_2120_p2;
    reg[33:0] add_ln25_45_reg_3254;
    wire logic[33:0] add_ln25_47_fu_2143_p2;
    reg[33:0] add_ln25_47_reg_3259;
    wire logic[33:0] add_ln25_49_fu_2167_p2;
    reg[33:0] add_ln25_49_reg_3264;
    wire logic[33:0] add_ln25_51_fu_2191_p2;
    reg[33:0] add_ln25_51_reg_3269;
    wire logic[33:0] add_ln25_53_fu_2215_p2;
    reg[33:0] add_ln25_53_reg_3274;
    wire logic[33:0] add_ln25_55_fu_2235_p2;
    reg[33:0] add_ln25_55_reg_3279;
    wire logic signed [33:0] sext_ln25_76_fu_2240_p1;
    wire logic signed [33:0] sext_ln25_80_fu_2244_p1;
    wire logic signed [33:0] sext_ln25_84_fu_2248_p1;
    wire logic signed [33:0] sext_ln25_88_fu_2252_p1;
    wire logic signed [33:0] sext_ln25_92_fu_2256_p1;
    wire logic signed [33:0] sext_ln25_96_fu_2260_p1;
    wire logic signed [33:0] sext_ln25_100_fu_2264_p1;
    wire logic signed [33:0] sext_ln25_104_fu_2268_p1;
    wire logic signed [33:0] sext_ln25_108_fu_2272_p1;
    wire logic signed [33:0] sext_ln25_111_fu_2276_p1;
    wire logic signed [33:0] sext_ln25_112_fu_2280_p1;
    reg[4:0] t_fu_108;
    wire logic[4:0] t_2_fu_753_p2;
    wire logic ap_loop_init;
    reg[4:0] ap_sig_allocacmp_t_1;
    wire logic ap_CS_fsm_state25;
    wire logic ap_CS_fsm_state26;
    wire logic ap_CS_fsm_state27;
    reg signed[33:0] grp_fu_604_p0;
    wire logic [14:0] grp_fu_604_p1;
    reg signed[33:0] grp_fu_609_p0;
    wire logic [14:0] grp_fu_609_p1;
    reg signed[33:0] grp_fu_614_p0;
    wire logic [14:0] grp_fu_614_p1;
    wire logic[47:0] grp_fu_604_p2;
    wire logic[47:0] grp_fu_609_p2;
    wire logic[47:0] grp_fu_614_p2;
    wire logic signed [31:0] sext_ln23_1_fu_764_p1;
    wire logic[32:0] add_ln23_fu_768_p2;
    wire logic signed [32:0] sext_ln23_2_fu_773_p1;
    wire logic signed [31:0] sext_ln23_3_fu_777_p1;
    wire logic[32:0] add_ln23_2_fu_791_p2;
    wire logic signed[31:0] sext_ln23_7_fu_801_p0;
    wire logic signed [32:0] sext_ln23_6_fu_797_p1;
    wire logic signed [31:0] sext_ln23_7_fu_801_p1;
    wire logic signed [31:0] sext_ln23_9_fu_819_p1;
    wire logic[32:0] add_ln23_4_fu_823_p2;
    wire logic signed [32:0] sext_ln23_10_fu_828_p1;
    wire logic signed [31:0] sext_ln23_11_fu_832_p1;
    wire logic[32:0] add_ln23_6_fu_846_p2;
    wire logic signed[31:0] sext_ln23_15_fu_856_p0;
    wire logic signed [32:0] sext_ln23_14_fu_852_p1;
    wire logic signed [31:0] sext_ln23_15_fu_856_p1;
    wire logic signed [31:0] sext_ln23_17_fu_874_p1;
    wire logic[32:0] add_ln23_8_fu_878_p2;
    wire logic signed [32:0] sext_ln23_18_fu_883_p1;
    wire logic signed [31:0] sext_ln23_19_fu_887_p1;
    wire logic[32:0] add_ln23_10_fu_901_p2;
    wire logic signed[31:0] sext_ln23_23_fu_911_p0;
    wire logic signed [32:0] sext_ln23_22_fu_907_p1;
    wire logic signed [31:0] sext_ln23_23_fu_911_p1;
    wire logic signed [31:0] sext_ln23_25_fu_929_p1;
    wire logic[32:0] add_ln23_12_fu_933_p2;
    wire logic signed [32:0] sext_ln23_26_fu_938_p1;
    wire logic signed [31:0] sext_ln23_27_fu_942_p1;
    wire logic[32:0] add_ln23_14_fu_956_p2;
    wire logic signed[31:0] sext_ln23_31_fu_966_p0;
    wire logic signed [32:0] sext_ln23_30_fu_962_p1;
    wire logic signed [31:0] sext_ln23_31_fu_966_p1;
    wire logic[32:0] add_ln25_fu_980_p2;
    wire logic signed [32:0] sext_ln25_2_fu_985_p1;
    wire logic signed [31:0] sext_ln25_3_fu_989_p1;
    wire logic signed [31:0] sext_ln23_33_fu_1007_p1;
    wire logic[32:0] add_ln23_16_fu_1011_p2;
    wire logic signed [32:0] sext_ln23_34_fu_1016_p1;
    wire logic signed [31:0] sext_ln23_35_fu_1020_p1;
    wire logic[32:0] add_ln23_18_fu_1034_p2;
    wire logic signed[31:0] sext_ln23_39_fu_1044_p0;
    wire logic signed [32:0] sext_ln23_38_fu_1040_p1;
    wire logic signed [31:0] sext_ln23_39_fu_1044_p1;
    wire logic[32:0] add_ln25_2_fu_1062_p2;
    wire logic signed [32:0] sext_ln25_6_fu_1067_p1;
    wire logic signed [31:0] sext_ln25_7_fu_1071_p1;
    wire logic signed [31:0] sext_ln23_41_fu_1089_p1;
    wire logic[32:0] add_ln23_20_fu_1093_p2;
    wire logic signed [32:0] sext_ln23_42_fu_1098_p1;
    wire logic signed [31:0] sext_ln23_43_fu_1102_p1;
    wire logic[32:0] add_ln23_22_fu_1116_p2;
    wire logic signed[31:0] sext_ln23_47_fu_1126_p0;
    wire logic signed [32:0] sext_ln23_46_fu_1122_p1;
    wire logic signed [31:0] sext_ln23_47_fu_1126_p1;
    wire logic[32:0] add_ln25_4_fu_1144_p2;
    wire logic signed [32:0] sext_ln25_10_fu_1149_p1;
    wire logic signed [31:0] sext_ln25_11_fu_1153_p1;
    wire logic signed [31:0] sext_ln23_49_fu_1171_p1;
    wire logic[32:0] add_ln23_24_fu_1175_p2;
    wire logic signed [32:0] sext_ln23_50_fu_1180_p1;
    wire logic signed [31:0] sext_ln23_51_fu_1184_p1;
    wire logic[32:0] add_ln23_26_fu_1198_p2;
    wire logic signed[31:0] sext_ln23_55_fu_1208_p0;
    wire logic signed [32:0] sext_ln23_54_fu_1204_p1;
    wire logic signed [31:0] sext_ln23_55_fu_1208_p1;
    wire logic[32:0] add_ln25_6_fu_1226_p2;
    wire logic signed [32:0] sext_ln25_14_fu_1231_p1;
    wire logic signed [31:0] sext_ln25_15_fu_1235_p1;
    wire logic signed [31:0] sext_ln23_57_fu_1253_p1;
    wire logic[32:0] add_ln23_28_fu_1257_p2;
    wire logic signed [32:0] sext_ln23_58_fu_1262_p1;
    wire logic signed [31:0] sext_ln23_59_fu_1266_p1;
    wire logic[32:0] add_ln23_30_fu_1280_p2;
    wire logic signed[31:0] sext_ln23_63_fu_1290_p0;
    wire logic signed [32:0] sext_ln23_62_fu_1286_p1;
    wire logic signed [31:0] sext_ln23_63_fu_1290_p1;
    wire logic[32:0] add_ln25_8_fu_1308_p2;
    wire logic signed [32:0] sext_ln25_18_fu_1313_p1;
    wire logic signed [31:0] sext_ln25_19_fu_1317_p1;
    wire logic signed [31:0] sext_ln23_65_fu_1335_p1;
    wire logic[32:0] add_ln23_32_fu_1339_p2;
    wire logic signed [32:0] sext_ln23_66_fu_1344_p1;
    wire logic signed [31:0] sext_ln23_67_fu_1348_p1;
    wire logic[32:0] add_ln23_34_fu_1362_p2;
    wire logic signed[31:0] sext_ln23_71_fu_1372_p0;
    wire logic signed [32:0] sext_ln23_70_fu_1368_p1;
    wire logic signed [31:0] sext_ln23_71_fu_1372_p1;
    wire logic[32:0] add_ln25_10_fu_1390_p2;
    wire logic signed [32:0] sext_ln25_22_fu_1395_p1;
    wire logic signed [31:0] sext_ln25_23_fu_1399_p1;
    wire logic signed [31:0] sext_ln23_73_fu_1417_p1;
    wire logic[32:0] add_ln23_36_fu_1421_p2;
    wire logic signed [32:0] sext_ln23_74_fu_1426_p1;
    wire logic signed [31:0] sext_ln23_75_fu_1430_p1;
    wire logic[32:0] add_ln23_38_fu_1444_p2;
    wire logic signed[31:0] sext_ln23_79_fu_1454_p0;
    wire logic signed [32:0] sext_ln23_78_fu_1450_p1;
    wire logic signed [31:0] sext_ln23_79_fu_1454_p1;
    wire logic[32:0] add_ln25_12_fu_1472_p2;
    wire logic signed [32:0] sext_ln25_26_fu_1477_p1;
    wire logic signed [31:0] sext_ln25_27_fu_1481_p1;
    wire logic signed [31:0] sext_ln23_81_fu_1499_p1;
    wire logic[32:0] add_ln23_40_fu_1503_p2;
    wire logic signed [32:0] sext_ln23_82_fu_1508_p1;
    wire logic signed [31:0] sext_ln23_83_fu_1512_p1;
    wire logic[32:0] add_ln23_42_fu_1526_p2;
    wire logic signed[31:0] sext_ln23_87_fu_1536_p0;
    wire logic signed [32:0] sext_ln23_86_fu_1532_p1;
    wire logic signed [31:0] sext_ln23_87_fu_1536_p1;
    wire logic[32:0] add_ln25_14_fu_1554_p2;
    wire logic signed [32:0] sext_ln25_30_fu_1559_p1;
    wire logic signed [31:0] sext_ln25_31_fu_1563_p1;
    wire logic signed [31:0] sext_ln23_89_fu_1581_p1;
    wire logic[32:0] add_ln23_44_fu_1585_p2;
    wire logic signed [32:0] sext_ln23_90_fu_1590_p1;
    wire logic signed [31:0] sext_ln23_91_fu_1594_p1;
    wire logic[32:0] add_ln23_46_fu_1608_p2;
    wire logic signed[31:0] sext_ln23_95_fu_1618_p0;
    wire logic signed [32:0] sext_ln23_94_fu_1614_p1;
    wire logic signed [31:0] sext_ln23_95_fu_1618_p1;
    wire logic[32:0] add_ln25_16_fu_1636_p2;
    wire logic signed [32:0] sext_ln25_34_fu_1641_p1;
    wire logic signed [31:0] sext_ln25_35_fu_1645_p1;
    wire logic signed [31:0] sext_ln23_97_fu_1663_p1;
    wire logic[32:0] add_ln23_48_fu_1667_p2;
    wire logic signed [32:0] sext_ln23_98_fu_1672_p1;
    wire logic signed [31:0] sext_ln23_99_fu_1676_p1;
    wire logic[32:0] add_ln23_50_fu_1690_p2;
    wire logic signed[31:0] sext_ln23_103_fu_1700_p0;
    wire logic signed [32:0] sext_ln23_102_fu_1696_p1;
    wire logic signed [31:0] sext_ln23_103_fu_1700_p1;
    wire logic[32:0] add_ln25_18_fu_1718_p2;
    wire logic signed [32:0] sext_ln25_38_fu_1723_p1;
    wire logic signed [31:0] sext_ln25_39_fu_1727_p1;
    wire logic signed [31:0] sext_ln23_105_fu_1745_p1;
    wire logic[32:0] add_ln23_52_fu_1749_p2;
    wire logic signed [32:0] sext_ln23_106_fu_1754_p1;
    wire logic signed [31:0] sext_ln23_107_fu_1758_p1;
    wire logic signed [31:0] sext_ln23_109_fu_1768_p1;
    wire logic[32:0] add_ln23_54_fu_1772_p2;
    wire logic signed [32:0] sext_ln23_110_fu_1778_p1;
    wire logic[32:0] add_ln25_20_fu_1795_p2;
    wire logic signed [32:0] sext_ln25_42_fu_1800_p1;
    wire logic signed [31:0] sext_ln25_43_fu_1804_p1;
    wire logic signed [31:0] sext_ln25_45_fu_1826_p1;
    wire logic[32:0] add_ln25_22_fu_1830_p2;
    wire logic signed [32:0] sext_ln25_46_fu_1835_p1;
    wire logic signed [31:0] sext_ln25_47_fu_1839_p1;
    wire logic signed [31:0] sext_ln25_49_fu_1849_p1;
    wire logic[32:0] add_ln25_24_fu_1853_p2;
    wire logic signed [32:0] sext_ln25_50_fu_1859_p1;
    wire logic signed [31:0] sext_ln25_51_fu_1863_p1;
    wire logic[32:0] add_ln25_26_fu_1877_p2;
    wire logic signed [32:0] sext_ln25_54_fu_1883_p1;
    wire logic signed [31:0] sext_ln25_55_fu_1887_p1;
    wire logic signed [31:0] sext_ln25_57_fu_1909_p1;
    wire logic[32:0] add_ln25_28_fu_1913_p2;
    wire logic signed [32:0] sext_ln25_58_fu_1918_p1;
    wire logic signed [31:0] sext_ln25_59_fu_1922_p1;
    wire logic signed [31:0] sext_ln25_61_fu_1931_p1;
    wire logic[32:0] add_ln25_30_fu_1934_p2;
    wire logic signed [32:0] sext_ln25_62_fu_1940_p1;
    wire logic signed [31:0] sext_ln25_63_fu_1944_p1;
    wire logic[32:0] add_ln25_32_fu_1956_p2;
    wire logic signed [32:0] sext_ln25_66_fu_1962_p1;
    wire logic signed [31:0] sext_ln25_67_fu_1966_p1;
    wire logic signed [31:0] sext_ln25_69_fu_1988_p1;
    wire logic[32:0] add_ln25_34_fu_1992_p2;
    wire logic signed [32:0] sext_ln25_70_fu_1997_p1;
    wire logic signed [31:0] sext_ln25_71_fu_2001_p1;
    wire logic signed [31:0] sext_ln25_73_fu_2011_p1;
    wire logic[32:0] add_ln25_36_fu_2015_p2;
    wire logic signed [32:0] sext_ln25_74_fu_2021_p1;
    wire logic signed [31:0] sext_ln25_75_fu_2025_p1;
    wire logic signed [31:0] sext_ln25_77_fu_2034_p1;
    wire logic[32:0] add_ln25_38_fu_2037_p2;
    wire logic signed [32:0] sext_ln25_78_fu_2043_p1;
    wire logic signed [31:0] sext_ln25_79_fu_2047_p1;
    wire logic signed [31:0] sext_ln25_81_fu_2056_p1;
    wire logic[32:0] add_ln25_40_fu_2059_p2;
    wire logic signed [32:0] sext_ln25_82_fu_2065_p1;
    wire logic signed [31:0] sext_ln25_83_fu_2069_p1;
    wire logic signed [31:0] sext_ln25_85_fu_2079_p1;
    wire logic[32:0] add_ln25_42_fu_2083_p2;
    wire logic signed [32:0] sext_ln25_86_fu_2089_p1;
    wire logic signed [31:0] sext_ln25_87_fu_2093_p1;
    wire logic signed [31:0] sext_ln25_89_fu_2103_p1;
    wire logic[32:0] add_ln25_44_fu_2107_p2;
    wire logic signed [32:0] sext_ln25_90_fu_2113_p1;
    wire logic signed [31:0] sext_ln25_91_fu_2117_p1;
    wire logic signed [31:0] sext_ln25_93_fu_2126_p1;
    wire logic[32:0] add_ln25_46_fu_2129_p2;
    wire logic signed [32:0] sext_ln25_94_fu_2135_p1;
    wire logic signed [31:0] sext_ln25_95_fu_2139_p1;
    wire logic signed [31:0] sext_ln25_97_fu_2149_p1;
    wire logic[32:0] add_ln25_48_fu_2153_p2;
    wire logic signed [32:0] sext_ln25_98_fu_2159_p1;
    wire logic signed [31:0] sext_ln25_99_fu_2163_p1;
    wire logic signed [31:0] sext_ln25_101_fu_2173_p1;
    wire logic[32:0] add_ln25_50_fu_2177_p2;
    wire logic signed [32:0] sext_ln25_102_fu_2183_p1;
    wire logic signed [31:0] sext_ln25_103_fu_2187_p1;
    wire logic signed [31:0] sext_ln25_105_fu_2197_p1;
    wire logic[32:0] add_ln25_52_fu_2201_p2;
    wire logic signed [32:0] sext_ln25_106_fu_2207_p1;
    wire logic signed [31:0] sext_ln25_107_fu_2211_p1;
    wire logic signed [31:0] sext_ln25_109_fu_2221_p1;
    wire logic[32:0] add_ln25_54_fu_2225_p2;
    wire logic signed [32:0] sext_ln25_110_fu_2231_p1;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg[27:0] ap_NS_fsm;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 28'd1;
        ap_done_reg = 1'b0;
    end
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_mul_34s_16ns_48_2_1_U1 mul_34s_16ns_48_2_1_U1 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_604_p0),
        .din1({1'b0, grp_fu_604_p1}),
        .dout(grp_fu_604_p2)
    );
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_mul_34s_16ns_48_2_1_U2 mul_34s_16ns_48_2_1_U2 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_609_p0),
        .din1({1'b0, grp_fu_609_p1}),
        .dout(grp_fu_609_p2)
    );
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_mul_34s_16ns_48_2_1_U3 mul_34s_16ns_48_2_1_U3 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_614_p0),
        .din1({1'b0, grp_fu_614_p1}),
        .dout(grp_fu_614_p2)
    );
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
        .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage0),
        .ap_loop_exit_done(ap_done_int)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 28'd1;
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
    always @(posedge ap_clk) begin
        if (( (1'b1 == ap_CS_fsm_state1))) begin begin
                t_fu_108 <= t_2_fu_753_p2;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_11_reg_2654 <= add_ln23_11_fu_915_p2;
            add_ln23_9_reg_2644 <= add_ln23_9_fu_891_p2;
            sext_ln23_21_reg_2649 <= sext_ln23_21_fu_897_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_13_reg_2669 <= add_ln23_13_fu_946_p2;
            add_ln23_15_reg_2679 <= add_ln23_15_fu_970_p2;
            add_ln25_1_reg_2689 <= add_ln25_1_fu_993_p2;
            sext_ln23_29_reg_2674 <= sext_ln23_29_fu_952_p1;
            sext_ln25_1_reg_2684 <= sext_ln25_1_fu_976_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_17_reg_2704 <= add_ln23_17_fu_1024_p2;
            add_ln23_19_reg_2714 <= add_ln23_19_fu_1048_p2;
            add_ln25_3_reg_2729 <= add_ln25_3_fu_1075_p2;
            sext_ln23_37_reg_2709 <= sext_ln23_37_fu_1030_p1;
            sext_ln25_5_reg_2724 <= sext_ln25_5_fu_1058_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_1_reg_2594 <= add_ln23_1_fu_781_p2;
            add_ln23_3_reg_2604 <= add_ln23_3_fu_805_p2;
            sext_ln23_5_reg_2599 <= sext_ln23_5_fu_787_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_21_reg_2744 <= add_ln23_21_fu_1106_p2;
            add_ln23_23_reg_2754 <= add_ln23_23_fu_1130_p2;
            add_ln25_5_reg_2769 <= add_ln25_5_fu_1157_p2;
            sext_ln23_45_reg_2749 <= sext_ln23_45_fu_1112_p1;
            sext_ln25_9_reg_2764 <= sext_ln25_9_fu_1140_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_25_reg_2784 <= add_ln23_25_fu_1188_p2;
            add_ln23_27_reg_2794 <= add_ln23_27_fu_1212_p2;
            add_ln25_7_reg_2809 <= add_ln25_7_fu_1239_p2;
            sext_ln23_53_reg_2789 <= sext_ln23_53_fu_1194_p1;
            sext_ln25_13_reg_2804 <= sext_ln25_13_fu_1222_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_29_reg_2824 <= add_ln23_29_fu_1270_p2;
            add_ln23_31_reg_2834 <= add_ln23_31_fu_1294_p2;
            add_ln25_9_reg_2849 <= add_ln25_9_fu_1321_p2;
            sext_ln23_61_reg_2829 <= sext_ln23_61_fu_1276_p1;
            sext_ln25_17_reg_2844 <= sext_ln25_17_fu_1304_p1;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state11)) begin
            add_ln23_33_reg_2864 <= add_ln23_33_fu_1352_p2;
            add_ln23_35_reg_2874 <= add_ln23_35_fu_1376_p2;
            add_ln25_11_reg_2894 <= add_ln25_11_fu_1403_p2;
            sext_ln23_69_reg_2869 <= sext_ln23_69_fu_1358_p1;
            sext_ln25_21_reg_2889 <= sext_ln25_21_fu_1386_p1;
            trunc_ln25_3_reg_2879 <= {{grp_fu_614_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state12)) begin
            add_ln23_37_reg_2916 <= add_ln23_37_fu_1434_p2;
            add_ln23_39_reg_2926 <= add_ln23_39_fu_1458_p2;
            add_ln25_13_reg_2946 <= add_ln25_13_fu_1485_p2;
            sext_ln23_77_reg_2921 <= sext_ln23_77_fu_1440_p1;
            sext_ln25_25_reg_2941 <= sext_ln25_25_fu_1468_p1;
            trunc_ln23_14_reg_2899 <= {{grp_fu_609_p2[47:16]}};
            trunc_ln25_4_reg_2931 <= {{grp_fu_614_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state13)) begin
            add_ln23_41_reg_2968 <= add_ln23_41_fu_1516_p2;
            add_ln23_43_reg_2978 <= add_ln23_43_fu_1540_p2;
            add_ln25_15_reg_2998 <= add_ln25_15_fu_1567_p2;
            sext_ln23_85_reg_2973 <= sext_ln23_85_fu_1522_p1;
            sext_ln25_29_reg_2993 <= sext_ln25_29_fu_1550_p1;
            trunc_ln23_15_reg_2951 <= {{grp_fu_604_p2[47:16]}};
            trunc_ln25_5_reg_2983 <= {{grp_fu_614_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state14)) begin
            add_ln23_45_reg_3020 <= add_ln23_45_fu_1598_p2;
            add_ln23_47_reg_3030 <= add_ln23_47_fu_1622_p2;
            add_ln25_17_reg_3050 <= add_ln25_17_fu_1649_p2;
            sext_ln23_93_reg_3025 <= sext_ln23_93_fu_1604_p1;
            sext_ln25_33_reg_3045 <= sext_ln25_33_fu_1632_p1;
            trunc_ln23_18_reg_3003 <= {{grp_fu_609_p2[47:16]}};
            trunc_ln25_6_reg_3035 <= {{grp_fu_614_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state15)) begin
            add_ln23_49_reg_3072 <= add_ln23_49_fu_1680_p2;
            add_ln23_51_reg_3082 <= add_ln23_51_fu_1704_p2;
            add_ln25_19_reg_3097 <= add_ln25_19_fu_1731_p2;
            sext_ln23_101_reg_3077 <= sext_ln23_101_fu_1686_p1;
            sext_ln25_37_reg_3092 <= sext_ln25_37_fu_1714_p1;
            trunc_ln23_19_reg_3055 <= {{grp_fu_604_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            add_ln23_53_reg_3119 <= add_ln23_53_fu_1762_p2;
            add_ln23_55_reg_3124 <= add_ln23_55_fu_1782_p2;
            add_ln25_21_reg_3139 <= add_ln25_21_fu_1808_p2;
            sext_ln25_41_reg_3134 <= sext_ln25_41_fu_1791_p1;
            trunc_ln23_22_reg_3102 <= {{grp_fu_609_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln23_5_reg_2619 <= add_ln23_5_fu_836_p2;
            add_ln23_7_reg_2629 <= add_ln23_7_fu_860_p2;
            sext_ln23_13_reg_2624 <= sext_ln23_13_fu_842_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln25_23_reg_3159 <= add_ln25_23_fu_1843_p2;
            add_ln25_25_reg_3164 <= add_ln25_25_fu_1867_p2;
            add_ln25_27_reg_3174 <= add_ln25_27_fu_1891_p2;
            sext_ln25_53_reg_3169 <= sext_ln25_53_fu_1873_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln25_29_reg_3194 <= add_ln25_29_fu_1925_p2;
            add_ln25_31_reg_3199 <= add_ln25_31_fu_1947_p2;
            add_ln25_33_reg_3209 <= add_ln25_33_fu_1970_p2;
            sext_ln25_65_reg_3204 <= sext_ln25_65_fu_1953_p1;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state19)) begin
            add_ln25_35_reg_3229 <= add_ln25_35_fu_2005_p2;
            add_ln25_37_reg_3234 <= add_ln25_37_fu_2028_p2;
            add_ln25_39_reg_3239 <= add_ln25_39_fu_2050_p2;
            add_ln25_41_reg_3244 <= add_ln25_41_fu_2073_p2;
            add_ln25_43_reg_3249 <= add_ln25_43_fu_2097_p2;
            add_ln25_45_reg_3254 <= add_ln25_45_fu_2120_p2;
            add_ln25_47_reg_3259 <= add_ln25_47_fu_2143_p2;
            add_ln25_49_reg_3264 <= add_ln25_49_fu_2167_p2;
            add_ln25_51_reg_3269 <= add_ln25_51_fu_2191_p2;
            add_ln25_53_reg_3274 <= add_ln25_53_fu_2215_p2;
            add_ln25_55_reg_3279 <= add_ln25_55_fu_2235_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            reg_649 <= A_q1;
            reg_653 <= A_q0;
        end
    end
    always @(posedge ap_clk) begin
        if (((((((((1'b1 == ap_CS_fsm_state22) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state6)) | (1'b1 == ap_CS_fsm_state5))) begin
            reg_657 <= {{grp_fu_604_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((((((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state5))) begin
            reg_664 <= {{grp_fu_609_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((((1'b1 == ap_CS_fsm_state22) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state6))) begin
            reg_671 <= {{grp_fu_609_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state16)) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state7))) begin
            reg_677 <= {{grp_fu_604_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state8))) begin
            reg_683 <= {{grp_fu_609_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state8))) begin
            reg_689 <= {{grp_fu_614_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state14)) | (1'b1 == ap_CS_fsm_state9))) begin
            reg_695 <= {{grp_fu_604_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if (((((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state9))) begin
            reg_701 <= {{grp_fu_614_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state10))) begin
            reg_707 <= {{grp_fu_609_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state22)) | (1'b1 == ap_CS_fsm_state10))) begin
            reg_712 <= {{grp_fu_614_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state11))) begin
            reg_718 <= {{grp_fu_604_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin begin
            sext_ln23_4_cast_reg_2301 <= sext_ln23_4_cast_fu_731_p1;
            sext_ln23_cast_reg_2306 <= sext_ln23_cast_fu_735_p1;
            sext_ln25_4_cast_reg_2291 <= sext_ln25_4_cast_fu_723_p1;
            sext_ln25_cast_reg_2296 <= sext_ln25_cast_fu_727_p1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state15)) begin
            A_address0 = A_addr_26_reg_2581;
        end
        else if (((1'b1 == ap_CS_fsm_state28) | (1'b1 == ap_CS_fsm_state14))) begin
            A_address0 = 64'h1c;
        end
        else if (((1'b1 == ap_CS_fsm_state27) | (1'b1 == ap_CS_fsm_state13))) begin
            A_address0 = 64'h1a;
        end
        else if (((1'b1 == ap_CS_fsm_state26) | (1'b1 == ap_CS_fsm_state12))) begin
            A_address0 = 64'h18;
        end
        else if (((1'b1 == ap_CS_fsm_state25) | (1'b1 == ap_CS_fsm_state11))) begin
            A_address0 = 64'h16;
        end
        else if (((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state10))) begin
            A_address0 = 64'h14;
        end
        else if (((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state9))) begin
            A_address0 = 64'h12;
        end
        else if (((1'b1 == ap_CS_fsm_state22) | (1'b1 == ap_CS_fsm_state8))) begin
            A_address0 = 64'h10;
        end
        else if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state7))) begin
            A_address0 = 64'he;
        end
        else if (((1'b1 == ap_CS_fsm_state20) | (1'b1 == ap_CS_fsm_state6))) begin
            A_address0 = 64'hc;
        end
        else if (((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state5))) begin
            A_address0 = 64'ha;
        end
        else if (((1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state4))) begin
            A_address0 = 64'h8;
        end
        else if (((1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state3))) begin
            A_address0 = 64'h6;
        end
        else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state16))) begin
            A_address0 = 64'h4;
        end
        else if (((icmp_ln20_fu_747_p2 == 1'b0))) begin
            A_address0 = 64'h2;
        end
        else begin
            A_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state15)) begin
            A_address1 = A_addr_27_reg_2586;
        end
        else if (((1'b1 == ap_CS_fsm_state28) | (1'b1 == ap_CS_fsm_state14))) begin
            A_address1 = 64'h1b;
        end
        else if (((1'b1 == ap_CS_fsm_state27) | (1'b1 == ap_CS_fsm_state13))) begin
            A_address1 = 64'h19;
        end
        else if (((1'b1 == ap_CS_fsm_state26) | (1'b1 == ap_CS_fsm_state12))) begin
            A_address1 = 64'h17;
        end
        else if (((1'b1 == ap_CS_fsm_state25) | (1'b1 == ap_CS_fsm_state11))) begin
            A_address1 = 64'h15;
        end
        else if (((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state10))) begin
            A_address1 = 64'h13;
        end
        else if (((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state9))) begin
            A_address1 = 64'h11;
        end
        else if (((1'b1 == ap_CS_fsm_state22) | (1'b1 == ap_CS_fsm_state8))) begin
            A_address1 = 64'hf;
        end
        else if (((1'b1 == ap_CS_fsm_state21) | (1'b1 == ap_CS_fsm_state7))) begin
            A_address1 = 64'hd;
        end
        else if (((1'b1 == ap_CS_fsm_state20) | (1'b1 == ap_CS_fsm_state6))) begin
            A_address1 = 64'hb;
        end
        else if (((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state5))) begin
            A_address1 = 64'h9;
        end
        else if (((1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state4))) begin
            A_address1 = 64'h7;
        end
        else if (((1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state3))) begin
            A_address1 = 64'h5;
        end
        else if (((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state16))) begin
            A_address1 = 64'h3;
        end
        else if (((icmp_ln20_fu_747_p2 == 1'b0))) begin
            A_address1 = 64'h1;
        end
        else begin
            A_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((((((((((((((((((((((((((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state27)) | (1'b1 == ap_CS_fsm_state26)) | (1'b1 == ap_CS_fsm_state25)) | (1'b1 == ap_CS_fsm_state28)) | (1'b1 == ap_CS_fsm_state23)) | (1'b1 == ap_CS_fsm_state16)) | (1'b1 == ap_CS_fsm_state24)) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state22)) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state14)) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state6)) | (1'b1 == ap_CS_fsm_state5)) | (1'b1 == ap_CS_fsm_state4)) | (1'b1 == ap_CS_fsm_state3)) | (((icmp_ln20_fu_747_p2 == 1'b0))))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((((((((((((((((((((((((((1'b1 == ap_CS_fsm_state2) | (1'b1 == ap_CS_fsm_state27)) | (1'b1 == ap_CS_fsm_state26)) | (1'b1 == ap_CS_fsm_state25)) | (1'b1 == ap_CS_fsm_state28)) | (1'b1 == ap_CS_fsm_state23)) | (1'b1 == ap_CS_fsm_state16)) | (1'b1 == ap_CS_fsm_state24)) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state22)) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state14)) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state6)) | (1'b1 == ap_CS_fsm_state5)) | (1'b1 == ap_CS_fsm_state4)) | (1'b1 == ap_CS_fsm_state3)) | (((icmp_ln20_fu_747_p2 == 1'b0))))) begin
            A_ce1 = 1'b1;
        end
        else begin
            A_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state28)) begin
            A_d0 = reg_664;
        end
        else if (((1'b1 == ap_CS_fsm_state26) | (1'b1 == ap_CS_fsm_state23))) begin
            A_d0 = reg_677;
        end
        else if (((1'b1 == ap_CS_fsm_state25) | (1'b1 == ap_CS_fsm_state22))) begin
            A_d0 = reg_671;
        end
        else if ((1'b1 == ap_CS_fsm_state20)) begin
            A_d0 = reg_657;
        end
        else if ((1'b1 == ap_CS_fsm_state19)) begin
            A_d0 = reg_712;
        end
        else if (((1'b1 == ap_CS_fsm_state27) | (1'b1 == ap_CS_fsm_state18))) begin
            A_d0 = reg_689;
        end
        else if ((1'b1 == ap_CS_fsm_state17)) begin
            A_d0 = trunc_ln25_5_reg_2983;
        end
        else if ((1'b1 == ap_CS_fsm_state16)) begin
            A_d0 = trunc_ln25_3_reg_2879;
        end
        else if ((((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state15))) begin
            A_d0 = reg_701;
        end
        else begin
            A_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state28)) begin
            A_d1 = reg_695;
        end
        else if ((1'b1 == ap_CS_fsm_state27)) begin
            A_d1 = reg_683;
        end
        else if (((1'b1 == ap_CS_fsm_state25) | (1'b1 == ap_CS_fsm_state22))) begin
            A_d1 = reg_657;
        end
        else if (((1'b1 == ap_CS_fsm_state24) | (1'b1 == ap_CS_fsm_state21))) begin
            A_d1 = reg_664;
        end
        else if ((1'b1 == ap_CS_fsm_state19)) begin
            A_d1 = reg_701;
        end
        else if ((1'b1 == ap_CS_fsm_state18)) begin
            A_d1 = trunc_ln25_6_reg_3035;
        end
        else if ((1'b1 == ap_CS_fsm_state17)) begin
            A_d1 = trunc_ln25_4_reg_2931;
        end
        else if (((1'b1 == ap_CS_fsm_state26) | (1'b1 == ap_CS_fsm_state16))) begin
            A_d1 = reg_712;
        end
        else if ((((1'b1 == ap_CS_fsm_state23) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state15))) begin
            A_d1 = reg_689;
        end
        else begin
            A_d1 = 32'dx;
        end
    end
    always @* begin
        if (((((((((((((((1'b1 == ap_CS_fsm_state27) | (1'b1 == ap_CS_fsm_state26)) | (1'b1 == ap_CS_fsm_state25)) | (1'b1 == ap_CS_fsm_state28)) | (1'b1 == ap_CS_fsm_state23)) | (1'b1 == ap_CS_fsm_state16)) | (1'b1 == ap_CS_fsm_state24)) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state22)) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15))) begin
            A_we0 = 1'b1;
        end
        else begin
            A_we0 = 1'b0;
        end
    end
    always @* begin
        if (((((((((((((((1'b1 == ap_CS_fsm_state27) | (1'b1 == ap_CS_fsm_state26)) | (1'b1 == ap_CS_fsm_state25)) | (1'b1 == ap_CS_fsm_state28)) | (1'b1 == ap_CS_fsm_state23)) | (1'b1 == ap_CS_fsm_state16)) | (1'b1 == ap_CS_fsm_state24)) | (1'b1 == ap_CS_fsm_state21)) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state22)) | (1'b1 == ap_CS_fsm_state20)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15))) begin
            A_we1 = 1'b1;
        end
        else begin
            A_we1 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state19)) begin
            B_address0 = 64'h1c;
        end
        else if ((1'b1 == ap_CS_fsm_state18)) begin
            B_address0 = 64'h1a;
        end
        else if ((1'b1 == ap_CS_fsm_state17)) begin
            B_address0 = 64'h18;
        end
        else if ((1'b1 == ap_CS_fsm_state16)) begin
            B_address0 = 64'h16;
        end
        else if ((1'b1 == ap_CS_fsm_state15)) begin
            B_address0 = 64'h14;
        end
        else if ((1'b1 == ap_CS_fsm_state14)) begin
            B_address0 = 64'h12;
        end
        else if ((1'b1 == ap_CS_fsm_state13)) begin
            B_address0 = 64'h10;
        end
        else if ((1'b1 == ap_CS_fsm_state12)) begin
            B_address0 = 64'he;
        end
        else if ((1'b1 == ap_CS_fsm_state11)) begin
            B_address0 = 64'hc;
        end
        else if ((1'b1 == ap_CS_fsm_state10)) begin
            B_address0 = 64'ha;
        end
        else if ((1'b1 == ap_CS_fsm_state9)) begin
            B_address0 = 64'h8;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            B_address0 = 64'h6;
        end
        else if ((1'b1 == ap_CS_fsm_state7)) begin
            B_address0 = 64'h4;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            B_address0 = 64'h2;
        end
        else begin
            B_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state19)) begin
            B_address1 = 64'h1b;
        end
        else if ((1'b1 == ap_CS_fsm_state18)) begin
            B_address1 = 64'h19;
        end
        else if ((1'b1 == ap_CS_fsm_state17)) begin
            B_address1 = 64'h17;
        end
        else if ((1'b1 == ap_CS_fsm_state16)) begin
            B_address1 = 64'h15;
        end
        else if ((1'b1 == ap_CS_fsm_state15)) begin
            B_address1 = 64'h13;
        end
        else if ((1'b1 == ap_CS_fsm_state14)) begin
            B_address1 = 64'h11;
        end
        else if ((1'b1 == ap_CS_fsm_state13)) begin
            B_address1 = 64'hf;
        end
        else if ((1'b1 == ap_CS_fsm_state12)) begin
            B_address1 = 64'hd;
        end
        else if ((1'b1 == ap_CS_fsm_state11)) begin
            B_address1 = 64'hb;
        end
        else if ((1'b1 == ap_CS_fsm_state10)) begin
            B_address1 = 64'h9;
        end
        else if ((1'b1 == ap_CS_fsm_state9)) begin
            B_address1 = 64'h7;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            B_address1 = 64'h5;
        end
        else if ((1'b1 == ap_CS_fsm_state7)) begin
            B_address1 = 64'h3;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            B_address1 = 64'h1;
        end
        else begin
            B_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((((((((((((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state14)) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state6))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((((((((((((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state14)) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state6))) begin
            B_ce1 = 1'b1;
        end
        else begin
            B_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state17)) begin
            B_d0 = trunc_ln23_22_reg_3102;
        end
        else if ((1'b1 == ap_CS_fsm_state15)) begin
            B_d0 = trunc_ln23_18_reg_3003;
        end
        else if ((1'b1 == ap_CS_fsm_state13)) begin
            B_d0 = trunc_ln23_14_reg_2899;
        end
        else if (((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state11))) begin
            B_d0 = reg_707;
        end
        else if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state9))) begin
            B_d0 = reg_683;
        end
        else if ((((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state7))) begin
            B_d0 = reg_671;
        end
        else if (((((1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state6))) begin
            B_d0 = reg_664;
        end
        else begin
            B_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state16)) begin
            B_d1 = trunc_ln23_19_reg_3055;
        end
        else if ((1'b1 == ap_CS_fsm_state14)) begin
            B_d1 = trunc_ln23_15_reg_2951;
        end
        else if (((1'b1 == ap_CS_fsm_state18) | (1'b1 == ap_CS_fsm_state12))) begin
            B_d1 = reg_718;
        end
        else if (((1'b1 == ap_CS_fsm_state15) | (1'b1 == ap_CS_fsm_state10))) begin
            B_d1 = reg_695;
        end
        else if ((((1'b1 == ap_CS_fsm_state17) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state8))) begin
            B_d1 = reg_677;
        end
        else if ((((((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state6))) begin
            B_d1 = reg_657;
        end
        else begin
            B_d1 = 32'dx;
        end
    end
    always @* begin
        if (((((((((((((((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state14)) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state6))) begin
            B_we0 = 1'b1;
        end
        else begin
            B_we0 = 1'b0;
        end
    end
    always @* begin
        if (((((((((((((((1'b1 == ap_CS_fsm_state16) | (1'b1 == ap_CS_fsm_state17)) | (1'b1 == ap_CS_fsm_state19)) | (1'b1 == ap_CS_fsm_state18)) | (1'b1 == ap_CS_fsm_state15)) | (1'b1 == ap_CS_fsm_state14)) | (1'b1 == ap_CS_fsm_state13)) | (1'b1 == ap_CS_fsm_state12)) | (1'b1 == ap_CS_fsm_state11)) | (1'b1 == ap_CS_fsm_state10)) | (1'b1 == ap_CS_fsm_state9)) | (1'b1 == ap_CS_fsm_state8)) | (1'b1 == ap_CS_fsm_state7)) | (1'b1 == ap_CS_fsm_state6))) begin
            B_we1 = 1'b1;
        end
        else begin
            B_we1 = 1'b0;
        end
    end
    always @* begin
        if ((((icmp_ln20_fu_747_p2 == 1'b1)) & (1'b1 == ap_CS_fsm_state1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if ((((ap_loop_exit_ready == 1'b1)))) begin
            ap_done_int = 1'b1;
        end
        else begin
            ap_done_int = 1'b0;
        end
    end
    always @* begin begin
            ap_idle = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state28)) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if (((ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_t_1 = 5'b0;
        end
        else begin
            ap_sig_allocacmp_t_1 = t_fu_108;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state23)) begin
            grp_fu_604_p0 = sext_ln25_111_fu_2276_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state22)) begin
            grp_fu_604_p0 = sext_ln25_100_fu_2264_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state21)) begin
            grp_fu_604_p0 = sext_ln25_88_fu_2252_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state20)) begin
            grp_fu_604_p0 = sext_ln25_76_fu_2240_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state19)) begin
            grp_fu_604_p0 = sext_ln25_64_fu_1976_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state18)) begin
            grp_fu_604_p0 = sext_ln25_52_fu_1897_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state17)) begin
            grp_fu_604_p0 = sext_ln23_111_fu_1814_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state16)) begin
            grp_fu_604_p0 = sext_ln23_104_fu_1737_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state15)) begin
            grp_fu_604_p0 = sext_ln23_96_fu_1655_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state14)) begin
            grp_fu_604_p0 = sext_ln23_88_fu_1573_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state13)) begin
            grp_fu_604_p0 = sext_ln23_80_fu_1491_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state12)) begin
            grp_fu_604_p0 = sext_ln23_72_fu_1409_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state11)) begin
            grp_fu_604_p0 = sext_ln23_64_fu_1327_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state10)) begin
            grp_fu_604_p0 = sext_ln23_56_fu_1245_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state9)) begin
            grp_fu_604_p0 = sext_ln23_48_fu_1163_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_fu_604_p0 = sext_ln23_40_fu_1081_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_fu_604_p0 = sext_ln23_32_fu_999_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_fu_604_p0 = sext_ln23_24_fu_921_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_fu_604_p0 = sext_ln23_16_fu_866_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_fu_604_p0 = sext_ln23_8_fu_811_p1;
        end
        else begin
            grp_fu_604_p0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state23)) begin
            grp_fu_609_p0 = sext_ln25_112_fu_2280_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state22)) begin
            grp_fu_609_p0 = sext_ln25_104_fu_2268_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state21)) begin
            grp_fu_609_p0 = sext_ln25_92_fu_2256_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state20)) begin
            grp_fu_609_p0 = sext_ln25_80_fu_2244_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state19)) begin
            grp_fu_609_p0 = sext_ln25_68_fu_1980_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state18)) begin
            grp_fu_609_p0 = sext_ln25_56_fu_1901_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state17)) begin
            grp_fu_609_p0 = sext_ln23_112_fu_1818_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state16)) begin
            grp_fu_609_p0 = sext_ln23_108_fu_1741_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state15)) begin
            grp_fu_609_p0 = sext_ln23_100_fu_1659_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state14)) begin
            grp_fu_609_p0 = sext_ln23_92_fu_1577_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state13)) begin
            grp_fu_609_p0 = sext_ln23_84_fu_1495_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state12)) begin
            grp_fu_609_p0 = sext_ln23_76_fu_1413_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state11)) begin
            grp_fu_609_p0 = sext_ln23_68_fu_1331_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state10)) begin
            grp_fu_609_p0 = sext_ln23_60_fu_1249_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state9)) begin
            grp_fu_609_p0 = sext_ln23_52_fu_1167_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_fu_609_p0 = sext_ln23_44_fu_1085_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_fu_609_p0 = sext_ln23_36_fu_1003_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_fu_609_p0 = sext_ln23_28_fu_925_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_fu_609_p0 = sext_ln23_20_fu_870_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_fu_609_p0 = sext_ln23_12_fu_815_p1;
        end
        else begin
            grp_fu_609_p0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state22)) begin
            grp_fu_614_p0 = sext_ln25_108_fu_2272_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state21)) begin
            grp_fu_614_p0 = sext_ln25_96_fu_2260_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state20)) begin
            grp_fu_614_p0 = sext_ln25_84_fu_2248_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state19)) begin
            grp_fu_614_p0 = sext_ln25_72_fu_1984_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state18)) begin
            grp_fu_614_p0 = sext_ln25_60_fu_1905_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state17)) begin
            grp_fu_614_p0 = sext_ln25_48_fu_1822_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state16)) begin
            grp_fu_614_p0 = sext_ln25_44_fu_1787_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state15)) begin
            grp_fu_614_p0 = sext_ln25_40_fu_1710_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state14)) begin
            grp_fu_614_p0 = sext_ln25_36_fu_1628_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state13)) begin
            grp_fu_614_p0 = sext_ln25_32_fu_1546_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state12)) begin
            grp_fu_614_p0 = sext_ln25_28_fu_1464_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state11)) begin
            grp_fu_614_p0 = sext_ln25_24_fu_1382_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state10)) begin
            grp_fu_614_p0 = sext_ln25_20_fu_1300_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state9)) begin
            grp_fu_614_p0 = sext_ln25_16_fu_1218_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_fu_614_p0 = sext_ln25_12_fu_1136_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_fu_614_p0 = sext_ln25_8_fu_1054_p1;
        end
        else begin
            grp_fu_614_p0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            28'd1: begin
                if ((((icmp_ln20_fu_747_p2 == 1'b1)))) begin
                    ap_NS_fsm = 28'd1;
                end
                else if (((ap_start_int == 1'b1))) begin
                    ap_NS_fsm = 28'd2;
                end
                else begin
                    ap_NS_fsm = 28'd1;
                end
            end
            28'd2: begin
                ap_NS_fsm = 28'd4;
            end
            28'd4: begin
                ap_NS_fsm = 28'd8;
            end
            28'd8: begin
                ap_NS_fsm = 28'd16;
            end
            28'd16: begin
                ap_NS_fsm = 28'd32;
            end
            28'd32: begin
                ap_NS_fsm = 28'd64;
            end
            28'd64: begin
                ap_NS_fsm = 28'd128;
            end
            28'd128: begin
                ap_NS_fsm = 28'd256;
            end
            28'd256: begin
                ap_NS_fsm = 28'd512;
            end
            28'd512: begin
                ap_NS_fsm = 28'd1024;
            end
            28'd1024: begin
                ap_NS_fsm = 28'd2048;
            end
            28'd2048: begin
                ap_NS_fsm = 28'd4096;
            end
            28'd4096: begin
                ap_NS_fsm = 28'd8192;
            end
            28'd8192: begin
                ap_NS_fsm = 28'd16384;
            end
            28'd16384: begin
                ap_NS_fsm = 28'd32768;
            end
            28'd32768: begin
                ap_NS_fsm = 28'd65536;
            end
            28'd65536: begin
                ap_NS_fsm = 28'd131072;
            end
            28'd131072: begin
                ap_NS_fsm = 28'd262144;
            end
            28'd262144: begin
                ap_NS_fsm = 28'd524288;
            end
            28'd524288: begin
                ap_NS_fsm = 28'd1048576;
            end
            28'd1048576: begin
                ap_NS_fsm = 28'd2097152;
            end
            28'd2097152: begin
                ap_NS_fsm = 28'd4194304;
            end
            28'd4194304: begin
                ap_NS_fsm = 28'd8388608;
            end
            28'd8388608: begin
                ap_NS_fsm = 28'd16777216;
            end
            28'd16777216: begin
                ap_NS_fsm = 28'd33554432;
            end
            28'd33554432: begin
                ap_NS_fsm = 28'd67108864;
            end
            28'd67108864: begin
                ap_NS_fsm = 28'd134217728;
            end
            28'd134217728: begin
                ap_NS_fsm = 28'd1;
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign A_addr_26_reg_2581 = 64'h2;
    assign A_addr_27_reg_2586 = 64'h1;
    assign add_ln23_10_fu_901_p2 = ($signed(sext_ln23_21_fu_897_p1) + $signed(sext_ln23_17_fu_874_p1));
    assign add_ln23_11_fu_915_p2 = ($signed(sext_ln23_22_fu_907_p1) + $signed(sext_ln23_23_fu_911_p1));
    assign add_ln23_12_fu_933_p2 = ($signed(sext_ln23_25_fu_929_p1) + $signed(sext_ln23_21_reg_2649));
    assign add_ln23_13_fu_946_p2 = ($signed(sext_ln23_26_fu_938_p1) + $signed(sext_ln23_27_fu_942_p1));
    assign add_ln23_14_fu_956_p2 = ($signed(sext_ln23_29_fu_952_p1) + $signed(sext_ln23_25_fu_929_p1));
    assign add_ln23_15_fu_970_p2 = ($signed(sext_ln23_30_fu_962_p1) + $signed(sext_ln23_31_fu_966_p1));
    assign add_ln23_16_fu_1011_p2 = ($signed(sext_ln23_33_fu_1007_p1) + $signed(sext_ln23_29_reg_2674));
    assign add_ln23_17_fu_1024_p2 = ($signed(sext_ln23_34_fu_1016_p1) + $signed(sext_ln23_35_fu_1020_p1));
    assign add_ln23_18_fu_1034_p2 = ($signed(sext_ln23_37_fu_1030_p1) + $signed(sext_ln23_33_fu_1007_p1));
    assign add_ln23_19_fu_1048_p2 = ($signed(sext_ln23_38_fu_1040_p1) + $signed(sext_ln23_39_fu_1044_p1));
    assign add_ln23_1_fu_781_p2 = ($signed(sext_ln23_2_fu_773_p1) + $signed(sext_ln23_3_fu_777_p1));
    assign add_ln23_20_fu_1093_p2 = ($signed(sext_ln23_41_fu_1089_p1) + $signed(sext_ln23_37_reg_2709));
    assign add_ln23_21_fu_1106_p2 = ($signed(sext_ln23_42_fu_1098_p1) + $signed(sext_ln23_43_fu_1102_p1));
    assign add_ln23_22_fu_1116_p2 = ($signed(sext_ln23_45_fu_1112_p1) + $signed(sext_ln23_41_fu_1089_p1));
    assign add_ln23_23_fu_1130_p2 = ($signed(sext_ln23_46_fu_1122_p1) + $signed(sext_ln23_47_fu_1126_p1));
    assign add_ln23_24_fu_1175_p2 = ($signed(sext_ln23_49_fu_1171_p1) + $signed(sext_ln23_45_reg_2749));
    assign add_ln23_25_fu_1188_p2 = ($signed(sext_ln23_50_fu_1180_p1) + $signed(sext_ln23_51_fu_1184_p1));
    assign add_ln23_26_fu_1198_p2 = ($signed(sext_ln23_53_fu_1194_p1) + $signed(sext_ln23_49_fu_1171_p1));
    assign add_ln23_27_fu_1212_p2 = ($signed(sext_ln23_54_fu_1204_p1) + $signed(sext_ln23_55_fu_1208_p1));
    assign add_ln23_28_fu_1257_p2 = ($signed(sext_ln23_57_fu_1253_p1) + $signed(sext_ln23_53_reg_2789));
    assign add_ln23_29_fu_1270_p2 = ($signed(sext_ln23_58_fu_1262_p1) + $signed(sext_ln23_59_fu_1266_p1));
    assign add_ln23_2_fu_791_p2 = ($signed(sext_ln23_5_fu_787_p1) + $signed(sext_ln23_1_fu_764_p1));
    assign add_ln23_30_fu_1280_p2 = ($signed(sext_ln23_61_fu_1276_p1) + $signed(sext_ln23_57_fu_1253_p1));
    assign add_ln23_31_fu_1294_p2 = ($signed(sext_ln23_62_fu_1286_p1) + $signed(sext_ln23_63_fu_1290_p1));
    assign add_ln23_32_fu_1339_p2 = ($signed(sext_ln23_65_fu_1335_p1) + $signed(sext_ln23_61_reg_2829));
    assign add_ln23_33_fu_1352_p2 = ($signed(sext_ln23_66_fu_1344_p1) + $signed(sext_ln23_67_fu_1348_p1));
    assign add_ln23_34_fu_1362_p2 = ($signed(sext_ln23_69_fu_1358_p1) + $signed(sext_ln23_65_fu_1335_p1));
    assign add_ln23_35_fu_1376_p2 = ($signed(sext_ln23_70_fu_1368_p1) + $signed(sext_ln23_71_fu_1372_p1));
    assign add_ln23_36_fu_1421_p2 = ($signed(sext_ln23_73_fu_1417_p1) + $signed(sext_ln23_69_reg_2869));
    assign add_ln23_37_fu_1434_p2 = ($signed(sext_ln23_74_fu_1426_p1) + $signed(sext_ln23_75_fu_1430_p1));
    assign add_ln23_38_fu_1444_p2 = ($signed(sext_ln23_77_fu_1440_p1) + $signed(sext_ln23_73_fu_1417_p1));
    assign add_ln23_39_fu_1458_p2 = ($signed(sext_ln23_78_fu_1450_p1) + $signed(sext_ln23_79_fu_1454_p1));
    assign add_ln23_3_fu_805_p2 = ($signed(sext_ln23_6_fu_797_p1) + $signed(sext_ln23_7_fu_801_p1));
    assign add_ln23_40_fu_1503_p2 = ($signed(sext_ln23_81_fu_1499_p1) + $signed(sext_ln23_77_reg_2921));
    assign add_ln23_41_fu_1516_p2 = ($signed(sext_ln23_82_fu_1508_p1) + $signed(sext_ln23_83_fu_1512_p1));
    assign add_ln23_42_fu_1526_p2 = ($signed(sext_ln23_85_fu_1522_p1) + $signed(sext_ln23_81_fu_1499_p1));
    assign add_ln23_43_fu_1540_p2 = ($signed(sext_ln23_86_fu_1532_p1) + $signed(sext_ln23_87_fu_1536_p1));
    assign add_ln23_44_fu_1585_p2 = ($signed(sext_ln23_89_fu_1581_p1) + $signed(sext_ln23_85_reg_2973));
    assign add_ln23_45_fu_1598_p2 = ($signed(sext_ln23_90_fu_1590_p1) + $signed(sext_ln23_91_fu_1594_p1));
    assign add_ln23_46_fu_1608_p2 = ($signed(sext_ln23_93_fu_1604_p1) + $signed(sext_ln23_89_fu_1581_p1));
    assign add_ln23_47_fu_1622_p2 = ($signed(sext_ln23_94_fu_1614_p1) + $signed(sext_ln23_95_fu_1618_p1));
    assign add_ln23_48_fu_1667_p2 = ($signed(sext_ln23_97_fu_1663_p1) + $signed(sext_ln23_93_reg_3025));
    assign add_ln23_49_fu_1680_p2 = ($signed(sext_ln23_98_fu_1672_p1) + $signed(sext_ln23_99_fu_1676_p1));
    assign add_ln23_4_fu_823_p2 = ($signed(sext_ln23_9_fu_819_p1) + $signed(sext_ln23_5_reg_2599));
    assign add_ln23_50_fu_1690_p2 = ($signed(sext_ln23_101_fu_1686_p1) + $signed(sext_ln23_97_fu_1663_p1));
    assign add_ln23_51_fu_1704_p2 = ($signed(sext_ln23_102_fu_1696_p1) + $signed(sext_ln23_103_fu_1700_p1));
    assign add_ln23_52_fu_1749_p2 = ($signed(sext_ln23_105_fu_1745_p1) + $signed(sext_ln23_101_reg_3077));
    assign add_ln23_53_fu_1762_p2 = ($signed(sext_ln23_106_fu_1754_p1) + $signed(sext_ln23_107_fu_1758_p1));
    assign add_ln23_54_fu_1772_p2 = ($signed(sext_ln23_109_fu_1768_p1) + $signed(sext_ln23_105_fu_1745_p1));
    assign add_ln23_55_fu_1782_p2 = ($signed(sext_ln23_110_fu_1778_p1) + $signed(sext_ln23_4_cast_reg_2301));
    assign add_ln23_5_fu_836_p2 = ($signed(sext_ln23_10_fu_828_p1) + $signed(sext_ln23_11_fu_832_p1));
    assign add_ln23_6_fu_846_p2 = ($signed(sext_ln23_13_fu_842_p1) + $signed(sext_ln23_9_fu_819_p1));
    assign add_ln23_7_fu_860_p2 = ($signed(sext_ln23_14_fu_852_p1) + $signed(sext_ln23_15_fu_856_p1));
    assign add_ln23_8_fu_878_p2 = ($signed(sext_ln23_17_fu_874_p1) + $signed(sext_ln23_13_reg_2624));
    assign add_ln23_9_fu_891_p2 = ($signed(sext_ln23_18_fu_883_p1) + $signed(sext_ln23_19_fu_887_p1));
    assign add_ln23_fu_768_p2 = ($signed(sext_ln23_1_fu_764_p1) + $signed(sext_ln23_cast_reg_2306));
    assign add_ln25_10_fu_1390_p2 = ($signed(sext_ln25_21_fu_1386_p1) + $signed(sext_ln25_17_reg_2844));
    assign add_ln25_11_fu_1403_p2 = ($signed(sext_ln25_22_fu_1395_p1) + $signed(sext_ln25_23_fu_1399_p1));
    assign add_ln25_12_fu_1472_p2 = ($signed(sext_ln25_25_fu_1468_p1) + $signed(sext_ln25_21_reg_2889));
    assign add_ln25_13_fu_1485_p2 = ($signed(sext_ln25_26_fu_1477_p1) + $signed(sext_ln25_27_fu_1481_p1));
    assign add_ln25_14_fu_1554_p2 = ($signed(sext_ln25_29_fu_1550_p1) + $signed(sext_ln25_25_reg_2941));
    assign add_ln25_15_fu_1567_p2 = ($signed(sext_ln25_30_fu_1559_p1) + $signed(sext_ln25_31_fu_1563_p1));
    assign add_ln25_16_fu_1636_p2 = ($signed(sext_ln25_33_fu_1632_p1) + $signed(sext_ln25_29_reg_2993));
    assign add_ln25_17_fu_1649_p2 = ($signed(sext_ln25_34_fu_1641_p1) + $signed(sext_ln25_35_fu_1645_p1));
    assign add_ln25_18_fu_1718_p2 = ($signed(sext_ln25_37_fu_1714_p1) + $signed(sext_ln25_33_reg_3045));
    assign add_ln25_19_fu_1731_p2 = ($signed(sext_ln25_38_fu_1723_p1) + $signed(sext_ln25_39_fu_1727_p1));
    assign add_ln25_1_fu_993_p2 = ($signed(sext_ln25_2_fu_985_p1) + $signed(sext_ln25_3_fu_989_p1));
    assign add_ln25_20_fu_1795_p2 = ($signed(sext_ln25_41_fu_1791_p1) + $signed(sext_ln25_37_reg_3092));
    assign add_ln25_21_fu_1808_p2 = ($signed(sext_ln25_42_fu_1800_p1) + $signed(sext_ln25_43_fu_1804_p1));
    assign add_ln25_22_fu_1830_p2 = ($signed(sext_ln25_45_fu_1826_p1) + $signed(sext_ln25_41_reg_3134));
    assign add_ln25_23_fu_1843_p2 = ($signed(sext_ln25_46_fu_1835_p1) + $signed(sext_ln25_47_fu_1839_p1));
    assign add_ln25_24_fu_1853_p2 = ($signed(sext_ln25_49_fu_1849_p1) + $signed(sext_ln25_45_fu_1826_p1));
    assign add_ln25_25_fu_1867_p2 = ($signed(sext_ln25_50_fu_1859_p1) + $signed(sext_ln25_51_fu_1863_p1));
    assign add_ln25_26_fu_1877_p2 = ($signed(sext_ln25_53_fu_1873_p1) + $signed(sext_ln25_49_fu_1849_p1));
    assign add_ln25_27_fu_1891_p2 = ($signed(sext_ln25_54_fu_1883_p1) + $signed(sext_ln25_55_fu_1887_p1));
    assign add_ln25_28_fu_1913_p2 = ($signed(sext_ln25_57_fu_1909_p1) + $signed(sext_ln25_53_reg_3169));
    assign add_ln25_29_fu_1925_p2 = ($signed(sext_ln25_58_fu_1918_p1) + $signed(sext_ln25_59_fu_1922_p1));
    assign add_ln25_2_fu_1062_p2 = ($signed(sext_ln25_5_fu_1058_p1) + $signed(sext_ln25_1_reg_2684));
    assign add_ln25_30_fu_1934_p2 = ($signed(sext_ln25_61_fu_1931_p1) + $signed(sext_ln25_57_fu_1909_p1));
    assign add_ln25_31_fu_1947_p2 = ($signed(sext_ln25_62_fu_1940_p1) + $signed(sext_ln25_63_fu_1944_p1));
    assign add_ln25_32_fu_1956_p2 = ($signed(sext_ln25_65_fu_1953_p1) + $signed(sext_ln25_61_fu_1931_p1));
    assign add_ln25_33_fu_1970_p2 = ($signed(sext_ln25_66_fu_1962_p1) + $signed(sext_ln25_67_fu_1966_p1));
    assign add_ln25_34_fu_1992_p2 = ($signed(sext_ln25_69_fu_1988_p1) + $signed(sext_ln25_65_reg_3204));
    assign add_ln25_35_fu_2005_p2 = ($signed(sext_ln25_70_fu_1997_p1) + $signed(sext_ln25_71_fu_2001_p1));
    assign add_ln25_36_fu_2015_p2 = ($signed(sext_ln25_73_fu_2011_p1) + $signed(sext_ln25_69_fu_1988_p1));
    assign add_ln25_37_fu_2028_p2 = ($signed(sext_ln25_74_fu_2021_p1) + $signed(sext_ln25_75_fu_2025_p1));
    assign add_ln25_38_fu_2037_p2 = ($signed(sext_ln25_77_fu_2034_p1) + $signed(sext_ln25_73_fu_2011_p1));
    assign add_ln25_39_fu_2050_p2 = ($signed(sext_ln25_78_fu_2043_p1) + $signed(sext_ln25_79_fu_2047_p1));
    assign add_ln25_3_fu_1075_p2 = ($signed(sext_ln25_6_fu_1067_p1) + $signed(sext_ln25_7_fu_1071_p1));
    assign add_ln25_40_fu_2059_p2 = ($signed(sext_ln25_81_fu_2056_p1) + $signed(sext_ln25_77_fu_2034_p1));
    assign add_ln25_41_fu_2073_p2 = ($signed(sext_ln25_82_fu_2065_p1) + $signed(sext_ln25_83_fu_2069_p1));
    assign add_ln25_42_fu_2083_p2 = ($signed(sext_ln25_85_fu_2079_p1) + $signed(sext_ln25_81_fu_2056_p1));
    assign add_ln25_43_fu_2097_p2 = ($signed(sext_ln25_86_fu_2089_p1) + $signed(sext_ln25_87_fu_2093_p1));
    assign add_ln25_44_fu_2107_p2 = ($signed(sext_ln25_89_fu_2103_p1) + $signed(sext_ln25_85_fu_2079_p1));
    assign add_ln25_45_fu_2120_p2 = ($signed(sext_ln25_90_fu_2113_p1) + $signed(sext_ln25_91_fu_2117_p1));
    assign add_ln25_46_fu_2129_p2 = ($signed(sext_ln25_93_fu_2126_p1) + $signed(sext_ln25_89_fu_2103_p1));
    assign add_ln25_47_fu_2143_p2 = ($signed(sext_ln25_94_fu_2135_p1) + $signed(sext_ln25_95_fu_2139_p1));
    assign add_ln25_48_fu_2153_p2 = ($signed(sext_ln25_97_fu_2149_p1) + $signed(sext_ln25_93_fu_2126_p1));
    assign add_ln25_49_fu_2167_p2 = ($signed(sext_ln25_98_fu_2159_p1) + $signed(sext_ln25_99_fu_2163_p1));
    assign add_ln25_4_fu_1144_p2 = ($signed(sext_ln25_9_fu_1140_p1) + $signed(sext_ln25_5_reg_2724));
    assign add_ln25_50_fu_2177_p2 = ($signed(sext_ln25_101_fu_2173_p1) + $signed(sext_ln25_97_fu_2149_p1));
    assign add_ln25_51_fu_2191_p2 = ($signed(sext_ln25_102_fu_2183_p1) + $signed(sext_ln25_103_fu_2187_p1));
    assign add_ln25_52_fu_2201_p2 = ($signed(sext_ln25_105_fu_2197_p1) + $signed(sext_ln25_101_fu_2173_p1));
    assign add_ln25_53_fu_2215_p2 = ($signed(sext_ln25_106_fu_2207_p1) + $signed(sext_ln25_107_fu_2211_p1));
    assign add_ln25_54_fu_2225_p2 = ($signed(sext_ln25_109_fu_2221_p1) + $signed(sext_ln25_105_fu_2197_p1));
    assign add_ln25_55_fu_2235_p2 = ($signed(sext_ln25_110_fu_2231_p1) + $signed(sext_ln25_4_cast_reg_2291));
    assign add_ln25_5_fu_1157_p2 = ($signed(sext_ln25_10_fu_1149_p1) + $signed(sext_ln25_11_fu_1153_p1));
    assign add_ln25_6_fu_1226_p2 = ($signed(sext_ln25_13_fu_1222_p1) + $signed(sext_ln25_9_reg_2764));
    assign add_ln25_7_fu_1239_p2 = ($signed(sext_ln25_14_fu_1231_p1) + $signed(sext_ln25_15_fu_1235_p1));
    assign add_ln25_8_fu_1308_p2 = ($signed(sext_ln25_17_fu_1304_p1) + $signed(sext_ln25_13_reg_2804));
    assign add_ln25_9_fu_1321_p2 = ($signed(sext_ln25_18_fu_1313_p1) + $signed(sext_ln25_19_fu_1317_p1));
    assign add_ln25_fu_980_p2 = ($signed(sext_ln25_1_fu_976_p1) + $signed(sext_ln25_cast_reg_2296));
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
    assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
    assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
    assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
    assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];
    assign ap_CS_fsm_state15 = ap_CS_fsm[32'd14];
    assign ap_CS_fsm_state16 = ap_CS_fsm[32'd15];
    assign ap_CS_fsm_state17 = ap_CS_fsm[32'd16];
    assign ap_CS_fsm_state18 = ap_CS_fsm[32'd17];
    assign ap_CS_fsm_state19 = ap_CS_fsm[32'd18];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state20 = ap_CS_fsm[32'd19];
    assign ap_CS_fsm_state21 = ap_CS_fsm[32'd20];
    assign ap_CS_fsm_state22 = ap_CS_fsm[32'd21];
    assign ap_CS_fsm_state23 = ap_CS_fsm[32'd22];
    assign ap_CS_fsm_state24 = ap_CS_fsm[32'd23];
    assign ap_CS_fsm_state25 = ap_CS_fsm[32'd24];
    assign ap_CS_fsm_state26 = ap_CS_fsm[32'd25];
    assign ap_CS_fsm_state27 = ap_CS_fsm[32'd26];
    assign ap_CS_fsm_state28 = ap_CS_fsm[32'd27];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
    assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
    assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
    assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign grp_fu_604_p1 = 48'h5555;
    assign grp_fu_609_p1 = 48'h5555;
    assign grp_fu_614_p1 = 48'h5555;
    assign icmp_ln20_fu_747_p2 = ((ap_sig_allocacmp_t_1 == 5'b10100) ? 1'b1 : 1'b0);
    assign sext_ln23_100_fu_1659_p1 = $signed(add_ln23_47_reg_3030);
    assign sext_ln23_101_fu_1686_p1 = reg_653;
    assign sext_ln23_102_fu_1696_p1 = $signed(add_ln23_50_fu_1690_p2);
    assign sext_ln23_103_fu_1700_p0 = A_q1;
    assign sext_ln23_103_fu_1700_p1 = sext_ln23_103_fu_1700_p0;
    assign sext_ln23_104_fu_1737_p1 = $signed(add_ln23_49_reg_3072);
    assign sext_ln23_105_fu_1745_p1 = reg_649;
    assign sext_ln23_106_fu_1754_p1 = $signed(add_ln23_52_fu_1749_p2);
    assign sext_ln23_107_fu_1758_p1 = reg_653;
    assign sext_ln23_108_fu_1741_p1 = $signed(add_ln23_51_reg_3082);
    assign sext_ln23_109_fu_1768_p1 = reg_653;
    assign sext_ln23_10_fu_828_p1 = $signed(add_ln23_4_fu_823_p2);
    assign sext_ln23_110_fu_1778_p1 = $signed(add_ln23_54_fu_1772_p2);
    assign sext_ln23_111_fu_1814_p1 = $signed(add_ln23_53_reg_3119);
    assign sext_ln23_112_fu_1818_p1 = $signed(add_ln23_55_reg_3124);
    assign sext_ln23_11_fu_832_p1 = reg_653;
    assign sext_ln23_12_fu_815_p1 = $signed(add_ln23_3_reg_2604);
    assign sext_ln23_13_fu_842_p1 = reg_653;
    assign sext_ln23_14_fu_852_p1 = $signed(add_ln23_6_fu_846_p2);
    assign sext_ln23_15_fu_856_p0 = A_q1;
    assign sext_ln23_15_fu_856_p1 = sext_ln23_15_fu_856_p0;
    assign sext_ln23_16_fu_866_p1 = $signed(add_ln23_5_reg_2619);
    assign sext_ln23_17_fu_874_p1 = reg_649;
    assign sext_ln23_18_fu_883_p1 = $signed(add_ln23_8_fu_878_p2);
    assign sext_ln23_19_fu_887_p1 = reg_653;
    assign sext_ln23_1_fu_764_p1 = reg_649;
    assign sext_ln23_20_fu_870_p1 = $signed(add_ln23_7_reg_2629);
    assign sext_ln23_21_fu_897_p1 = reg_653;
    assign sext_ln23_22_fu_907_p1 = $signed(add_ln23_10_fu_901_p2);
    assign sext_ln23_23_fu_911_p0 = A_q1;
    assign sext_ln23_23_fu_911_p1 = sext_ln23_23_fu_911_p0;
    assign sext_ln23_24_fu_921_p1 = $signed(add_ln23_9_reg_2644);
    assign sext_ln23_25_fu_929_p1 = reg_649;
    assign sext_ln23_26_fu_938_p1 = $signed(add_ln23_12_fu_933_p2);
    assign sext_ln23_27_fu_942_p1 = reg_653;
    assign sext_ln23_28_fu_925_p1 = $signed(add_ln23_11_reg_2654);
    assign sext_ln23_29_fu_952_p1 = reg_653;
    assign sext_ln23_2_fu_773_p1 = $signed(add_ln23_fu_768_p2);
    assign sext_ln23_30_fu_962_p1 = $signed(add_ln23_14_fu_956_p2);
    assign sext_ln23_31_fu_966_p0 = A_q1;
    assign sext_ln23_31_fu_966_p1 = sext_ln23_31_fu_966_p0;
    assign sext_ln23_32_fu_999_p1 = $signed(add_ln23_13_reg_2669);
    assign sext_ln23_33_fu_1007_p1 = reg_649;
    assign sext_ln23_34_fu_1016_p1 = $signed(add_ln23_16_fu_1011_p2);
    assign sext_ln23_35_fu_1020_p1 = reg_653;
    assign sext_ln23_36_fu_1003_p1 = $signed(add_ln23_15_reg_2679);
    assign sext_ln23_37_fu_1030_p1 = reg_653;
    assign sext_ln23_38_fu_1040_p1 = $signed(add_ln23_18_fu_1034_p2);
    assign sext_ln23_39_fu_1044_p0 = A_q1;
    assign sext_ln23_39_fu_1044_p1 = sext_ln23_39_fu_1044_p0;
    assign sext_ln23_3_fu_777_p1 = reg_653;
    assign sext_ln23_40_fu_1081_p1 = $signed(add_ln23_17_reg_2704);
    assign sext_ln23_41_fu_1089_p1 = reg_649;
    assign sext_ln23_42_fu_1098_p1 = $signed(add_ln23_20_fu_1093_p2);
    assign sext_ln23_43_fu_1102_p1 = reg_653;
    assign sext_ln23_44_fu_1085_p1 = $signed(add_ln23_19_reg_2714);
    assign sext_ln23_45_fu_1112_p1 = reg_653;
    assign sext_ln23_46_fu_1122_p1 = $signed(add_ln23_22_fu_1116_p2);
    assign sext_ln23_47_fu_1126_p0 = A_q1;
    assign sext_ln23_47_fu_1126_p1 = sext_ln23_47_fu_1126_p0;
    assign sext_ln23_48_fu_1163_p1 = $signed(add_ln23_21_reg_2744);
    assign sext_ln23_49_fu_1171_p1 = reg_649;
    assign sext_ln23_4_cast_fu_731_p1 = $signed(sext_ln23_4);
    assign sext_ln23_50_fu_1180_p1 = $signed(add_ln23_24_fu_1175_p2);
    assign sext_ln23_51_fu_1184_p1 = reg_653;
    assign sext_ln23_52_fu_1167_p1 = $signed(add_ln23_23_reg_2754);
    assign sext_ln23_53_fu_1194_p1 = reg_653;
    assign sext_ln23_54_fu_1204_p1 = $signed(add_ln23_26_fu_1198_p2);
    assign sext_ln23_55_fu_1208_p0 = A_q1;
    assign sext_ln23_55_fu_1208_p1 = sext_ln23_55_fu_1208_p0;
    assign sext_ln23_56_fu_1245_p1 = $signed(add_ln23_25_reg_2784);
    assign sext_ln23_57_fu_1253_p1 = reg_649;
    assign sext_ln23_58_fu_1262_p1 = $signed(add_ln23_28_fu_1257_p2);
    assign sext_ln23_59_fu_1266_p1 = reg_653;
    assign sext_ln23_5_fu_787_p1 = reg_653;
    assign sext_ln23_60_fu_1249_p1 = $signed(add_ln23_27_reg_2794);
    assign sext_ln23_61_fu_1276_p1 = reg_653;
    assign sext_ln23_62_fu_1286_p1 = $signed(add_ln23_30_fu_1280_p2);
    assign sext_ln23_63_fu_1290_p0 = A_q1;
    assign sext_ln23_63_fu_1290_p1 = sext_ln23_63_fu_1290_p0;
    assign sext_ln23_64_fu_1327_p1 = $signed(add_ln23_29_reg_2824);
    assign sext_ln23_65_fu_1335_p1 = reg_649;
    assign sext_ln23_66_fu_1344_p1 = $signed(add_ln23_32_fu_1339_p2);
    assign sext_ln23_67_fu_1348_p1 = reg_653;
    assign sext_ln23_68_fu_1331_p1 = $signed(add_ln23_31_reg_2834);
    assign sext_ln23_69_fu_1358_p1 = reg_653;
    assign sext_ln23_6_fu_797_p1 = $signed(add_ln23_2_fu_791_p2);
    assign sext_ln23_70_fu_1368_p1 = $signed(add_ln23_34_fu_1362_p2);
    assign sext_ln23_71_fu_1372_p0 = A_q1;
    assign sext_ln23_71_fu_1372_p1 = sext_ln23_71_fu_1372_p0;
    assign sext_ln23_72_fu_1409_p1 = $signed(add_ln23_33_reg_2864);
    assign sext_ln23_73_fu_1417_p1 = reg_649;
    assign sext_ln23_74_fu_1426_p1 = $signed(add_ln23_36_fu_1421_p2);
    assign sext_ln23_75_fu_1430_p1 = reg_653;
    assign sext_ln23_76_fu_1413_p1 = $signed(add_ln23_35_reg_2874);
    assign sext_ln23_77_fu_1440_p1 = reg_653;
    assign sext_ln23_78_fu_1450_p1 = $signed(add_ln23_38_fu_1444_p2);
    assign sext_ln23_79_fu_1454_p0 = A_q1;
    assign sext_ln23_79_fu_1454_p1 = sext_ln23_79_fu_1454_p0;
    assign sext_ln23_7_fu_801_p0 = A_q1;
    assign sext_ln23_7_fu_801_p1 = sext_ln23_7_fu_801_p0;
    assign sext_ln23_80_fu_1491_p1 = $signed(add_ln23_37_reg_2916);
    assign sext_ln23_81_fu_1499_p1 = reg_649;
    assign sext_ln23_82_fu_1508_p1 = $signed(add_ln23_40_fu_1503_p2);
    assign sext_ln23_83_fu_1512_p1 = reg_653;
    assign sext_ln23_84_fu_1495_p1 = $signed(add_ln23_39_reg_2926);
    assign sext_ln23_85_fu_1522_p1 = reg_653;
    assign sext_ln23_86_fu_1532_p1 = $signed(add_ln23_42_fu_1526_p2);
    assign sext_ln23_87_fu_1536_p0 = A_q1;
    assign sext_ln23_87_fu_1536_p1 = sext_ln23_87_fu_1536_p0;
    assign sext_ln23_88_fu_1573_p1 = $signed(add_ln23_41_reg_2968);
    assign sext_ln23_89_fu_1581_p1 = reg_649;
    assign sext_ln23_8_fu_811_p1 = $signed(add_ln23_1_reg_2594);
    assign sext_ln23_90_fu_1590_p1 = $signed(add_ln23_44_fu_1585_p2);
    assign sext_ln23_91_fu_1594_p1 = reg_653;
    assign sext_ln23_92_fu_1577_p1 = $signed(add_ln23_43_reg_2978);
    assign sext_ln23_93_fu_1604_p1 = reg_653;
    assign sext_ln23_94_fu_1614_p1 = $signed(add_ln23_46_fu_1608_p2);
    assign sext_ln23_95_fu_1618_p0 = A_q1;
    assign sext_ln23_95_fu_1618_p1 = sext_ln23_95_fu_1618_p0;
    assign sext_ln23_96_fu_1655_p1 = $signed(add_ln23_45_reg_3020);
    assign sext_ln23_97_fu_1663_p1 = reg_649;
    assign sext_ln23_98_fu_1672_p1 = $signed(add_ln23_48_fu_1667_p2);
    assign sext_ln23_99_fu_1676_p1 = reg_653;
    assign sext_ln23_9_fu_819_p1 = reg_649;
    assign sext_ln23_cast_fu_735_p1 = $signed(sext_ln23);
    assign sext_ln25_100_fu_2264_p1 = $signed(add_ln25_47_reg_3259);
    assign sext_ln25_101_fu_2173_p1 = reg_664;
    assign sext_ln25_102_fu_2183_p1 = $signed(add_ln25_50_fu_2177_p2);
    assign sext_ln25_103_fu_2187_p1 = reg_657;
    assign sext_ln25_104_fu_2268_p1 = $signed(add_ln25_49_reg_3264);
    assign sext_ln25_105_fu_2197_p1 = reg_657;
    assign sext_ln25_106_fu_2207_p1 = $signed(add_ln25_52_fu_2201_p2);
    assign sext_ln25_107_fu_2211_p1 = reg_707;
    assign sext_ln25_108_fu_2272_p1 = $signed(add_ln25_51_reg_3269);
    assign sext_ln25_109_fu_2221_p1 = reg_707;
    assign sext_ln25_10_fu_1149_p1 = $signed(add_ln25_4_fu_1144_p2);
    assign sext_ln25_110_fu_2231_p1 = $signed(add_ln25_54_fu_2225_p2);
    assign sext_ln25_111_fu_2276_p1 = $signed(add_ln25_53_reg_3274);
    assign sext_ln25_112_fu_2280_p1 = $signed(add_ln25_55_reg_3279);
    assign sext_ln25_11_fu_1153_p1 = reg_671;
    assign sext_ln25_12_fu_1136_p1 = $signed(add_ln25_3_reg_2729);
    assign sext_ln25_13_fu_1222_p1 = reg_671;
    assign sext_ln25_14_fu_1231_p1 = $signed(add_ln25_6_fu_1226_p2);
    assign sext_ln25_15_fu_1235_p1 = reg_677;
    assign sext_ln25_16_fu_1218_p1 = $signed(add_ln25_5_reg_2769);
    assign sext_ln25_17_fu_1304_p1 = reg_677;
    assign sext_ln25_18_fu_1313_p1 = $signed(add_ln25_8_fu_1308_p2);
    assign sext_ln25_19_fu_1317_p1 = reg_664;
    assign sext_ln25_1_fu_976_p1 = reg_657;
    assign sext_ln25_20_fu_1300_p1 = $signed(add_ln25_7_reg_2809);
    assign sext_ln25_21_fu_1386_p1 = reg_664;
    assign sext_ln25_22_fu_1395_p1 = $signed(add_ln25_10_fu_1390_p2);
    assign sext_ln25_23_fu_1399_p1 = reg_657;
    assign sext_ln25_24_fu_1382_p1 = $signed(add_ln25_9_reg_2849);
    assign sext_ln25_25_fu_1468_p1 = reg_657;
    assign sext_ln25_26_fu_1477_p1 = $signed(add_ln25_12_fu_1472_p2);
    assign sext_ln25_27_fu_1481_p1 = reg_683;
    assign sext_ln25_28_fu_1464_p1 = $signed(add_ln25_11_reg_2894);
    assign sext_ln25_29_fu_1550_p1 = reg_683;
    assign sext_ln25_2_fu_985_p1 = $signed(add_ln25_fu_980_p2);
    assign sext_ln25_30_fu_1559_p1 = $signed(add_ln25_14_fu_1554_p2);
    assign sext_ln25_31_fu_1563_p1 = reg_695;
    assign sext_ln25_32_fu_1546_p1 = $signed(add_ln25_13_reg_2946);
    assign sext_ln25_33_fu_1632_p1 = reg_695;
    assign sext_ln25_34_fu_1641_p1 = $signed(add_ln25_16_fu_1636_p2);
    assign sext_ln25_35_fu_1645_p1 = reg_671;
    assign sext_ln25_36_fu_1628_p1 = $signed(add_ln25_15_reg_2998);
    assign sext_ln25_37_fu_1714_p1 = reg_671;
    assign sext_ln25_38_fu_1723_p1 = $signed(add_ln25_18_fu_1718_p2);
    assign sext_ln25_39_fu_1727_p1 = reg_677;
    assign sext_ln25_3_fu_989_p1 = reg_664;
    assign sext_ln25_40_fu_1710_p1 = $signed(add_ln25_17_reg_3050);
    assign sext_ln25_41_fu_1791_p1 = reg_677;
    assign sext_ln25_42_fu_1800_p1 = $signed(add_ln25_20_fu_1795_p2);
    assign sext_ln25_43_fu_1804_p1 = reg_707;
    assign sext_ln25_44_fu_1787_p1 = $signed(add_ln25_19_reg_3097);
    assign sext_ln25_45_fu_1826_p1 = reg_707;
    assign sext_ln25_46_fu_1835_p1 = $signed(add_ln25_22_fu_1830_p2);
    assign sext_ln25_47_fu_1839_p1 = reg_718;
    assign sext_ln25_48_fu_1822_p1 = $signed(add_ln25_21_reg_3139);
    assign sext_ln25_49_fu_1849_p1 = reg_718;
    assign sext_ln25_4_cast_fu_723_p1 = $signed(sext_ln25_4);
    assign sext_ln25_50_fu_1859_p1 = $signed(add_ln25_24_fu_1853_p2);
    assign sext_ln25_51_fu_1863_p1 = reg_664;
    assign sext_ln25_52_fu_1897_p1 = $signed(add_ln25_23_reg_3159);
    assign sext_ln25_53_fu_1873_p1 = reg_664;
    assign sext_ln25_54_fu_1883_p1 = $signed(add_ln25_26_fu_1877_p2);
    assign sext_ln25_55_fu_1887_p1 = reg_657;
    assign sext_ln25_56_fu_1901_p1 = $signed(add_ln25_25_reg_3164);
    assign sext_ln25_57_fu_1909_p1 = reg_657;
    assign sext_ln25_58_fu_1918_p1 = $signed(add_ln25_28_fu_1913_p2);
    assign sext_ln25_59_fu_1922_p1 = trunc_ln23_14_reg_2899;
    assign sext_ln25_5_fu_1058_p1 = reg_664;
    assign sext_ln25_60_fu_1905_p1 = $signed(add_ln25_27_reg_3174);
    assign sext_ln25_61_fu_1931_p1 = trunc_ln23_14_reg_2899;
    assign sext_ln25_62_fu_1940_p1 = $signed(add_ln25_30_fu_1934_p2);
    assign sext_ln25_63_fu_1944_p1 = trunc_ln23_15_reg_2951;
    assign sext_ln25_64_fu_1976_p1 = $signed(add_ln25_29_reg_3194);
    assign sext_ln25_65_fu_1953_p1 = trunc_ln23_15_reg_2951;
    assign sext_ln25_66_fu_1962_p1 = $signed(add_ln25_32_fu_1956_p2);
    assign sext_ln25_67_fu_1966_p1 = reg_683;
    assign sext_ln25_68_fu_1980_p1 = $signed(add_ln25_31_reg_3199);
    assign sext_ln25_69_fu_1988_p1 = reg_683;
    assign sext_ln25_6_fu_1067_p1 = $signed(add_ln25_2_fu_1062_p2);
    assign sext_ln25_70_fu_1997_p1 = $signed(add_ln25_34_fu_1992_p2);
    assign sext_ln25_71_fu_2001_p1 = reg_695;
    assign sext_ln25_72_fu_1984_p1 = $signed(add_ln25_33_reg_3209);
    assign sext_ln25_73_fu_2011_p1 = reg_695;
    assign sext_ln25_74_fu_2021_p1 = $signed(add_ln25_36_fu_2015_p2);
    assign sext_ln25_75_fu_2025_p1 = trunc_ln23_18_reg_3003;
    assign sext_ln25_76_fu_2240_p1 = $signed(add_ln25_35_reg_3229);
    assign sext_ln25_77_fu_2034_p1 = trunc_ln23_18_reg_3003;
    assign sext_ln25_78_fu_2043_p1 = $signed(add_ln25_38_fu_2037_p2);
    assign sext_ln25_79_fu_2047_p1 = trunc_ln23_19_reg_3055;
    assign sext_ln25_7_fu_1071_p1 = reg_657;
    assign sext_ln25_80_fu_2244_p1 = $signed(add_ln25_37_reg_3234);
    assign sext_ln25_81_fu_2056_p1 = trunc_ln23_19_reg_3055;
    assign sext_ln25_82_fu_2065_p1 = $signed(add_ln25_40_fu_2059_p2);
    assign sext_ln25_83_fu_2069_p1 = reg_671;
    assign sext_ln25_84_fu_2248_p1 = $signed(add_ln25_39_reg_3239);
    assign sext_ln25_85_fu_2079_p1 = reg_671;
    assign sext_ln25_86_fu_2089_p1 = $signed(add_ln25_42_fu_2083_p2);
    assign sext_ln25_87_fu_2093_p1 = reg_677;
    assign sext_ln25_88_fu_2252_p1 = $signed(add_ln25_41_reg_3244);
    assign sext_ln25_89_fu_2103_p1 = reg_677;
    assign sext_ln25_8_fu_1054_p1 = $signed(add_ln25_1_reg_2689);
    assign sext_ln25_90_fu_2113_p1 = $signed(add_ln25_44_fu_2107_p2);
    assign sext_ln25_91_fu_2117_p1 = trunc_ln23_22_reg_3102;
    assign sext_ln25_92_fu_2256_p1 = $signed(add_ln25_43_reg_3249);
    assign sext_ln25_93_fu_2126_p1 = trunc_ln23_22_reg_3102;
    assign sext_ln25_94_fu_2135_p1 = $signed(add_ln25_46_fu_2129_p2);
    assign sext_ln25_95_fu_2139_p1 = reg_718;
    assign sext_ln25_96_fu_2260_p1 = $signed(add_ln25_45_reg_3254);
    assign sext_ln25_97_fu_2149_p1 = reg_718;
    assign sext_ln25_98_fu_2159_p1 = $signed(add_ln25_48_fu_2153_p2);
    assign sext_ln25_99_fu_2163_p1 = reg_664;
    assign sext_ln25_9_fu_1140_p1 = reg_657;
    assign sext_ln25_cast_fu_727_p1 = $signed(sext_ln25);
    assign t_2_fu_753_p2 = (ap_sig_allocacmp_t_1 + 5'b1);
endmodule
module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_mul_34s_16ns_48_2_1_U1 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[33:0] din0,
    input logic[15:0] din1,
    output logic[47:0] dout
);
    wire logic signed[47:0] tmp_product;
    reg signed[47:0] buff0;
    assign tmp_product = ($signed(din0) * $signed({1'b0, din1}));
    always @(posedge clk) begin
        buff0 <= tmp_product;
    end
    assign dout = buff0;
endmodule

module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_mul_34s_16ns_48_2_1_U2 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[33:0] din0,
    input logic[15:0] din1,
    output logic[47:0] dout
);
    wire logic signed[47:0] tmp_product;
    reg signed[47:0] buff0;
    assign tmp_product = ($signed(din0) * $signed({1'b0, din1}));
    always @(posedge clk) begin
        buff0 <= tmp_product;
    end
    assign dout = buff0;
endmodule

module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_mul_34s_16ns_48_2_1_U3 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[33:0] din0,
    input logic[15:0] din1,
    output logic[47:0] dout
);
    wire logic signed[47:0] tmp_product;
    reg signed[47:0] buff0;
    assign tmp_product = ($signed(din0) * $signed({1'b0, din1}));
    always @(posedge clk) begin
        buff0 <= tmp_product;
    end
    assign dout = buff0;
endmodule

module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_20_1_fu_80_flow_control_loop_pipe_sequential_init_U (
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
    assign ap_loop_init = ap_loop_init_int;
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
