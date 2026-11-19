module kernel_trisolv (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output reg[17:0] L_address0,
    output reg L_ce0,
    input logic[31:0] L_q0,
    output reg[8:0] x_address0,
    output reg x_ce0,
    output reg x_we0,
    output reg[31:0] x_d0,
    input logic[31:0] x_q0,
    output logic[8:0] b_address0,
    output reg b_ce0,
    input logic[31:0] b_q0
);
    reg[58:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    reg[17:0] phi_mul_load_reg_205;
    wire logic ap_CS_fsm_state2;
    reg[8:0] i_1_reg_211;
    wire logic[0:0] icmp_ln19_fu_131_p2;
    reg[8:0] x_addr_reg_226;
    wire logic[17:0] add_ln24_fu_162_p2;
    reg[17:0] add_ln24_reg_231;
    wire logic ap_CS_fsm_state3;
    reg[31:0] b_load_reg_236;
    wire logic ap_CS_fsm_state5;
    reg[31:0] x_load_reg_246;
    wire logic ap_CS_fsm_state6;
    reg signed[31:0] L_load_reg_251;
    wire logic ap_CS_fsm_state7;
    wire logic[31:0] grp_fu_181_p2;
    reg[31:0] sdiv_ln24_reg_266;
    wire logic ap_CS_fsm_state58;
    wire logic grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start;
    wire logic grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_done;
    wire logic grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_idle;
    wire logic grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_ready;
    wire logic[8:0] grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_address0;
    wire logic grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_ce0;
    wire logic grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_we0;
    wire logic[31:0] grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_d0;
    wire logic[17:0] grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_L_address0;
    wire logic grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_L_ce0;
    reg grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start_reg;
    wire logic ap_CS_fsm_state4;
    wire logic [8:0] zext_ln19_fu_143_p1;
    wire logic [17:0] zext_ln24_1_fu_167_p1;
    reg[17:0] phi_mul_fu_50;
    wire logic[17:0] add_ln19_1_fu_125_p2;
    reg[8:0] i_fu_54;
    wire logic[8:0] add_ln19_fu_137_p2;
    wire logic ap_CS_fsm_state59;
    wire logic[31:0] trunc_ln24_fu_187_p1;
    wire logic [8:0] zext_ln24_fu_159_p1;
    wire logic[47:0] grp_fu_181_p0;
    reg grp_fu_181_ap_start;
    wire logic grp_fu_181_ap_done;
    reg[58:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 59'h1;
        grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start_reg = 1'b0;
    end
    kernel_trisolv_grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96 grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start),
        .ap_done(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_done),
        .ap_idle(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_idle),
        .ap_ready(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_ready),
        .b_load(b_load_reg_236),
        .x_address0(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_address0),
        .x_ce0(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_ce0),
        .x_we0(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_we0),
        .x_d0(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_d0),
        .x_q0(x_q0),
        .zext_ln19(i_1_reg_211),
        .i(i_1_reg_211),
        .phi_mul(phi_mul_load_reg_205),
        .L_address0(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_L_address0),
        .L_ce0(grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_L_ce0),
        .L_q0(L_q0)
    );
    kernel_trisolv_sdiv_48ns_32s_32_52_seq_1_U9 #(
        .ID(1),
        .NUM_STAGE(52),
        .din0_WIDTH(48),
        .din1_WIDTH(32),
        .dout_WIDTH(32)
    ) sdiv_48ns_32s_32_52_seq_1_U9 (
        .clk(ap_clk),
        .reset(ap_rst),
        .ce(1'b1),
        .start(grp_fu_181_ap_start),
        .done(grp_fu_181_ap_done),
        .din0(grp_fu_181_p0),
        .din1(L_load_reg_251),
        .dout(grp_fu_181_p2)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 59'h1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state3)) begin
                grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_ready == 1'b1)) begin
                grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            i_fu_54 <= 9'd0;
        end
        else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln19_fu_131_p2 == 1'b0))) begin
            i_fu_54 <= add_ln19_fu_137_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((ap_start == 1'b1) & (1'b1 == ap_CS_fsm_state1))) begin
            phi_mul_fu_50 <= 18'd0;
        end
        else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln19_fu_131_p2 == 1'b0))) begin
            phi_mul_fu_50 <= add_ln19_1_fu_125_p2;
        end
    end
    always @(posedge ap_clk) begin begin
            L_load_reg_251 <= L_q0;
            x_load_reg_246 <= x_q0;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            add_ln24_reg_231 <= add_ln24_fu_162_p2;
            b_load_reg_236 <= b_q0;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            i_1_reg_211 <= i_fu_54;
            phi_mul_load_reg_205 <= phi_mul_fu_50;
        end
    end
    always @(posedge ap_clk) begin begin
            sdiv_ln24_reg_266 <= grp_fu_181_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state2))) begin
            x_addr_reg_226 <= zext_ln19_fu_143_p1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            L_address0 = zext_ln24_1_fu_167_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            L_address0 = grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_L_address0;
        end
        else begin
            L_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            L_ce0 = 1'b1;
        end
        else begin
            L_ce0 = grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_L_ce0;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln19_fu_131_p2 == 1'b1))) begin
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
        if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln19_fu_131_p2 == 1'b1))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            b_ce0 = 1'b1;
        end
        else begin
            b_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state7)) begin
            grp_fu_181_ap_start = 1'b1;
        end
        else begin
            grp_fu_181_ap_start = 1'b0;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state59) | (1'b1 == ap_CS_fsm_state5))) begin
            x_address0 = x_addr_reg_226;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            x_address0 = grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_address0;
        end
        else begin
            x_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state59) | (1'b1 == ap_CS_fsm_state5))) begin
            x_ce0 = 1'b1;
        end
        else begin
            x_ce0 = grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_ce0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state59)) begin
            x_d0 = trunc_ln24_fu_187_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            x_d0 = grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_d0;
        end
        else begin
            x_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state59)) begin
            x_we0 = 1'b1;
        end
        else begin
            x_we0 = grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_x_we0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            59'h1: begin
                if (((ap_start == 1'b1))) begin
                    ap_NS_fsm = 59'h2;
                end
                else begin
                    ap_NS_fsm = 59'h1;
                end
            end
            59'h2: begin
                if (( (icmp_ln19_fu_131_p2 == 1'b1))) begin
                    ap_NS_fsm = 59'h1;
                end
                else begin
                    ap_NS_fsm = 59'h4;
                end
            end
            59'h4: begin
                ap_NS_fsm = 59'h8;
            end
            59'h8: begin
                if (( (grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_done == 1'b1))) begin
                    ap_NS_fsm = 59'h10;
                end
                else begin
                    ap_NS_fsm = 59'h8;
                end
            end
            59'h10: begin
                ap_NS_fsm = 59'h20;
            end
            59'h20: begin
                ap_NS_fsm = 59'h40;
            end
            59'h40: begin
                ap_NS_fsm = 59'h80;
            end
            59'h80: begin
                ap_NS_fsm = 59'h100;
            end
            59'h100: begin
                ap_NS_fsm = 59'h200;
            end
            59'h200: begin
                ap_NS_fsm = 59'h400;
            end
            59'h400: begin
                ap_NS_fsm = 59'h800;
            end
            59'h800: begin
                ap_NS_fsm = 59'h1000;
            end
            59'h1000: begin
                ap_NS_fsm = 59'h2000;
            end
            59'h2000: begin
                ap_NS_fsm = 59'h4000;
            end
            59'h4000: begin
                ap_NS_fsm = 59'h8000;
            end
            59'h8000: begin
                ap_NS_fsm = 59'h10000;
            end
            59'h10000: begin
                ap_NS_fsm = 59'h20000;
            end
            59'h20000: begin
                ap_NS_fsm = 59'h40000;
            end
            59'h40000: begin
                ap_NS_fsm = 59'h80000;
            end
            59'h80000: begin
                ap_NS_fsm = 59'h100000;
            end
            59'h100000: begin
                ap_NS_fsm = 59'h200000;
            end
            59'h200000: begin
                ap_NS_fsm = 59'h400000;
            end
            59'h400000: begin
                ap_NS_fsm = 59'h800000;
            end
            59'h800000: begin
                ap_NS_fsm = 59'h1000000;
            end
            59'h1000000: begin
                ap_NS_fsm = 59'h2000000;
            end
            59'h2000000: begin
                ap_NS_fsm = 59'h4000000;
            end
            59'h4000000: begin
                ap_NS_fsm = 59'h8000000;
            end
            59'h8000000: begin
                ap_NS_fsm = 59'h10000000;
            end
            59'h10000000: begin
                ap_NS_fsm = 59'h20000000;
            end
            59'h20000000: begin
                ap_NS_fsm = 59'h40000000;
            end
            59'h40000000: begin
                ap_NS_fsm = 59'h80000000;
            end
            59'h80000000: begin
                ap_NS_fsm = 59'h100000000;
            end
            59'h100000000: begin
                ap_NS_fsm = 59'h200000000;
            end
            59'h200000000: begin
                ap_NS_fsm = 59'h400000000;
            end
            59'h400000000: begin
                ap_NS_fsm = 59'h800000000;
            end
            59'h800000000: begin
                ap_NS_fsm = 59'h1000000000;
            end
            59'h1000000000: begin
                ap_NS_fsm = 59'h2000000000;
            end
            59'h2000000000: begin
                ap_NS_fsm = 59'h4000000000;
            end
            59'h4000000000: begin
                ap_NS_fsm = 59'h8000000000;
            end
            59'h8000000000: begin
                ap_NS_fsm = 59'h10000000000;
            end
            59'h10000000000: begin
                ap_NS_fsm = 59'h20000000000;
            end
            59'h20000000000: begin
                ap_NS_fsm = 59'h40000000000;
            end
            59'h40000000000: begin
                ap_NS_fsm = 59'h80000000000;
            end
            59'h80000000000: begin
                ap_NS_fsm = 59'h100000000000;
            end
            59'h100000000000: begin
                ap_NS_fsm = 59'h200000000000;
            end
            59'h200000000000: begin
                ap_NS_fsm = 59'h400000000000;
            end
            59'h400000000000: begin
                ap_NS_fsm = 59'h800000000000;
            end
            59'h800000000000: begin
                ap_NS_fsm = 59'h1000000000000;
            end
            59'h1000000000000: begin
                ap_NS_fsm = 59'h2000000000000;
            end
            59'h2000000000000: begin
                ap_NS_fsm = 59'h4000000000000;
            end
            59'h4000000000000: begin
                ap_NS_fsm = 59'h8000000000000;
            end
            59'h8000000000000: begin
                ap_NS_fsm = 59'h10000000000000;
            end
            59'h10000000000000: begin
                ap_NS_fsm = 59'h20000000000000;
            end
            59'h20000000000000: begin
                ap_NS_fsm = 59'h40000000000000;
            end
            59'h40000000000000: begin
                ap_NS_fsm = 59'h80000000000000;
            end
            59'h80000000000000: begin
                ap_NS_fsm = 59'h100000000000000;
            end
            59'h100000000000000: begin
                ap_NS_fsm = 59'h200000000000000;
            end
            59'h200000000000000: begin
                ap_NS_fsm = 59'h400000000000000;
            end
            59'h400000000000000: begin
                ap_NS_fsm = 59'h2;
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln19_1_fu_125_p2 = (phi_mul_fu_50 + 18'd400);
    assign add_ln19_fu_137_p2 = (i_fu_54 + 9'd1);
    assign add_ln24_fu_162_p2 = (phi_mul_load_reg_205 + zext_ln24_fu_159_p1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign ap_CS_fsm_state58 = ap_CS_fsm[32'd57];
    assign ap_CS_fsm_state59 = ap_CS_fsm[32'd58];
    assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
    assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
    assign b_address0 = zext_ln19_fu_143_p1;
    assign grp_fu_181_p0 = {{x_load_reg_246}, 16'd0};
    assign grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start = grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_ap_start_reg;
    assign icmp_ln19_fu_131_p2 = ((i_fu_54 == 9'd400) ? 1'b1 : 1'b0);
    assign trunc_ln24_fu_187_p1 = sdiv_ln24_reg_266[31:0];
    assign zext_ln19_fu_143_p1 = i_fu_54;
    assign zext_ln24_1_fu_167_p1 = add_ln24_reg_231;
    assign zext_ln24_fu_159_p1 = i_1_reg_211;
endmodule

module kernel_trisolv_grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[31:0] b_load,
    output reg[8:0] x_address0,
    output reg x_ce0,
    output reg x_we0,
    output logic[31:0] x_d0,
    input logic[31:0] x_q0,
    input logic[8:0] zext_ln19,
    input logic[8:0] i,
    input logic[17:0] phi_mul,
    output logic[17:0] L_address0,
    output reg L_ce0,
    input logic[31:0] L_q0
);
    reg[4:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    reg ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_idle_pp0;
    wire logic ap_CS_fsm_pp0_stage2;
    wire logic ap_block_pp0_stage2_subdone;
    reg[0:0] icmp_ln22_reg_259;
    reg ap_condition_exit_pp0_iter0_stage2;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_CS_fsm_pp0_stage4;
    wire logic ap_block_pp0_stage4_subdone;
    wire logic ap_block_pp0_stage0_11001;
    wire logic [8:0] zext_ln19_cast_fu_130_p1;
    reg [8:0] zext_ln19_cast_reg_243;
    reg[8:0] j_1_reg_248;
    wire logic ap_CS_fsm_pp0_stage1;
    wire logic ap_block_pp0_stage1_11001;
    reg[31:0] x_load_reg_254;
    wire logic[0:0] icmp_ln22_fu_151_p2;
    reg signed[31:0] L_load_reg_268;
    wire logic ap_block_pp0_stage2_11001;
    reg signed[31:0] x_load_1_reg_278;
    wire logic ap_CS_fsm_pp0_stage3;
    wire logic ap_block_pp0_stage3_11001;
    wire logic[47:0] grp_fu_126_p2;
    reg[47:0] mul_ln23_reg_293;
    reg ap_enable_reg_pp0_iter0_reg;
    wire logic ap_block_pp0_stage1_subdone;
    wire logic ap_block_pp0_stage1;
    wire logic [17:0] zext_ln23_1_fu_165_p1;
    wire logic [8:0] j_cast_fu_175_p1;
    wire logic ap_block_pp0_stage2;
    reg[8:0] j_fu_60;
    wire logic[8:0] add_ln22_fu_170_p2;
    wire logic ap_loop_init;
    reg[31:0] x_load_2_fu_64;
    reg[31:0] ap_sig_allocacmp_x_load;
    wire logic [8:0] zext_ln23_fu_156_p1;
    wire logic[17:0] add_ln23_fu_160_p2;
    wire logic[47:0] shl_ln1_fu_192_p3;
    wire logic[47:0] sub_ln23_fu_199_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg[4:0] ap_NS_fsm;
    wire logic ap_block_pp0_stage0_subdone;
    reg ap_idle_pp0_1to1;
    wire logic ap_block_pp0_stage3_subdone;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 5'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter0_reg = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_trisolv_grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_mul_32s_32s_48_2_1_U1 mul_32s_32s_48_2_1_U1 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(x_load_1_reg_278),
        .din1(L_load_reg_268),
        .dout(grp_fu_126_p2)
    );
    kernel_trisolv_grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
        .ap_loop_exit_ready(ap_condition_exit_pp0_iter0_stage2),
        .ap_loop_exit_done(ap_done_int)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 5'b1;
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
            if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter1 <= 1'b0;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage4))) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (ap_loop_init == 1'b1))) begin
            j_fu_60 <= 9'd0;
        end
        else if (((((icmp_ln22_reg_259 == 1'b0) & (1'b0 == 1'b0))) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            j_fu_60 <= add_ln22_fu_170_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0)) & (ap_loop_init == 1'b1))) begin
            x_load_2_fu_64 <= b_load;
        end
        else if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)))) begin
            x_load_2_fu_64 <= {{sub_ln23_fu_199_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln22_reg_259 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            L_load_reg_268 <= L_q0;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            icmp_ln22_reg_259 <= icmp_ln22_fu_151_p2;
            j_1_reg_248 <= j_fu_60;
            x_load_reg_254 <= ap_sig_allocacmp_x_load;
        end
    end
    always @(posedge ap_clk) begin begin
            mul_ln23_reg_293 <= grp_fu_126_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((((icmp_ln22_reg_259 == 1'b0))) & (1'b1 == ap_CS_fsm_pp0_stage3))) begin
            x_load_1_reg_278 <= x_q0;
        end
    end
    always @(posedge ap_clk) begin begin
            zext_ln19_cast_reg_243[8:0] <= zext_ln19_cast_fu_130_p1[8:0];
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            L_ce0 = 1'b1;
        end
        else begin
            L_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln22_reg_259 == 1'b1) & (1'b0 == 1'b0))) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
            ap_condition_exit_pp0_iter0_stage2 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage2 = 1'b0;
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
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_sig_allocacmp_x_load = {{sub_ln23_fu_199_p2[47:16]}};
        end
        else begin
            ap_sig_allocacmp_x_load = x_load_2_fu_64;
        end
    end
    always @* begin
        if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage2))) begin
                x_address0 = j_cast_fu_175_p1;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                x_address0 = zext_ln19_cast_reg_243;
            end
            else begin
                x_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        end
        else begin
            x_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage2)) | (((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
            x_ce0 = 1'b1;
        end
        else begin
            x_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            x_we0 = 1'b1;
        end
        else begin
            x_we0 = 1'b0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            5'b1: begin
                if ((~(((ap_start_int == 1'b0) & (1'b1 == 1'b1))) & (1'b0 == 1'b0))) begin
                    ap_NS_fsm = 5'b10;
                end
                else begin
                    ap_NS_fsm = 5'b1;
                end
            end
            5'b10: begin begin
                    ap_NS_fsm = 5'b100;
                end
            end
            5'b100: begin begin
                    ap_NS_fsm = 5'b1000;
                end
            end
            5'b1000: begin begin
                    ap_NS_fsm = 5'b10000;
                end
            end
            5'b10000: begin begin
                    ap_NS_fsm = 5'b1;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign L_address0 = zext_ln23_1_fu_165_p1;
    assign add_ln22_fu_170_p2 = (j_1_reg_248 + 9'd1);
    assign add_ln23_fu_160_p2 = (phi_mul + zext_ln23_fu_156_p1);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_pp0_stage2 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_pp0_stage3 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_pp0_stage4 = ap_CS_fsm[32'd4];
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
    assign ap_block_pp0_stage4_subdone = 1'b0;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage2;
    assign icmp_ln22_fu_151_p2 = ((j_fu_60 == i) ? 1'b1 : 1'b0);
    assign j_cast_fu_175_p1 = j_1_reg_248;
    assign shl_ln1_fu_192_p3 = {{x_load_reg_254}, 16'd0};
    assign sub_ln23_fu_199_p2 = (shl_ln1_fu_192_p3 - mul_ln23_reg_293);
    assign x_d0 = ap_sig_allocacmp_x_load;
    assign zext_ln19_cast_fu_130_p1 = zext_ln19;
    assign zext_ln23_1_fu_165_p1 = add_ln23_fu_160_p2;
    assign zext_ln23_fu_156_p1 = j_fu_60;
    always @(posedge ap_clk) begin
        begin end
    end
endmodule
module kernel_trisolv_grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_mul_32s_32s_48_2_1_U1 (
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

module kernel_trisolv_grp_kernel_trisolv_Pipeline_VITIS_LOOP_22_2_fu_96_flow_control_loop_pipe_sequential_init_U (
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


module kernel_trisolv_sdiv_48ns_32s_32_52_seq_1_U9 #(
    parameter logic signed[31:0] ID = 1,
    parameter logic signed[31:0] NUM_STAGE = 52,
    parameter logic signed[31:0] din0_WIDTH = 48,
    parameter logic signed[31:0] din1_WIDTH = 32,
    parameter logic signed[31:0] dout_WIDTH = 32
) (
    input logic clk,
    input logic reset,
    input logic ce,
    input logic start,
    output reg done,
    input logic[47:0] din0,
    input logic[31:0] din1,
    output logic[31:0] dout
);
    reg start0 = 32'd0;
    wire logic done0;
    reg[47:0] dividend0;
    reg[31:0] divisor0;
    wire logic[47:0] dividend_u;
    wire logic[31:0] divisor_u;
    wire logic[31:0] quot_u;
    wire logic [0:0] remd_u;
    reg[31:0] quot;
    wire logic[1:0] sign_i;
    wire logic[1:0] sign_o;
    kernel_trisolv_sdiv_48ns_32s_32_52_seq_1_U9_kernel_trisolv_sdiv_48ns_32s_32_52_seq_1_divseq_u #(
        .in0_WIDTH(48),
        .in1_WIDTH(32),
        .out_WIDTH(32)
    ) kernel_trisolv_sdiv_48ns_32s_32_52_seq_1_divseq_u (
        .clk(clk),
        .reset(reset),
        .ce(ce),
        .start(start0),
        .dividend(dividend_u),
        .divisor(divisor_u),
        .sign_i(sign_i),
        .sign_o(sign_o),
        .done(done0),
        .quot(quot_u),
        .remd(remd_u)
    );
    assign sign_i = {(dividend0[47] ^ divisor0[31]), dividend0[47]};
    assign dividend_u = (dividend0[47] ? (~(dividend0[47:0]) + 1'b1) : dividend0[47:0]);
    assign divisor_u = (divisor0[31] ? (~(divisor0[31:0]) + 1'b1) : divisor0[31:0]);
    always @(posedge clk) begin begin
            dividend0 <= din0;
            divisor0 <= din1;
            start0 <= start;
        end
    end
    always @(posedge clk) begin
        done <= 1'b1;
    end
    always @(posedge clk) begin begin
            if (sign_o[1]) begin
                quot <= (~(quot_u) + 1'b1);
            end
            else begin
                quot <= quot_u;
            end
        end
    end
    assign dout = quot;
endmodule
module kernel_trisolv_sdiv_48ns_32s_32_52_seq_1_U9_kernel_trisolv_sdiv_48ns_32s_32_52_seq_1_divseq_u #(
    parameter logic signed[31:0] in0_WIDTH = 48,
    parameter logic signed[31:0] in1_WIDTH = 32,
    parameter logic signed[31:0] out_WIDTH = 32
) (
    input logic clk,
    input logic reset,
    input logic ce,
    input logic start,
    input logic[47:0] dividend,
    input logic[31:0] divisor,
    input logic[1:0] sign_i,
    output logic[1:0] sign_o,
    output logic done,
    output logic[31:0] quot,
    output logic[31:0] remd
);
    reg[47:0] dividend0;
    reg[31:0] divisor0;
    reg[1:0] sign0;
    reg[47:0] dividend_tmp;
    reg[46:0] remd_tmp;
    wire logic[47:0] dividend_tmp_mux;
    wire logic[46:0] remd_tmp_mux;
    wire logic[47:0] comb_tmp;
    wire logic[48:0] cal_tmp;
    assign quot = dividend_tmp;
    assign remd = remd_tmp;
    assign sign_o = sign0;
    always @(posedge clk) begin
        if (start) begin
            dividend0 <= dividend;
            divisor0 <= divisor;
            sign0 <= sign_i;
        end
    end
    reg[48:0] r_stage;
    assign done = r_stage[48];
    always @(posedge clk) begin
        r_stage[48:0] <= {r_stage[47:0], start};
    end
    assign dividend_tmp_mux = (r_stage[0] ? dividend0 : dividend_tmp);
    assign remd_tmp_mux = (r_stage[0] ? 48'h0 : remd_tmp);
    assign comb_tmp = {remd_tmp_mux[46:0], dividend_tmp_mux[47]};
    assign cal_tmp = ({1'b0, comb_tmp} - {1'b0, divisor0});
    always @(posedge clk) begin
        begin
            dividend_tmp <= {dividend_tmp_mux[46:0], ~(cal_tmp[48])};
        end
        remd_tmp <= (cal_tmp[48] ? comb_tmp : cal_tmp[47:0]);
    end
endmodule
