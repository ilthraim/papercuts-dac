module kernel_symm (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    input logic[31:0] alpha,
    input logic[31:0] beta,
    output reg[9:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output reg[31:0] C_d0,
    input logic[31:0] C_q0,
    output logic[9:0] C_address1,
    output reg C_ce1,
    input logic[31:0] C_q1,
    output reg[8:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output reg[9:0] B_address0,
    output reg B_ce0,
    input logic[31:0] B_q0
);
    reg[13:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic signed [31:0] conv_i389_fu_183_p1;
    reg signed [31:0] conv_i389_reg_440;
    wire logic signed [31:0] alpha_cast_fu_187_p1;
    reg signed [31:0] alpha_cast_reg_445;
    wire logic signed [31:0] sext_ln22_fu_191_p1;
    reg signed [31:0] sext_ln22_reg_450;
    wire logic[4:0] select_ln22_fu_243_p3;
    reg[4:0] select_ln22_reg_458;
    wire logic ap_CS_fsm_state2;
    wire logic[0:0] icmp_ln22_fu_213_p2;
    wire logic[4:0] select_ln22_1_fu_251_p3;
    reg[4:0] select_ln22_1_reg_464;
    reg[9:0] C_addr_reg_474;
    wire logic ap_CS_fsm_state3;
    reg signed[31:0] B_load_reg_484;
    wire logic ap_CS_fsm_state4;
    wire logic ap_CS_fsm_state5;
    reg signed[31:0] A_load_reg_499;
    wire logic ap_CS_fsm_state6;
    wire logic signed[63:0] grp_fu_175_p2;
    reg[63:0] mul_ln30_reg_504;
    wire logic[8:0] add_ln27_1_fu_355_p2;
    reg[8:0] add_ln27_1_reg_510;
    wire logic ap_CS_fsm_state7;
    reg signed[31:0] C_load_reg_520;
    wire logic ap_CS_fsm_state10;
    wire logic signed [31:0] sext_ln30_1_fu_369_p1;
    wire logic ap_CS_fsm_state11;
    wire logic[63:0] grp_fu_179_p2;
    reg[63:0] mul_ln30_2_reg_530;
    wire logic[47:0] grp_fu_167_p2;
    reg[47:0] mul_ln30_1_reg_540;
    wire logic ap_CS_fsm_state12;
    wire logic[47:0] grp_fu_171_p2;
    reg[47:0] mul_ln30_3_reg_545;
    reg[31:0] trunc_ln_reg_550;
    wire logic ap_CS_fsm_state13;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_done;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_idle;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_ready;
    wire logic[9:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_address0;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_ce0;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_we0;
    wire logic[31:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_d0;
    wire logic[9:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_address1;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_ce1;
    wire logic[8:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_A_address0;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_A_ce0;
    wire logic[9:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_B_address0;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_B_ce0;
    wire logic signed[31:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_temp2_out;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_temp2_out_ap_vld;
    wire logic signed[31:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_din0;
    wire logic signed[31:0] grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_din1;
    wire logic grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_ce;
    reg grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start_reg;
    wire logic ap_CS_fsm_state8;
    wire logic [9:0] zext_ln30_2_fu_313_p1;
    wire logic [8:0] mul_ln22_cast_fu_328_p1;
    reg[4:0] j_fu_86;
    wire logic[4:0] add_ln23_fu_259_p2;
    reg[4:0] i_fu_90;
    reg[9:0] indvar_flatten_fu_94;
    wire logic[9:0] add_ln22_1_fu_219_p2;
    wire logic ap_CS_fsm_state9;
    wire logic ap_CS_fsm_state14;
    reg signed[31:0] grp_fu_167_p0;
    reg signed[31:0] grp_fu_167_p1;
    wire logic signed[31:0] grp_fu_171_p1;
    wire logic signed[31:0] grp_fu_175_p1;
    wire logic signed[31:0] conv_i389_fu_183_p0;
    wire logic signed[31:0] alpha_cast_fu_187_p0;
    wire logic[0:0] icmp_ln23_fu_237_p2;
    wire logic[4:0] add_ln22_fu_231_p2;
    wire logic[5:0] tmp_1_fu_287_p3;
    wire logic[9:0] tmp_fu_280_p3;
    wire logic [5:0] zext_ln30_fu_294_p1;
    wire logic[9:0] sub_ln30_fu_298_p2;
    wire logic [4:0] zext_ln30_1_fu_304_p1;
    wire logic[9:0] add_ln30_2_fu_307_p2;
    wire logic[4:0] mul_ln22_fu_322_p0;
    wire logic [4:0] mul_ln22_fu_322_p1;
    wire logic [8:0] mul_ln22_fu_322_p2;
    wire logic[6:0] tmp_3_fu_344_p3;
    wire logic[8:0] tmp_2_fu_337_p3;
    wire logic [6:0] zext_ln27_fu_351_p1;
    wire logic[63:0] shl_ln_fu_378_p3;
    wire logic[63:0] shl_ln30_1_fu_390_p3;
    wire logic[63:0] add_ln30_fu_385_p2;
    wire logic[63:0] add_ln30_1_fu_397_p2;
    reg grp_fu_167_ce;
    reg grp_fu_179_ce;
    reg[13:0] ap_NS_fsm;
    wire logic [4:0] mul_ln22_fu_322_p00;
    initial begin
        ap_CS_fsm = 14'd1;
        grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start_reg = 1'b0;
    end
    kernel_symm_grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152 grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start),
        .ap_done(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_done),
        .ap_idle(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_idle),
        .ap_ready(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_ready),
        .select_ln22_1(select_ln22_1_reg_464),
        .zext_ln23(select_ln22_reg_458),
        .C_address0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_address0),
        .C_ce0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_ce0),
        .C_we0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_we0),
        .C_d0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_d0),
        .C_address1(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_address1),
        .C_ce1(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_ce1),
        .C_q1(C_q1),
        .add_ln27_1(add_ln27_1_reg_510),
        .A_address0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_A_address0),
        .A_ce0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_A_ce0),
        .A_q0(A_q0),
        .B_address0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_B_address0),
        .B_ce0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_B_ce0),
        .B_q0(B_q0),
        .mul_ln30(mul_ln30_reg_504),
        .temp2_out(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_temp2_out),
        .temp2_out_ap_vld(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_temp2_out_ap_vld),
        .grp_fu_167_p_din0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_din0),
        .grp_fu_167_p_din1(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_din1),
        .grp_fu_167_p_dout0(grp_fu_167_p2),
        .grp_fu_167_p_ce(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_ce)
    );
    kernel_symm_mul_32s_32s_48_2_1_U12 mul_32s_32s_48_2_1_U12 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_167_p0),
        .din1(grp_fu_167_p1),
        .dout(grp_fu_167_p2)
    );
    kernel_symm_mul_32s_32s_48_2_1_U13 mul_32s_32s_48_2_1_U13 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_temp2_out),
        .din1(grp_fu_171_p1),
        .dout(grp_fu_171_p2)
    );
    kernel_symm_mul_32s_32s_64_2_1_U14 mul_32s_32s_64_2_1_U14 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(B_load_reg_484),
        .din1(grp_fu_175_p1),
        .dout(grp_fu_175_p2)
    );
    kernel_symm_mul_64s_32s_64_5_1_U15 mul_64s_32s_64_5_1_U15 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(mul_ln30_reg_504),
        .din1(A_load_reg_499),
        .dout(grp_fu_179_p2)
    );
    kernel_symm_mul_5ns_6ns_10_1_1_U16 mul_5ns_6ns_10_1_1_U16 (
        .din0(mul_ln22_fu_322_p0),
        .din1({1'b0, mul_ln22_fu_322_p1}),
        .dout(mul_ln22_fu_322_p2)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 14'd1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state7)) begin
                grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_ready == 1'b1)) begin
                grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            i_fu_90 <= 5'b0;
        end
        else if (( (1'b1 == ap_CS_fsm_state2))) begin
            i_fu_90 <= select_ln22_1_fu_251_p3;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            indvar_flatten_fu_94 <= 10'd0;
        end
        else if (( (1'b1 == ap_CS_fsm_state2))) begin
            indvar_flatten_fu_94 <= add_ln22_1_fu_219_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            j_fu_86 <= 5'b0;
        end
        else if (( (1'b1 == ap_CS_fsm_state2))) begin
            j_fu_86 <= add_ln23_fu_259_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            A_load_reg_499 <= A_q0;
            mul_ln30_reg_504 <= grp_fu_175_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            B_load_reg_484 <= B_q0;
        end
    end
    always @(posedge ap_clk) begin begin
            C_addr_reg_474 <= zext_ln30_2_fu_313_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            C_load_reg_520 <= C_q0;
        end
    end
    always @(posedge ap_clk) begin begin
            add_ln27_1_reg_510[8:2] <= add_ln27_1_fu_355_p2[8:2];
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state1)) begin
            alpha_cast_reg_445 <= alpha_cast_fu_187_p1;
            conv_i389_reg_440 <= conv_i389_fu_183_p1;
            sext_ln22_reg_450 <= sext_ln22_fu_191_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            mul_ln30_1_reg_540 <= grp_fu_167_p2;
            mul_ln30_3_reg_545 <= grp_fu_171_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state11)) begin
            mul_ln30_2_reg_530 <= grp_fu_179_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((icmp_ln22_fu_213_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state2))) begin
            select_ln22_1_reg_464 <= select_ln22_1_fu_251_p3;
            select_ln22_reg_458 <= select_ln22_fu_243_p3;
        end
    end
    always @(posedge ap_clk) begin begin
            trunc_ln_reg_550 <= {{add_ln30_1_fu_397_p2[63:32]}};
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            A_address0 = mul_ln22_cast_fu_328_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            A_address0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_A_address0;
        end
        else begin
            A_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_A_ce0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            B_address0 = zext_ln30_2_fu_313_p1;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            B_address0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_B_address0;
        end
        else begin
            B_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_B_ce0;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state9))) begin
            C_address0 = C_addr_reg_474;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            C_address0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_address0;
        end
        else begin
            C_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state14) | (1'b1 == ap_CS_fsm_state9))) begin
            C_ce0 = 1'b1;
        end
        else begin
            C_ce0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_ce0;
        end
    end
    always @* begin begin
            C_ce1 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_ce1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state14)) begin
            C_d0 = trunc_ln_reg_550;
        end
        else if ((1'b1 == ap_CS_fsm_state8)) begin
            C_d0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_d0;
        end
        else begin
            C_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state14)) begin
            C_we0 = 1'b1;
        end
        else begin
            C_we0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_we0;
        end
    end
    always @* begin
        if (((icmp_ln22_fu_213_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
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
        if (((icmp_ln22_fu_213_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state2))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin begin
            grp_fu_167_ce = 1'b1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_fu_167_p0 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_din0;
        end
        else if ((1'b1 == ap_CS_fsm_state11)) begin
            grp_fu_167_p0 = sext_ln30_1_fu_369_p1;
        end
        else begin
            grp_fu_167_p0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state8)) begin
            grp_fu_167_p1 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_grp_fu_167_p_din1;
        end
        else if ((1'b1 == ap_CS_fsm_state11)) begin
            grp_fu_167_p1 = sext_ln22_reg_450;
        end
        else begin
            grp_fu_167_p1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin begin
            grp_fu_179_ce = 1'b1;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            14'd1: begin
                if (( (ap_start == 1'b1))) begin
                    ap_NS_fsm = 14'd2;
                end
                else begin
                    ap_NS_fsm = 14'd1;
                end
            end
            14'd2: begin
                if (((icmp_ln22_fu_213_p2 == 1'b1))) begin
                    ap_NS_fsm = 14'd1;
                end
                else begin
                    ap_NS_fsm = 14'd4;
                end
            end
            14'd4: begin
                ap_NS_fsm = 14'd8;
            end
            14'd8: begin
                ap_NS_fsm = 14'd16;
            end
            14'd16: begin
                ap_NS_fsm = 14'd32;
            end
            14'd32: begin
                ap_NS_fsm = 14'd64;
            end
            14'd64: begin
                ap_NS_fsm = 14'd128;
            end
            14'd128: begin
                if (( (grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_done == 1'b1))) begin
                    ap_NS_fsm = 14'd256;
                end
                else begin
                    ap_NS_fsm = 14'd128;
                end
            end
            14'd256: begin
                ap_NS_fsm = 14'd512;
            end
            14'd512: begin
                ap_NS_fsm = 14'd1024;
            end
            14'd1024: begin
                ap_NS_fsm = 14'd2048;
            end
            14'd2048: begin
                ap_NS_fsm = 14'd4096;
            end
            14'd4096: begin
                ap_NS_fsm = 14'd8192;
            end
            14'd8192: begin
                ap_NS_fsm = 14'd2;
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign C_address1 = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_C_address1;
    assign add_ln22_1_fu_219_p2 = (indvar_flatten_fu_94 + 10'd1);
    assign add_ln22_fu_231_p2 = (i_fu_90 + 5'b1);
    assign add_ln23_fu_259_p2 = (select_ln22_fu_243_p3 + 5'b1);
    assign add_ln27_1_fu_355_p2 = (tmp_2_fu_337_p3 + zext_ln27_fu_351_p1);
    assign add_ln30_1_fu_397_p2 = (shl_ln30_1_fu_390_p3 + add_ln30_fu_385_p2);
    assign add_ln30_2_fu_307_p2 = (sub_ln30_fu_298_p2 + zext_ln30_1_fu_304_p1);
    assign add_ln30_fu_385_p2 = (shl_ln_fu_378_p3 + mul_ln30_2_reg_530);
    assign alpha_cast_fu_187_p0 = alpha;
    assign alpha_cast_fu_187_p1 = alpha_cast_fu_187_p0;
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state10 = ap_CS_fsm[32'd9];
    assign ap_CS_fsm_state11 = ap_CS_fsm[32'd10];
    assign ap_CS_fsm_state12 = ap_CS_fsm[32'd11];
    assign ap_CS_fsm_state13 = ap_CS_fsm[32'd12];
    assign ap_CS_fsm_state14 = ap_CS_fsm[32'd13];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
    assign ap_CS_fsm_state7 = ap_CS_fsm[32'd6];
    assign ap_CS_fsm_state8 = ap_CS_fsm[32'd7];
    assign ap_CS_fsm_state9 = ap_CS_fsm[32'd8];
    assign conv_i389_fu_183_p0 = alpha;
    assign conv_i389_fu_183_p1 = conv_i389_fu_183_p0;
    assign grp_fu_171_p1 = alpha_cast_reg_445;
    assign grp_fu_175_p1 = conv_i389_reg_440;
    assign grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start = grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_ap_start_reg;
    assign icmp_ln22_fu_213_p2 = ((indvar_flatten_fu_94 == 10'd600) ? 1'b1 : 1'b0);
    assign icmp_ln23_fu_237_p2 = ((j_fu_86 == 5'b11110) ? 1'b1 : 1'b0);
    assign mul_ln22_cast_fu_328_p1 = mul_ln22_fu_322_p2;
    assign mul_ln22_fu_322_p0 = mul_ln22_fu_322_p00;
    assign mul_ln22_fu_322_p00 = select_ln22_1_reg_464;
    assign mul_ln22_fu_322_p1 = 10'd21;
    assign select_ln22_1_fu_251_p3 = ((icmp_ln23_fu_237_p2[0:0] == 1'b1) ? add_ln22_fu_231_p2 : i_fu_90);
    assign select_ln22_fu_243_p3 = ((icmp_ln23_fu_237_p2[0:0] == 1'b1) ? 5'b0 : j_fu_86);
    assign sext_ln22_fu_191_p1 = $signed(beta);
    assign sext_ln30_1_fu_369_p1 = C_load_reg_520;
    assign shl_ln30_1_fu_390_p3 = {{mul_ln30_3_reg_545}, 16'd0};
    assign shl_ln_fu_378_p3 = {{mul_ln30_1_reg_540}, 16'd0};
    assign sub_ln30_fu_298_p2 = (tmp_fu_280_p3 - zext_ln30_fu_294_p1);
    assign tmp_1_fu_287_p3 = {{select_ln22_1_reg_464}, 1'b0};
    assign tmp_2_fu_337_p3 = {{select_ln22_1_reg_464}, 4'b0};
    assign tmp_3_fu_344_p3 = {{select_ln22_1_reg_464}, 2'b0};
    assign tmp_fu_280_p3 = {{select_ln22_1_reg_464}, 5'b0};
    assign zext_ln27_fu_351_p1 = tmp_3_fu_344_p3;
    assign zext_ln30_1_fu_304_p1 = select_ln22_reg_458;
    assign zext_ln30_2_fu_313_p1 = add_ln30_2_fu_307_p2;
    assign zext_ln30_fu_294_p1 = tmp_1_fu_287_p3;
    always @(posedge ap_clk) begin
        add_ln27_1_reg_510[1:0] <= 2'b0;
    end
endmodule