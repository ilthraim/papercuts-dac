
module kernel_symm_grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152 (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    input logic[4:0] select_ln22_1,
    input logic[4:0] zext_ln23,
    output logic[9:0] C_address0,
    output reg C_ce0,
    output reg C_we0,
    output logic[31:0] C_d0,
    output logic[9:0] C_address1,
    output reg C_ce1,
    input logic[31:0] C_q1,
    input logic[8:0] add_ln27_1,
    output logic[8:0] A_address0,
    output reg A_ce0,
    input logic[31:0] A_q0,
    output logic[9:0] B_address0,
    output reg B_ce0,
    input logic[31:0] B_q0,
    input logic[63:0] mul_ln30,
    output logic[31:0] temp2_out,
    output reg temp2_out_ap_vld,
    output logic[31:0] grp_fu_167_p_din0,
    output logic[31:0] grp_fu_167_p_din1,
    input logic[47:0] grp_fu_167_p_dout0,
    output logic grp_fu_167_p_ce
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
    wire logic[0:0] icmp_ln26_fu_186_p2;
    reg ap_condition_exit_pp0_iter0_stage0;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic [4:0] zext_ln23_cast_fu_169_p1;
    reg [4:0] zext_ln23_cast_reg_343;
    reg[4:0] k_1_reg_348;
    reg[4:0] k_1_reg_348_pp0_iter1_reg;
    reg[4:0] k_1_reg_348_pp0_iter2_reg;
    reg[0:0] icmp_ln26_reg_354;
    reg[0:0] icmp_ln26_reg_354_pp0_iter1_reg;
    reg[0:0] icmp_ln26_reg_354_pp0_iter2_reg;
    reg[0:0] icmp_ln26_reg_354_pp0_iter3_reg;
    reg[0:0] icmp_ln26_reg_354_pp0_iter4_reg;
    reg[0:0] icmp_ln26_reg_354_pp0_iter5_reg;
    reg signed[31:0] A_load_reg_363;
    reg signed[31:0] A_load_reg_363_pp0_iter2_reg;
    reg signed[31:0] A_load_reg_363_pp0_iter3_reg;
    reg signed[31:0] A_load_reg_363_pp0_iter4_reg;
    reg[9:0] C_addr_reg_374;
    reg[9:0] C_addr_reg_374_pp0_iter4_reg;
    reg[9:0] C_addr_reg_374_pp0_iter5_reg;
    reg[9:0] C_addr_reg_374_pp0_iter6_reg;
    reg[31:0] B_load_reg_385;
    wire logic signed [31:0] sext_ln28_fu_257_p1;
    wire logic signed [31:0] sext_ln28_1_fu_261_p1;
    wire logic[63:0] grp_fu_165_p2;
    reg[63:0] mul_ln27_reg_400;
    reg[31:0] C_load_reg_405;
    reg[47:0] mul_ln28_reg_410;
    wire logic [8:0] zext_ln27_3_fu_208_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [9:0] zext_ln27_2_fu_251_p1;
    reg[31:0] temp2_fu_80;
    wire logic ap_loop_init;
    reg[4:0] k_fu_84;
    wire logic[4:0] add_ln26_fu_192_p2;
    reg[4:0] ap_sig_allocacmp_k_1;
    wire logic [4:0] zext_ln27_fu_198_p1;
    wire logic[8:0] add_ln27_3_fu_202_p2;
    wire logic[5:0] tmp_5_fu_229_p3;
    wire logic[9:0] tmp_4_fu_222_p3;
    wire logic [5:0] zext_ln27_1_fu_236_p1;
    wire logic[9:0] sub_ln27_fu_240_p2;
    wire logic[9:0] add_ln27_2_fu_246_p2;
    wire logic[63:0] shl_ln1_fu_268_p3;
    wire logic[63:0] add_ln27_fu_275_p2;
    wire logic[47:0] shl_ln2_fu_291_p3;
    wire logic[47:0] add_ln28_fu_299_p2;
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
    kernel_symm_grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_mul_64s_32s_64_5_1_U2 mul_64s_32s_64_5_1_U2 (
        .clk(ap_clk),
        .ce(1'b1),
        .reset(ap_rst),
        .din0(mul_ln30),
        .din1(A_load_reg_363),
        .dout(grp_fu_165_p2)
    );
    kernel_symm_grp_kernel_symm_Pipeline_VITIS_LOOP_26_3_fu_152_flow_control_loop_pipe_sequential_init_U flow_control_loop_pipe_sequential_init_U (
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
            if (((icmp_ln26_fu_186_p2 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
                k_fu_84 <= add_ln26_fu_192_p2;
            end
            else if ((ap_loop_init == 1'b1)) begin
                k_fu_84 <= 5'b0;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((1'b1 == 1'b1) & (ap_loop_init == 1'b1))) begin
                temp2_fu_80 <= 32'd0;
            end
            else if ((ap_enable_reg_pp0_iter7 == 1'b1)) begin
                temp2_fu_80 <= {{add_ln28_fu_299_p2[47:16]}};
            end
        end
    end
    always @(posedge ap_clk) begin begin
            A_load_reg_363 <= A_q0;
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
            ap_loop_exit_ready_pp0_iter2_reg <= ap_loop_exit_ready_pp0_iter1_reg;
            icmp_ln26_reg_354 <= icmp_ln26_fu_186_p2;
            icmp_ln26_reg_354_pp0_iter1_reg <= 1'b1;
            k_1_reg_348 <= ap_sig_allocacmp_k_1;
            k_1_reg_348_pp0_iter1_reg <= k_1_reg_348;
            zext_ln23_cast_reg_343[4:0] <= zext_ln23_cast_fu_169_p1[4:0];
        end
    end
    always @(posedge ap_clk) begin begin
            A_load_reg_363_pp0_iter2_reg <= A_load_reg_363;
            A_load_reg_363_pp0_iter3_reg <= A_load_reg_363_pp0_iter2_reg;
            A_load_reg_363_pp0_iter4_reg <= A_load_reg_363_pp0_iter3_reg;
            B_load_reg_385 <= B_q0;
            C_addr_reg_374 <= zext_ln27_2_fu_251_p1;
            C_addr_reg_374_pp0_iter4_reg <= C_addr_reg_374;
            C_addr_reg_374_pp0_iter5_reg <= C_addr_reg_374_pp0_iter4_reg;
            C_addr_reg_374_pp0_iter6_reg <= C_addr_reg_374_pp0_iter5_reg;
            ap_loop_exit_ready_pp0_iter3_reg <= ap_loop_exit_ready_pp0_iter2_reg;
            ap_loop_exit_ready_pp0_iter4_reg <= ap_loop_exit_ready_pp0_iter3_reg;
            ap_loop_exit_ready_pp0_iter5_reg <= ap_loop_exit_ready_pp0_iter4_reg;
            ap_loop_exit_ready_pp0_iter6_reg <= ap_loop_exit_ready_pp0_iter5_reg;
            icmp_ln26_reg_354_pp0_iter2_reg <= 1'b1;
            icmp_ln26_reg_354_pp0_iter3_reg <= 1'b1;
            icmp_ln26_reg_354_pp0_iter4_reg <= 1'b1;
            icmp_ln26_reg_354_pp0_iter5_reg <= 1'b1;
            k_1_reg_348_pp0_iter2_reg <= k_1_reg_348_pp0_iter1_reg;
            mul_ln27_reg_400 <= grp_fu_165_p2;
            mul_ln28_reg_410 <= grp_fu_167_p_dout0;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b1))) begin
            C_load_reg_405 <= C_q1;
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
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b1))) begin
            B_ce0 = 1'b1;
        end
        else begin
            B_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
            C_ce0 = 1'b1;
        end
        else begin
            C_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b1))) begin
            C_ce1 = 1'b1;
        end
        else begin
            C_ce1 = 1'b0;
        end
    end
    always @* begin
        if (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1))) begin
            C_we0 = 1'b1;
        end
        else begin
            C_we0 = 1'b0;
        end
    end
    always @* begin
        if (((((icmp_ln26_fu_186_p2 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == 1'b1))) begin
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
        if ((((1'b0 == 1'b0) & (1'b1 == 1'b1)) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_k_1 = 5'b0;
        end
        else begin
            ap_sig_allocacmp_k_1 = k_fu_84;
        end
    end
    always @* begin begin
            temp2_out_ap_vld = 1'b0;
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
    assign A_address0 = zext_ln27_3_fu_208_p1;
    assign B_address0 = zext_ln27_2_fu_251_p1;
    assign C_address0 = C_addr_reg_374_pp0_iter6_reg;
    assign C_address1 = C_addr_reg_374_pp0_iter4_reg;
    assign C_d0 = {{add_ln27_fu_275_p2[63:32]}};
    assign add_ln26_fu_192_p2 = (ap_sig_allocacmp_k_1 + 5'b1);
    assign add_ln27_2_fu_246_p2 = (sub_ln27_fu_240_p2 + zext_ln23_cast_reg_343);
    assign add_ln27_3_fu_202_p2 = (add_ln27_1 + zext_ln27_fu_198_p1);
    assign add_ln27_fu_275_p2 = (shl_ln1_fu_268_p3 + mul_ln27_reg_400);
    assign add_ln28_fu_299_p2 = (shl_ln2_fu_291_p3 + mul_ln28_reg_410);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_enable_reg_pp0_iter0 = ap_start_int;
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage0;
    assign grp_fu_167_p_ce = 1'b1;
    assign grp_fu_167_p_din0 = sext_ln28_fu_257_p1;
    assign grp_fu_167_p_din1 = sext_ln28_1_fu_261_p1;
    assign icmp_ln26_fu_186_p2 = ((ap_sig_allocacmp_k_1 == select_ln22_1) ? 1'b1 : 1'b0);
    assign sext_ln28_1_fu_261_p1 = A_load_reg_363_pp0_iter4_reg;
    assign sext_ln28_fu_257_p1 = $signed(B_load_reg_385);
    assign shl_ln1_fu_268_p3 = {{C_load_reg_405}, 32'd0};
    assign shl_ln2_fu_291_p3 = {{temp2_fu_80}, 16'd0};
    assign sub_ln27_fu_240_p2 = (tmp_4_fu_222_p3 - zext_ln27_1_fu_236_p1);
    assign temp2_out = temp2_fu_80;
    assign tmp_4_fu_222_p3 = {{k_1_reg_348_pp0_iter2_reg}, 5'b0};
    assign tmp_5_fu_229_p3 = {{k_1_reg_348_pp0_iter2_reg}, 1'b0};
    assign zext_ln23_cast_fu_169_p1 = zext_ln23;
    assign zext_ln27_1_fu_236_p1 = tmp_5_fu_229_p3;
    assign zext_ln27_2_fu_251_p1 = add_ln27_2_fu_246_p2;
    assign zext_ln27_3_fu_208_p1 = add_ln27_3_fu_202_p2;
    assign zext_ln27_fu_198_p1 = ap_sig_allocacmp_k_1;
    always @(posedge ap_clk) begin
        begin end
    end
endmodule