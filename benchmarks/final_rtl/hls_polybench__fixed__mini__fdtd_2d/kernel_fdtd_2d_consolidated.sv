module kernel_fdtd_2d (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output reg[9:0] ex_address0,
    output reg ex_ce0,
    output reg ex_we0,
    output logic[31:0] ex_d0,
    input logic[31:0] ex_q0,
    output reg[9:0] ex_address1,
    output reg ex_ce1,
    input logic[31:0] ex_q1,
    output reg[9:0] ey_address0,
    output reg ey_ce0,
    output reg ey_we0,
    output reg[31:0] ey_d0,
    input logic[31:0] ey_q0,
    output reg[9:0] ey_address1,
    output reg ey_ce1,
    input logic[31:0] ey_q1,
    output reg[9:0] hz_address0,
    output reg hz_ce0,
    output reg hz_we0,
    output logic[31:0] hz_d0,
    input logic[31:0] hz_q0,
    output reg[9:0] hz_address1,
    output reg hz_ce1,
    input logic[31:0] hz_q1,
    output logic[4:0] p_fict_s_address0,
    output reg p_fict_s_ce0,
    input logic[31:0] p_fict_s_q0
);
    reg[9:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic ap_CS_fsm_state2;
    wire logic[0:0] icmp_ln25_fu_109_p2;
    reg[31:0] p_fict_s_load_reg_146;
    wire logic ap_CS_fsm_state3;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_done;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_idle;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_ready;
    wire logic [4:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_ce0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_we0;
    wire logic[31:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_d0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_done;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_idle;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_ready;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_ce0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_we0;
    wire logic[31:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_d0;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_address1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_ce1;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_ce0;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_address1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_ce1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_done;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_idle;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_ready;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_ce0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_we0;
    wire logic[31:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_d0;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_address1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_ce1;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_ce0;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_address1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_ce1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_done;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_idle;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_ready;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_ce0;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_address1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_ce1;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_ce0;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_address1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_ce1;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_address0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_ce0;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_we0;
    wire logic[31:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_d0;
    wire logic[9:0] grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_address1;
    wire logic grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_ce1;
    reg grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start_reg;
    wire logic ap_CS_fsm_state4;
    reg grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start_reg;
    wire logic ap_CS_fsm_state5;
    wire logic ap_CS_fsm_state6;
    reg grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start_reg;
    wire logic ap_CS_fsm_state7;
    wire logic ap_CS_fsm_state8;
    reg grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start_reg;
    wire logic ap_CS_fsm_state9;
    wire logic ap_CS_fsm_state10;
    wire logic [4:0] zext_ln25_fu_121_p1;
    reg[4:0] t_fu_50;
    wire logic[4:0] add_ln25_fu_115_p2;
    reg[9:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 10'd1;
        grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start_reg = 1'b0;
        grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start_reg = 1'b0;
        grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start_reg = 1'b0;
        grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start_reg = 1'b0;
    end
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67 grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start),
        .ap_done(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_done),
        .ap_idle(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_idle),
        .ap_ready(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_ready),
        .ey_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_address0),
        .ey_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_ce0),
        .ey_we0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_we0),
        .ey_d0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_d0),
        .p_fict_s_load(p_fict_s_load_reg_146)
    );
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75 grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start),
        .ap_done(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_done),
        .ap_idle(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_idle),
        .ap_ready(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_ready),
        .ey_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_address0),
        .ey_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_ce0),
        .ey_we0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_we0),
        .ey_d0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_d0),
        .ey_address1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_address1),
        .ey_ce1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_ce1),
        .ey_q1(ey_q1),
        .hz_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_address0),
        .hz_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_ce0),
        .hz_q0(hz_q0),
        .hz_address1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_address1),
        .hz_ce1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_ce1),
        .hz_q1(hz_q1)
    );
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83 grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start),
        .ap_done(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_done),
        .ap_idle(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_idle),
        .ap_ready(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_ready),
        .ex_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_address0),
        .ex_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_ce0),
        .ex_we0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_we0),
        .ex_d0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_d0),
        .ex_address1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_address1),
        .ex_ce1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_ce1),
        .ex_q1(ex_q1),
        .hz_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_address0),
        .hz_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_ce0),
        .hz_q0(hz_q0),
        .hz_address1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_address1),
        .hz_ce1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_ce1),
        .hz_q1(hz_q1)
    );
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91 grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start),
        .ap_done(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_done),
        .ap_idle(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_idle),
        .ap_ready(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_ready),
        .ex_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_address0),
        .ex_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_ce0),
        .ex_q0(ex_q0),
        .ex_address1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_address1),
        .ex_ce1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_ce1),
        .ex_q1(ex_q1),
        .ey_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_address0),
        .ey_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_ce0),
        .ey_q0(ey_q0),
        .ey_address1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_address1),
        .ey_ce1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_ce1),
        .ey_q1(ey_q1),
        .hz_address0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_address0),
        .hz_ce0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_ce0),
        .hz_we0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_we0),
        .hz_d0(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_d0),
        .hz_address1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_address1),
        .hz_ce1(grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_ce1),
        .hz_q1(hz_q1)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 10'd1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state3)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_ready == 1'b1)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state5)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_ready == 1'b1)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state7)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_ready == 1'b1)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state9)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_ready == 1'b1)) begin
                grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            t_fu_50 <= 5'b0;
        end
        else if (((icmp_ln25_fu_109_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
            t_fu_50 <= add_ln25_fu_115_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            p_fict_s_load_reg_146 <= p_fict_s_q0;
        end
    end
    always @* begin
        if (((icmp_ln25_fu_109_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
        if (((icmp_ln25_fu_109_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ex_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            ex_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_address0;
        end
        else begin
            ex_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ex_address1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_address1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            ex_address1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_address1;
        end
        else begin
            ex_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ex_ce0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_ce0;
        end
        else begin
            ex_ce0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_ce0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ex_ce1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ex_ce1;
        end
        else begin
            ex_ce1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_ce1;
        end
    end
    always @* begin begin
            ex_we0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_we0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ey_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            ey_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            ey_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_address0;
        end
        else begin
            ey_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ey_address1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_address1;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            ey_address1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_address1;
        end
        else begin
            ey_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ey_ce0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_ce0;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            ey_ce0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_ce0;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            ey_ce0 = 1'b1;
        end
        else begin
            ey_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            ey_ce1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ey_ce1;
        end
        else begin
            ey_ce1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_ce1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            ey_d0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_d0;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            ey_d0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_d0;
        end
        else begin
            ey_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            ey_we0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ey_we0;
        end
        else begin
            ey_we0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ey_we0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            hz_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            hz_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            hz_address0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_address0;
        end
        else begin
            hz_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            hz_address1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_address1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            hz_address1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_address1;
        end
        else if ((1'b1 == ap_CS_fsm_state6)) begin
            hz_address1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_address1;
        end
        else begin
            hz_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            hz_ce0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_ce0;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            hz_ce0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_ce0;
        end
        else begin
            hz_ce0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_ce0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state10)) begin
            hz_ce1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_ce1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            hz_ce1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_hz_ce1;
        end
        else begin
            hz_ce1 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_hz_ce1;
        end
    end
    always @* begin begin
            hz_we0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_we0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            p_fict_s_ce0 = 1'b1;
        end
        else begin
            p_fict_s_ce0 = 1'b0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            10'd1: begin
                if (( (ap_start == 1'b1))) begin
                    ap_NS_fsm = 10'd2;
                end
                else begin
                    ap_NS_fsm = 10'd1;
                end
            end
            10'd2: begin
                if (((icmp_ln25_fu_109_p2 == 1'b1))) begin
                    ap_NS_fsm = 10'd1;
                end
                else begin
                    ap_NS_fsm = 10'd4;
                end
            end
            10'd4: begin
                ap_NS_fsm = 10'd8;
            end
            10'd8: begin
                if (((grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_done == 1'b1))) begin
                    ap_NS_fsm = 10'd16;
                end
                else begin
                    ap_NS_fsm = 10'd8;
                end
            end
            10'd16: begin
                ap_NS_fsm = 10'd32;
            end
            10'd32: begin
                if (( (grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_done == 1'b1))) begin
                    ap_NS_fsm = 10'd64;
                end
                else begin
                    ap_NS_fsm = 10'd32;
                end
            end
            10'd64: begin
                ap_NS_fsm = 10'd128;
            end
            10'd128: begin
                if (( (grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_done == 1'b1))) begin
                    ap_NS_fsm = 10'd256;
                end
                else begin
                    ap_NS_fsm = 10'd128;
                end
            end
            10'd256: begin
                ap_NS_fsm = 10'd512;
            end
            10'd512: begin
                if (( (grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_done == 1'b1))) begin
                    ap_NS_fsm = 10'd2;
                end
                else begin
                    ap_NS_fsm = 10'd512;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln25_fu_115_p2 = (t_fu_50 + 5'b1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
    assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
    assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
    assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
    assign ex_d0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ex_d0;
    assign grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_ap_start_reg;
    assign grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_ap_start_reg;
    assign grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_ap_start_reg;
    assign grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_ap_start_reg;
    assign hz_d0 = grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_hz_d0;
    assign icmp_ln25_fu_109_p2 = ((t_fu_50 == 5'b10100) ? 1'b1 : 1'b0);
    assign p_fict_s_address0 = zext_ln25_fu_121_p1;
    assign zext_ln25_fu_121_p1 = t_fu_50;
endmodule

module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output logic[9:0] ey_address0,
    output reg ey_ce0,
    output reg ey_we0,
    output logic[31:0] ey_d0,
    input logic[31:0] p_fict_s_load
);
    reg[0:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic[0:0] icmp_ln27_fu_70_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic [4:0] j_cast_fu_82_p1;
    reg[4:0] j_fu_38;
    wire logic[4:0] add_ln27_fu_76_p2;
    wire logic ap_loop_init;
    reg[4:0] ap_sig_allocacmp_j_1;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_done_reg = 1'b0;
    end
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
    always @(posedge ap_clk) begin begin
            ap_CS_fsm <= 1'b1;
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_done_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                j_fu_38 <= add_ln27_fu_76_p2;
            end
        end
    end
    always @* begin
        if ((( (icmp_ln27_fu_70_p2 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if ((( (ap_loop_exit_ready == 1'b1)) & (1'b1 == 1'b1))) begin
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
        if (((ap_start_int == 1'b1) & (1'b1 == 1'b1))) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if (((ap_loop_init == 1'b1) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_j_1 = 5'b0;
        end
        else begin
            ap_sig_allocacmp_j_1 = j_fu_38;
        end
    end
    always @* begin begin
            ey_ce0 = 1'b1;
        end
    end
    always @* begin
        if ((((ap_start_int == 1'b1) & (icmp_ln27_fu_70_p2 == 1'b0)) & (1'b1 == 1'b1))) begin
            ey_we0 = 1'b1;
        end
        else begin
            ey_we0 = 1'b0;
        end
    end
    always @* begin
        case (1'b1)
            1'b1: begin
                ap_NS_fsm = 1'b1;
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln27_fu_76_p2 = (ap_sig_allocacmp_j_1 + 5'b1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign ey_address0 = j_cast_fu_82_p1;
    assign ey_d0 = p_fict_s_load;
    assign icmp_ln27_fu_70_p2 = ((ap_sig_allocacmp_j_1 == 5'b11110) ? 1'b1 : 1'b0);
    assign j_cast_fu_82_p1 = ap_sig_allocacmp_j_1;
endmodule
module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_27_2_fu_67_flow_control_loop_pipe_sequential_init_U (
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


module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output logic[9:0] ey_address0,
    output reg ey_ce0,
    output reg ey_we0,
    output logic[31:0] ey_d0,
    output logic[9:0] ey_address1,
    output reg ey_ce1,
    input logic[31:0] ey_q1,
    output logic[9:0] hz_address0,
    output reg hz_ce0,
    input logic[31:0] hz_q0,
    output logic[9:0] hz_address1,
    output reg hz_ce1,
    input logic[31:0] hz_q1
);
    reg[0:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    wire logic ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_enable_reg_pp0_iter3;
    reg ap_idle_pp0;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic[0:0] icmp_ln29_fu_138_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic[4:0] select_ln29_fu_168_p3;
    reg[4:0] select_ln29_reg_363;
    wire logic[4:0] select_ln29_1_fu_176_p3;
    reg[4:0] select_ln29_1_reg_368;
    wire logic[4:0] select_ln29_2_fu_190_p3;
    reg[4:0] select_ln29_2_reg_374;
    reg[9:0] ey_addr_1_reg_380;
    reg[9:0] ey_addr_1_reg_380_pp0_iter2_reg;
    wire logic[32:0] sub_ln31_fu_301_p2;
    reg[32:0] sub_ln31_reg_396;
    reg[31:0] ey_load_reg_401;
    wire logic [9:0] zext_ln31_3_fu_276_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [9:0] zext_ln31_4_fu_288_p1;
    reg[4:0] j_fu_66;
    wire logic[4:0] add_ln30_fu_198_p2;
    wire logic ap_loop_init;
    reg[4:0] ap_sig_allocacmp_j_load;
    reg[4:0] i_fu_70;
    reg[4:0] ap_sig_allocacmp_i_load;
    reg[9:0] indvar_flatten_fu_74;
    wire logic[9:0] add_ln29_1_fu_144_p2;
    reg[9:0] ap_sig_allocacmp_indvar_flatten_load;
    wire logic[0:0] icmp_ln30_fu_162_p2;
    wire logic[4:0] add_ln29_fu_156_p2;
    wire logic[4:0] empty_fu_184_p2;
    wire logic[5:0] tmp_1_fu_226_p3;
    wire logic[9:0] tmp_fu_219_p3;
    wire logic [5:0] zext_ln31_fu_233_p1;
    wire logic[5:0] tmp_3_fu_250_p3;
    wire logic[9:0] tmp_2_fu_243_p3;
    wire logic [5:0] zext_ln31_1_fu_257_p1;
    wire logic[9:0] sub_ln31_2_fu_237_p2;
    wire logic [4:0] zext_ln31_2_fu_267_p1;
    wire logic[9:0] add_ln31_fu_270_p2;
    wire logic[9:0] sub_ln31_3_fu_261_p2;
    wire logic[9:0] add_ln31_1_fu_282_p2;
    wire logic signed [31:0] sext_ln31_fu_293_p1;
    wire logic signed [31:0] sext_ln31_1_fu_297_p1;
    wire logic[47:0] shl_ln31_1_fu_314_p3;
    wire logic[47:0] shl_ln_fu_307_p3;
    wire logic[47:0] sub_ln31_1_fu_321_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg ap_loop_exit_ready_pp0_iter2_reg;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter3 = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
    always @(posedge ap_clk) begin begin
            ap_CS_fsm <= 1'b1;
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_done_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else begin
                ap_enable_reg_pp0_iter1 <= ap_start_int;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (( (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                i_fu_70 <= select_ln29_1_fu_176_p3;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln29_fu_138_p2 == 1'b0))) begin
                indvar_flatten_fu_74 <= add_ln29_1_fu_144_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (( (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_66 <= add_ln30_fu_198_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            ey_addr_1_reg_380 <= zext_ln31_3_fu_276_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            ey_addr_1_reg_380_pp0_iter2_reg <= ey_addr_1_reg_380;
            sub_ln31_reg_396 <= sub_ln31_fu_301_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            ey_load_reg_401 <= ey_q1;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln29_fu_138_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            select_ln29_1_reg_368 <= select_ln29_1_fu_176_p3;
            select_ln29_2_reg_374 <= select_ln29_2_fu_190_p3;
            select_ln29_reg_363 <= select_ln29_fu_168_p3;
        end
    end
    always @* begin
        if (((((icmp_ln29_fu_138_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    always @* begin begin
            ap_idle_pp0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_i_load = 5'b1;
        end
        else begin
            ap_sig_allocacmp_i_load = i_fu_70;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_indvar_flatten_load = 10'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_74;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_j_load = 5'b0;
        end
        else begin
            ap_sig_allocacmp_j_load = j_fu_66;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            ey_ce0 = 1'b1;
        end
        else begin
            ey_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            ey_ce1 = 1'b1;
        end
        else begin
            ey_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            ey_we0 = 1'b1;
        end
        else begin
            ey_we0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            hz_ce0 = 1'b1;
        end
        else begin
            hz_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            hz_ce1 = 1'b1;
        end
        else begin
            hz_ce1 = 1'b0;
        end
    end
    always @* begin
        case (1'b1)
            1'b1: begin
                ap_NS_fsm = 1'b1;
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln29_1_fu_144_p2 = (ap_sig_allocacmp_indvar_flatten_load + 10'd1);
    assign add_ln29_fu_156_p2 = (ap_sig_allocacmp_i_load + 5'b1);
    assign add_ln30_fu_198_p2 = (select_ln29_fu_168_p3 + 5'b1);
    assign add_ln31_1_fu_282_p2 = (sub_ln31_3_fu_261_p2 + zext_ln31_2_fu_267_p1);
    assign add_ln31_fu_270_p2 = (sub_ln31_2_fu_237_p2 + zext_ln31_2_fu_267_p1);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign empty_fu_184_p2 = ($signed(ap_sig_allocacmp_i_load) + $signed(5'b11111));
    assign ey_address0 = ey_addr_1_reg_380_pp0_iter2_reg;
    assign ey_address1 = zext_ln31_3_fu_276_p1;
    assign ey_d0 = {{sub_ln31_1_fu_321_p2[47:16]}};
    assign hz_address0 = zext_ln31_4_fu_288_p1;
    assign hz_address1 = zext_ln31_3_fu_276_p1;
    assign icmp_ln29_fu_138_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 10'd570) ? 1'b1 : 1'b0);
    assign icmp_ln30_fu_162_p2 = ((ap_sig_allocacmp_j_load == 5'b11110) ? 1'b1 : 1'b0);
    assign select_ln29_1_fu_176_p3 = ((icmp_ln30_fu_162_p2[0:0] == 1'b1) ? add_ln29_fu_156_p2 : ap_sig_allocacmp_i_load);
    assign select_ln29_2_fu_190_p3 = ((icmp_ln30_fu_162_p2[0:0] == 1'b1) ? ap_sig_allocacmp_i_load : empty_fu_184_p2);
    assign select_ln29_fu_168_p3 = ((icmp_ln30_fu_162_p2[0:0] == 1'b1) ? 5'b0 : ap_sig_allocacmp_j_load);
    assign sext_ln31_1_fu_297_p1 = $signed(hz_q0);
    assign sext_ln31_fu_293_p1 = $signed(hz_q1);
    assign shl_ln31_1_fu_314_p3 = {{ey_load_reg_401}, 16'd0};
    assign shl_ln_fu_307_p3 = {{sub_ln31_reg_396}, 15'd0};
    assign sub_ln31_1_fu_321_p2 = (shl_ln31_1_fu_314_p3 - shl_ln_fu_307_p3);
    assign sub_ln31_2_fu_237_p2 = (tmp_fu_219_p3 - zext_ln31_fu_233_p1);
    assign sub_ln31_3_fu_261_p2 = (tmp_2_fu_243_p3 - zext_ln31_1_fu_257_p1);
    assign sub_ln31_fu_301_p2 = ($signed(sext_ln31_fu_293_p1) - $signed(sext_ln31_1_fu_297_p1));
    assign tmp_1_fu_226_p3 = {{select_ln29_1_reg_368}, 1'b0};
    assign tmp_2_fu_243_p3 = {{select_ln29_2_reg_374}, 5'b0};
    assign tmp_3_fu_250_p3 = {{select_ln29_2_reg_374}, 1'b0};
    assign tmp_fu_219_p3 = {{select_ln29_1_reg_368}, 5'b0};
    assign zext_ln31_1_fu_257_p1 = tmp_3_fu_250_p3;
    assign zext_ln31_2_fu_267_p1 = select_ln29_reg_363;
    assign zext_ln31_3_fu_276_p1 = add_ln31_fu_270_p2;
    assign zext_ln31_4_fu_288_p1 = add_ln31_1_fu_282_p2;
    assign zext_ln31_fu_233_p1 = tmp_1_fu_226_p3;
endmodule
module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_29_3_VITIS_LOOP_30_4_fu_75_flow_control_loop_pipe_sequential_init_U (
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
    always @* begin
        if (((ap_done_int == 1'b1) || (1'b0 && (ap_start_int == 1'b0)))) begin
            ap_done = 1'b1;
        end
        else begin
            ap_done = 1'b0;
        end
    end
endmodule


module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output logic[9:0] ex_address0,
    output reg ex_ce0,
    output reg ex_we0,
    output logic[31:0] ex_d0,
    output logic[9:0] ex_address1,
    output reg ex_ce1,
    input logic[31:0] ex_q1,
    output logic[9:0] hz_address0,
    output reg hz_ce0,
    input logic[31:0] hz_q0,
    output logic[9:0] hz_address1,
    output reg hz_ce1,
    input logic[31:0] hz_q1
);
    reg[0:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    wire logic ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_enable_reg_pp0_iter3;
    reg ap_idle_pp0;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic[0:0] icmp_ln32_fu_138_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic[4:0] select_ln32_fu_168_p3;
    reg[4:0] select_ln32_reg_334;
    wire logic[4:0] select_ln32_1_fu_176_p3;
    reg[4:0] select_ln32_1_reg_340;
    reg[9:0] ex_addr_reg_346;
    reg[9:0] ex_addr_reg_346_pp0_iter2_reg;
    wire logic[32:0] sub_ln34_fu_272_p2;
    reg[32:0] sub_ln34_reg_362;
    reg[31:0] ex_load_reg_367;
    wire logic [9:0] zext_ln34_2_fu_238_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [9:0] zext_ln34_4_fu_259_p1;
    reg[4:0] j_fu_66;
    wire logic[4:0] add_ln33_fu_184_p2;
    wire logic ap_loop_init;
    reg[4:0] ap_sig_allocacmp_j_load;
    reg[4:0] i_fu_70;
    reg[4:0] ap_sig_allocacmp_i_load;
    reg[9:0] indvar_flatten6_fu_74;
    wire logic[9:0] add_ln32_1_fu_144_p2;
    reg[9:0] ap_sig_allocacmp_indvar_flatten6_load;
    wire logic[0:0] icmp_ln33_fu_162_p2;
    wire logic[4:0] add_ln32_fu_156_p2;
    wire logic[5:0] tmp_5_fu_212_p3;
    wire logic[9:0] tmp_4_fu_205_p3;
    wire logic [5:0] zext_ln34_fu_219_p1;
    wire logic[9:0] sub_ln34_2_fu_223_p2;
    wire logic [4:0] zext_ln34_1_fu_229_p1;
    wire logic[9:0] add_ln34_1_fu_232_p2;
    wire logic[4:0] add_ln34_fu_244_p2;
    wire logic [4:0] zext_ln34_3_fu_249_p1;
    wire logic[9:0] add_ln34_2_fu_253_p2;
    wire logic signed [31:0] sext_ln34_fu_264_p1;
    wire logic signed [31:0] sext_ln34_1_fu_268_p1;
    wire logic[47:0] shl_ln34_1_fu_285_p3;
    wire logic[47:0] shl_ln1_fu_278_p3;
    wire logic[47:0] sub_ln34_1_fu_292_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg ap_loop_exit_ready_pp0_iter2_reg;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter3 = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
    always @(posedge ap_clk) begin begin
            ap_CS_fsm <= 1'b1;
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_done_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else begin
                ap_enable_reg_pp0_iter1 <= ap_start_int;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (( (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                i_fu_70 <= select_ln32_1_fu_176_p3;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln32_fu_138_p2 == 1'b0))) begin
                indvar_flatten6_fu_74 <= add_ln32_1_fu_144_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (( (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_66 <= add_ln33_fu_184_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            ex_addr_reg_346 <= zext_ln34_2_fu_238_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            ex_addr_reg_346_pp0_iter2_reg <= ex_addr_reg_346;
            sub_ln34_reg_362 <= sub_ln34_fu_272_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            ex_load_reg_367 <= ex_q1;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln32_fu_138_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            select_ln32_1_reg_340 <= select_ln32_1_fu_176_p3;
            select_ln32_reg_334 <= select_ln32_fu_168_p3;
        end
    end
    always @* begin
        if (((((icmp_ln32_fu_138_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b1))) begin
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
    always @* begin begin
            ap_idle_pp0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_i_load = 5'b0;
        end
        else begin
            ap_sig_allocacmp_i_load = i_fu_70;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_indvar_flatten6_load = 10'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten6_load = indvar_flatten6_fu_74;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_j_load = 5'b1;
        end
        else begin
            ap_sig_allocacmp_j_load = j_fu_66;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            ex_ce0 = 1'b1;
        end
        else begin
            ex_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            ex_ce1 = 1'b1;
        end
        else begin
            ex_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            ex_we0 = 1'b1;
        end
        else begin
            ex_we0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            hz_ce0 = 1'b1;
        end
        else begin
            hz_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            hz_ce1 = 1'b1;
        end
        else begin
            hz_ce1 = 1'b0;
        end
    end
    always @* begin
        case (1'b1)
            1'b1: begin
                ap_NS_fsm = 1'b1;
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln32_1_fu_144_p2 = (ap_sig_allocacmp_indvar_flatten6_load + 10'd1);
    assign add_ln32_fu_156_p2 = (ap_sig_allocacmp_i_load + 5'b1);
    assign add_ln33_fu_184_p2 = (select_ln32_fu_168_p3 + 5'b1);
    assign add_ln34_1_fu_232_p2 = (sub_ln34_2_fu_223_p2 + zext_ln34_1_fu_229_p1);
    assign add_ln34_2_fu_253_p2 = (sub_ln34_2_fu_223_p2 + zext_ln34_3_fu_249_p1);
    assign add_ln34_fu_244_p2 = ($signed(select_ln32_reg_334) + $signed(5'b11111));
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign ex_address0 = ex_addr_reg_346_pp0_iter2_reg;
    assign ex_address1 = zext_ln34_2_fu_238_p1;
    assign ex_d0 = {{sub_ln34_1_fu_292_p2[47:16]}};
    assign hz_address0 = zext_ln34_4_fu_259_p1;
    assign hz_address1 = zext_ln34_2_fu_238_p1;
    assign icmp_ln32_fu_138_p2 = ((ap_sig_allocacmp_indvar_flatten6_load == 10'd580) ? 1'b1 : 1'b0);
    assign icmp_ln33_fu_162_p2 = ((ap_sig_allocacmp_j_load == 5'b11110) ? 1'b1 : 1'b0);
    assign select_ln32_1_fu_176_p3 = ((icmp_ln33_fu_162_p2[0:0] == 1'b1) ? add_ln32_fu_156_p2 : ap_sig_allocacmp_i_load);
    assign select_ln32_fu_168_p3 = ((icmp_ln33_fu_162_p2[0:0] == 1'b1) ? 5'b1 : ap_sig_allocacmp_j_load);
    assign sext_ln34_1_fu_268_p1 = $signed(hz_q0);
    assign sext_ln34_fu_264_p1 = $signed(hz_q1);
    assign shl_ln1_fu_278_p3 = {{sub_ln34_reg_362}, 15'd0};
    assign shl_ln34_1_fu_285_p3 = {{ex_load_reg_367}, 16'd0};
    assign sub_ln34_1_fu_292_p2 = (shl_ln34_1_fu_285_p3 - shl_ln1_fu_278_p3);
    assign sub_ln34_2_fu_223_p2 = (tmp_4_fu_205_p3 - zext_ln34_fu_219_p1);
    assign sub_ln34_fu_272_p2 = ($signed(sext_ln34_fu_264_p1) - $signed(sext_ln34_1_fu_268_p1));
    assign tmp_4_fu_205_p3 = {{select_ln32_1_reg_340}, 5'b0};
    assign tmp_5_fu_212_p3 = {{select_ln32_1_reg_340}, 1'b0};
    assign zext_ln34_1_fu_229_p1 = select_ln32_reg_334;
    assign zext_ln34_2_fu_238_p1 = add_ln34_1_fu_232_p2;
    assign zext_ln34_3_fu_249_p1 = add_ln34_fu_244_p2;
    assign zext_ln34_4_fu_259_p1 = add_ln34_2_fu_253_p2;
    assign zext_ln34_fu_219_p1 = tmp_5_fu_212_p3;
endmodule
module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_32_5_VITIS_LOOP_33_6_fu_83_flow_control_loop_pipe_sequential_init_U (
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
    always @* begin
        if (((ap_done_int == 1'b1) || (1'b0 && (ap_start_int == 1'b0)))) begin
            ap_done = 1'b1;
        end
        else begin
            ap_done = 1'b0;
        end
    end
endmodule


module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output logic[9:0] ex_address0,
    output reg ex_ce0,
    input logic[31:0] ex_q0,
    output logic[9:0] ex_address1,
    output reg ex_ce1,
    input logic[31:0] ex_q1,
    output logic[9:0] ey_address0,
    output reg ey_ce0,
    input logic[31:0] ey_q0,
    output logic[9:0] ey_address1,
    output reg ey_ce1,
    input logic[31:0] ey_q1,
    output logic[9:0] hz_address0,
    output reg hz_ce0,
    output reg hz_we0,
    output logic[31:0] hz_d0,
    output logic[9:0] hz_address1,
    output reg hz_ce1,
    input logic[31:0] hz_q1
);
    reg[0:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    wire logic ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_enable_reg_pp0_iter3;
    reg ap_enable_reg_pp0_iter4;
    reg ap_enable_reg_pp0_iter5;
    reg ap_enable_reg_pp0_iter6;
    reg ap_idle_pp0;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic[0:0] icmp_ln35_fu_167_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic[4:0] select_ln35_fu_191_p3;
    reg[4:0] select_ln35_reg_424;
    wire logic[4:0] select_ln35_1_fu_205_p3;
    reg[4:0] select_ln35_1_reg_429;
    wire logic[4:0] select_ln35_2_fu_219_p3;
    reg[4:0] select_ln35_2_reg_435;
    wire logic[4:0] add_ln37_fu_227_p2;
    reg[4:0] add_ln37_reg_441;
    reg[9:0] hz_addr_reg_461;
    reg[9:0] hz_addr_reg_461_pp0_iter2_reg;
    reg[9:0] hz_addr_reg_461_pp0_iter3_reg;
    reg[9:0] hz_addr_reg_461_pp0_iter4_reg;
    reg[9:0] hz_addr_reg_461_pp0_iter5_reg;
    wire logic[32:0] sub_ln37_fu_345_p2;
    reg[32:0] sub_ln37_reg_472;
    reg[31:0] ey_load_reg_477;
    reg[31:0] ey_load_1_reg_482;
    wire logic[33:0] sub_ln38_fu_366_p2;
    reg signed[33:0] sub_ln38_reg_487;
    reg[31:0] hz_load_reg_497;
    wire logic[47:0] grp_fu_144_p2;
    reg[47:0] mul_ln37_reg_502;
    wire logic [9:0] zext_ln37_3_fu_305_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [9:0] zext_ln37_4_fu_318_p1;
    wire logic [9:0] zext_ln37_6_fu_332_p1;
    reg[4:0] j_fu_66;
    wire logic ap_loop_init;
    reg[4:0] ap_sig_allocacmp_j_load;
    reg[4:0] i_fu_70;
    reg[4:0] ap_sig_allocacmp_i_load;
    reg[9:0] indvar_flatten13_fu_74;
    wire logic[9:0] add_ln35_fu_173_p2;
    reg[9:0] ap_sig_allocacmp_indvar_flatten13_load;
    wire logic signed[16:0] grp_fu_144_p1;
    wire logic[0:0] icmp_ln36_fu_185_p2;
    wire logic[4:0] indvars_iv_next3216_fu_199_p2;
    wire logic[4:0] indvars_iv_next32_mid1_fu_213_p2;
    wire logic[5:0] tmp_7_fu_255_p3;
    wire logic[9:0] tmp_6_fu_248_p3;
    wire logic [5:0] zext_ln37_fu_262_p1;
    wire logic[5:0] tmp_9_fu_279_p3;
    wire logic[9:0] tmp_8_fu_272_p3;
    wire logic [5:0] zext_ln37_1_fu_286_p1;
    wire logic[9:0] sub_ln37_1_fu_266_p2;
    wire logic [4:0] zext_ln37_2_fu_296_p1;
    wire logic[9:0] add_ln37_3_fu_299_p2;
    wire logic[9:0] sub_ln37_2_fu_290_p2;
    wire logic[9:0] add_ln37_4_fu_312_p2;
    wire logic [4:0] zext_ln37_5_fu_323_p1;
    wire logic[9:0] add_ln37_5_fu_326_p2;
    wire logic signed [31:0] sext_ln37_fu_337_p1;
    wire logic signed [31:0] sext_ln37_1_fu_341_p1;
    wire logic signed [32:0] sext_ln37_2_fu_351_p1;
    wire logic signed [31:0] sext_ln37_3_fu_354_p1;
    wire logic[33:0] add_ln37_1_fu_357_p2;
    wire logic signed [31:0] sext_ln38_fu_363_p1;
    wire logic[47:0] shl_ln2_fu_376_p3;
    wire logic[47:0] add_ln37_2_fu_383_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg ap_loop_exit_ready_pp0_iter2_reg;
    reg ap_loop_exit_ready_pp0_iter3_reg;
    reg ap_loop_exit_ready_pp0_iter4_reg;
    reg ap_loop_exit_ready_pp0_iter5_reg;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter3 = 1'b0;
        ap_enable_reg_pp0_iter4 = 1'b0;
        ap_enable_reg_pp0_iter5 = 1'b0;
        ap_enable_reg_pp0_iter6 = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_mul_34s_17s_48_2_1_U7 mul_34s_17s_48_2_1_U7 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(sub_ln38_reg_487),
        .din1(grp_fu_144_p1),
        .dout(grp_fu_144_p2)
    );
    kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
    always @(posedge ap_clk) begin begin
            ap_CS_fsm <= 1'b1;
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_done_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage0)) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else begin
                ap_enable_reg_pp0_iter1 <= ap_start_int;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (( (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                i_fu_70 <= select_ln35_1_fu_205_p3;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln35_fu_167_p2 == 1'b0))) begin
                indvar_flatten13_fu_74 <= add_ln35_fu_173_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (( (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_66 <= add_ln37_fu_227_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln35_fu_167_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            add_ln37_reg_441 <= add_ln37_fu_227_p2;
            select_ln35_1_reg_429 <= select_ln35_1_fu_205_p3;
            select_ln35_2_reg_435 <= select_ln35_2_fu_219_p3;
            select_ln35_reg_424 <= select_ln35_fu_191_p3;
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            hz_addr_reg_461 <= zext_ln37_3_fu_305_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
            ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
            hz_addr_reg_461_pp0_iter2_reg <= hz_addr_reg_461;
            hz_addr_reg_461_pp0_iter3_reg <= hz_addr_reg_461_pp0_iter2_reg;
            hz_addr_reg_461_pp0_iter4_reg <= hz_addr_reg_461_pp0_iter3_reg;
            hz_addr_reg_461_pp0_iter5_reg <= hz_addr_reg_461_pp0_iter4_reg;
            mul_ln37_reg_502 <= grp_fu_144_p2;
            sub_ln37_reg_472 <= sub_ln37_fu_345_p2;
            sub_ln38_reg_487 <= sub_ln38_fu_366_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            ey_load_1_reg_482 <= ey_q0;
            ey_load_reg_477 <= ey_q1;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            hz_load_reg_497 <= hz_q1;
        end
    end
    always @* begin
        if (((((icmp_ln35_fu_167_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter5_reg == 1'b1))) begin
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
    always @* begin begin
            ap_idle_pp0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_i_load = 5'b0;
        end
        else begin
            ap_sig_allocacmp_i_load = i_fu_70;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_indvar_flatten13_load = 10'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten13_load = indvar_flatten13_fu_74;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_j_load = 5'b0;
        end
        else begin
            ap_sig_allocacmp_j_load = j_fu_66;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            ex_ce0 = 1'b1;
        end
        else begin
            ex_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            ex_ce1 = 1'b1;
        end
        else begin
            ex_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            ey_ce0 = 1'b1;
        end
        else begin
            ey_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            ey_ce1 = 1'b1;
        end
        else begin
            ey_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b1))) begin
            hz_ce0 = 1'b1;
        end
        else begin
            hz_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
            hz_ce1 = 1'b1;
        end
        else begin
            hz_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b1))) begin
            hz_we0 = 1'b1;
        end
        else begin
            hz_we0 = 1'b0;
        end
    end
    always @* begin
        case (1'b1)
            1'b1: begin
                ap_NS_fsm = 1'b1;
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln35_fu_173_p2 = (ap_sig_allocacmp_indvar_flatten13_load + 10'd1);
    assign add_ln37_1_fu_357_p2 = ($signed(sext_ln37_2_fu_351_p1) + $signed(sext_ln37_3_fu_354_p1));
    assign add_ln37_2_fu_383_p2 = (shl_ln2_fu_376_p3 + mul_ln37_reg_502);
    assign add_ln37_3_fu_299_p2 = (sub_ln37_1_fu_266_p2 + zext_ln37_2_fu_296_p1);
    assign add_ln37_4_fu_312_p2 = (sub_ln37_2_fu_290_p2 + zext_ln37_2_fu_296_p1);
    assign add_ln37_5_fu_326_p2 = (sub_ln37_1_fu_266_p2 + zext_ln37_5_fu_323_p1);
    assign add_ln37_fu_227_p2 = (select_ln35_fu_191_p3 + 5'b1);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign ex_address0 = zext_ln37_3_fu_305_p1;
    assign ex_address1 = zext_ln37_6_fu_332_p1;
    assign ey_address0 = zext_ln37_3_fu_305_p1;
    assign ey_address1 = zext_ln37_4_fu_318_p1;
    assign grp_fu_144_p1 = 48'hffffffff4ccd;
    assign hz_address0 = hz_addr_reg_461_pp0_iter5_reg;
    assign hz_address1 = hz_addr_reg_461_pp0_iter3_reg;
    assign hz_d0 = {{add_ln37_2_fu_383_p2[47:16]}};
    assign icmp_ln35_fu_167_p2 = ((ap_sig_allocacmp_indvar_flatten13_load == 10'd551) ? 1'b1 : 1'b0);
    assign icmp_ln36_fu_185_p2 = ((ap_sig_allocacmp_j_load == 5'b11101) ? 1'b1 : 1'b0);
    assign indvars_iv_next3216_fu_199_p2 = (ap_sig_allocacmp_i_load + 5'b1);
    assign indvars_iv_next32_mid1_fu_213_p2 = (ap_sig_allocacmp_i_load + 5'b10);
    assign select_ln35_1_fu_205_p3 = ((icmp_ln36_fu_185_p2[0:0] == 1'b1) ? indvars_iv_next3216_fu_199_p2 : ap_sig_allocacmp_i_load);
    assign select_ln35_2_fu_219_p3 = ((icmp_ln36_fu_185_p2[0:0] == 1'b1) ? indvars_iv_next32_mid1_fu_213_p2 : indvars_iv_next3216_fu_199_p2);
    assign select_ln35_fu_191_p3 = ((icmp_ln36_fu_185_p2[0:0] == 1'b1) ? 5'b0 : ap_sig_allocacmp_j_load);
    assign sext_ln37_1_fu_341_p1 = $signed(ex_q0);
    assign sext_ln37_2_fu_351_p1 = $signed(sub_ln37_reg_472);
    assign sext_ln37_3_fu_354_p1 = $signed(ey_load_reg_477);
    assign sext_ln37_fu_337_p1 = $signed(ex_q1);
    assign sext_ln38_fu_363_p1 = $signed(ey_load_1_reg_482);
    assign shl_ln2_fu_376_p3 = {{hz_load_reg_497}, 16'd0};
    assign sub_ln37_1_fu_266_p2 = (tmp_6_fu_248_p3 - zext_ln37_fu_262_p1);
    assign sub_ln37_2_fu_290_p2 = (tmp_8_fu_272_p3 - zext_ln37_1_fu_286_p1);
    assign sub_ln37_fu_345_p2 = ($signed(sext_ln37_fu_337_p1) - $signed(sext_ln37_1_fu_341_p1));
    assign sub_ln38_fu_366_p2 = ($signed(add_ln37_1_fu_357_p2) - $signed(sext_ln38_fu_363_p1));
    assign tmp_6_fu_248_p3 = {{select_ln35_1_reg_429}, 5'b0};
    assign tmp_7_fu_255_p3 = {{select_ln35_1_reg_429}, 1'b0};
    assign tmp_8_fu_272_p3 = {{select_ln35_2_reg_435}, 5'b0};
    assign tmp_9_fu_279_p3 = {{select_ln35_2_reg_435}, 1'b0};
    assign zext_ln37_1_fu_286_p1 = tmp_9_fu_279_p3;
    assign zext_ln37_2_fu_296_p1 = select_ln35_reg_424;
    assign zext_ln37_3_fu_305_p1 = add_ln37_3_fu_299_p2;
    assign zext_ln37_4_fu_318_p1 = add_ln37_4_fu_312_p2;
    assign zext_ln37_5_fu_323_p1 = add_ln37_reg_441;
    assign zext_ln37_6_fu_332_p1 = add_ln37_5_fu_326_p2;
    assign zext_ln37_fu_262_p1 = tmp_7_fu_255_p3;
endmodule
module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_mul_34s_17s_48_2_1_U7 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[33:0] din0,
    input logic[16:0] din1,
    output logic[47:0] dout
);
    wire logic signed[47:0] tmp_product;
    reg signed[47:0] buff0;
    assign tmp_product = ($signed(din0) * $signed(din1));
    always @(posedge clk) begin
        buff0 <= tmp_product;
    end
    assign dout = buff0;
endmodule

module kernel_fdtd_2d_grp_kernel_fdtd_2d_Pipeline_VITIS_LOOP_35_7_VITIS_LOOP_36_8_fu_91_flow_control_loop_pipe_sequential_init_U (
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
    always @* begin
        if (((ap_done_int == 1'b1) || (1'b0 && (ap_start_int == 1'b0)))) begin
            ap_done = 1'b1;
        end
        else begin
            ap_done = 1'b0;
        end
    end
endmodule
