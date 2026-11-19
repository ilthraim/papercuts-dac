module kernel_bicg (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output logic[13:0] A_address0,
    output logic A_ce0,
    input logic[31:0] A_q0,
    output reg[6:0] s_address0,
    output reg s_ce0,
    output reg s_we0,
    output reg[31:0] s_d0,
    output logic[6:0] s_address1,
    output reg s_ce1,
    input logic[31:0] s_q1,
    output logic[6:0] q_address0,
    output logic q_ce0,
    output logic q_we0,
    output logic[31:0] q_d0,
    output logic[6:0] p_address0,
    output logic p_ce0,
    input logic[31:0] p_q0,
    output logic[6:0] r_address0,
    output logic r_ce0,
    input logic[31:0] r_q0
);
    reg[3:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_done;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_idle;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_ready;
    wire logic[6:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_address0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_ce0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_we0;
    wire logic [0:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_d0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_done;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_idle;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_ready;
    wire logic[6:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_r_address0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_r_ce0;
    wire logic[13:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_A_address0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_A_ce0;
    wire logic[6:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_address0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_ce0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_we0;
    wire logic[31:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_d0;
    wire logic[6:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_address1;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_ce1;
    wire logic[6:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_p_address0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_p_ce0;
    wire logic[6:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_address0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_ce0;
    wire logic grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_we0;
    wire logic[31:0] grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_d0;
    reg grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start_reg;
    wire logic ap_CS_fsm_state2;
    reg grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start_reg;
    wire logic ap_CS_fsm_state3;
    wire logic ap_CS_fsm_state4;
    reg[3:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 4'b1;
        grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start_reg = 1'b0;
        grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start_reg = 1'b0;
    end
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30 grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start),
        .ap_done(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_done),
        .ap_idle(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_idle),
        .ap_ready(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_ready),
        .s_address0(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_address0),
        .s_ce0(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_ce0),
        .s_we0(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_we0),
        .s_d0(grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_d0)
    );
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36 grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start),
        .ap_done(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_done),
        .ap_idle(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_idle),
        .ap_ready(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_ready),
        .r_address0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_r_address0),
        .r_ce0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_r_ce0),
        .r_q0(r_q0),
        .A_address0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_A_address0),
        .A_ce0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_A_ce0),
        .A_q0(A_q0),
        .s_address0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_address0),
        .s_ce0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_ce0),
        .s_we0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_we0),
        .s_d0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_d0),
        .s_address1(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_address1),
        .s_ce1(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_ce1),
        .s_q1(s_q1),
        .p_address0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_p_address0),
        .p_ce0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_p_ce0),
        .p_q0(p_q0),
        .q_address0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_address0),
        .q_ce0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_ce0),
        .q_we0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_we0),
        .q_d0(grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_d0)
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
            grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start_reg <= 1'b0;
        end
        else begin
            if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
                grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_ready == 1'b1)) begin
                grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state3)) begin
                grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_ready == 1'b1)) begin
                grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start_reg <= 1'b0;
            end
        end
    end
    always @* begin
        if (((grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
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
        if (((grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_done == 1'b1) & (1'b1 == ap_CS_fsm_state4))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            s_address0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            s_address0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_address0;
        end
        else begin
            s_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            s_ce0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_ce0;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            s_ce0 = 1'b1;
        end
        else begin
            s_ce0 = 1'b0;
        end
    end
    always @* begin begin
            s_ce1 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_ce1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            s_d0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_d0;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            s_d0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_d0;
        end
        else begin
            s_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            s_we0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_we0;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            s_we0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_s_we0;
        end
        else begin
            s_we0 = 1'b0;
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
                if (((grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_done == 1'b1))) begin
                    ap_NS_fsm = 4'b100;
                end
                else begin
                    ap_NS_fsm = 4'b10;
                end
            end
            4'b100: begin
                ap_NS_fsm = 4'b1000;
            end
            4'b1000: begin
                if (((grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_done == 1'b1))) begin
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
    assign A_address0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_A_address0;
    assign A_ce0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_A_ce0;
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start = grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_ap_start_reg;
    assign grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_ap_start_reg;
    assign p_address0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_p_address0;
    assign p_ce0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_p_ce0;
    assign q_address0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_address0;
    assign q_ce0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_ce0;
    assign q_d0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_d0;
    assign q_we0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_q_we0;
    assign r_address0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_r_address0;
    assign r_ce0 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_r_ce0;
    assign s_address1 = grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_s_address1;
endmodule

module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output logic[6:0] s_address0,
    output reg s_ce0,
    output reg s_we0,
    output logic[31:0] s_d0
);
    reg[0:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic[0:0] icmp_ln22_fu_60_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic [6:0] i_cast_fu_72_p1;
    reg[6:0] i_fu_34;
    wire logic[6:0] add_ln22_fu_66_p2;
    wire logic ap_loop_init;
    reg[6:0] ap_sig_allocacmp_i_1;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_done_reg = 1'b0;
    end
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
                i_fu_34 <= add_ln22_fu_66_p2;
            end
        end
    end
    always @* begin
        if ((( (icmp_ln22_fu_60_p2 == 1'b1)) & (1'b1 == 1'b1))) begin
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
            ap_sig_allocacmp_i_1 = 7'b0;
        end
        else begin
            ap_sig_allocacmp_i_1 = i_fu_34;
        end
    end
    always @* begin begin
            s_ce0 = 1'b1;
        end
    end
    always @* begin
        if ((( (icmp_ln22_fu_60_p2 == 1'b0)) & (1'b1 == 1'b1))) begin
            s_we0 = 1'b1;
        end
        else begin
            s_we0 = 1'b0;
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
    assign add_ln22_fu_66_p2 = (ap_sig_allocacmp_i_1 + 7'b1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign i_cast_fu_72_p1 = ap_sig_allocacmp_i_1;
    assign icmp_ln22_fu_60_p2 = ((ap_sig_allocacmp_i_1 == 7'b1110100) ? 1'b1 : 1'b0);
    assign s_address0 = i_cast_fu_72_p1;
    assign s_d0 = 32'd0;
endmodule
module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_22_1_fu_30_flow_control_loop_pipe_sequential_init_U (
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


module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output logic[6:0] r_address0,
    output reg r_ce0,
    input logic[31:0] r_q0,
    output logic[13:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output logic[6:0] s_address0,
    output reg s_ce0,
    output reg s_we0,
    output logic[31:0] s_d0,
    output logic[6:0] s_address1,
    output reg s_ce1,
    input logic[31:0] s_q1,
    output logic[6:0] p_address0,
    output reg p_ce0,
    input logic[31:0] p_q0,
    output logic[6:0] q_address0,
    output reg q_ce0,
    output reg q_we0,
    output logic[31:0] q_d0
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
    reg ap_enable_reg_pp0_iter7;
    reg ap_idle_pp0;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic[0:0] icmp_ln24_fu_177_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic[0:0] icmp_ln27_fu_201_p2;
    reg[0:0] icmp_ln27_reg_386;
    reg[0:0] icmp_ln27_reg_386_pp0_iter1_reg;
    reg[0:0] icmp_ln27_reg_386_pp0_iter2_reg;
    reg[0:0] icmp_ln27_reg_386_pp0_iter3_reg;
    reg[0:0] icmp_ln27_reg_386_pp0_iter4_reg;
    reg[0:0] icmp_ln27_reg_386_pp0_iter5_reg;
    reg[0:0] icmp_ln27_reg_386_pp0_iter6_reg;
    wire logic[6:0] select_ln24_fu_207_p3;
    reg[6:0] select_ln24_reg_391;
    reg[6:0] select_ln24_reg_391_pp0_iter1_reg;
    reg[6:0] select_ln24_reg_391_pp0_iter2_reg;
    wire logic[6:0] select_ln24_1_fu_215_p3;
    reg[6:0] select_ln24_1_reg_397;
    reg[6:0] select_ln24_1_reg_397_pp0_iter1_reg;
    reg[6:0] select_ln24_1_reg_397_pp0_iter2_reg;
    wire logic[0:0] ifzero_fu_233_p2;
    reg[0:0] ifzero_reg_407;
    reg[0:0] ifzero_reg_407_pp0_iter1_reg;
    reg[0:0] ifzero_reg_407_pp0_iter2_reg;
    reg[0:0] ifzero_reg_407_pp0_iter3_reg;
    reg[0:0] ifzero_reg_407_pp0_iter4_reg;
    reg[0:0] ifzero_reg_407_pp0_iter5_reg;
    reg[0:0] ifzero_reg_407_pp0_iter6_reg;
    wire logic [6:0] zext_ln24_fu_257_p1;
    reg [6:0] zext_ln24_reg_416;
    reg [6:0] zext_ln24_reg_416_pp0_iter4_reg;
    reg [6:0] zext_ln24_reg_416_pp0_iter5_reg;
    reg [6:0] zext_ln24_reg_416_pp0_iter6_reg;
    reg[6:0] s_addr_reg_431;
    reg[6:0] s_addr_reg_431_pp0_iter4_reg;
    reg[6:0] s_addr_reg_431_pp0_iter5_reg;
    reg[6:0] s_addr_reg_431_pp0_iter6_reg;
    reg signed[31:0] r_load_reg_442;
    reg[31:0] A_load_reg_447;
    reg signed[31:0] p_load_9_reg_452;
    wire logic signed [31:0] sext_ln29_fu_274_p1;
    wire logic[47:0] grp_fu_146_p2;
    reg[47:0] mul_ln29_reg_473;
    reg[31:0] s_load_reg_478;
    wire logic[47:0] grp_fu_150_p2;
    reg[47:0] mul_ln30_reg_483;
    wire logic ap_block_pp0_stage0;
    wire logic [13:0] zext_ln29_2_fu_266_p1;
    wire logic [6:0] j_cast_fu_261_p1;
    reg[31:0] empty_fu_62;
    wire logic ap_loop_init;
    reg[6:0] j_fu_66;
    wire logic[6:0] add_ln27_fu_227_p2;
    reg[6:0] ap_sig_allocacmp_j_load;
    reg[6:0] i_fu_70;
    reg[6:0] ap_sig_allocacmp_i_load;
    reg[13:0] indvar_flatten_fu_74;
    wire logic[13:0] add_ln24_1_fu_183_p2;
    reg[13:0] ap_sig_allocacmp_indvar_flatten_load;
    wire logic signed[31:0] grp_fu_146_p0;
    wire logic signed[31:0] grp_fu_150_p1;
    wire logic[6:0] add_ln24_fu_195_p2;
    wire logic[13:0] grp_fu_345_p3;
    wire logic[47:0] shl_ln_fu_286_p3;
    wire logic[47:0] add_ln29_fu_293_p2;
    wire logic[31:0] select_ln24_2_fu_309_p3;
    wire logic[47:0] shl_ln1_fu_316_p3;
    wire logic[47:0] add_ln30_fu_324_p2;
    wire logic[6:0] grp_fu_345_p0;
    wire logic[6:0] grp_fu_345_p1;
    wire logic[6:0] grp_fu_345_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg ap_loop_exit_ready_pp0_iter2_reg;
    reg ap_loop_exit_ready_pp0_iter3_reg;
    reg ap_loop_exit_ready_pp0_iter4_reg;
    reg ap_loop_exit_ready_pp0_iter5_reg;
    reg ap_loop_exit_ready_pp0_iter6_reg;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    wire logic [6:0] grp_fu_345_p00;
    wire logic [6:0] grp_fu_345_p20;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter3 = 1'b0;
        ap_enable_reg_pp0_iter4 = 1'b0;
        ap_enable_reg_pp0_iter5 = 1'b0;
        ap_enable_reg_pp0_iter6 = 1'b0;
        ap_enable_reg_pp0_iter7 = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mul_32s_32s_48_2_1_U2 mul_32s_32s_48_2_1_U2 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_146_p0),
        .din1(r_load_reg_442),
        .dout(grp_fu_146_p2)
    );
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mul_32s_32s_48_2_1_U3 mul_32s_32s_48_2_1_U3 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(p_load_9_reg_452),
        .din1(grp_fu_150_p1),
        .dout(grp_fu_150_p2)
    );
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mac_muladd_7ns_7ns_7ns_14_4_1_U4 mac_muladd_7ns_7ns_7ns_14_4_1_U4 (
        .clk(ap_clk),
        .reset(ap_rst),
        .ce(1'b1),
        .din0(grp_fu_345_p0),
        .din1(grp_fu_345_p1),
        .din2(grp_fu_345_p2),
        .dout(grp_fu_345_p3)
    );
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((ap_loop_init == 1'b1) & (1'b1 == 1'b1))) begin
                empty_fu_62 <= 32'd0;
            end
            else if ((ap_enable_reg_pp0_iter7 == 1'b1)) begin
                empty_fu_62 <= {{add_ln30_fu_324_p2[47:16]}};
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln24_fu_177_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                i_fu_70 <= select_ln24_1_fu_215_p3;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln24_fu_177_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                indvar_flatten_fu_74 <= add_ln24_1_fu_183_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln24_fu_177_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_66 <= add_ln27_fu_227_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            A_load_reg_447 <= A_q0;
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
            ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
            ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
            icmp_ln27_reg_386_pp0_iter2_reg <= icmp_ln27_reg_386_pp0_iter1_reg;
            icmp_ln27_reg_386_pp0_iter3_reg <= icmp_ln27_reg_386_pp0_iter2_reg;
            icmp_ln27_reg_386_pp0_iter4_reg <= icmp_ln27_reg_386_pp0_iter3_reg;
            icmp_ln27_reg_386_pp0_iter5_reg <= icmp_ln27_reg_386_pp0_iter4_reg;
            icmp_ln27_reg_386_pp0_iter6_reg <= icmp_ln27_reg_386_pp0_iter5_reg;
            ifzero_reg_407_pp0_iter2_reg <= ifzero_reg_407_pp0_iter1_reg;
            ifzero_reg_407_pp0_iter3_reg <= ifzero_reg_407_pp0_iter2_reg;
            ifzero_reg_407_pp0_iter4_reg <= ifzero_reg_407_pp0_iter3_reg;
            ifzero_reg_407_pp0_iter5_reg <= ifzero_reg_407_pp0_iter4_reg;
            ifzero_reg_407_pp0_iter6_reg <= ifzero_reg_407_pp0_iter5_reg;
            mul_ln29_reg_473 <= grp_fu_146_p2;
            mul_ln30_reg_483 <= grp_fu_150_p2;
            p_load_9_reg_452 <= p_q0;
            r_load_reg_442 <= r_q0;
            s_addr_reg_431 <= j_cast_fu_261_p1;
            s_addr_reg_431_pp0_iter4_reg <= s_addr_reg_431;
            s_addr_reg_431_pp0_iter5_reg <= s_addr_reg_431_pp0_iter4_reg;
            s_addr_reg_431_pp0_iter6_reg <= s_addr_reg_431_pp0_iter5_reg;
            select_ln24_1_reg_397_pp0_iter2_reg <= select_ln24_1_reg_397_pp0_iter1_reg;
            select_ln24_reg_391_pp0_iter2_reg <= select_ln24_reg_391_pp0_iter1_reg;
            zext_ln24_reg_416[6:0] <= zext_ln24_fu_257_p1[6:0];
            zext_ln24_reg_416_pp0_iter4_reg[6:0] <= zext_ln24_reg_416[6:0];
            zext_ln24_reg_416_pp0_iter5_reg[6:0] <= zext_ln24_reg_416_pp0_iter4_reg[6:0];
            zext_ln24_reg_416_pp0_iter6_reg[6:0] <= zext_ln24_reg_416_pp0_iter5_reg[6:0];
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            icmp_ln27_reg_386_pp0_iter1_reg <= icmp_ln27_reg_386;
            ifzero_reg_407_pp0_iter1_reg <= ifzero_reg_407;
            select_ln24_1_reg_397_pp0_iter1_reg <= select_ln24_1_reg_397;
            select_ln24_reg_391_pp0_iter1_reg <= select_ln24_reg_391;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln24_fu_177_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            icmp_ln27_reg_386 <= icmp_ln27_fu_201_p2;
            ifzero_reg_407 <= ifzero_fu_233_p2;
            select_ln24_1_reg_397 <= select_ln24_1_fu_215_p3;
            select_ln24_reg_391 <= select_ln24_fu_207_p3;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b1))) begin
            s_load_reg_478 <= s_q1;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln24_fu_177_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter6_reg == 1'b1))) begin
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
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_i_load = 7'b0;
        end
        else begin
            ap_sig_allocacmp_i_load = i_fu_70;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_indvar_flatten_load = 14'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_74;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_j_load = 7'b0;
        end
        else begin
            ap_sig_allocacmp_j_load = j_fu_66;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            p_ce0 = 1'b1;
        end
        else begin
            p_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
            q_ce0 = 1'b1;
        end
        else begin
            q_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1)) & (ifzero_reg_407_pp0_iter6_reg == 1'b1))) begin
            q_we0 = 1'b1;
        end
        else begin
            q_we0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            r_ce0 = 1'b1;
        end
        else begin
            r_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
            s_ce0 = 1'b1;
        end
        else begin
            s_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            s_ce1 = 1'b1;
        end
        else begin
            s_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
            s_we0 = 1'b1;
        end
        else begin
            s_we0 = 1'b0;
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
    assign A_address0 = zext_ln29_2_fu_266_p1;
    assign add_ln24_1_fu_183_p2 = (ap_sig_allocacmp_indvar_flatten_load + 14'd1);
    assign add_ln24_fu_195_p2 = (ap_sig_allocacmp_i_load + 7'b1);
    assign add_ln27_fu_227_p2 = (select_ln24_fu_207_p3 + 7'b1);
    assign add_ln29_fu_293_p2 = (shl_ln_fu_286_p3 + mul_ln29_reg_473);
    assign add_ln30_fu_324_p2 = (shl_ln1_fu_316_p3 + mul_ln30_reg_483);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign grp_fu_146_p0 = sext_ln29_fu_274_p1;
    assign grp_fu_150_p1 = sext_ln29_fu_274_p1;
    assign grp_fu_345_p0 = grp_fu_345_p00;
    assign grp_fu_345_p00 = select_ln24_1_fu_215_p3;
    assign grp_fu_345_p1 = 14'd116;
    assign grp_fu_345_p2 = grp_fu_345_p20;
    assign grp_fu_345_p20 = select_ln24_reg_391_pp0_iter1_reg;
    assign icmp_ln24_fu_177_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 14'd14384) ? 1'b1 : 1'b0);
    assign icmp_ln27_fu_201_p2 = ((ap_sig_allocacmp_j_load == 7'b1110100) ? 1'b1 : 1'b0);
    assign ifzero_fu_233_p2 = ((add_ln27_fu_227_p2 == 7'b1110100) ? 1'b1 : 1'b0);
    assign j_cast_fu_261_p1 = select_ln24_reg_391_pp0_iter2_reg;
    assign p_address0 = j_cast_fu_261_p1;
    assign q_address0 = zext_ln24_reg_416_pp0_iter6_reg;
    assign q_d0 = {{add_ln30_fu_324_p2[47:16]}};
    assign r_address0 = zext_ln24_fu_257_p1;
    assign s_address0 = s_addr_reg_431_pp0_iter6_reg;
    assign s_address1 = s_addr_reg_431_pp0_iter4_reg;
    assign s_d0 = {{add_ln29_fu_293_p2[47:16]}};
    assign select_ln24_1_fu_215_p3 = ((icmp_ln27_fu_201_p2[0:0] == 1'b1) ? add_ln24_fu_195_p2 : ap_sig_allocacmp_i_load);
    assign select_ln24_2_fu_309_p3 = ((icmp_ln27_reg_386_pp0_iter6_reg[0:0] == 1'b1) ? 32'd0 : empty_fu_62);
    assign select_ln24_fu_207_p3 = ((icmp_ln27_fu_201_p2[0:0] == 1'b1) ? 7'b0 : ap_sig_allocacmp_j_load);
    assign sext_ln29_fu_274_p1 = $signed(A_load_reg_447);
    assign shl_ln1_fu_316_p3 = {{select_ln24_2_fu_309_p3}, 16'd0};
    assign shl_ln_fu_286_p3 = {{s_load_reg_478}, 16'd0};
    assign zext_ln24_fu_257_p1 = select_ln24_1_reg_397_pp0_iter2_reg;
    assign zext_ln29_2_fu_266_p1 = grp_fu_345_p3;
    always @(posedge ap_clk) begin
        begin end
        begin end
        begin end
        begin end
    end
endmodule
module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mul_32s_32s_48_2_1_U2 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[31:0] din0,
    input logic[31:0] din1,
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

module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mul_32s_32s_48_2_1_U3 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[31:0] din0,
    input logic[31:0] din1,
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


module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mac_muladd_7ns_7ns_7ns_14_4_1_U4 (
    input logic clk,
    input logic reset,
    input logic ce,
    input logic[6:0] din0,
    input logic[6:0] din1,
    input logic[6:0] din2,
    output logic[13:0] dout
);
    kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mac_muladd_7ns_7ns_7ns_14_4_1_U4_kernel_bicg_mac_muladd_7ns_7ns_7ns_14_4_1_DSP48_0_U kernel_bicg_mac_muladd_7ns_7ns_7ns_14_4_1_DSP48_0_U (
        .clk(clk),
        .rst(reset),
        .ce(ce),
        .in0(din0),
        .in1(din1),
        .in2(din2),
        .dout(dout)
    );
endmodule
module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_mac_muladd_7ns_7ns_7ns_14_4_1_U4_kernel_bicg_mac_muladd_7ns_7ns_7ns_14_4_1_DSP48_0_U (
    input logic clk,
    input logic rst,
    input logic ce,
    input logic[6:0] in0,
    input logic[6:0] in1,
    input logic[6:0] in2,
    output logic[13:0] dout
);
    wire logic signed[7:0] a;
    wire logic signed[7:0] b;
    wire logic signed[7:0] c;
    wire logic signed[13:0] m;
    wire logic signed[13:0] p;
    reg signed[13:0] m_reg;
    reg signed[7:0] a_reg;
    reg signed[7:0] b_reg;
    reg signed[13:0] p_reg;
    assign a = $unsigned(in0);
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

module kernel_bicg_grp_kernel_bicg_Pipeline_VITIS_LOOP_24_2_VITIS_LOOP_27_3_fu_36_flow_control_loop_pipe_sequential_init_U (
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
