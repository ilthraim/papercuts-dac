module kernel_gemm (
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
    output reg[12:0] C_address1,
    output reg C_ce1,
    input logic[31:0] C_q1,
    output logic[12:0] A_address0,
    output logic A_ce0,
    input logic[31:0] A_q0,
    output logic[12:0] B_address0,
    output logic B_ce0,
    input logic[31:0] B_q0
);
    reg[4:0] ap_CS_fsm;
    wire logic ap_CS_fsm_state1;
    reg[12:0] phi_mul_load_reg_199;
    wire logic ap_CS_fsm_state2;
    reg[5:0] i_1_reg_205;
    wire logic[12:0] empty_fu_168_p2;
    reg[12:0] empty_reg_214;
    wire logic ap_CS_fsm_state4;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_done;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_idle;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_ready;
    wire logic[12:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_ce0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_we0;
    wire logic[31:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_d0;
    wire logic[12:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_address1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_ce1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_done;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_idle;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_ready;
    wire logic[12:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_A_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_A_ce0;
    wire logic[12:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_ce0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_we0;
    wire logic[31:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_d0;
    wire logic[12:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_address1;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_ce1;
    wire logic[12:0] grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_B_address0;
    wire logic grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_B_ce0;
    reg grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start_reg;
    wire logic[0:0] icmp_ln22_fu_124_p2;
    wire logic ap_CS_fsm_state3;
    reg grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start_reg;
    wire logic ap_CS_fsm_state5;
    reg[12:0] phi_mul_fu_60;
    wire logic[12:0] add_ln22_1_fu_118_p2;
    reg[5:0] i_fu_64;
    wire logic[5:0] add_ln22_fu_130_p2;
    wire logic[11:0] tmp_fu_146_p3;
    wire logic[9:0] tmp_1_fu_157_p3;
    wire logic [11:0] tmp_cast_fu_153_p1;
    wire logic [9:0] tmp_1_cast_fu_164_p1;
    reg[4:0] ap_NS_fsm;
    initial begin
        ap_CS_fsm = 5'b1;
        grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start_reg = 1'b0;
        grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start_reg = 1'b0;
    end
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80 grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start),
        .ap_done(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_done),
        .ap_idle(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_idle),
        .ap_ready(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_ready),
        .phi_mul(phi_mul_load_reg_199),
        .C_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_address0),
        .C_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_ce0),
        .C_we0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_we0),
        .C_d0(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_d0),
        .C_address1(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_address1),
        .C_ce1(grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_ce1),
        .C_q1(C_q1),
        .beta_cast(beta)
    );
    kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88 grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88 (
        .ap_clk(ap_clk),
        .ap_rst(ap_rst),
        .ap_start(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start),
        .ap_done(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_done),
        .ap_idle(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_idle),
        .ap_ready(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_ready),
        .empty(empty_reg_214),
        .A_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_A_address0),
        .A_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_A_ce0),
        .A_q0(A_q0),
        .conv_i70(alpha),
        .phi_mul(phi_mul_load_reg_199),
        .C_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_address0),
        .C_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_ce0),
        .C_we0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_we0),
        .C_d0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_d0),
        .C_address1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_address1),
        .C_ce1(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_ce1),
        .C_q1(C_q1),
        .B_address0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_B_address0),
        .B_ce0(grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_B_ce0),
        .B_q0(B_q0)
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
            grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start_reg <= 1'b0;
        end
        else begin
            if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln22_fu_124_p2 == 1'b0))) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_ready == 1'b1)) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_rst == 1'b1)) begin
            grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start_reg <= 1'b0;
        end
        else begin
            if ((1'b1 == ap_CS_fsm_state4)) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start_reg <= 1'b1;
            end
            else if ((grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_ready == 1'b1)) begin
                grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start_reg <= 1'b0;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            i_fu_64 <= 6'b0;
        end
        else if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln22_fu_124_p2 == 1'b0))) begin
            i_fu_64 <= add_ln22_fu_130_p2;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b1 == ap_CS_fsm_state1))) begin
            phi_mul_fu_60 <= 13'd0;
        end
        else if (((1'b1 == ap_CS_fsm_state2))) begin
            phi_mul_fu_60 <= add_ln22_1_fu_118_p2;
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state4)) begin
            empty_reg_214[12:4] <= empty_fu_168_p2[12:4];
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_CS_fsm_state2)) begin
            i_1_reg_205 <= i_fu_64;
            phi_mul_load_reg_199 <= phi_mul_fu_60;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_address0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_address0;
        end
        else begin
            C_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_address1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_address1;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_address1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_address1;
        end
        else begin
            C_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_ce0;
        end
        else begin
            C_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_ce0;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_ce1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_ce1;
        end
        else begin
            C_ce1 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_ce1;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_d0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_d0;
        end
        else if ((1'b1 == ap_CS_fsm_state3)) begin
            C_d0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_d0;
        end
        else begin
            C_d0 = 32'dx;
        end
    end
    always @* begin
        if ((1'b1 == ap_CS_fsm_state5)) begin
            C_we0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_C_we0;
        end
        else begin
            C_we0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_C_we0;
        end
    end
    always @* begin
        if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln22_fu_124_p2 == 1'b1))) begin
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
        if (((1'b1 == ap_CS_fsm_state2) & (icmp_ln22_fu_124_p2 == 1'b1))) begin
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
                if (( (icmp_ln22_fu_124_p2 == 1'b1))) begin
                    ap_NS_fsm = 5'b1;
                end
                else begin
                    ap_NS_fsm = 5'b100;
                end
            end
            5'b100: begin
                if (((grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_done == 1'b1))) begin
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
                if (((grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_done == 1'b1))) begin
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
    assign A_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_A_address0;
    assign A_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_A_ce0;
    assign B_address0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_B_address0;
    assign B_ce0 = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_B_ce0;
    assign add_ln22_1_fu_118_p2 = (phi_mul_fu_60 + 13'd70);
    assign add_ln22_fu_130_p2 = (i_fu_64 + 6'b1);
    assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_state2 = ap_CS_fsm[32'd1];
    assign ap_CS_fsm_state3 = ap_CS_fsm[32'd2];
    assign ap_CS_fsm_state4 = ap_CS_fsm[32'd3];
    assign ap_CS_fsm_state5 = ap_CS_fsm[32'd4];
    assign empty_fu_168_p2 = (tmp_cast_fu_153_p1 + tmp_1_cast_fu_164_p1);
    assign grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start = grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_80_ap_start_reg;
    assign grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start = grp_kernel_gemm_Pipeline_VITIS_LOOP_25_3_VITIS_LOOP_26_4_fu_88_ap_start_reg;
    assign icmp_ln22_fu_124_p2 = ((i_fu_64 == 6'b111100) ? 1'b1 : 1'b0);
    assign tmp_1_cast_fu_164_p1 = tmp_1_fu_157_p3;
    assign tmp_1_fu_157_p3 = {{i_1_reg_205}, 4'b0};
    assign tmp_cast_fu_153_p1 = tmp_fu_146_p3;
    assign tmp_fu_146_p3 = {{i_1_reg_205}, 6'b0};
    always @(posedge ap_clk) begin
        empty_reg_214[3:0] <= 4'b0;
    end
endmodule