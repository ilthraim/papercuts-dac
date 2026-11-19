
module kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[8:0] phi_mul2,
    output logic[8:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output logic[31:0] C_d0,
    output logic[8:0] C_address1,
    output reg C_ce1,
    input logic[31:0] C_q1,
    input logic[31:0] beta_cast
);
    reg[0:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    wire logic ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_enable_reg_pp0_iter3;
    reg ap_enable_reg_pp0_iter4;
    reg ap_idle_pp0;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic[0:0] icmp_ln23_fu_97_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic signed [31:0] beta_cast_cast_fu_85_p1;
    reg signed [31:0] beta_cast_cast_reg_150;
    wire logic ap_block_pp0_stage0_11001;
    reg[8:0] C_addr_reg_159;
    reg[8:0] C_addr_reg_159_pp0_iter1_reg;
    reg[8:0] C_addr_reg_159_pp0_iter2_reg;
    reg[8:0] C_addr_reg_159_pp0_iter3_reg;
    reg signed[31:0] C_load_reg_165;
    reg[31:0] trunc_ln_reg_175;
    wire logic [8:0] zext_ln24_1_fu_119_p1;
    wire logic ap_block_pp0_stage0;
    reg[4:0] j_fu_48;
    wire logic[4:0] add_ln23_fu_103_p2;
    wire logic ap_loop_init;
    reg[4:0] ap_sig_allocacmp_j_1;
    wire logic signed[31:0] grp_fu_81_p1;
    wire logic [4:0] zext_ln24_fu_109_p1;
    wire logic[8:0] add_ln24_fu_113_p2;
    wire logic[47:0] grp_fu_81_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg ap_loop_exit_ready_pp0_iter2_reg;
    reg ap_loop_exit_ready_pp0_iter3_reg;
    reg[0:0] ap_NS_fsm;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 1'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter3 = 1'b0;
        ap_enable_reg_pp0_iter4 = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_mul_32s_32s_48_2_1_U1 mul_32s_32s_48_2_1_U1 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(C_load_reg_165),
        .din1(grp_fu_81_p1),
        .dout(grp_fu_81_p2)
    );
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
    always @(posedge ap_clk) begin begin
            if (((icmp_ln23_fu_97_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_48 <= add_ln23_fu_103_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln23_fu_97_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            C_addr_reg_159 <= zext_ln24_1_fu_119_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            C_addr_reg_159_pp0_iter1_reg <= C_addr_reg_159;
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            beta_cast_cast_reg_150 <= beta_cast_cast_fu_85_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            C_addr_reg_159_pp0_iter2_reg <= C_addr_reg_159_pp0_iter1_reg;
            C_addr_reg_159_pp0_iter3_reg <= C_addr_reg_159_pp0_iter2_reg;
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            trunc_ln_reg_175 <= {{grp_fu_81_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            C_load_reg_165 <= C_q1;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
            C_ce0 = 1'b1;
        end
        else begin
            C_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            C_ce1 = 1'b1;
        end
        else begin
            C_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
            C_we0 = 1'b1;
        end
        else begin
            C_we0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln23_fu_97_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b1))) begin
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
            ap_sig_allocacmp_j_1 = 5'b0;
        end
        else begin
            ap_sig_allocacmp_j_1 = j_fu_48;
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
    assign C_address0 = C_addr_reg_159_pp0_iter3_reg;
    assign C_address1 = zext_ln24_1_fu_119_p1;
    assign C_d0 = trunc_ln_reg_175;
    assign add_ln23_fu_103_p2 = (ap_sig_allocacmp_j_1 + 5'b1);
    assign add_ln24_fu_113_p2 = (phi_mul2 + zext_ln24_fu_109_p1);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign beta_cast_cast_fu_85_p1 = $signed(beta_cast);
    assign grp_fu_81_p1 = beta_cast_cast_reg_150;
    assign icmp_ln23_fu_97_p2 = ((ap_sig_allocacmp_j_1 == 5'b11001) ? 1'b1 : 1'b0);
    assign zext_ln24_1_fu_119_p1 = add_ln24_fu_113_p2;
    assign zext_ln24_fu_109_p1 = ap_sig_allocacmp_j_1;
endmodule