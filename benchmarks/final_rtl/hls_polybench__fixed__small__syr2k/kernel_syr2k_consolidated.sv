module kernel_syr2k (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    input logic[31:0] alpha,
    input logic[31:0] beta,
    output reg[12:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output reg[31:0] C_d0,
    input logic[31:0] C_q0,
    output logic[12:0] C_address1,
    output reg C_ce1,
    input logic[31:0] C_q1,
    output logic[12:0] A_address0,
    output logic A_ce0,
    input logic[31:0] A_q0,
    output logic[12:0] A_address1,
    output logic A_ce1,
    input logic[31:0] A_q1,
    output logic[12:0] B_address0,
    output logic B_ce0,
    input logic[31:0] B_q0,
    output logic[12:0] B_address1,
    output logic B_ce1,
    input logic[31:0] B_q1
);
    reg[4:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    reg[6:0] indvars_iv272_load_reg_248;
    wire logic ap_CS_fsm_state2;
    wire logic[0:0] icmp_ln21_fu_119_p2;
    wire logic[12:0] add_ln23_fu_155_p2;
    reg[12:0] add_ln23_reg_256;
    wire logic[12:0] empty_fu_174_p2;
    reg[12:0] empty_reg_262;
    wire logic[12:0] sub_ln24_fu_214_p2;
    reg[12:0] sub_ln24_reg_267;
    wire logic ap_CS_fsm_state4;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_done;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_idle;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_ready;
    wire logic[12:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_address0;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_ce0;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_we0;
    wire logic[31:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_d0;
    wire logic[12:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_address1;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_ce1;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_done;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_idle;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_ready;
    wire logic[12:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_address0;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_ce0;
    wire logic[12:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_address1;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_ce1;
    wire logic[12:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_address0;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_ce0;
    wire logic[12:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_address1;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_ce1;
    wire logic[12:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_address0;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_ce0;
    wire logic grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_we0;
    wire logic[31:0] grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_d0;
    reg grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start_reg;
    wire logic ap_CS_fsm_state3;
    reg grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start_reg;
    wire logic ap_CS_fsm_state5;
    reg[6:0] indvars_iv272_fu_62;
    wire logic[6:0] add_ln21_1_fu_180_p2;
    reg[6:0] i_fu_66;
    wire logic[6:0] add_ln21_fu_125_p2;
    wire logic[10:0] tmp_1_fu_143_p3;
    wire logic[12:0] tmp_fu_135_p3;
    wire logic [10:0] zext_ln23_fu_151_p1;
    wire logic[8:0] tmp_3_fu_162_p3;
    wire logic [8:0] tmp_3_cast_fu_170_p1;
    wire logic[8:0] tmp_4_fu_203_p3;
    wire logic[12:0] p_shl4_fu_196_p3;
    wire logic [8:0] zext_ln24_fu_210_p1;
    reg[4:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 5'b1;
        grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start_reg = 1'b0;
        grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start_reg = 1'b0;
    end
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82 grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start),
        .ap_done(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_done),
        .ap_idle(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_idle),
        .ap_ready(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_ready),
        .indvars_iv272(indvars_iv272_load_reg_248),
        .add_ln23(add_ln23_reg_256),
        .C_address0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_address0),
        .C_ce0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_ce0),
        .C_we0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_we0),
        .C_d0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_d0),
        .C_address1(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_address1),
        .C_ce1(grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_ce1),
        .C_q1(C_q1),
        .beta_cast(beta)
    );
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91 grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start),
        .ap_done(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_done),
        .ap_idle(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_idle),
        .ap_ready(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_ready),
        .sub_ln24(sub_ln24_reg_267),
        .indvars_iv272(indvars_iv272_load_reg_248),
        .empty(empty_reg_262),
        .B_address0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_address0),
        .B_ce0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_ce0),
        .B_q0(B_q0),
        .B_address1(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_address1),
        .B_ce1(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_ce1),
        .B_q1(B_q1),
        .A_address0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_address0),
        .A_ce0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_ce0),
        .A_q0(A_q0),
        .A_address1(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_address1),
        .A_ce1(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_ce1),
        .A_q1(A_q1),
        .add_ln23(add_ln23_reg_256),
        .C_address0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_address0),
        .C_ce0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_ce0),
        .C_we0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_we0),
        .C_d0(grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_d0),
        .C_q0(C_q0),
        .conv7_i174(alpha)
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
            grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start_reg <= 1'b0;
        end
        else begin
            if (((icmp_ln21_fu_119_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
                grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_ready == 1'b1)) begin
                grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state4)) begin
                grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_ready == 1'b1)) begin
                grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            i_fu_66 <= 7'b0;
        end
        else if (((icmp_ln21_fu_119_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
            i_fu_66 <= add_ln21_fu_125_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            indvars_iv272_fu_62 <= 7'b1;
        end
        else if (((icmp_ln21_fu_119_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
            indvars_iv272_fu_62 <= add_ln21_1_fu_180_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((icmp_ln21_fu_119_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
            add_ln23_reg_256[12:4] <= add_ln23_fu_155_p2[12:4];
            empty_reg_262[12:2] <= empty_fu_174_p2[12:2];
            indvars_iv272_load_reg_248 <= indvars_iv272_fu_62;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            sub_ln24_reg_267[12:2] <= sub_ln24_fu_214_p2[12:2];
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_address0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_address0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_address0;
        end
        else begin
            C_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_ce0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_ce0;
        end
        else begin
            C_ce0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_ce0;
        end
    end
    always @* begin begin
            C_ce1 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_ce1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_d0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_d0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_d0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_d0;
        end
        else begin
            C_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_we0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_C_we0;
        end
        else begin
            C_we0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_we0;
        end
    end
    always @* begin
        if (((icmp_ln21_fu_119_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
        if (((icmp_ln21_fu_119_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
                if (((icmp_ln21_fu_119_p2 == 1'b1))) begin
                    ap_NS_fsm = 5'b1;
                end
                else begin
                    ap_NS_fsm = 5'b100;
                end
            end
            5'b100: begin
                if (((grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_done == 1'b1))) begin
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
                if (( (grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_done == 1'b1))) begin
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
    assign A_address0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_address0;
    assign A_address1 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_address1;
    assign A_ce0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_ce0;
    assign A_ce1 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_A_ce1;
    assign B_address0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_address0;
    assign B_address1 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_address1;
    assign B_ce0 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_ce0;
    assign B_ce1 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_B_ce1;
    assign C_address1 = grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_C_address1;
    assign add_ln21_1_fu_180_p2 = (indvars_iv272_fu_62 + 7'b1);
    assign add_ln21_fu_125_p2 = (i_fu_66 + 7'b1);
    assign add_ln23_fu_155_p2 = (tmp_fu_135_p3 + zext_ln23_fu_151_p1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign empty_fu_174_p2 = (tmp_fu_135_p3 - tmp_3_cast_fu_170_p1);
    assign grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start = grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_ap_start_reg;
    assign grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start = grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_ap_start_reg;
    assign icmp_ln21_fu_119_p2 = ((i_fu_66 == 7'b1010000) ? 1'b1 : 1'b0);
    assign p_shl4_fu_196_p3 = {{indvars_iv272_load_reg_248}, 6'b0};
    assign sub_ln24_fu_214_p2 = (p_shl4_fu_196_p3 - zext_ln24_fu_210_p1);
    assign tmp_1_fu_143_p3 = {{i_fu_66}, 4'b0};
    assign tmp_3_cast_fu_170_p1 = tmp_3_fu_162_p3;
    assign tmp_3_fu_162_p3 = {{i_fu_66}, 2'b0};
    assign tmp_4_fu_203_p3 = {{indvars_iv272_load_reg_248}, 2'b0};
    assign tmp_fu_135_p3 = {{i_fu_66}, 6'b0};
    assign zext_ln23_fu_151_p1 = tmp_1_fu_143_p3;
    assign zext_ln24_fu_210_p1 = tmp_4_fu_203_p3;
    always @(posedge ap_clk) begin
        add_ln23_reg_256[3:0] <= 4'b0;
        empty_reg_262[1:0] <= 2'b0;
        sub_ln24_reg_267[1:0] <= 2'b0;
    end
endmodule

module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[6:0] indvars_iv272,
    input logic[12:0] add_ln23,
    output logic[12:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output logic[31:0] C_d0,
    output logic[12:0] C_address1,
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
    wire logic[0:0] icmp_ln22_fu_109_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic signed [31:0] beta_cast_cast_fu_97_p1;
    reg signed [31:0] beta_cast_cast_reg_162;
    wire logic ap_block_pp0_stage0_11001;
    reg[12:0] C_addr_reg_171;
    reg[12:0] C_addr_reg_171_pp0_iter1_reg;
    reg[12:0] C_addr_reg_171_pp0_iter2_reg;
    reg[12:0] C_addr_reg_171_pp0_iter3_reg;
    reg signed[31:0] C_load_reg_177;
    reg[31:0] trunc_ln_reg_187;
    wire logic [12:0] zext_ln23_1_fu_131_p1;
    wire logic ap_block_pp0_stage0;
    reg[6:0] j_fu_54;
    wire logic[6:0] add_ln22_fu_115_p2;
    wire logic ap_loop_init;
    reg[6:0] ap_sig_allocacmp_j_1;
    wire logic signed[31:0] grp_fu_93_p1;
    wire logic [6:0] zext_ln23_fu_121_p1;
    wire logic[12:0] add_ln23_1_fu_125_p2;
    wire logic[47:0] grp_fu_93_p2;
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
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_mul_32s_32s_48_2_1_U1 mul_32s_32s_48_2_1_U1 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(C_load_reg_177),
        .din1(grp_fu_93_p1),
        .dout(grp_fu_93_p2)
    );
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
            if (((icmp_ln22_fu_109_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_54 <= add_ln22_fu_115_p2;
            end
            else if ((ap_loop_init == 1'b1)) begin
                j_fu_54 <= 7'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln22_fu_109_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == 1'b1))) begin
            C_addr_reg_171 <= zext_ln23_1_fu_131_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            C_addr_reg_171_pp0_iter1_reg <= C_addr_reg_171;
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            beta_cast_cast_reg_162 <= beta_cast_cast_fu_97_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            C_addr_reg_171_pp0_iter2_reg <= C_addr_reg_171_pp0_iter1_reg;
            C_addr_reg_171_pp0_iter3_reg <= C_addr_reg_171_pp0_iter2_reg;
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            trunc_ln_reg_187 <= {{grp_fu_93_p2[47:16]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == 1'b1))) begin
            C_load_reg_177 <= C_q1;
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
        if (((((icmp_ln22_fu_109_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
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
            ap_sig_allocacmp_j_1 = 7'b0;
        end
        else begin
            ap_sig_allocacmp_j_1 = j_fu_54;
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
    assign C_address0 = C_addr_reg_171_pp0_iter3_reg;
    assign C_address1 = zext_ln23_1_fu_131_p1;
    assign C_d0 = trunc_ln_reg_187;
    assign add_ln22_fu_115_p2 = (ap_sig_allocacmp_j_1 + 7'b1);
    assign add_ln23_1_fu_125_p2 = (add_ln23 + zext_ln23_fu_121_p1);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign beta_cast_cast_fu_97_p1 = $signed(beta_cast);
    assign grp_fu_93_p1 = beta_cast_cast_reg_162;
    assign icmp_ln22_fu_109_p2 = ((ap_sig_allocacmp_j_1 == indvars_iv272) ? 1'b1 : 1'b0);
    assign zext_ln23_1_fu_131_p1 = add_ln23_1_fu_125_p2;
    assign zext_ln23_fu_121_p1 = ap_sig_allocacmp_j_1;
endmodule
module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_mul_32s_32s_48_2_1_U1 (
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

module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_22_2_fu_82_flow_control_loop_pipe_sequential_init_U (
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


module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[12:0] sub_ln24,
    input logic[6:0] indvars_iv272,
    input logic[12:0] empty,
    output logic[12:0] B_address0,
    output reg B_ce0,
    input logic[31:0] B_q0,
    output logic[12:0] B_address1,
    output reg B_ce1,
    input logic[31:0] B_q1,
    output logic[12:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output logic[12:0] A_address1,
    output reg A_ce1,
    input logic[31:0] A_q1,
    input logic[12:0] add_ln23,
    output reg[12:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output logic[31:0] C_d0,
    input logic[31:0] C_q0,
    input logic[31:0] conv7_i174
);
    reg[1:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    reg ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_enable_reg_pp0_iter3;
    reg ap_enable_reg_pp0_iter4;
    reg ap_enable_reg_pp0_iter5;
    reg ap_enable_reg_pp0_iter6;
    reg ap_idle_pp0;
    wire logic ap_CS_fsm_pp0_stage1;
    wire logic ap_block_pp0_stage1_subdone;
    reg[0:0] icmp_ln24_reg_494;
    reg ap_condition_exit_pp0_iter0_stage1;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic signed [31:0] conv7_i174_cast_fu_211_p1;
    reg signed [31:0] conv7_i174_cast_reg_488;
    wire logic[0:0] icmp_ln24_fu_243_p2;
    reg[0:0] icmp_ln24_reg_494_pp0_iter1_reg;
    reg[0:0] icmp_ln24_reg_494_pp0_iter2_reg;
    reg[0:0] icmp_ln24_reg_494_pp0_iter3_reg;
    reg[0:0] icmp_ln24_reg_494_pp0_iter4_reg;
    wire logic[6:0] select_ln24_fu_273_p3;
    reg[6:0] select_ln24_reg_498;
    reg[6:0] select_ln24_reg_498_pp0_iter1_reg;
    reg[6:0] select_ln24_reg_498_pp0_iter2_reg;
    reg[6:0] select_ln24_reg_498_pp0_iter3_reg;
    reg[6:0] select_ln24_reg_498_pp0_iter4_reg;
    wire logic[5:0] select_ln24_1_fu_281_p3;
    reg[5:0] select_ln24_1_reg_506;
    wire logic[12:0] add_ln24_2_fu_302_p2;
    reg[12:0] add_ln24_2_reg_511;
    wire logic ap_block_pp0_stage1_11001;
    reg signed[31:0] A_load_1_reg_526;
    reg signed[31:0] B_load_1_reg_531;
    reg signed[31:0] B_load_reg_556;
    reg signed[31:0] A_load_reg_561;
    wire logic signed[63:0] grp_fu_195_p2;
    reg signed[63:0] mul_ln27_reg_566;
    wire logic signed[63:0] grp_fu_199_p2;
    reg signed[63:0] mul_ln27_2_reg_571;
    reg[12:0] C_addr_reg_586;
    reg[12:0] C_addr_reg_586_pp0_iter5_reg;
    wire logic[0:0] addr_cmp_fu_390_p2;
    reg[0:0] addr_cmp_reg_591;
    wire logic[63:0] grp_fu_203_p2;
    reg[63:0] mul_ln27_1_reg_596;
    wire logic[63:0] grp_fu_207_p2;
    reg[63:0] mul_ln27_3_reg_601;
    wire logic[31:0] reuse_select_fu_404_p3;
    reg[31:0] reuse_select_reg_606;
    reg[31:0] trunc_ln1_reg_611;
    reg ap_enable_reg_pp0_iter0_reg;
    wire logic ap_block_pp0_stage0_subdone;
    wire logic [12:0] zext_ln27_3_fu_337_p1;
    wire logic ap_block_pp0_stage1;
    wire logic [12:0] select_ln24_2_cast_fu_353_p1;
    wire logic [12:0] zext_ln27_1_fu_382_p1;
    reg[63:0] reuse_addr_reg_fu_82;
    wire logic ap_loop_init;
    reg[31:0] reuse_reg_fu_86;
    wire logic ap_block_pp0_stage0;
    reg[6:0] j_fu_90;
    wire logic[6:0] add_ln25_fu_343_p2;
    reg[6:0] ap_sig_allocacmp_j_load;
    reg[5:0] k_fu_94;
    reg[5:0] ap_sig_allocacmp_k_load;
    reg[12:0] indvar_flatten_fu_98;
    wire logic[12:0] add_ln24_1_fu_249_p2;
    reg[12:0] ap_sig_allocacmp_indvar_flatten_load;
    wire logic signed[31:0] grp_fu_195_p1;
    wire logic signed[31:0] grp_fu_199_p1;
    wire logic[0:0] icmp_ln25_fu_267_p2;
    wire logic[5:0] add_ln24_fu_261_p2;
    wire logic [5:0] zext_ln24_fu_299_p1;
    wire logic[8:0] tmp_6_fu_314_p3;
    wire logic[12:0] tmp_5_fu_307_p3;
    wire logic [8:0] zext_ln27_2_fu_321_p1;
    wire logic[12:0] sub_ln27_fu_325_p2;
    wire logic[12:0] add_ln27_3_fu_331_p2;
    wire logic [6:0] zext_ln27_fu_374_p1;
    wire logic[12:0] add_ln27_2_fu_377_p2;
    wire logic[63:0] shl_ln_fu_415_p3;
    wire logic[63:0] add_ln27_fu_411_p2;
    wire logic[63:0] add_ln27_1_fu_422_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg ap_condition_exit_pp0_iter5_stage0;
    reg ap_idle_pp0_0to4;
    reg ap_loop_exit_ready_pp0_iter2_reg;
    reg ap_loop_exit_ready_pp0_iter3_reg;
    reg ap_loop_exit_ready_pp0_iter4_reg;
    reg ap_loop_exit_ready_pp0_iter5_reg;
    reg[1:0] ap_NS_fsm;
    reg ap_idle_pp0_1to6;
    reg ap_done_pending_pp0;
    wire logic ap_start_int;
    initial begin
        ap_CS_fsm = 2'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter3 = 1'b0;
        ap_enable_reg_pp0_iter4 = 1'b0;
        ap_enable_reg_pp0_iter5 = 1'b0;
        ap_enable_reg_pp0_iter6 = 1'b0;
        ap_enable_reg_pp0_iter0_reg = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_32s_32s_64_2_1_U7 mul_32s_32s_64_2_1_U7 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(A_load_1_reg_526),
        .din1(grp_fu_195_p1),
        .dout(grp_fu_195_p2)
    );
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_32s_32s_64_2_1_U8 mul_32s_32s_64_2_1_U8 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(B_load_1_reg_531),
        .din1(grp_fu_199_p1),
        .dout(grp_fu_199_p2)
    );
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_64s_32s_64_5_1_U9 mul_64s_32s_64_5_1_U9 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(mul_ln27_reg_566),
        .din1(B_load_reg_556),
        .dout(grp_fu_203_p2)
    );
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_64s_32s_64_5_1_U10 mul_64s_32s_64_5_1_U10 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(mul_ln27_2_reg_571),
        .din1(A_load_reg_561),
        .dout(grp_fu_207_p2)
    );
    kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter3 <= 1'b0;
        end
        else begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter4 <= 1'b0;
        end
        else begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter5 <= 1'b0;
        end
        else begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_enable_reg_pp0_iter6 <= 1'b0;
        end
        else begin
            if ((((1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                ap_enable_reg_pp0_iter6 <= 1'b0;
            end
            else begin
                ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
            end
        end
    end
    always @(posedge ap_clk) begin if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        end
    end
    always @(posedge ap_clk) begin if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
        end
    end
    always @(posedge ap_clk) begin if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
        end
    end
    always @(posedge ap_clk) begin if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            if (((ap_enable_reg_pp0_iter0 == 1'b1) & (icmp_ln24_fu_243_p2 == 1'b0))) begin
                indvar_flatten_fu_98 <= add_ln24_1_fu_249_p2;
            end
            else if ((ap_loop_init == 1'b1)) begin
                indvar_flatten_fu_98 <= 13'd0;
            end
        end
    end
    always @(posedge ap_clk) begin if (((((icmp_ln24_reg_494 == 1'b0) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
            j_fu_90 <= add_ln25_fu_343_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            if (((ap_enable_reg_pp0_iter0 == 1'b1))) begin
                k_fu_94 <= select_ln24_1_fu_281_p3;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)))) begin
            reuse_addr_reg_fu_82 <= 64'hffffffffffffffff;
        end
        else if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            reuse_addr_reg_fu_82 <= zext_ln27_1_fu_382_p1;
        end
    end
    always @(posedge ap_clk) begin if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1)))) begin
            reuse_reg_fu_86 <= {{add_ln27_1_fu_422_p2[63:32]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            A_load_1_reg_526 <= A_q1;
            B_load_1_reg_531 <= B_q1;
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            A_load_reg_561 <= A_q0;
            B_load_reg_556 <= B_q0;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            C_addr_reg_586 <= zext_ln27_1_fu_382_p1;
            C_addr_reg_586_pp0_iter5_reg <= C_addr_reg_586;
            addr_cmp_reg_591 <= addr_cmp_fu_390_p2;
            trunc_ln1_reg_611 <= {{add_ln27_1_fu_422_p2[63:32]}};
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln24_reg_494 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            add_ln24_2_reg_511 <= add_ln24_2_fu_302_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            conv7_i174_cast_reg_488 <= conv7_i174_cast_fu_211_p1;
            icmp_ln24_reg_494 <= icmp_ln24_fu_243_p2;
            icmp_ln24_reg_494_pp0_iter1_reg <= icmp_ln24_reg_494;
            icmp_ln24_reg_494_pp0_iter2_reg <= 1'b0;
            icmp_ln24_reg_494_pp0_iter3_reg <= 1'b0;
            icmp_ln24_reg_494_pp0_iter4_reg <= 1'b0;
            mul_ln27_1_reg_596 <= grp_fu_203_p2;
            mul_ln27_2_reg_571 <= grp_fu_199_p2;
            mul_ln27_3_reg_601 <= grp_fu_207_p2;
            mul_ln27_reg_566 <= grp_fu_195_p2;
            reuse_select_reg_606 <= reuse_select_fu_404_p3;
            select_ln24_reg_498_pp0_iter1_reg <= select_ln24_reg_498;
            select_ln24_reg_498_pp0_iter2_reg <= select_ln24_reg_498_pp0_iter1_reg;
            select_ln24_reg_498_pp0_iter3_reg <= select_ln24_reg_498_pp0_iter2_reg;
            select_ln24_reg_498_pp0_iter4_reg <= select_ln24_reg_498_pp0_iter3_reg;
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (icmp_ln24_fu_243_p2 == 1'b0))) begin
            select_ln24_1_reg_506 <= select_ln24_1_fu_281_p3;
            select_ln24_reg_498 <= select_ln24_fu_273_p3;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            A_ce1 = 1'b1;
        end
        else begin
            A_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            B_ce1 = 1'b1;
        end
        else begin
            B_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b1)))) begin
            C_address0 = C_addr_reg_586_pp0_iter5_reg;
        end
        else if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            C_address0 = zext_ln27_1_fu_382_p1;
        end
        else begin
            C_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1)) | (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b1))))) begin
            C_ce0 = 1'b1;
        end
        else begin
            C_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b1)))) begin
            C_we0 = 1'b1;
        end
        else begin
            C_we0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln24_reg_494 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b1;
        end
        else begin
            ap_condition_exit_pp0_iter0_stage1 = 1'b0;
        end
    end
    always @* begin begin
            ap_condition_exit_pp0_iter5_stage0 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_loop_exit_ready_pp0_iter5_reg == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            ap_done_int = 1'b1;
        end
        else begin
            ap_done_int = 1'b0;
        end
    end
    always @* begin
        if (~(((((( (ap_loop_exit_ready_pp0_iter5_reg == 1'b0)) & (ap_loop_exit_ready_pp0_iter4_reg == 1'b0)) & (ap_loop_exit_ready_pp0_iter3_reg == 1'b0)) & (ap_loop_exit_ready_pp0_iter2_reg == 1'b0)) & (ap_loop_exit_ready_pp0_iter1_reg == 1'b0)))) begin
            ap_done_pending_pp0 = 1'b1;
        end
        else begin
            ap_done_pending_pp0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0 = ap_start_int;
        end
        else begin
            ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
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
            ap_idle_pp0_0to4 = 1'b0;
        end
    end
    always @* begin begin
            ap_idle_pp0_1to6 = 1'b1;
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
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)))) begin
            ap_sig_allocacmp_indvar_flatten_load = 13'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_98;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)))) begin
            ap_sig_allocacmp_j_load = 7'b0;
        end
        else begin
            ap_sig_allocacmp_j_load = j_fu_90;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_loop_init == 1'b1)))) begin
            ap_sig_allocacmp_k_load = 6'b0;
        end
        else begin
            ap_sig_allocacmp_k_load = k_fu_94;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            2'b1: begin if ((~((((ap_start_int == 1'b0) & (ap_done_pending_pp0 == 1'b0)) & (1'b1 == 1'b1))) & (1'b0 == 1'b0))) begin
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
    assign A_address0 = select_ln24_2_cast_fu_353_p1;
    assign A_address1 = zext_ln27_3_fu_337_p1;
    assign B_address0 = select_ln24_2_cast_fu_353_p1;
    assign B_address1 = zext_ln27_3_fu_337_p1;
    assign C_d0 = trunc_ln1_reg_611;
    assign add_ln24_1_fu_249_p2 = (ap_sig_allocacmp_indvar_flatten_load + 13'd1);
    assign add_ln24_2_fu_302_p2 = (empty + zext_ln24_fu_299_p1);
    assign add_ln24_fu_261_p2 = (ap_sig_allocacmp_k_load + 6'b1);
    assign add_ln25_fu_343_p2 = (select_ln24_reg_498 + 7'b1);
    assign add_ln27_1_fu_422_p2 = (shl_ln_fu_415_p3 + add_ln27_fu_411_p2);
    assign add_ln27_2_fu_377_p2 = (add_ln23 + zext_ln27_fu_374_p1);
    assign add_ln27_3_fu_331_p2 = (sub_ln27_fu_325_p2 + zext_ln24_fu_299_p1);
    assign add_ln27_fu_411_p2 = (mul_ln27_3_reg_601 + mul_ln27_1_reg_596);
    assign addr_cmp_fu_390_p2 = ((reuse_addr_reg_fu_82 == zext_ln27_1_fu_382_p1) ? 1'b1 : 1'b0);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_block_pp0_stage1 = 1'b0;
    assign ap_block_pp0_stage1_11001 = 1'b0;
    assign ap_block_pp0_stage1_subdone = 1'b0;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;
    assign conv7_i174_cast_fu_211_p1 = $signed(conv7_i174);
    assign grp_fu_195_p1 = conv7_i174_cast_reg_488;
    assign grp_fu_199_p1 = conv7_i174_cast_reg_488;
    assign icmp_ln24_fu_243_p2 = ((ap_sig_allocacmp_indvar_flatten_load == sub_ln24) ? 1'b1 : 1'b0);
    assign icmp_ln25_fu_267_p2 = ((ap_sig_allocacmp_j_load == indvars_iv272) ? 1'b1 : 1'b0);
    assign reuse_select_fu_404_p3 = ((addr_cmp_reg_591[0:0] == 1'b1) ? reuse_reg_fu_86 : C_q0);
    assign select_ln24_1_fu_281_p3 = ((icmp_ln25_fu_267_p2[0:0] == 1'b1) ? add_ln24_fu_261_p2 : ap_sig_allocacmp_k_load);
    assign select_ln24_2_cast_fu_353_p1 = add_ln24_2_reg_511;
    assign select_ln24_fu_273_p3 = ((icmp_ln25_fu_267_p2[0:0] == 1'b1) ? 7'b0 : ap_sig_allocacmp_j_load);
    assign shl_ln_fu_415_p3 = {{reuse_select_reg_606}, 32'd0};
    assign sub_ln27_fu_325_p2 = (tmp_5_fu_307_p3 - zext_ln27_2_fu_321_p1);
    assign tmp_5_fu_307_p3 = {{select_ln24_reg_498}, 6'b0};
    assign tmp_6_fu_314_p3 = {{select_ln24_reg_498}, 2'b0};
    assign zext_ln24_fu_299_p1 = select_ln24_1_reg_506;
    assign zext_ln27_1_fu_382_p1 = add_ln27_2_fu_377_p2;
    assign zext_ln27_2_fu_321_p1 = tmp_6_fu_314_p3;
    assign zext_ln27_3_fu_337_p1 = add_ln27_3_fu_331_p2;
    assign zext_ln27_fu_374_p1 = select_ln24_reg_498_pp0_iter4_reg;
endmodule
module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_32s_32s_64_2_1_U7 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[31:0] din0,
    input logic[31:0] din1,
    output logic[63:0] dout
);
    wire logic signed[63:0] tmp_product;
    reg signed[63:0] buff0;
    assign tmp_product = ($signed(din0) * $signed(din1));
    always @(posedge clk) begin
        buff0 <= tmp_product;
    end
    assign dout = buff0;
endmodule

module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_32s_32s_64_2_1_U8 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[31:0] din0,
    input logic[31:0] din1,
    output logic[63:0] dout
);
    wire logic signed[63:0] tmp_product;
    reg signed[63:0] buff0;
    assign tmp_product = ($signed(din0) * $signed(din1));
    always @(posedge clk) begin
        buff0 <= tmp_product;
    end
    assign dout = buff0;
endmodule

module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_64s_32s_64_5_1_U9 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[63:0] din0,
    input logic[31:0] din1,
    output logic[63:0] dout
);
    wire logic signed[63:0] tmp_product;
    reg signed[63:0] buff0;
    reg[63:0] din0_reg;
    reg[31:0] din1_reg;
    reg signed[63:0] buff1;
    reg signed[63:0] buff2;
    assign tmp_product = ($signed(din0_reg) * $signed(din1_reg));
    always @(posedge clk) begin
        buff0 <= tmp_product;
        din0_reg <= din0;
        din1_reg <= din1;
        buff1 <= buff0;
        buff2 <= buff1;
    end
    assign dout = buff2;
endmodule

module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_mul_64s_32s_64_5_1_U10 (
    input logic clk,
    input logic ce,
    input logic reset,
    input logic[63:0] din0,
    input logic[31:0] din1,
    output logic[63:0] dout
);
    wire logic signed[63:0] tmp_product;
    reg signed[63:0] buff0;
    reg[63:0] din0_reg;
    reg[31:0] din1_reg;
    reg signed[63:0] buff1;
    reg signed[63:0] buff2;
    assign tmp_product = ($signed(din0_reg) * $signed(din1_reg));
    always @(posedge clk) begin
        buff0 <= tmp_product;
        din0_reg <= din0;
        din1_reg <= din1;
        buff1 <= buff0;
        buff2 <= buff1;
    end
    assign dout = buff2;
endmodule

module kernel_syr2k_grp_kernel_syr2k_Pipeline_VITIS_LOOP_24_3_VITIS_LOOP_25_4_fu_91_flow_control_loop_pipe_sequential_init_U (
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
