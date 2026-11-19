module kernel_atax (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output reg ap_done,
    output reg ap_idle,
    output reg ap_ready,
    output reg[13:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output logic[6:0] x_address0,
    output logic x_ce0,
    input logic[31:0] x_q0,
    output reg[6:0] y_address0,
    output reg y_ce0,
    output reg y_we0,
    output reg[31:0] y_d0,
    output logic[6:0] y_address1,
    output reg y_ce1,
    input logic[31:0] y_q1,
    output logic[6:0] tmp_address0,
    output reg tmp_ce0,
    output reg tmp_we0,
    output logic[31:0] tmp_d0
);
    reg[5:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    reg[6:0] i_reg_177;
    wire logic ap_CS_fsm_state3;
    wire logic[13:0] sub_ln27_fu_143_p2;
    reg[13:0] sub_ln27_reg_185;
    wire logic[0:0] icmp_ln23_fu_111_p2;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_done;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_idle;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_ready;
    wire logic[6:0] grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_address0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_ce0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_we0;
    wire logic [0:0] grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_d0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_done;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_idle;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_ready;
    wire logic[13:0] grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_A_address0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_A_ce0;
    wire logic[6:0] grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_x_address0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_x_ce0;
    wire logic[31:0] grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_p_out;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_p_out_ap_vld;
    wire logic signed[31:0] grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_din0;
    wire logic signed[31:0] grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_din1;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_ce;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_done;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_idle;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_ready;
    wire logic[13:0] grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_A_address0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_A_ce0;
    wire logic[6:0] grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_address0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_ce0;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_we0;
    wire logic[31:0] grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_d0;
    wire logic[6:0] grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_address1;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_ce1;
    wire logic signed[31:0] grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_din0;
    wire logic signed[31:0] grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_din1;
    wire logic grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_ce;
    reg grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start_reg;
    wire logic ap_CS_fsm_state2;
    reg grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start_reg;
    wire logic ap_CS_fsm_state4;
    reg grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start_reg;
    wire logic ap_CS_fsm_state5;
    wire logic ap_CS_fsm_state6;
    wire logic [6:0] zext_ln23_fu_155_p1;
    reg[6:0] i_1_fu_56;
    wire logic[6:0] add_ln23_fu_117_p2;
    wire logic[8:0] tmp_2_fu_131_p3;
    wire logic[13:0] tmp_1_fu_123_p3;
    wire logic [8:0] zext_ln27_fu_139_p1;
    wire logic[47:0] grp_fu_194_p2;
    reg signed[31:0] grp_fu_194_p0;
    reg signed[31:0] grp_fu_194_p1;
    reg grp_fu_194_ce;
    reg[5:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 6'b1;
        grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start_reg = 1'b0;
        grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start_reg = 1'b0;
        grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start_reg = 1'b0;
    end
    kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77 grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start),
        .ap_done(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_done),
        .ap_idle(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_idle),
        .ap_ready(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_ready),
        .y_address0(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_address0),
        .y_ce0(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_ce0),
        .y_we0(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_we0),
        .y_d0(grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_d0)
    );
    kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83 grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start),
        .ap_done(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_done),
        .ap_idle(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_idle),
        .ap_ready(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_ready),
        .sub_ln27(sub_ln27_reg_185),
        .A_address0(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_A_address0),
        .A_ce0(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_A_ce0),
        .A_q0(A_q0),
        .x_address0(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_x_address0),
        .x_ce0(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_x_ce0),
        .x_q0(x_q0),
        .p_out(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_p_out),
        .p_out_ap_vld(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_p_out_ap_vld),
        .grp_fu_194_p_din0(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_din0),
        .grp_fu_194_p_din1(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_din1),
        .grp_fu_194_p_dout0(grp_fu_194_p2),
        .grp_fu_194_p_ce(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_ce)
    );
    kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93 grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start),
        .ap_done(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_done),
        .ap_idle(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_idle),
        .ap_ready(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_ready),
        .sub_ln27(sub_ln27_reg_185),
        .A_address0(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_A_address0),
        .A_ce0(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_A_ce0),
        .A_q0(A_q0),
        .sext_ln28(grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_p_out),
        .y_address0(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_address0),
        .y_ce0(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_ce0),
        .y_we0(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_we0),
        .y_d0(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_d0),
        .y_address1(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_address1),
        .y_ce1(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_ce1),
        .y_q1(y_q1),
        .grp_fu_194_p_din0(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_din0),
        .grp_fu_194_p_din1(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_din1),
        .grp_fu_194_p_dout0(grp_fu_194_p2),
        .grp_fu_194_p_ce(grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_ce)
    );
    kernel_atax_mul_32s_32s_48_2_1_U12 mul_32s_32s_48_2_1_U12 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(grp_fu_194_p0),
        .din1(grp_fu_194_p1),
        .dout(grp_fu_194_p2)
    );
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            ap_CS_fsm <= 6'b1;
        end
        else begin
            ap_CS_fsm <= ap_NS_fsm;
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start_reg <= 1'b0;
        end
        else begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_ready == 1'b1)) begin
                grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start_reg <= 1'b0;
        end
        else begin
            if (((icmp_ln23_fu_111_p2 == 1'b0) & (1'b1 == ap_CS_fsm_state3))) begin
                grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_ready == 1'b1)) begin
                grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state5)) begin
                grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_ready == 1'b1)) begin
                grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            i_1_fu_56 <= 7'b0;
        end
        else if (( (1'b1 == ap_CS_fsm_state3))) begin
            i_1_fu_56 <= add_ln23_fu_117_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state3)) begin
            i_reg_177 <= i_1_fu_56;
        end
    end
    always @(posedge ap_clk) begin
        if (( (1'b1 == ap_CS_fsm_state3))) begin
            sub_ln27_reg_185[13:2] <= sub_ln27_fu_143_p2[13:2];
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            A_address0 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_A_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            A_address0 = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_A_address0;
        end
        else begin
            A_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            A_ce0 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_A_ce0;
        end
        else begin
            A_ce0 = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_A_ce0;
        end
    end
    always @* begin
        if (((icmp_ln23_fu_111_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
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
        if (((icmp_ln23_fu_111_p2 == 1'b1) & (1'b1 == ap_CS_fsm_state3))) begin
            ap_ready = 1'b1;
        end
        else begin
            ap_ready = 1'b0;
        end
    end
    always @* begin begin
            grp_fu_194_ce = 1'b1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_fu_194_p0 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_din0;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_fu_194_p0 = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_din0;
        end
        else begin
            grp_fu_194_p0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            grp_fu_194_p1 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_grp_fu_194_p_din1;
        end
        else if ((1'b1 == ap_CS_fsm_state4)) begin
            grp_fu_194_p1 = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_grp_fu_194_p_din1;
        end
        else begin
            grp_fu_194_p1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            tmp_ce0 = 1'b1;
        end
        else begin
            tmp_ce0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            tmp_we0 = 1'b1;
        end
        else begin
            tmp_we0 = 1'b0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            y_address0 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            y_address0 = grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_address0;
        end
        else begin
            y_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            y_ce0 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_ce0;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            y_ce0 = 1'b1;
        end
        else begin
            y_ce0 = 1'b0;
        end
    end
    always @* begin begin
            y_ce1 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_ce1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            y_d0 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_d0;
        end
        else if ((1'b1 == ap_CS_fsm_state2)) begin
            y_d0 = grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_d0;
        end
        else begin
            y_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state6)) begin
            y_we0 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_we0;
        end
        else begin
            y_we0 = grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_y_we0;
        end
    end
    always @* begin
        case (ap_CS_fsm)
            6'b1: begin
                if (( (ap_start == 1'b1))) begin
                    ap_NS_fsm = 6'b10;
                end
                else begin
                    ap_NS_fsm = 6'b1;
                end
            end
            6'b10: begin
                if (((grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_done == 1'b1))) begin
                    ap_NS_fsm = 6'b100;
                end
                else begin
                    ap_NS_fsm = 6'b10;
                end
            end
            6'b100: begin
                if (((icmp_ln23_fu_111_p2 == 1'b1))) begin
                    ap_NS_fsm = 6'b1;
                end
                else begin
                    ap_NS_fsm = 6'b1000;
                end
            end
            6'b1000: begin
                if (((grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_done == 1'b1))) begin
                    ap_NS_fsm = 6'b10000;
                end
                else begin
                    ap_NS_fsm = 6'b1000;
                end
            end
            6'b10000: begin
                ap_NS_fsm = 6'b100000;
            end
            6'b100000: begin
                if (( (grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_done == 1'b1))) begin
                    ap_NS_fsm = 6'b100;
                end
                else begin
                    ap_NS_fsm = 6'b100000;
                end
            end
            default: begin
                ap_NS_fsm = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    assign add_ln23_fu_117_p2 = (i_1_fu_56 + 7'b1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign ap_CS_fsm_state6 = ap_CS_fsm[32'd5];
    assign grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start = grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_ap_start_reg;
    assign grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_ap_start_reg;
    assign grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_ap_start_reg;
    assign icmp_ln23_fu_111_p2 = ((i_1_fu_56 == 7'b1110100) ? 1'b1 : 1'b0);
    assign sub_ln27_fu_143_p2 = (tmp_1_fu_123_p3 - zext_ln27_fu_139_p1);
    assign tmp_1_fu_123_p3 = {{i_1_fu_56}, 7'b0};
    assign tmp_2_fu_131_p3 = {{i_1_fu_56}, 2'b0};
    assign tmp_address0 = zext_ln23_fu_155_p1;
    assign tmp_d0 = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_p_out;
    assign x_address0 = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_x_address0;
    assign x_ce0 = grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_x_ce0;
    assign y_address1 = grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_y_address1;
    assign zext_ln23_fu_155_p1 = i_reg_177;
    assign zext_ln27_fu_139_p1 = tmp_2_fu_131_p3;
    always @(posedge ap_clk) begin
        sub_ln27_reg_185[1:0] <= 2'b0;
    end
endmodule

module kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output logic[6:0] y_address0,
    output reg y_ce0,
    output reg y_we0,
    output logic[31:0] y_d0
);
    reg[0:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    wire logic[0:0] icmp_ln21_fu_60_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic [6:0] i_cast_fu_72_p1;
    reg[6:0] i_fu_34;
    wire logic[6:0] add_ln21_fu_66_p2;
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
    kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
                i_fu_34 <= add_ln21_fu_66_p2;
            end
        end
    end
    always @* begin
        if ((( (icmp_ln21_fu_60_p2 == 1'b1)) & (1'b1 == 1'b1))) begin
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
            y_ce0 = 1'b1;
        end
    end
    always @* begin
        if ((((ap_start_int == 1'b1) & (icmp_ln21_fu_60_p2 == 1'b0)) & (1'b1 == 1'b1))) begin
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
    assign add_ln21_fu_66_p2 = (ap_sig_allocacmp_i_1 + 7'b1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign i_cast_fu_72_p1 = ap_sig_allocacmp_i_1;
    assign icmp_ln21_fu_60_p2 = ((ap_sig_allocacmp_i_1 == 7'b1111100) ? 1'b1 : 1'b0);
    assign y_address0 = i_cast_fu_72_p1;
    assign y_d0 = 32'd0;
endmodule
module kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_21_1_fu_77_flow_control_loop_pipe_sequential_init_U (
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


module kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[13:0] sub_ln27,
    output logic[13:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output logic[6:0] x_address0,
    output reg x_ce0,
    input logic[31:0] x_q0,
    output logic[31:0] p_out,
    output reg p_out_ap_vld,
    output logic[31:0] grp_fu_194_p_din0,
    output logic[31:0] grp_fu_194_p_din1,
    input logic[47:0] grp_fu_194_p_dout0,
    output logic grp_fu_194_p_ce
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
    wire logic[0:0] icmp_ln26_fu_118_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    reg[0:0] icmp_ln26_reg_213;
    reg[0:0] icmp_ln26_reg_213_pp0_iter1_reg;
    reg[0:0] icmp_ln26_reg_213_pp0_iter2_reg;
    reg[31:0] A_load_reg_227;
    reg[31:0] x_load_reg_232;
    wire logic signed [31:0] sext_ln27_fu_155_p1;
    wire logic signed [31:0] sext_ln27_1_fu_159_p1;
    reg[47:0] mul_ln27_reg_247;
    wire logic [13:0] zext_ln27_1_fu_145_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [6:0] j_cast_fu_130_p1;
    reg[31:0] empty_fu_54;
    wire logic ap_loop_init;
    reg[6:0] j_fu_58;
    wire logic[6:0] add_ln26_fu_124_p2;
    reg[6:0] ap_sig_allocacmp_j_2;
    wire logic [6:0] zext_ln27_fu_135_p1;
    wire logic[13:0] add_ln27_1_fu_139_p2;
    wire logic[47:0] shl_ln_fu_166_p3;
    wire logic[47:0] add_ln27_fu_174_p2;
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
    kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
            if (((1'b1 == 1'b1) & (ap_loop_init == 1'b1))) begin
                empty_fu_54 <= 32'd0;
            end
            else if ((ap_enable_reg_pp0_iter4 == 1'b1)) begin
                empty_fu_54 <= {{add_ln27_fu_174_p2[47:16]}};
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((icmp_ln26_fu_118_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_58 <= add_ln26_fu_124_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            A_load_reg_227 <= A_q0;
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            icmp_ln26_reg_213 <= icmp_ln26_fu_118_p2;
            icmp_ln26_reg_213_pp0_iter1_reg <= 1'b1;
            x_load_reg_232 <= x_q0;
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            icmp_ln26_reg_213_pp0_iter2_reg <= 1'b1;
            mul_ln27_reg_247 <= grp_fu_194_p_dout0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln26_fu_118_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
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
            ap_sig_allocacmp_j_2 = 7'b0;
        end
        else begin
            ap_sig_allocacmp_j_2 = j_fu_58;
        end
    end
    always @* begin begin
            p_out_ap_vld = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            x_ce0 = 1'b1;
        end
        else begin
            x_ce0 = 1'b0;
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
    assign A_address0 = zext_ln27_1_fu_145_p1;
    assign add_ln26_fu_124_p2 = (ap_sig_allocacmp_j_2 + 7'b1);
    assign add_ln27_1_fu_139_p2 = (sub_ln27 + zext_ln27_fu_135_p1);
    assign add_ln27_fu_174_p2 = (shl_ln_fu_166_p3 + mul_ln27_reg_247);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign grp_fu_194_p_ce = 1'b1;
    assign grp_fu_194_p_din0 = sext_ln27_1_fu_159_p1;
    assign grp_fu_194_p_din1 = sext_ln27_fu_155_p1;
    assign icmp_ln26_fu_118_p2 = ((ap_sig_allocacmp_j_2 == 7'b1111100) ? 1'b1 : 1'b0);
    assign j_cast_fu_130_p1 = ap_sig_allocacmp_j_2;
    assign p_out = empty_fu_54;
    assign sext_ln27_1_fu_159_p1 = $signed(x_load_reg_232);
    assign sext_ln27_fu_155_p1 = $signed(A_load_reg_227);
    assign shl_ln_fu_166_p3 = {{empty_fu_54}, 16'd0};
    assign x_address0 = j_cast_fu_130_p1;
    assign zext_ln27_1_fu_145_p1 = add_ln27_1_fu_139_p2;
    assign zext_ln27_fu_135_p1 = ap_sig_allocacmp_j_2;
endmodule
module kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_26_3_fu_83_flow_control_loop_pipe_sequential_init_U (
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


module kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[13:0] sub_ln27,
    output logic[13:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    input logic[31:0] sext_ln28,
    output logic[6:0] y_address0,
    output reg y_ce0,
    output reg y_we0,
    output logic[31:0] y_d0,
    output logic[6:0] y_address1,
    output reg y_ce1,
    input logic[31:0] y_q1,
    output logic[31:0] grp_fu_194_p_din0,
    output logic[31:0] grp_fu_194_p_din1,
    input logic[47:0] grp_fu_194_p_dout0,
    output logic grp_fu_194_p_ce
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
    wire logic[0:0] icmp_ln28_fu_116_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic signed [31:0] sext_ln28_cast_fu_104_p1;
    reg signed [31:0] sext_ln28_cast_reg_186;
    wire logic ap_block_pp0_stage0_11001;
    reg[6:0] j_1_reg_191;
    reg[6:0] j_1_reg_191_pp0_iter1_reg;
    reg[31:0] A_load_reg_205;
    wire logic signed [31:0] sext_ln29_fu_152_p1;
    reg[6:0] y_addr_reg_215;
    reg[6:0] y_addr_reg_215_pp0_iter3_reg;
    reg[47:0] mul_ln29_reg_221;
    reg[31:0] y_load_reg_226;
    wire logic [13:0] zext_ln29_1_fu_138_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [6:0] j_1_cast_fu_148_p1;
    reg[6:0] j_fu_54;
    wire logic[6:0] add_ln28_fu_122_p2;
    wire logic ap_loop_init;
    reg[6:0] ap_sig_allocacmp_j_1;
    wire logic [6:0] zext_ln29_fu_128_p1;
    wire logic[13:0] add_ln29_1_fu_132_p2;
    wire logic[47:0] shl_ln1_fu_156_p3;
    wire logic[47:0] add_ln29_fu_163_p2;
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
    kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
            if (((icmp_ln28_fu_116_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                j_fu_54 <= add_ln28_fu_122_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin begin
            A_load_reg_205 <= A_q0;
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            j_1_reg_191 <= ap_sig_allocacmp_j_1;
            j_1_reg_191_pp0_iter1_reg <= j_1_reg_191;
            sext_ln28_cast_reg_186 <= sext_ln28_cast_fu_104_p1;
        end
    end
    always @(posedge ap_clk) begin begin
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            mul_ln29_reg_221 <= grp_fu_194_p_dout0;
            y_addr_reg_215 <= j_1_cast_fu_148_p1;
            y_addr_reg_215_pp0_iter3_reg <= y_addr_reg_215;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            y_load_reg_226 <= y_q1;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
            A_ce0 = 1'b1;
        end
        else begin
            A_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln28_fu_116_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
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
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
            y_ce0 = 1'b1;
        end
        else begin
            y_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1))) begin
            y_ce1 = 1'b1;
        end
        else begin
            y_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b1))) begin
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
    assign A_address0 = zext_ln29_1_fu_138_p1;
    assign add_ln28_fu_122_p2 = (ap_sig_allocacmp_j_1 + 7'b1);
    assign add_ln29_1_fu_132_p2 = (sub_ln27 + zext_ln29_fu_128_p1);
    assign add_ln29_fu_163_p2 = (shl_ln1_fu_156_p3 + mul_ln29_reg_221);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign grp_fu_194_p_ce = 1'b1;
    assign grp_fu_194_p_din0 = sext_ln29_fu_152_p1;
    assign grp_fu_194_p_din1 = sext_ln28_cast_reg_186;
    assign icmp_ln28_fu_116_p2 = ((ap_sig_allocacmp_j_1 == 7'b1111100) ? 1'b1 : 1'b0);
    assign j_1_cast_fu_148_p1 = j_1_reg_191_pp0_iter1_reg;
    assign sext_ln28_cast_fu_104_p1 = $signed(sext_ln28);
    assign sext_ln29_fu_152_p1 = $signed(A_load_reg_205);
    assign shl_ln1_fu_156_p3 = {{y_load_reg_226}, 16'd0};
    assign y_address0 = y_addr_reg_215_pp0_iter3_reg;
    assign y_address1 = j_1_cast_fu_148_p1;
    assign y_d0 = {{add_ln29_fu_163_p2[47:16]}};
    assign zext_ln29_1_fu_138_p1 = add_ln29_1_fu_132_p2;
    assign zext_ln29_fu_128_p1 = ap_sig_allocacmp_j_1;
endmodule
module kernel_atax_grp_kernel_atax_Pipeline_VITIS_LOOP_28_4_fu_93_flow_control_loop_pipe_sequential_init_U (
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

module kernel_atax_mul_32s_32s_48_2_1_U12 (
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
