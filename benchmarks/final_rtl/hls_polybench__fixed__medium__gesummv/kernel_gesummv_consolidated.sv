module kernel_gesummv (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[31:0] alpha,
    input logic[31:0] beta,
    output logic[15:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output logic[15:0] B_address0,
    output reg B_ce0,
    input logic[31:0] B_q0,
    output logic[7:0] tmp_address0,
    output reg tmp_ce0,
    output reg tmp_we0,
    output logic[31:0] tmp_d0,
    output logic[7:0] x_address0,
    output reg x_ce0,
    input logic[31:0] x_q0,
    output logic[7:0] y_address0,
    output reg y_ce0,
    output reg y_we0,
    output logic[31:0] y_d0
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
    wire logic[0:0] icmp_ln23_fu_223_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic signed [31:0] alpha_cast_fu_187_p1;
    reg signed [31:0] alpha_cast_reg_473;
    reg signed [31:0] alpha_cast_reg_473_pp0_iter1_reg;
    reg signed [31:0] alpha_cast_reg_473_pp0_iter2_reg;
    reg signed [31:0] alpha_cast_reg_473_pp0_iter3_reg;
    reg signed [31:0] alpha_cast_reg_473_pp0_iter4_reg;
    reg signed [31:0] alpha_cast_reg_473_pp0_iter5_reg;
    reg signed [31:0] alpha_cast_reg_473_pp0_iter6_reg;
    reg signed [31:0] alpha_cast_reg_473_pp0_iter7_reg;
    wire logic signed [31:0] sext_ln23_fu_191_p1;
    reg signed [31:0] sext_ln23_reg_478;
    reg signed [31:0] sext_ln23_reg_478_pp0_iter1_reg;
    reg signed [31:0] sext_ln23_reg_478_pp0_iter2_reg;
    reg signed [31:0] sext_ln23_reg_478_pp0_iter3_reg;
    reg signed [31:0] sext_ln23_reg_478_pp0_iter4_reg;
    reg signed [31:0] sext_ln23_reg_478_pp0_iter5_reg;
    reg signed [31:0] sext_ln23_reg_478_pp0_iter6_reg;
    reg signed [31:0] sext_ln23_reg_478_pp0_iter7_reg;
    wire logic[0:0] icmp_ln27_fu_247_p2;
    reg[0:0] icmp_ln27_reg_487;
    reg[0:0] icmp_ln27_reg_487_pp0_iter1_reg;
    reg[0:0] icmp_ln27_reg_487_pp0_iter2_reg;
    reg[0:0] icmp_ln27_reg_487_pp0_iter3_reg;
    reg[0:0] icmp_ln27_reg_487_pp0_iter4_reg;
    reg[0:0] icmp_ln27_reg_487_pp0_iter5_reg;
    reg[0:0] icmp_ln27_reg_487_pp0_iter6_reg;
    wire logic[7:0] select_ln23_fu_253_p3;
    reg[7:0] select_ln23_reg_493;
    reg[7:0] select_ln23_reg_493_pp0_iter1_reg;
    reg[7:0] select_ln23_reg_493_pp0_iter2_reg;
    wire logic[7:0] select_ln23_1_fu_261_p3;
    reg[7:0] select_ln23_1_reg_499;
    reg[7:0] select_ln23_1_reg_499_pp0_iter1_reg;
    reg[7:0] select_ln23_1_reg_499_pp0_iter2_reg;
    reg[7:0] select_ln23_1_reg_499_pp0_iter3_reg;
    reg[7:0] select_ln23_1_reg_499_pp0_iter4_reg;
    reg[7:0] select_ln23_1_reg_499_pp0_iter5_reg;
    reg[7:0] select_ln23_1_reg_499_pp0_iter6_reg;
    wire logic[0:0] ifzero_fu_279_p2;
    reg[0:0] ifzero_reg_509;
    reg[0:0] ifzero_reg_509_pp0_iter1_reg;
    reg[0:0] ifzero_reg_509_pp0_iter2_reg;
    reg[0:0] ifzero_reg_509_pp0_iter3_reg;
    reg[0:0] ifzero_reg_509_pp0_iter4_reg;
    reg[0:0] ifzero_reg_509_pp0_iter5_reg;
    reg[0:0] ifzero_reg_509_pp0_iter6_reg;
    reg[0:0] ifzero_reg_509_pp0_iter7_reg;
    reg[0:0] ifzero_reg_509_pp0_iter8_reg;
    reg[0:0] ifzero_reg_509_pp0_iter9_reg;
    reg signed[31:0] A_load_reg_533;
    reg[31:0] x_load_reg_538;
    reg signed[31:0] B_load_reg_543;
    wire logic signed [31:0] sext_ln29_1_fu_316_p1;
    wire logic[47:0] grp_fu_171_p2;
    reg[47:0] mul_ln29_reg_564;
    wire logic[47:0] grp_fu_175_p2;
    reg[47:0] mul_ln30_reg_569;
    wire logic [7:0] zext_ln23_fu_331_p1;
    reg [7:0] zext_ln23_reg_574;
    reg [7:0] zext_ln23_reg_574_pp0_iter8_reg;
    reg [7:0] zext_ln23_reg_574_pp0_iter9_reg;
    reg signed[31:0] trunc_ln_reg_579;
    reg signed[31:0] trunc_ln1_reg_584;
    wire logic[47:0] grp_fu_179_p2;
    reg[47:0] mul_ln32_reg_599;
    wire logic[47:0] grp_fu_183_p2;
    reg[47:0] mul_ln32_1_reg_604;
    wire logic [15:0] zext_ln29_2_fu_307_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [7:0] j_cast_fu_303_p1;
    reg[31:0] empty_fu_74;
    wire logic ap_loop_init;
    reg[31:0] empty_9_fu_78;
    reg[7:0] j_fu_82;
    wire logic[7:0] add_ln27_fu_273_p2;
    reg[7:0] ap_sig_allocacmp_j_load;
    reg[7:0] i_fu_86;
    reg[7:0] ap_sig_allocacmp_i_load;
    reg[15:0] indvar_flatten_fu_90;
    wire logic[15:0] add_ln23_1_fu_229_p2;
    reg[15:0] ap_sig_allocacmp_indvar_flatten_load;
    wire logic signed[31:0] grp_fu_171_p0;
    wire logic signed[31:0] grp_fu_175_p1;
    wire logic signed[31:0] grp_fu_179_p1;
    wire logic signed[31:0] grp_fu_183_p1;
    wire logic[7:0] add_ln23_fu_241_p2;
    wire logic[15:0] grp_fu_429_p3;
    wire logic[31:0] select_ln23_2_fu_335_p3;
    wire logic[47:0] shl_ln_fu_342_p3;
    wire logic[47:0] add_ln29_fu_350_p2;
    wire logic[31:0] select_ln23_3_fu_366_p3;
    wire logic[47:0] shl_ln1_fu_373_p3;
    wire logic[47:0] add_ln30_fu_381_p2;
    wire logic[47:0] add_ln32_fu_414_p2;
    wire logic[7:0] grp_fu_429_p0;
    wire logic[7:0] grp_fu_429_p1;
    wire logic[7:0] grp_fu_429_p2;
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
    wire logic [7:0] grp_fu_429_p00;
    wire logic [7:0] grp_fu_429_p20;
    reg ap_condition_272;
    reg ap_condition_274;
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
    kernel_gesummv_mul_32s_32s_48_2_1_U1 mul_32s_32s_48_2_1_U1 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_171_p0),
        .din1(A_load_reg_533),
        .dout(grp_fu_171_p2)
    );
    kernel_gesummv_mul_32s_32s_48_2_1_U2 mul_32s_32s_48_2_1_U2 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(B_load_reg_543),
        .din1(grp_fu_175_p1),
        .dout(grp_fu_175_p2)
    );
    kernel_gesummv_mul_32s_32s_48_2_1_U3 mul_32s_32s_48_2_1_U3 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(trunc_ln_reg_579),
        .din1(grp_fu_179_p1),
        .dout(grp_fu_179_p2)
    );
    kernel_gesummv_mul_32s_32s_48_2_1_U4 mul_32s_32s_48_2_1_U4 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(trunc_ln1_reg_584),
        .din1(grp_fu_183_p1),
        .dout(grp_fu_183_p2)
    );
    kernel_gesummv_mac_muladd_8ns_8ns_8ns_16_4_1_U5 mac_muladd_8ns_8ns_8ns_16_4_1_U5 (
        .clk(ap_clk),
        .reset(ap_rst),
        .ce(1'b1),
        .din0(grp_fu_429_p0),
        .din1(grp_fu_429_p1),
        .din2(grp_fu_429_p2),
        .dout(grp_fu_429_p3)
    );
    kernel_gesummv_flow_control_loop_pipe_U flow_control_loop_pipe_U (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(ap_start),
        .ap_ready(ap_ready),
        .ap_done(ap_done),
        .ap_continue(1'b1),
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
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter1 <= 1'b0;
        end
        else begin
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
            if ((1'b1 == ap_condition_272)) begin
                empty_9_fu_78 <= 32'd0;
            end
            else if ((ap_enable_reg_pp0_iter7 == 1'b1)) begin
                empty_9_fu_78 <= {{add_ln29_fu_350_p2[47:16]}};
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if ((1'b1 == ap_condition_272)) begin
                empty_fu_74 <= 32'd0;
            end
            else if ((ap_enable_reg_pp0_iter7 == 1'b1)) begin
                empty_fu_74 <= {{add_ln30_fu_381_p2[47:16]}};
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_condition_274)) begin
            if ((icmp_ln23_fu_223_p2 == 1'b0)) begin
                i_fu_86 <= select_ln23_1_fu_261_p3;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_condition_274)) begin
            if ((icmp_ln23_fu_223_p2 == 1'b0)) begin
                indvar_flatten_fu_90 <= add_ln23_1_fu_229_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_condition_274)) begin
            if ((icmp_ln23_fu_223_p2 == 1'b0)) begin
                j_fu_82 <= add_ln27_fu_273_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            A_load_reg_533 <= A_q0;
            B_load_reg_543 <= B_q0;
            alpha_cast_reg_473_pp0_iter2_reg <= alpha_cast_reg_473_pp0_iter1_reg;
            alpha_cast_reg_473_pp0_iter3_reg <= alpha_cast_reg_473_pp0_iter2_reg;
            alpha_cast_reg_473_pp0_iter4_reg <= alpha_cast_reg_473_pp0_iter3_reg;
            alpha_cast_reg_473_pp0_iter5_reg <= alpha_cast_reg_473_pp0_iter4_reg;
            alpha_cast_reg_473_pp0_iter6_reg <= alpha_cast_reg_473_pp0_iter5_reg;
            alpha_cast_reg_473_pp0_iter7_reg <= alpha_cast_reg_473_pp0_iter6_reg;
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
            ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
            ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
            ap_loop_exit_ready_pp0_iter7_reg <= ap_loop_exit_ready_pp0_iter6_reg;
            ap_loop_exit_ready_pp0_iter8_reg <= ap_loop_exit_ready_pp0_iter7_reg;
            ap_loop_exit_ready_pp0_iter9_reg <= ap_loop_exit_ready_pp0_iter8_reg;
            icmp_ln27_reg_487_pp0_iter2_reg <= icmp_ln27_reg_487_pp0_iter1_reg;
            icmp_ln27_reg_487_pp0_iter3_reg <= icmp_ln27_reg_487_pp0_iter2_reg;
            icmp_ln27_reg_487_pp0_iter4_reg <= icmp_ln27_reg_487_pp0_iter3_reg;
            icmp_ln27_reg_487_pp0_iter5_reg <= icmp_ln27_reg_487_pp0_iter4_reg;
            icmp_ln27_reg_487_pp0_iter6_reg <= icmp_ln27_reg_487_pp0_iter5_reg;
            ifzero_reg_509_pp0_iter2_reg <= ifzero_reg_509_pp0_iter1_reg;
            ifzero_reg_509_pp0_iter3_reg <= ifzero_reg_509_pp0_iter2_reg;
            ifzero_reg_509_pp0_iter4_reg <= ifzero_reg_509_pp0_iter3_reg;
            ifzero_reg_509_pp0_iter5_reg <= ifzero_reg_509_pp0_iter4_reg;
            ifzero_reg_509_pp0_iter6_reg <= ifzero_reg_509_pp0_iter5_reg;
            ifzero_reg_509_pp0_iter7_reg <= ifzero_reg_509_pp0_iter6_reg;
            ifzero_reg_509_pp0_iter8_reg <= ifzero_reg_509_pp0_iter7_reg;
            ifzero_reg_509_pp0_iter9_reg <= ifzero_reg_509_pp0_iter8_reg;
            mul_ln29_reg_564 <= grp_fu_171_p2;
            mul_ln30_reg_569 <= grp_fu_175_p2;
            select_ln23_1_reg_499_pp0_iter2_reg <= select_ln23_1_reg_499_pp0_iter1_reg;
            select_ln23_1_reg_499_pp0_iter3_reg <= select_ln23_1_reg_499_pp0_iter2_reg;
            select_ln23_1_reg_499_pp0_iter4_reg <= select_ln23_1_reg_499_pp0_iter3_reg;
            select_ln23_1_reg_499_pp0_iter5_reg <= select_ln23_1_reg_499_pp0_iter4_reg;
            select_ln23_1_reg_499_pp0_iter6_reg <= select_ln23_1_reg_499_pp0_iter5_reg;
            select_ln23_reg_493_pp0_iter2_reg <= select_ln23_reg_493_pp0_iter1_reg;
            sext_ln23_reg_478_pp0_iter2_reg <= sext_ln23_reg_478_pp0_iter1_reg;
            sext_ln23_reg_478_pp0_iter3_reg <= sext_ln23_reg_478_pp0_iter2_reg;
            sext_ln23_reg_478_pp0_iter4_reg <= sext_ln23_reg_478_pp0_iter3_reg;
            sext_ln23_reg_478_pp0_iter5_reg <= sext_ln23_reg_478_pp0_iter4_reg;
            sext_ln23_reg_478_pp0_iter6_reg <= sext_ln23_reg_478_pp0_iter5_reg;
            sext_ln23_reg_478_pp0_iter7_reg <= sext_ln23_reg_478_pp0_iter6_reg;
            trunc_ln1_reg_584 <= {{add_ln30_fu_381_p2[47:16]}};
            trunc_ln_reg_579 <= {{add_ln29_fu_350_p2[47:16]}};
            x_load_reg_538 <= x_q0;
            zext_ln23_reg_574[7:0] <= zext_ln23_fu_331_p1[7:0];
            zext_ln23_reg_574_pp0_iter8_reg[7:0] <= zext_ln23_reg_574[7:0];
            zext_ln23_reg_574_pp0_iter9_reg[7:0] <= zext_ln23_reg_574_pp0_iter8_reg[7:0];
        end
    end
    always @(posedge ap_clk) begin begin
            alpha_cast_reg_473 <= alpha_cast_fu_187_p1;
            alpha_cast_reg_473_pp0_iter1_reg <= alpha_cast_reg_473;
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            icmp_ln27_reg_487_pp0_iter1_reg <= icmp_ln27_reg_487;
            ifzero_reg_509_pp0_iter1_reg <= ifzero_reg_509;
            select_ln23_1_reg_499_pp0_iter1_reg <= select_ln23_1_reg_499;
            select_ln23_reg_493_pp0_iter1_reg <= select_ln23_reg_493;
            sext_ln23_reg_478 <= sext_ln23_fu_191_p1;
            sext_ln23_reg_478_pp0_iter1_reg <= sext_ln23_reg_478;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln23_fu_223_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            icmp_ln27_reg_487 <= icmp_ln27_fu_247_p2;
            ifzero_reg_509 <= ifzero_fu_279_p2;
            select_ln23_1_reg_499 <= select_ln23_1_fu_261_p3;
            select_ln23_reg_493 <= select_ln23_fu_253_p3;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ifzero_reg_509_pp0_iter8_reg == 1'b1))) begin
            mul_ln32_1_reg_604 <= grp_fu_183_p2;
            mul_ln32_reg_599 <= grp_fu_179_p2;
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
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln23_fu_223_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
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
    always @* begin
        if ((((ap_idle_pp0 == 1'b1) & (ap_start_int == 1'b0)) & (1'b1 == 1'b1))) begin
            ap_idle = 1'b1;
        end
        else begin
            ap_idle = 1'b0;
        end
    end
    always @* begin
        if ((((((((((((ap_enable_reg_pp0_iter10 == 1'b0) & (ap_enable_reg_pp0_iter9 == 1'b0)) & (ap_enable_reg_pp0_iter8 == 1'b0)) & (ap_enable_reg_pp0_iter7 == 1'b0)) & (ap_enable_reg_pp0_iter6 == 1'b0)) & (ap_enable_reg_pp0_iter5 == 1'b0)) & (ap_enable_reg_pp0_iter4 == 1'b0)) & (ap_enable_reg_pp0_iter3 == 1'b0)) & (ap_enable_reg_pp0_iter2 == 1'b0)) & (ap_enable_reg_pp0_iter1 == 1'b0)))) begin
            ap_idle_pp0 = 1'b1;
        end
        else begin
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
        if (((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_i_load = 8'd0;
        end
        else begin
            ap_sig_allocacmp_i_load = i_fu_86;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_indvar_flatten_load = 16'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_90;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_sig_allocacmp_j_load = 8'd0;
        end
        else begin
            ap_sig_allocacmp_j_load = j_fu_82;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
            tmp_ce0 = 1'b1;
        end
        else begin
            tmp_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1)) & (ifzero_reg_509_pp0_iter6_reg == 1'b1))) begin
            tmp_we0 = 1'b1;
        end
        else begin
            tmp_we0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            x_ce0 = 1'b1;
        end
        else begin
            x_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b1))) begin
            y_ce0 = 1'b1;
        end
        else begin
            y_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter10 == 1'b1)) & (ifzero_reg_509_pp0_iter9_reg == 1'b1))) begin
            y_we0 = 1'b1;
        end
        else begin
            y_we0 = 1'b0;
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
    assign A_address0 = zext_ln29_2_fu_307_p1;
    assign B_address0 = zext_ln29_2_fu_307_p1;
    assign add_ln23_1_fu_229_p2 = (ap_sig_allocacmp_indvar_flatten_load + 16'd1);
    assign add_ln23_fu_241_p2 = (ap_sig_allocacmp_i_load + 8'd1);
    assign add_ln27_fu_273_p2 = (select_ln23_fu_253_p3 + 8'd1);
    assign add_ln29_fu_350_p2 = (shl_ln_fu_342_p3 + mul_ln29_reg_564);
    assign add_ln30_fu_381_p2 = (shl_ln1_fu_373_p3 + mul_ln30_reg_569);
    assign add_ln32_fu_414_p2 = (mul_ln32_reg_599 + mul_ln32_1_reg_604);
    assign alpha_cast_fu_187_p1 = $signed(alpha);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    always @* begin
        ap_condition_272 = (((ap_loop_init == 1'b1) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1));
    end
    always @* begin
        ap_condition_274 = (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1));
    end
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign grp_fu_171_p0 = sext_ln29_1_fu_316_p1;
    assign grp_fu_175_p1 = sext_ln29_1_fu_316_p1;
    assign grp_fu_179_p1 = alpha_cast_reg_473_pp0_iter7_reg;
    assign grp_fu_183_p1 = sext_ln23_reg_478_pp0_iter7_reg;
    assign grp_fu_429_p0 = grp_fu_429_p00;
    assign grp_fu_429_p00 = select_ln23_1_fu_261_p3;
    assign grp_fu_429_p1 = 16'd250;
    assign grp_fu_429_p2 = grp_fu_429_p20;
    assign grp_fu_429_p20 = select_ln23_reg_493_pp0_iter1_reg;
    assign icmp_ln23_fu_223_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 16'd62500) ? 1'b1 : 1'b0);
    assign icmp_ln27_fu_247_p2 = ((ap_sig_allocacmp_j_load == 8'd250) ? 1'b1 : 1'b0);
    assign ifzero_fu_279_p2 = ((add_ln27_fu_273_p2 == 8'd250) ? 1'b1 : 1'b0);
    assign j_cast_fu_303_p1 = select_ln23_reg_493_pp0_iter2_reg;
    assign select_ln23_1_fu_261_p3 = ((icmp_ln27_fu_247_p2[0:0] == 1'b1) ? add_ln23_fu_241_p2 : ap_sig_allocacmp_i_load);
    assign select_ln23_2_fu_335_p3 = ((icmp_ln27_reg_487_pp0_iter6_reg[0:0] == 1'b1) ? 32'd0 : empty_9_fu_78);
    assign select_ln23_3_fu_366_p3 = ((icmp_ln27_reg_487_pp0_iter6_reg[0:0] == 1'b1) ? 32'd0 : empty_fu_74);
    assign select_ln23_fu_253_p3 = ((icmp_ln27_fu_247_p2[0:0] == 1'b1) ? 8'd0 : ap_sig_allocacmp_j_load);
    assign sext_ln23_fu_191_p1 = $signed(beta);
    assign sext_ln29_1_fu_316_p1 = $signed(x_load_reg_538);
    assign shl_ln1_fu_373_p3 = {{select_ln23_3_fu_366_p3}, 16'd0};
    assign shl_ln_fu_342_p3 = {{select_ln23_2_fu_335_p3}, 16'd0};
    assign tmp_address0 = zext_ln23_fu_331_p1;
    assign tmp_d0 = {{add_ln29_fu_350_p2[47:16]}};
    assign x_address0 = j_cast_fu_303_p1;
    assign y_address0 = zext_ln23_reg_574_pp0_iter9_reg;
    assign y_d0 = {{add_ln32_fu_414_p2[47:16]}};
    assign zext_ln23_fu_331_p1 = select_ln23_1_reg_499_pp0_iter6_reg;
    assign zext_ln29_2_fu_307_p1 = grp_fu_429_p3;
    always @(posedge ap_clk) begin
        begin end
        begin end
        begin end
    end
endmodule
module kernel_gesummv_mul_32s_32s_48_2_1_U1 (
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

module kernel_gesummv_mul_32s_32s_48_2_1_U2 (
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

module kernel_gesummv_mul_32s_32s_48_2_1_U3 (
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

module kernel_gesummv_mul_32s_32s_48_2_1_U4 (
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


module kernel_gesummv_mac_muladd_8ns_8ns_8ns_16_4_1_U5 (
    input logic clk,
    input logic reset,
    input logic ce,
    input logic[7:0] din0,
    input logic[7:0] din1,
    input logic[7:0] din2,
    output logic[15:0] dout
);
    kernel_gesummv_mac_muladd_8ns_8ns_8ns_16_4_1_U5_kernel_gesummv_mac_muladd_8ns_8ns_8ns_16_4_1_DSP48_0_U kernel_gesummv_mac_muladd_8ns_8ns_8ns_16_4_1_DSP48_0_U (
        .clk(clk),
        .rst(reset),
        .ce(ce),
        .in0(din0),
        .in1(din1),
        .in2(din2),
        .dout(dout)
    );
endmodule
module kernel_gesummv_mac_muladd_8ns_8ns_8ns_16_4_1_U5_kernel_gesummv_mac_muladd_8ns_8ns_8ns_16_4_1_DSP48_0_U (
    input logic clk,
    input logic rst,
    input logic ce,
    input logic[7:0] in0,
    input logic[7:0] in1,
    input logic[7:0] in2,
    output logic[15:0] dout
);
    wire logic signed[8:0] a;
    wire logic signed[8:0] b;
    wire logic signed[8:0] c;
    wire logic signed[15:0] m;
    wire logic signed[15:0] p;
    reg signed[15:0] m_reg;
    reg signed[8:0] a_reg;
    reg signed[8:0] b_reg;
    reg signed[15:0] p_reg;
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

module kernel_gesummv_flow_control_loop_pipe_U (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_ready,
    output logic ap_done,
    input logic ap_continue,
    output logic ap_start_int,
    input logic ap_ready_int,
    input logic ap_done_int,
    output logic ap_continue_int,
    output reg ap_loop_init,
    input logic ap_loop_exit_ready,
    input logic ap_loop_exit_done
);
    initial begin
        ap_loop_init = 1'b1;
    end
    assign ap_start_int = ap_start;
    assign ap_continue_int = ap_continue;
    assign ap_done = ap_loop_exit_done;
    assign ap_ready = ap_loop_exit_ready;
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_loop_init <= 1'b1;
        end
        else if ((ap_loop_exit_ready == 1'b1)) begin
            ap_loop_init <= 1'b1;
        end
        else if ((ap_ready_int == 1'b1)) begin
            ap_loop_init <= 1'b0;
        end
    end
endmodule
