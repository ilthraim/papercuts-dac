module kernel_jacobi_1d (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output reg[6:0] A_address0,
    output reg A_ce0,
    output reg A_we0,
    output logic[31:0] A_d0,
    input logic[31:0] A_q0,
    output logic[6:0] A_address1,
    output reg A_ce1,
    input logic[31:0] A_q1,
    output reg[6:0] B_address0,
    output reg B_ce0,
    output reg B_we0,
    output logic[31:0] B_d0,
    input logic[31:0] B_q0,
    output logic[6:0] B_address1,
    output reg B_ce1,
    input logic[31:0] B_q1
);
    reg[4:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_done;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_idle;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_ready;
    wire logic[6:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_address0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_ce0;
    wire logic[6:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_address1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_ce1;
    wire logic[6:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_address0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_ce0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_we0;
    wire logic[31:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_d0;
    wire logic signed[33:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_din0;
    wire logic [14:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_din1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_ce;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_done;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_idle;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_ready;
    wire logic[6:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_address0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_ce0;
    wire logic[6:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_address1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_ce1;
    wire logic[6:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_address0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_ce0;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_we0;
    wire logic[31:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_d0;
    wire logic signed[33:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_din0;
    wire logic [14:0] grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_din1;
    wire logic grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_ce;
    reg grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start_reg;
    wire logic ap_CS_fsm_state2;
    wire logic[0:0] icmp_ln20_fu_68_p2;
    wire logic ap_CS_fsm_state3;
    reg grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start_reg;
    wire logic ap_CS_fsm_state4;
    wire logic ap_CS_fsm_state5;
    reg[5:0] t_fu_40;
    wire logic[5:0] t_2_fu_74_p2;
    wire logic[47:0] grp_fu_95_p2;
    reg signed[33:0] grp_fu_95_p0;
    reg[15:0] grp_fu_95_p1;
    reg grp_fu_95_ce;
    reg[4:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 5'b1;
        grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start_reg = 1'b0;
        grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start_reg = 1'b0;
    end
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44 grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start),
        .ap_done(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_done),
        .ap_idle(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_idle),
        .ap_ready(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_ready),
        .A_address0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_address0),
        .A_ce0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_ce0),
        .A_q0(A_q0),
        .A_address1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_address1),
        .A_ce1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_ce1),
        .A_q1(A_q1),
        .B_address0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_address0),
        .B_ce0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_ce0),
        .B_we0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_we0),
        .B_d0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_d0),
        .grp_fu_95_p_din0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_din0),
        .grp_fu_95_p_din1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_din1),
        .grp_fu_95_p_dout0(grp_fu_95_p2),
        .grp_fu_95_p_ce(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_ce)
    );
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52 grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start),
        .ap_done(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_done),
        .ap_idle(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_idle),
        .ap_ready(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_ready),
        .B_address0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_address0),
        .B_ce0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_ce0),
        .B_q0(B_q0),
        .B_address1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_address1),
        .B_ce1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_ce1),
        .B_q1(B_q1),
        .A_address0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_address0),
        .A_ce0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_ce0),
        .A_we0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_we0),
        .A_d0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_d0),
        .grp_fu_95_p_din0(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_din0),
        .grp_fu_95_p_din1(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_din1),
        .grp_fu_95_p_dout0(grp_fu_95_p2),
        .grp_fu_95_p_ce(grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_ce)
    );
    kernel_jacobi_1d_mul_34s_16ns_48_2_1_U7 mul_34s_16ns_48_2_1_U7 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_95_p0),
        .din1(grp_fu_95_p1),
        .dout(grp_fu_95_p2)
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
            grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start_reg <= 1'b0;
        end
        else begin
            if (((icmp_ln20_fu_68_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
                grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_ready == 1'b1)) begin
                grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state4)) begin
                grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_ready == 1'b1)) begin
                grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            t_fu_40 <= 6'b0;
        end
        else if (( (1'b1 == ap_CS_fsm_state2))) begin
            t_fu_40 <= t_2_fu_74_p2;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            A_address0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            A_address0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_address0;
        end
        else begin
            A_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            A_ce0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_ce0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            A_ce0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_ce0;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            A_ce1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_ce1;
        end
        else begin
            A_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            A_we0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_we0;
        end
        else begin
            A_we0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            B_address0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            B_address0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_address0;
        end
        else begin
            B_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            B_ce0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_ce0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            B_ce0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_ce0;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            B_ce1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_ce1;
        end
        else begin
            B_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            B_we0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_we0;
        end
        else begin
            B_we0 = 1'b0;
        end
    end
    always @* begin
        if (((icmp_ln20_fu_68_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
        if (((icmp_ln20_fu_68_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin begin
            grp_fu_95_ce = 1'b1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_fu_95_p0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_din0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_fu_95_p0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_din0;
        end
        else begin
            grp_fu_95_p0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            grp_fu_95_p1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_grp_fu_95_p_din1;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            grp_fu_95_p1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_grp_fu_95_p_din1;
        end
        else begin
            grp_fu_95_p1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
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
                if (((icmp_ln20_fu_68_p2 == 1'b1))) begin
                    ap_NS_fsm = 5'b1;
                end
                else begin
                    ap_NS_fsm = 5'b100;
                end
            end
            5'b100: begin
                if (((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_done == 1'b1))) begin
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
                if (((grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_done == 1'b1))) begin
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
    assign A_address1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_A_address1;
    assign A_d0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_A_d0;
    assign B_address1 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_B_address1;
    assign B_d0 = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_B_d0;
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_ap_start_reg;
    assign grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start = grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_ap_start_reg;
    assign icmp_ln20_fu_68_p2 = ((t_fu_40 == 6'b101000) ? 1'b1 : 1'b0);
    assign t_2_fu_74_p2 = (t_fu_40 + 6'b1);
endmodule

module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output reg[6:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output logic[6:0] A_address1,
    output reg A_ce1,
    input logic[31:0] A_q1,
    output logic[6:0] B_address0,
    output reg B_ce0,
    output reg B_we0,
    output logic[31:0] B_d0,
    output logic[33:0] grp_fu_95_p_din0,
    output logic[15:0] grp_fu_95_p_din1,
    input logic[47:0] grp_fu_95_p_dout0,
    output logic grp_fu_95_p_ce
);
    reg[1:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    reg ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_idle_pp0;
    wire logic ap_CS_fsm_pp0_stage1;
    wire logic ap_block_pp0_stage1_subdone;
    reg[0:0] icmp_ln22_reg_242;
    reg ap_condition_exit_pp0_iter0_stage1;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    reg[6:0] i_2_reg_237;
    wire logic ap_block_pp0_stage0_11001;
    wire logic[0:0] icmp_ln22_fu_119_p2;
    wire logic [6:0] i_cast1_fu_125_p1;
    reg [6:0] i_cast1_reg_246;
    reg [6:0] i_cast1_reg_246_pp0_iter1_reg;
    reg [6:0] i_cast1_reg_246_pp0_iter2_reg;
    reg[6:0] lshr_ln_reg_261;
    wire logic[32:0] add_ln23_1_fu_183_p2;
    reg[32:0] add_ln23_1_reg_266;
    wire logic ap_block_pp0_stage1_11001;
    wire logic[33:0] add_ln23_4_fu_210_p2;
    reg[33:0] add_ln23_4_reg_276;
    wire logic signed [33:0] sext_ln23_4_fu_216_p1;
    reg[31:0] trunc_ln_reg_286;
    reg ap_enable_reg_pp0_iter0_reg;
    wire logic [6:0] zext_ln23_fu_154_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [6:0] zext_ln23_1_fu_194_p1;
    wire logic ap_block_pp0_stage1;
    reg[6:0] i_fu_56;
    wire logic[6:0] add_ln23_2_fu_189_p2;
    wire logic ap_loop_init;
    reg[6:0] ap_sig_allocacmp_i_2;
    wire logic[8:0] shl_ln_fu_130_p3;
    wire logic[8:0] add_ln23_fu_138_p2;
    wire logic[6:0] lshr_ln23_2_fu_144_p4;
    wire logic[8:0] add_ln23_3_fu_159_p2;
    wire logic signed [31:0] sext_ln23_1_fu_179_p1;
    wire logic signed [31:0] sext_ln23_fu_175_p1;
    wire logic signed [32:0] sext_ln23_2_fu_203_p1;
    wire logic signed [31:0] sext_ln23_3_fu_206_p1;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg[1:0] ap_NS_fsm;
    wire logic ap_block_pp0_stage0_subdone;
    reg ap_idle_pp0_1to2;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 2'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter0_reg = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
            ap_CS_fsm <= 2'b1;
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
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
        else begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (ap_loop_init == 1'b1))) begin
            i_fu_56 <= 7'b1;
        end
        else if (((((icmp_ln22_reg_242 == 1'b0) & (1'b0 == 1'b0))) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            i_fu_56 <= add_ln23_2_fu_189_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln22_reg_242 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            add_ln23_1_reg_266 <= add_ln23_1_fu_183_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            add_ln23_4_reg_276 <= add_ln23_4_fu_210_p2;
            i_2_reg_237 <= ap_sig_allocacmp_i_2;
            i_cast1_reg_246_pp0_iter1_reg[6:0] <= i_cast1_reg_246[6:0];
            i_cast1_reg_246_pp0_iter2_reg[6:0] <= i_cast1_reg_246_pp0_iter1_reg[6:0];
            icmp_ln22_reg_242 <= icmp_ln22_fu_119_p2;
            trunc_ln_reg_286 <= {{grp_fu_95_p_dout0[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln22_fu_119_p2 == 1'b0) & (1'b0 == 1'b0)))) begin
            i_cast1_reg_246[6:0] <= i_cast1_fu_125_p1[6:0];
            lshr_ln_reg_261 <= {{add_ln23_3_fu_159_p2[8:2]}};
        end
    end
    always @* begin
        if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                A_address0 = zext_ln23_1_fu_194_p1;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                A_address0 = i_cast1_fu_125_p1;
            end
            else begin
                A_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        end
        else begin
            A_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) | (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            A_ce1 = 1'b1;
        end
        else begin
            A_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            B_we0 = 1'b1;
        end
        else begin
            B_we0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln22_reg_242 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
    always @* begin
        if (((ap_enable_reg_pp0_iter2 == 1'b0))) begin
            ap_idle_pp0_1to2 = 1'b1;
        end
        else begin
            ap_idle_pp0_1to2 = 1'b0;
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
        if ((((1'b0 == 1'b0)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_i_2 = 7'b1;
        end
        else begin
            ap_sig_allocacmp_i_2 = i_fu_56;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            2'b1: begin
                if ((~(((ap_start_int == 1'b0) & (ap_idle_pp0_1to2 == 1'b1))) & (1'b0 == 1'b0))) begin
                    ap_NS_fsm = 2'b10;
                end
                else begin
                    ap_NS_fsm = 2'b1;
                end
            end
            2'b10: begin begin
                    ap_NS_fsm = 2'b1;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign A_address1 = zext_ln23_fu_154_p1;
    assign B_address0 = i_cast1_reg_246_pp0_iter2_reg;
    assign B_d0 = trunc_ln_reg_286;
    assign add_ln23_1_fu_183_p2 = ($signed(sext_ln23_1_fu_179_p1) + $signed(sext_ln23_fu_175_p1));
    assign add_ln23_2_fu_189_p2 = (i_2_reg_237 + 7'b1);
    assign add_ln23_3_fu_159_p2 = (shl_ln_fu_130_p3 + 9'd4);
    assign add_ln23_4_fu_210_p2 = ($signed(sext_ln23_2_fu_203_p1) + $signed(sext_ln23_3_fu_206_p1));
    assign add_ln23_fu_138_p2 = ($signed(shl_ln_fu_130_p3) + $signed(9'd508));
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_block_pp0_stage1 = 1'b0;
    assign ap_block_pp0_stage1_11001 = 1'b0;
    assign ap_block_pp0_stage1_subdone = 1'b0;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;
    assign grp_fu_95_p_ce = 1'b1;
    assign grp_fu_95_p_din0 = sext_ln23_4_fu_216_p1;
    assign grp_fu_95_p_din1 = 48'h5555;
    assign i_cast1_fu_125_p1 = ap_sig_allocacmp_i_2;
    assign icmp_ln22_fu_119_p2 = ((ap_sig_allocacmp_i_2 == 7'b1110111) ? 1'b1 : 1'b0);
    assign lshr_ln23_2_fu_144_p4 = {{add_ln23_fu_138_p2[8:2]}};
    assign sext_ln23_1_fu_179_p1 = $signed(A_q0);
    assign sext_ln23_2_fu_203_p1 = $signed(add_ln23_1_reg_266);
    assign sext_ln23_3_fu_206_p1 = $signed(A_q0);
    assign sext_ln23_4_fu_216_p1 = $signed(add_ln23_4_reg_276);
    assign sext_ln23_fu_175_p1 = $signed(A_q1);
    assign shl_ln_fu_130_p3 = {{ap_sig_allocacmp_i_2}, 2'b0};
    assign zext_ln23_1_fu_194_p1 = lshr_ln_reg_261;
    assign zext_ln23_fu_154_p1 = lshr_ln23_2_fu_144_p4;
    always @(posedge ap_clk) begin
        begin end
        begin end
        begin end
    end
endmodule
module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_22_2_fu_44_flow_control_loop_pipe_sequential_init_U (
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


module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output reg[6:0] B_address0,
    output reg B_ce0,
    input logic[31:0] B_q0,
    output logic[6:0] B_address1,
    output reg B_ce1,
    input logic[31:0] B_q1,
    output logic[6:0] A_address0,
    output reg A_ce0,
    output reg A_we0,
    output logic[31:0] A_d0,
    output logic[33:0] grp_fu_95_p_din0,
    output logic[15:0] grp_fu_95_p_din1,
    input logic[47:0] grp_fu_95_p_dout0,
    output logic grp_fu_95_p_ce
);
    reg[1:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    reg ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_idle_pp0;
    wire logic ap_CS_fsm_pp0_stage1;
    wire logic ap_block_pp0_stage1_subdone;
    reg[0:0] icmp_ln24_reg_242;
    reg ap_condition_exit_pp0_iter0_stage1;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    reg[6:0] i_1_reg_237;
    wire logic ap_block_pp0_stage0_11001;
    wire logic[0:0] icmp_ln24_fu_119_p2;
    wire logic [6:0] i_1_cast2_fu_125_p1;
    reg [6:0] i_1_cast2_reg_246;
    reg [6:0] i_1_cast2_reg_246_pp0_iter1_reg;
    reg [6:0] i_1_cast2_reg_246_pp0_iter2_reg;
    reg[6:0] lshr_ln1_reg_261;
    wire logic[32:0] add_ln25_1_fu_183_p2;
    reg[32:0] add_ln25_1_reg_266;
    wire logic ap_block_pp0_stage1_11001;
    wire logic[33:0] add_ln25_4_fu_210_p2;
    reg[33:0] add_ln25_4_reg_276;
    wire logic signed [33:0] sext_ln25_4_fu_216_p1;
    reg[31:0] trunc_ln1_reg_286;
    reg ap_enable_reg_pp0_iter0_reg;
    wire logic [6:0] zext_ln25_fu_154_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [6:0] zext_ln25_1_fu_194_p1;
    wire logic ap_block_pp0_stage1;
    reg[6:0] i_fu_56;
    wire logic[6:0] add_ln25_2_fu_189_p2;
    wire logic ap_loop_init;
    reg[6:0] ap_sig_allocacmp_i_1;
    wire logic[8:0] shl_ln1_fu_130_p3;
    wire logic[8:0] add_ln25_fu_138_p2;
    wire logic[6:0] lshr_ln25_2_fu_144_p4;
    wire logic[8:0] add_ln25_3_fu_159_p2;
    wire logic signed [31:0] sext_ln25_1_fu_179_p1;
    wire logic signed [31:0] sext_ln25_fu_175_p1;
    wire logic signed [32:0] sext_ln25_2_fu_203_p1;
    wire logic signed [31:0] sext_ln25_3_fu_206_p1;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg[1:0] ap_NS_fsm;
    wire logic ap_block_pp0_stage0_subdone;
    reg ap_idle_pp0_1to2;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 2'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter0_reg = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
            ap_CS_fsm <= 2'b1;
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
            if ((1'b1 == ap_condition_exit_pp0_iter0_stage1)) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter2 <= 1'b0;
        end
        else begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (ap_loop_init == 1'b1))) begin
            i_fu_56 <= 7'b1;
        end
        else if (((((icmp_ln24_reg_242 == 1'b0) & (1'b0 == 1'b0))) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            i_fu_56 <= add_ln25_2_fu_189_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln24_reg_242 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            add_ln25_1_reg_266 <= add_ln25_1_fu_183_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            add_ln25_4_reg_276 <= add_ln25_4_fu_210_p2;
            i_1_cast2_reg_246_pp0_iter1_reg[6:0] <= i_1_cast2_reg_246[6:0];
            i_1_cast2_reg_246_pp0_iter2_reg[6:0] <= i_1_cast2_reg_246_pp0_iter1_reg[6:0];
            i_1_reg_237 <= ap_sig_allocacmp_i_1;
            icmp_ln24_reg_242 <= icmp_ln24_fu_119_p2;
            trunc_ln1_reg_286 <= {{grp_fu_95_p_dout0[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln24_fu_119_p2 == 1'b0) & (1'b0 == 1'b0)))) begin
            i_1_cast2_reg_246[6:0] <= i_1_cast2_fu_125_p1[6:0];
            lshr_ln1_reg_261 <= {{add_ln25_3_fu_159_p2[8:2]}};
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            A_we0 = 1'b1;
        end
        else begin
            A_we0 = 1'b0;
        end
    end
    always @* begin
        if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                B_address0 = zext_ln25_1_fu_194_p1;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                B_address0 = i_1_cast2_fu_125_p1;
            end
            else begin
                B_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        end
        else begin
            B_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) | (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            B_ce1 = 1'b1;
        end
        else begin
            B_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln24_reg_242 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
    always @* begin
        if (((ap_enable_reg_pp0_iter2 == 1'b0))) begin
            ap_idle_pp0_1to2 = 1'b1;
        end
        else begin
            ap_idle_pp0_1to2 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_ready_int = 1'b1;
        end
        else begin
            ap_ready_int = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_i_1 = 7'b1;
        end
        else begin
            ap_sig_allocacmp_i_1 = i_fu_56;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            2'b1: begin
                if ((~(((ap_start_int == 1'b0) & (ap_idle_pp0_1to2 == 1'b1))) & (1'b0 == 1'b0))) begin
                    ap_NS_fsm = 2'b10;
                end
                else begin
                    ap_NS_fsm = 2'b1;
                end
            end
            2'b10: begin begin
                    ap_NS_fsm = 2'b1;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign A_address0 = i_1_cast2_reg_246_pp0_iter2_reg;
    assign A_d0 = trunc_ln1_reg_286;
    assign B_address1 = zext_ln25_fu_154_p1;
    assign add_ln25_1_fu_183_p2 = ($signed(sext_ln25_1_fu_179_p1) + $signed(sext_ln25_fu_175_p1));
    assign add_ln25_2_fu_189_p2 = (i_1_reg_237 + 7'b1);
    assign add_ln25_3_fu_159_p2 = (shl_ln1_fu_130_p3 + 9'd4);
    assign add_ln25_4_fu_210_p2 = ($signed(sext_ln25_2_fu_203_p1) + $signed(sext_ln25_3_fu_206_p1));
    assign add_ln25_fu_138_p2 = ($signed(shl_ln1_fu_130_p3) + $signed(9'd508));
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_block_pp0_stage1 = 1'b0;
    assign ap_block_pp0_stage1_11001 = 1'b0;
    assign ap_block_pp0_stage1_subdone = 1'b0;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;
    assign grp_fu_95_p_ce = 1'b1;
    assign grp_fu_95_p_din0 = sext_ln25_4_fu_216_p1;
    assign grp_fu_95_p_din1 = 48'h5555;
    assign i_1_cast2_fu_125_p1 = ap_sig_allocacmp_i_1;
    assign icmp_ln24_fu_119_p2 = ((ap_sig_allocacmp_i_1 == 7'b1110111) ? 1'b1 : 1'b0);
    assign lshr_ln25_2_fu_144_p4 = {{add_ln25_fu_138_p2[8:2]}};
    assign sext_ln25_1_fu_179_p1 = $signed(B_q0);
    assign sext_ln25_2_fu_203_p1 = $signed(add_ln25_1_reg_266);
    assign sext_ln25_3_fu_206_p1 = $signed(B_q0);
    assign sext_ln25_4_fu_216_p1 = $signed(add_ln25_4_reg_276);
    assign sext_ln25_fu_175_p1 = $signed(B_q1);
    assign shl_ln1_fu_130_p3 = {{ap_sig_allocacmp_i_1}, 2'b0};
    assign zext_ln25_1_fu_194_p1 = lshr_ln1_reg_261;
    assign zext_ln25_fu_154_p1 = lshr_ln25_2_fu_144_p4;
    always @(posedge ap_clk) begin
        begin end
        begin end
        begin end
    end
endmodule
module kernel_jacobi_1d_grp_kernel_jacobi_1d_Pipeline_VITIS_LOOP_24_3_fu_52_flow_control_loop_pipe_sequential_init_U (
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

module kernel_jacobi_1d_mul_34s_16ns_48_2_1_U7 (
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
