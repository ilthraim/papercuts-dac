module kernel_gemm (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    input logic[31:0] alpha,
    input logic[31:0] beta,
    output reg[8:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output reg[31:0] C_d0,
    input logic[31:0] C_q0,
    output reg[8:0] C_address1,
    output reg C_ce1,
    output reg C_we1,
    output logic[31:0] C_d1,
    input logic[31:0] C_q1,
    output logic[9:0] A_address0,
    output logic A_ce0,
    input logic[31:0] A_q0,
    output logic[9:0] B_address0,
    output logic B_ce0,
    input logic[31:0] B_q0,
    output logic[9:0] B_address1,
    output logic B_ce1,
    input logic[31:0] B_q1
);
    reg[4:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    reg[8:0] phi_mul2_load_reg_411;
    wire logic ap_CS_fsm_state2;
    reg[4:0] i_1_reg_441;
    wire logic[8:0] add_ln27_25_fu_218_p2;
    reg[8:0] add_ln27_25_reg_450;
    wire logic ap_CS_fsm_state4;
    wire logic[8:0] add_ln27_26_fu_224_p2;
    reg[8:0] add_ln27_26_reg_455;
    wire logic[8:0] add_ln27_27_fu_230_p2;
    reg[8:0] add_ln27_27_reg_460;
    wire logic[8:0] add_ln27_28_fu_236_p2;
    reg[8:0] add_ln27_28_reg_465;
    wire logic[8:0] add_ln27_29_fu_242_p2;
    reg[8:0] add_ln27_29_reg_470;
    wire logic[8:0] add_ln27_30_fu_248_p2;
    reg[8:0] add_ln27_30_reg_475;
    wire logic[8:0] add_ln27_31_fu_254_p2;
    reg[8:0] add_ln27_31_reg_480;
    wire logic[8:0] add_ln27_32_fu_260_p2;
    reg[8:0] add_ln27_32_reg_485;
    wire logic[8:0] add_ln27_33_fu_266_p2;
    reg[8:0] add_ln27_33_reg_490;
    wire logic[8:0] add_ln27_34_fu_272_p2;
    reg[8:0] add_ln27_34_reg_495;
    wire logic[8:0] add_ln27_35_fu_278_p2;
    reg[8:0] add_ln27_35_reg_500;
    wire logic[8:0] add_ln27_36_fu_284_p2;
    reg[8:0] add_ln27_36_reg_505;
    wire logic[8:0] add_ln27_37_fu_290_p2;
    reg[8:0] add_ln27_37_reg_510;
    wire logic[8:0] add_ln27_38_fu_296_p2;
    reg[8:0] add_ln27_38_reg_515;
    wire logic[8:0] add_ln27_39_fu_302_p2;
    reg[8:0] add_ln27_39_reg_520;
    wire logic[8:0] add_ln27_40_fu_308_p2;
    reg[8:0] add_ln27_40_reg_525;
    wire logic[8:0] add_ln27_41_fu_314_p2;
    reg[8:0] add_ln27_41_reg_530;
    wire logic[8:0] add_ln27_42_fu_320_p2;
    reg[8:0] add_ln27_42_reg_535;
    wire logic[8:0] add_ln27_43_fu_326_p2;
    reg[8:0] add_ln27_43_reg_540;
    wire logic[8:0] add_ln27_44_fu_332_p2;
    reg[8:0] add_ln27_44_reg_545;
    wire logic[8:0] add_ln27_45_fu_338_p2;
    reg[8:0] add_ln27_45_reg_550;
    wire logic[8:0] add_ln27_46_fu_344_p2;
    reg[8:0] add_ln27_46_reg_555;
    wire logic[8:0] add_ln27_47_fu_350_p2;
    reg[8:0] add_ln27_47_reg_560;
    wire logic[8:0] add_ln27_48_fu_356_p2;
    reg[8:0] add_ln27_48_reg_565;
    wire logic[9:0] empty_fu_380_p2;
    reg[9:0] empty_reg_570;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_done;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_idle;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_ready;
    wire logic[8:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_ce0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_we0;
    wire logic[31:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_d0;
    wire logic[8:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_address1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_ce1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_done;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_idle;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_ready;
    wire logic[8:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_ce0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_we0;
    wire logic[31:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_d0;
    wire logic[8:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_address1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_ce1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_we1;
    wire logic[31:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_d1;
    wire logic[9:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_A_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_A_ce0;
    wire logic[9:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_ce0;
    wire logic[9:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_address1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_ce1;
    reg grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start_reg;
    wire logic[0:0] icmp_ln22_fu_196_p2;
    wire logic ap_CS_fsm_state3;
    reg grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start_reg;
    wire logic ap_CS_fsm_state5;
    reg[8:0] phi_mul2_fu_108;
    wire logic[8:0] add_ln22_1_fu_190_p2;
    reg[4:0] i_fu_112;
    wire logic[4:0] add_ln22_fu_202_p2;
    wire logic[5:0] tmp_1_fu_369_p3;
    wire logic[9:0] tmp_fu_362_p3;
    wire logic [5:0] tmp_1_cast_fu_376_p1;
    reg[4:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 5'b1;
        grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start_reg = 1'b0;
        grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start_reg = 1'b0;
    end
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128 grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start),
        .ap_done(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_done),
        .ap_idle(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_idle),
        .ap_ready(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_ready),
        .phi_mul2(phi_mul2_load_reg_411),
        .C_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_address0),
        .C_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_ce0),
        .C_we0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_we0),
        .C_d0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_d0),
        .C_address1(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_address1),
        .C_ce1(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_ce1),
        .C_q1(C_q1),
        .beta_cast(beta)
    );
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136 grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start),
        .ap_done(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_done),
        .ap_idle(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_idle),
        .ap_ready(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_ready),
        .C_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_address0),
        .C_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_ce0),
        .C_we0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_we0),
        .C_d0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_d0),
        .C_q0(C_q0),
        .C_address1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_address1),
        .C_ce1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_ce1),
        .C_we1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_we1),
        .C_d1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_d1),
        .C_q1(C_q1),
        .add_ln27_48(add_ln27_48_reg_565),
        .add_ln27_47(add_ln27_47_reg_560),
        .add_ln27_46(add_ln27_46_reg_555),
        .add_ln27_45(add_ln27_45_reg_550),
        .add_ln27_44(add_ln27_44_reg_545),
        .add_ln27_43(add_ln27_43_reg_540),
        .add_ln27_42(add_ln27_42_reg_535),
        .add_ln27_41(add_ln27_41_reg_530),
        .add_ln27_40(add_ln27_40_reg_525),
        .add_ln27_39(add_ln27_39_reg_520),
        .add_ln27_38(add_ln27_38_reg_515),
        .add_ln27_37(add_ln27_37_reg_510),
        .add_ln27_36(add_ln27_36_reg_505),
        .add_ln27_35(add_ln27_35_reg_500),
        .add_ln27_34(add_ln27_34_reg_495),
        .add_ln27_33(add_ln27_33_reg_490),
        .add_ln27_32(add_ln27_32_reg_485),
        .add_ln27_31(add_ln27_31_reg_480),
        .add_ln27_30(add_ln27_30_reg_475),
        .add_ln27_29(add_ln27_29_reg_470),
        .add_ln27_28(add_ln27_28_reg_465),
        .add_ln27_27(add_ln27_27_reg_460),
        .add_ln27_26(add_ln27_26_reg_455),
        .add_ln27_25(add_ln27_25_reg_450),
        .phi_mul2(phi_mul2_load_reg_411),
        .empty(empty_reg_570),
        .A_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_A_address0),
        .A_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_A_ce0),
        .A_q0(A_q0),
        .B_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_address0),
        .B_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_ce0),
        .B_q0(B_q0),
        .B_address1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_address1),
        .B_ce1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_ce1),
        .B_q1(B_q1),
        .conv_i70(alpha)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 5'b1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start_reg <= 1'b0;
        end
        else begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln22_fu_196_p2 == 1'b0))) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_ready == 1'b1)) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state4)) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_ready == 1'b1)) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            i_fu_112 <= 5'b0;
        end
        else if (((1'b1 == ap_CS_fsm_state2))) begin
            i_fu_112 <= add_ln22_fu_202_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            phi_mul2_fu_108 <= 9'd0;
        end
        else if (((1'b1 == ap_CS_fsm_state2))) begin
            phi_mul2_fu_108 <= add_ln22_1_fu_190_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            add_ln27_25_reg_450 <= add_ln27_25_fu_218_p2;
            add_ln27_26_reg_455 <= add_ln27_26_fu_224_p2;
            add_ln27_27_reg_460 <= add_ln27_27_fu_230_p2;
            add_ln27_28_reg_465 <= add_ln27_28_fu_236_p2;
            add_ln27_29_reg_470 <= add_ln27_29_fu_242_p2;
            add_ln27_30_reg_475 <= add_ln27_30_fu_248_p2;
            add_ln27_31_reg_480 <= add_ln27_31_fu_254_p2;
            add_ln27_32_reg_485 <= add_ln27_32_fu_260_p2;
            add_ln27_33_reg_490 <= add_ln27_33_fu_266_p2;
            add_ln27_34_reg_495 <= add_ln27_34_fu_272_p2;
            add_ln27_35_reg_500 <= add_ln27_35_fu_278_p2;
            add_ln27_36_reg_505 <= add_ln27_36_fu_284_p2;
            add_ln27_37_reg_510 <= add_ln27_37_fu_290_p2;
            add_ln27_38_reg_515 <= add_ln27_38_fu_296_p2;
            add_ln27_39_reg_520 <= add_ln27_39_fu_302_p2;
            add_ln27_40_reg_525 <= add_ln27_40_fu_308_p2;
            add_ln27_41_reg_530 <= add_ln27_41_fu_314_p2;
            add_ln27_42_reg_535 <= add_ln27_42_fu_320_p2;
            add_ln27_43_reg_540 <= add_ln27_43_fu_326_p2;
            add_ln27_44_reg_545 <= add_ln27_44_fu_332_p2;
            add_ln27_45_reg_550 <= add_ln27_45_fu_338_p2;
            add_ln27_46_reg_555 <= add_ln27_46_fu_344_p2;
            add_ln27_47_reg_560 <= add_ln27_47_fu_350_p2;
            add_ln27_48_reg_565 <= add_ln27_48_fu_356_p2;
            empty_reg_570[9:1] <= empty_fu_380_p2[9:1];
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            i_1_reg_441 <= i_fu_112;
            phi_mul2_load_reg_411 <= phi_mul2_fu_108;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_address0;
        end
        else begin
            C_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_address1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_address1;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_address1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_address1;
        end
        else begin
            C_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_ce0;
        end
        else begin
            C_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_ce0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_ce1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_ce1;
        end
        else begin
            C_ce1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_ce1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_d0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_d0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_d0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_d0;
        end
        else begin
            C_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_we0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_we0;
        end
        else begin
            C_we0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_C_we0;
        end
    end
    always @* begin begin
            C_we1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_we1;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln22_fu_196_p2 == 1'b1))) begin
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
        if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln22_fu_196_p2 == 1'b1))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            5'b1: begin
                if (( (ap_start == 1'b1))) begin
                    ap_NS_fsm = 5'b10;
                end
                else begin
                    ap_NS_fsm = 5'b1;
                end
            end
            5'b10: begin
                if (( (icmp_ln22_fu_196_p2 == 1'b1))) begin
                    ap_NS_fsm = 5'b1;
                end
                else begin
                    ap_NS_fsm = 5'b100;
                end
            end
            5'b100: begin
                if (( (grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_done == 1'b1))) begin
                    ap_NS_fsm = 5'b1000;
                end
                else begin
                    ap_NS_fsm = 5'b100;
                end
            end
            5'b1000: begin
                ap_NS_fsm = 5'b10000;
            end
            5'b10000: begin
                if (( (grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_done == 1'b1))) begin
                    ap_NS_fsm = 5'b10;
                end
                else begin
                    ap_NS_fsm = 5'b10000;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign A_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_A_address0;
    assign A_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_A_ce0;
    assign B_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_address0;
    assign B_address1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_address1;
    assign B_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_ce0;
    assign B_ce1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_B_ce1;
    assign C_d1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_C_d1;
    assign add_ln22_1_fu_190_p2 = (phi_mul2_fu_108 + 9'd25);
    assign add_ln22_fu_202_p2 = (i_fu_112 + 5'b1);
    assign add_ln27_25_fu_218_p2 = (phi_mul2_load_reg_411 + 9'd1);
    assign add_ln27_26_fu_224_p2 = (phi_mul2_load_reg_411 + 9'd2);
    assign add_ln27_27_fu_230_p2 = (phi_mul2_load_reg_411 + 9'd3);
    assign add_ln27_28_fu_236_p2 = (phi_mul2_load_reg_411 + 9'd4);
    assign add_ln27_29_fu_242_p2 = (phi_mul2_load_reg_411 + 9'd5);
    assign add_ln27_30_fu_248_p2 = (phi_mul2_load_reg_411 + 9'd6);
    assign add_ln27_31_fu_254_p2 = (phi_mul2_load_reg_411 + 9'd7);
    assign add_ln27_32_fu_260_p2 = (phi_mul2_load_reg_411 + 9'd8);
    assign add_ln27_33_fu_266_p2 = (phi_mul2_load_reg_411 + 9'd9);
    assign add_ln27_34_fu_272_p2 = (phi_mul2_load_reg_411 + 9'd10);
    assign add_ln27_35_fu_278_p2 = (phi_mul2_load_reg_411 + 9'd11);
    assign add_ln27_36_fu_284_p2 = (phi_mul2_load_reg_411 + 9'd12);
    assign add_ln27_37_fu_290_p2 = (phi_mul2_load_reg_411 + 9'd13);
    assign add_ln27_38_fu_296_p2 = (phi_mul2_load_reg_411 + 9'd14);
    assign add_ln27_39_fu_302_p2 = (phi_mul2_load_reg_411 + 9'd15);
    assign add_ln27_40_fu_308_p2 = (phi_mul2_load_reg_411 + 9'd16);
    assign add_ln27_41_fu_314_p2 = (phi_mul2_load_reg_411 + 9'd17);
    assign add_ln27_42_fu_320_p2 = (phi_mul2_load_reg_411 + 9'd18);
    assign add_ln27_43_fu_326_p2 = (phi_mul2_load_reg_411 + 9'd19);
    assign add_ln27_44_fu_332_p2 = (phi_mul2_load_reg_411 + 9'd20);
    assign add_ln27_45_fu_338_p2 = (phi_mul2_load_reg_411 + 9'd21);
    assign add_ln27_46_fu_344_p2 = (phi_mul2_load_reg_411 + 9'd22);
    assign add_ln27_47_fu_350_p2 = (phi_mul2_load_reg_411 + 9'd23);
    assign add_ln27_48_fu_356_p2 = (phi_mul2_load_reg_411 + 9'd24);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign empty_fu_380_p2 = (tmp_fu_362_p3 - tmp_1_cast_fu_376_p1);
    assign grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_ap_start_reg;
    assign grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_fu_136_ap_start_reg;
    assign icmp_ln22_fu_196_p2 = ((i_fu_112 == 5'b10100) ? 1'b1 : 1'b0);
    assign tmp_1_cast_fu_376_p1 = tmp_1_fu_369_p3;
    assign tmp_1_fu_369_p3 = {{i_1_reg_441}, 1'b0};
    assign tmp_fu_362_p3 = {{i_1_reg_441}, 5'b0};
    always @(posedge ap_clk) begin
        empty_reg_570[0] <= 1'b0;
    end
endmodule