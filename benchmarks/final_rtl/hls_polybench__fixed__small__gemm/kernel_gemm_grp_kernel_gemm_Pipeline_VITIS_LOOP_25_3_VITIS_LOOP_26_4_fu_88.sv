
module kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[12:0] empty,
    output logic[12:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    input logic[31:0] conv_i70,
    input logic[12:0] phi_mul,
    output logic[12:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output logic[31:0] C_d0,
    output logic[12:0] C_address1,
    output reg C_ce1,
    input logic[31:0] C_q1,
    output logic[12:0] B_address0,
    output reg B_ce0,
    input logic[31:0] B_q0
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
    reg ap_enable_reg_pp0_iter8;
    reg ap_enable_reg_pp0_iter9;
    reg ap_enable_reg_pp0_iter10;
    reg ap_idle_pp0;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic[0:0] icmp_ln25_fu_169_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic signed [31:0] conv_i70_cast_fu_147_p1;
    reg signed [31:0] conv_i70_cast_reg_340;
    wire logic[6:0] select_ln25_fu_199_p3;
    reg[6:0] select_ln25_reg_349;
    reg[6:0] select_ln25_reg_349_pp0_iter1_reg;
    wire logic[6:0] select_ln25_1_fu_207_p3;
    reg[6:0] select_ln25_1_reg_354;
    reg signed[31:0] A_load_reg_369;
    wire logic [6:0] zext_ln27_1_fu_253_p1;
    wire logic[12:0] add_ln27_1_fu_256_p2;
    reg[12:0] add_ln27_1_reg_379;
    reg[12:0] add_ln27_1_reg_379_pp0_iter3_reg;
    reg[12:0] add_ln27_1_reg_379_pp0_iter4_reg;
    reg[12:0] add_ln27_1_reg_379_pp0_iter5_reg;
    reg[12:0] add_ln27_1_reg_379_pp0_iter6_reg;
    reg[12:0] add_ln27_1_reg_379_pp0_iter7_reg;
    wire logic signed[63:0] grp_fu_139_p2;
    reg signed[63:0] mul_ln25_reg_394;
    reg signed[31:0] B_load_reg_399;
    reg[12:0] C_addr_reg_409;
    reg[12:0] C_addr_reg_409_pp0_iter9_reg;
    wire logic[63:0] grp_fu_143_p2;
    reg[63:0] mul_ln27_reg_415;
    reg[31:0] C_load_reg_420;
    wire logic [12:0] add_ln25_1_cast_fu_248_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [12:0] zext_ln27_3_fu_265_p1;
    wire logic [12:0] zext_ln27_2_fu_273_p1;
    reg[6:0] j_fu_66;
    wire logic[6:0] add_ln26_fu_219_p2;
    wire logic ap_loop_init;
    reg[6:0] ap_sig_allocacmp_j_load;
    reg[6:0] k_fu_70;
    reg[6:0] ap_sig_allocacmp_k_load;
    reg[12:0] indvar_flatten_fu_74;
    wire logic[12:0] add_ln25_2_fu_175_p2;
    reg[12:0] ap_sig_allocacmp_indvar_flatten_load;
    wire logic signed[31:0] grp_fu_139_p1;
    wire logic[0:0] icmp_ln26_fu_193_p2;
    wire logic[6:0] add_ln25_fu_187_p2;
    wire logic [6:0] zext_ln27_fu_240_p1;
    wire logic[12:0] add_ln25_1_fu_243_p2;
    wire logic[12:0] grp_fu_300_p3;
    wire logic[63:0] shl_ln_fu_277_p3;
    wire logic[63:0] add_ln27_fu_284_p2;
    wire logic[6:0] grp_fu_300_p0;
    wire logic[6:0] grp_fu_300_p1;
    wire logic[6:0] grp_fu_300_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg ap_loop_exit_ready_pp0_iter2_reg;
    reg ap_loop_exit_ready_pp0_iter3_reg;
    reg ap_loop_exit_ready_pp0_iter4_reg;
    reg ap_loop_exit_ready_pp0_iter5_reg;
    reg ap_loop_exit_ready_pp0_iter6_reg;
    reg ap_loop_exit_ready_pp0_iter7_reg;
    reg ap_loop_exit_ready_pp0_iter8_reg;
    reg ap_loop_exit_ready_pp0_iter9_reg;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    wire logic [6:0] grp_fu_300_p00;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter3 = 1'b0;
        ap_enable_reg_pp0_iter4 = 1'b0;
        ap_enable_reg_pp0_iter5 = 1'b0;
        ap_enable_reg_pp0_iter6 = 1'b0;
        ap_enable_reg_pp0_iter7 = 1'b0;
        ap_enable_reg_pp0_iter8 = 1'b0;
        ap_enable_reg_pp0_iter9 = 1'b0;
        ap_enable_reg_pp0_iter10 = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_mul_32s_32s_64_2_1_U6 mul_32s_32s_64_2_1_U6 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(A_load_reg_369),
        .din1(grp_fu_139_p1),
        .dout(grp_fu_139_p2)
    );
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_mul_64s_32s_64_5_1_U7 mul_64s_32s_64_5_1_U7 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(mul_ln25_reg_394),
        .din1(B_load_reg_399),
        .dout(grp_fu_143_p2)
    );
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_mac_muladd_7ns_7ns_7ns_13_4_1_U8 mac_muladd_7ns_7ns_7ns_13_4_1_U8 (
        .clk(ap_clk),
        .reset(ap_rst),
        .ce(1'b1),
        .din0(grp_fu_300_p0),
        .din1(grp_fu_300_p1),
        .din2(grp_fu_300_p2),
        .dout(grp_fu_300_p3)
    );
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
                ap_enable_reg_pp0_iter10 <= ap_enable_reg_pp0_iter9;
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
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter8 <= ap_enable_reg_pp0_iter7;
            end
        end
    end
    always @(posedge ap_clk) begin begin begin
                ap_enable_reg_pp0_iter9 <= ap_enable_reg_pp0_iter8;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln25_fu_169_p2 == 1'b0))) begin
                indvar_flatten_fu_74 <= add_ln25_2_fu_175_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln25_fu_169_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_66 <= add_ln26_fu_219_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln25_fu_169_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                k_fu_70 <= select_ln25_1_fu_207_p3;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            A_load_reg_369 <= A_q0;
            B_load_reg_399 <= B_q0;
            C_addr_reg_409 <= zext_ln27_2_fu_273_p1;
            C_addr_reg_409_pp0_iter9_reg <= C_addr_reg_409;
            add_ln27_1_reg_379 <= add_ln27_1_fu_256_p2;
            add_ln27_1_reg_379_pp0_iter3_reg <= add_ln27_1_reg_379;
            add_ln27_1_reg_379_pp0_iter4_reg <= add_ln27_1_reg_379_pp0_iter3_reg;
            add_ln27_1_reg_379_pp0_iter5_reg <= add_ln27_1_reg_379_pp0_iter4_reg;
            add_ln27_1_reg_379_pp0_iter6_reg <= add_ln27_1_reg_379_pp0_iter5_reg;
            add_ln27_1_reg_379_pp0_iter7_reg <= add_ln27_1_reg_379_pp0_iter6_reg;
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
            ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
            ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
            ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
            ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
            ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
            mul_ln25_reg_394 <= grp_fu_139_p2;
            mul_ln27_reg_415 <= grp_fu_143_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b1))) begin
            C_load_reg_420 <= C_q1;
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            conv_i70_cast_reg_340 <= conv_i70_cast_fu_147_p1;
            select_ln25_reg_349_pp0_iter1_reg <= select_ln25_reg_349;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln25_fu_169_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            select_ln25_1_reg_354 <= select_ln25_1_fu_207_p3;
            select_ln25_reg_349 <= select_ln25_fu_199_p3;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
            C_ce0 = 1'b1;
        end
        else begin
            C_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter8 == 1'b1))) begin
            C_ce1 = 1'b1;
        end
        else begin
            C_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
            C_we0 = 1'b1;
        end
        else begin
            C_we0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln25_fu_169_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter9_reg == 1'b1))) begin
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
            ap_sig_allocacmp_indvar_flatten_load = 13'd0;
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
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_k_load = 7'b0;
        end
        else begin
            ap_sig_allocacmp_k_load = k_fu_70;
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
    assign A_address0 = add_ln25_1_cast_fu_248_p1;
    assign B_address0 = zext_ln27_3_fu_265_p1;
    assign C_address0 = C_addr_reg_409_pp0_iter9_reg;
    assign C_address1 = zext_ln27_2_fu_273_p1;
    assign C_d0 = {{add_ln27_fu_284_p2[63:32]}};
    assign add_ln25_1_cast_fu_248_p1 = add_ln25_1_fu_243_p2;
    assign add_ln25_1_fu_243_p2 = (empty + zext_ln27_fu_240_p1);
    assign add_ln25_2_fu_175_p2 = (ap_sig_allocacmp_indvar_flatten_load + 13'd1);
    assign add_ln25_fu_187_p2 = (ap_sig_allocacmp_k_load + 7'b1);
    assign add_ln26_fu_219_p2 = (select_ln25_fu_199_p3 + 7'b1);
    assign add_ln27_1_fu_256_p2 = (phi_mul + zext_ln27_1_fu_253_p1);
    assign add_ln27_fu_284_p2 = (shl_ln_fu_277_p3 + mul_ln27_reg_415);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign conv_i70_cast_fu_147_p1 = $signed(conv_i70);
    assign grp_fu_139_p1 = conv_i70_cast_reg_340;
    assign grp_fu_300_p0 = grp_fu_300_p00;
    assign grp_fu_300_p00 = select_ln25_1_fu_207_p3;
    assign grp_fu_300_p1 = 13'd70;
    assign grp_fu_300_p2 = zext_ln27_1_fu_253_p1;
    assign icmp_ln25_fu_169_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 13'd5600) ? 1'b1 : 1'b0);
    assign icmp_ln26_fu_193_p2 = ((ap_sig_allocacmp_j_load == 7'b1000110) ? 1'b1 : 1'b0);
    assign select_ln25_1_fu_207_p3 = ((icmp_ln26_fu_193_p2[0:0] == 1'b1) ? add_ln25_fu_187_p2 : ap_sig_allocacmp_k_load);
    assign select_ln25_fu_199_p3 = ((icmp_ln26_fu_193_p2[0:0] == 1'b1) ? 7'b0 : ap_sig_allocacmp_j_load);
    assign shl_ln_fu_277_p3 = {{C_load_reg_420}, 32'd0};
    assign zext_ln27_1_fu_253_p1 = select_ln25_reg_349_pp0_iter1_reg;
    assign zext_ln27_2_fu_273_p1 = add_ln27_1_reg_379_pp0_iter7_reg;
    assign zext_ln27_3_fu_265_p1 = grp_fu_300_p3;
    assign zext_ln27_fu_240_p1 = select_ln25_1_reg_354;
endmodule