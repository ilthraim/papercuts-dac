module kernel_floyd_warshall (
    input logic ap_clk,
    input logic ap_rst,
    input logic ap_start,
    output logic ap_done,
    output reg ap_idle,
    output logic ap_ready,
    output reg[17:0] path_address0,
    output reg path_ce0,
    output reg path_we0,
    output logic[31:0] path_d0,
    input logic[31:0] path_q0,
    output reg[17:0] path_address1,
    output reg path_ce1,
    input logic[31:0] path_q1
);
    reg[1:0] ap_CS_fsm;
    wire logic ap_CS_fsm_pp0_stage0;
    reg ap_enable_reg_pp0_iter0;
    reg ap_enable_reg_pp0_iter1;
    reg ap_enable_reg_pp0_iter2;
    reg ap_idle_pp0;
    wire logic ap_CS_fsm_pp0_stage1;
    wire logic ap_block_pp0_stage1_subdone;
    reg[0:0] icmp_ln16_reg_439;
    reg ap_condition_exit_pp0_iter0_stage1;
    wire logic ap_loop_exit_ready;
    reg ap_ready_int;
    wire logic ap_block_pp0_stage0_11001;
    wire logic[0:0] icmp_ln16_fu_161_p2;
    reg[8:0] j_load_reg_443;
    reg[17:0] indvar_flatten_load_reg_448;
    wire logic[0:0] icmp_ln18_fu_191_p2;
    reg[0:0] icmp_ln18_reg_453;
    wire logic[8:0] select_ln16_fu_197_p3;
    reg[8:0] select_ln16_reg_460;
    wire logic [8:0] zext_ln20_fu_213_p1;
    reg [8:0] zext_ln20_reg_465;
    wire logic[0:0] icmp_ln19_fu_217_p2;
    reg[0:0] icmp_ln19_reg_471;
    wire logic[8:0] add_ln18_fu_223_p2;
    reg[8:0] add_ln18_reg_476;
    wire logic[8:0] select_ln18_fu_254_p3;
    reg[8:0] select_ln18_reg_481;
    wire logic ap_block_pp0_stage1_11001;
    wire logic[17:0] mul_ln20_1_fu_271_p2;
    reg[17:0] mul_ln20_1_reg_486;
    wire logic [8:0] zext_ln20_3_fu_319_p1;
    reg[17:0] path_addr_1_reg_502;
    reg[17:0] path_addr_1_reg_502_pp0_iter2_reg;
    wire logic[0:0] addr_cmp_fu_335_p2;
    reg[0:0] addr_cmp_reg_508;
    reg[31:0] path_load_reg_518;
    reg[31:0] path_load_1_reg_524;
    wire logic[31:0] add_ln20_fu_359_p2;
    reg[31:0] add_ln20_reg_529;
    reg ap_enable_reg_pp0_iter0_reg;
    wire logic [17:0] zext_ln20_2_fu_314_p1;
    wire logic ap_block_pp0_stage0;
    wire logic [17:0] zext_ln20_4_fu_327_p1;
    wire logic [17:0] zext_ln20_5_fu_346_p1;
    wire logic ap_block_pp0_stage1;
    reg[63:0] reuse_addr_reg_fu_62;
    wire logic ap_loop_init;
    reg[31:0] reuse_reg_fu_66;
    wire logic[31:0] select_ln20_fu_369_p3;
    reg[8:0] j_fu_70;
    wire logic[8:0] add_ln19_fu_277_p2;
    reg[8:0] ap_sig_allocacmp_j_load;
    reg[8:0] i_fu_74;
    wire logic[8:0] select_ln18_1_fu_261_p3;
    reg[8:0] ap_sig_allocacmp_i_load;
    reg[17:0] indvar_flatten_fu_78;
    wire logic[17:0] select_ln18_2_fu_288_p3;
    reg[17:0] ap_sig_allocacmp_indvar_flatten_load;
    reg[8:0] k_fu_82;
    wire logic[8:0] select_ln16_1_fu_205_p3;
    reg[8:0] ap_sig_allocacmp_k_load;
    reg[26:0] indvar_flatten13_fu_86;
    wire logic[26:0] add_ln16_1_fu_167_p2;
    reg[26:0] ap_sig_allocacmp_indvar_flatten13_load;
    wire logic[8:0] add_ln16_fu_185_p2;
    wire logic[0:0] xor_ln16_fu_239_p2;
    wire logic[0:0] and_ln16_fu_244_p2;
    wire logic[0:0] or_ln18_fu_249_p2;
    wire logic[8:0] mul_ln20_1_fu_271_p0;
    wire logic [8:0] mul_ln20_1_fu_271_p1;
    wire logic[17:0] add_ln18_1_fu_283_p2;
    wire logic[17:0] add_ln20_1_fu_310_p2;
    wire logic[17:0] add_ln20_2_fu_322_p2;
    wire logic[17:0] grp_fu_381_p3;
    wire logic[31:0] reuse_select_fu_353_p3;
    wire logic[0:0] icmp_ln20_fu_365_p2;
    wire logic[8:0] grp_fu_381_p0;
    wire logic[8:0] grp_fu_381_p1;
    wire logic[8:0] grp_fu_381_p2;
    reg ap_done_reg;
    wire logic ap_continue_int;
    reg ap_done_int;
    reg ap_loop_exit_ready_pp0_iter1_reg;
    reg[1:0] ap_NS_fsm;
    wire logic ap_block_pp0_stage0_subdone;
    reg ap_idle_pp0_1to2;
    wire logic ap_start_int;
    wire logic [8:0] grp_fu_381_p00;
    wire logic [8:0] mul_ln20_1_fu_271_p00;
    reg ap_condition_104;
    reg ap_condition_368;
    reg ap_condition_148;
    initial begin
        ap_CS_fsm = 2'b1;
        ap_enable_reg_pp0_iter1 = 1'b0;
        ap_enable_reg_pp0_iter2 = 1'b0;
        ap_enable_reg_pp0_iter0_reg = 1'b0;
        ap_done_reg = 1'b0;
    end
    kernel_floyd_warshall_mul_9ns_10ns_18_1_1_U1 mul_9ns_10ns_18_1_1_U1 (
        .din0(mul_ln20_1_fu_271_p0),
        .din1({1'b0, mul_ln20_1_fu_271_p1}),
        .dout(mul_ln20_1_fu_271_p2)
    );
    kernel_floyd_warshall_mac_muladd_9ns_9ns_9ns_18_4_1_U2 mac_muladd_9ns_9ns_9ns_18_4_1_U2 (
        .clk(ap_clk),
        .reset(ap_rst),
        .ce(1'b1),
        .din0(grp_fu_381_p0),
        .din1(grp_fu_381_p1),
        .din2(grp_fu_381_p2),
        .dout(grp_fu_381_p3)
    );
    kernel_floyd_warshall_flow_control_loop_pipe_U flow_control_loop_pipe_U (
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
        if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin begin
                i_fu_74 <= select_ln18_1_fu_261_p3;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_condition_148)) begin
            if ((icmp_ln16_fu_161_p2 == 1'b0)) begin
                indvar_flatten13_fu_86 <= add_ln16_1_fu_167_p2;
            end
            else begin end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin begin
                indvar_flatten_fu_78 <= select_ln18_2_fu_288_p3;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((ap_enable_reg_pp0_iter0 == 1'b1)) begin begin
                j_fu_70 <= add_ln19_fu_277_p2;
            end
        end
    end
    always @(posedge ap_clk) begin
        if ((1'b1 == ap_condition_148)) begin begin
                k_fu_82 <= select_ln16_1_fu_205_p3;
            end
        end
    end
    always @(posedge ap_clk) begin begin
            if (((ap_enable_reg_pp0_iter0 == 1'b1) & (ap_loop_init == 1'b1))) begin
                reuse_addr_reg_fu_62 <= 64'hffffffffffffffff;
            end
            else if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
                reuse_addr_reg_fu_62 <= zext_ln20_4_fu_327_p1;
            end
        end
    end
    always @(posedge ap_clk) begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0)) & (ap_loop_init == 1'b1))) begin
            reuse_reg_fu_66 <= 32'd0;
        end
        else if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)))) begin
            reuse_reg_fu_66 <= select_ln20_fu_369_p3;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln16_fu_161_p2 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            add_ln18_reg_476 <= add_ln18_fu_223_p2;
            icmp_ln18_reg_453 <= icmp_ln18_fu_191_p2;
            icmp_ln19_reg_471 <= icmp_ln19_fu_217_p2;
            indvar_flatten_load_reg_448 <= ap_sig_allocacmp_indvar_flatten_load;
            j_load_reg_443 <= ap_sig_allocacmp_j_load;
            select_ln16_reg_460 <= select_ln16_fu_197_p3;
            zext_ln20_reg_465[8:0] <= zext_ln20_fu_213_p1[8:0];
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            add_ln20_reg_529 <= add_ln20_fu_359_p2;
            addr_cmp_reg_508 <= addr_cmp_fu_335_p2;
            icmp_ln16_reg_439 <= icmp_ln16_fu_161_p2;
            path_addr_1_reg_502 <= zext_ln20_4_fu_327_p1;
            path_addr_1_reg_502_pp0_iter2_reg <= path_addr_1_reg_502;
        end
    end
    always @(posedge ap_clk) begin
        if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            ap_loop_exit_ready_pp0_iter1_reg <= ap_loop_exit_ready;
        end
    end
    always @(posedge ap_clk) begin
        if ((((icmp_ln16_reg_439 == 1'b0) & (1'b0 == 1'b0)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            mul_ln20_1_reg_486 <= mul_ln20_1_fu_271_p2;
            select_ln18_reg_481 <= select_ln18_fu_254_p3;
        end
    end
    always @(posedge ap_clk) begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            path_load_1_reg_524 <= path_q0;
            path_load_reg_518 <= path_q1;
        end
    end
    always @* begin
        if (((((icmp_ln16_reg_439 == 1'b1) & (1'b0 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
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
    always @* begin
        if ((1'b1 == ap_CS_fsm_pp0_stage0)) begin
            ap_enable_reg_pp0_iter0 = ap_start_int;
        end
        else begin
            ap_enable_reg_pp0_iter0 = ap_enable_reg_pp0_iter0_reg;
        end
    end
    always @* begin
        if ((( (ap_idle_pp0 == 1'b1)))) begin
            ap_idle = 1'b1;
        end
        else begin
            ap_idle = 1'b0;
        end
    end
    always @* begin
        if ((((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0)) & (ap_enable_reg_pp0_iter0 == 1'b0))) begin
            ap_idle_pp0 = 1'b1;
        end
        else begin
            ap_idle_pp0 = 1'b0;
        end
    end
    always @* begin
        if (((ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b0))) begin
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
        if (((((1'b0 == 1'b0))) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_i_load = 9'd0;
        end
        else begin
            ap_sig_allocacmp_i_load = i_fu_74;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_indvar_flatten13_load = 27'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten13_load = indvar_flatten13_fu_86;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_indvar_flatten_load = 18'd0;
        end
        else begin
            ap_sig_allocacmp_indvar_flatten_load = indvar_flatten_fu_78;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0))) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_j_load = 9'd0;
        end
        else begin
            ap_sig_allocacmp_j_load = j_fu_70;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1))) & (ap_loop_init == 1'b1))) begin
            ap_sig_allocacmp_k_load = 9'd0;
        end
        else begin
            ap_sig_allocacmp_k_load = k_fu_82;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            path_address0 = path_addr_1_reg_502_pp0_iter2_reg;
        end
        else if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
            path_address0 = zext_ln20_2_fu_314_p1;
        end
        else begin
            path_address0 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if ((ap_enable_reg_pp0_iter1 == 1'b1)) begin
            if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
                path_address1 = zext_ln20_5_fu_346_p1;
            end
            else if (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
                path_address1 = zext_ln20_4_fu_327_p1;
            end
            else begin
                path_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        end
        else begin
            path_address1 = 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0)) | (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1)))) begin
            path_ce0 = 1'b1;
        end
        else begin
            path_ce0 = 1'b0;
        end
    end
    always @* begin
        if (((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1))) | (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter1 == 1'b1))))) begin
            path_ce1 = 1'b1;
        end
        else begin
            path_ce1 = 1'b0;
        end
    end
    always @* begin
        if ((((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage1))) begin
            path_we0 = 1'b1;
        end
        else begin
            path_we0 = 1'b0;
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
    assign add_ln16_1_fu_167_p2 = (ap_sig_allocacmp_indvar_flatten13_load + 27'd1);
    assign add_ln16_fu_185_p2 = (ap_sig_allocacmp_k_load + 9'd1);
    assign add_ln18_1_fu_283_p2 = (indvar_flatten_load_reg_448 + 18'd1);
    assign add_ln18_fu_223_p2 = (select_ln16_fu_197_p3 + 9'd1);
    assign add_ln19_fu_277_p2 = (select_ln18_fu_254_p3 + 9'd1);
    assign add_ln20_1_fu_310_p2 = (mul_ln20_1_reg_486 + zext_ln20_reg_465);
    assign add_ln20_2_fu_322_p2 = (mul_ln20_1_reg_486 + zext_ln20_3_fu_319_p1);
    assign add_ln20_fu_359_p2 = (path_q1 + reuse_select_fu_353_p3);
    assign addr_cmp_fu_335_p2 = ((reuse_addr_reg_fu_62 == zext_ln20_2_fu_314_p1) ? 1'b1 : 1'b0);
    assign and_ln16_fu_244_p2 = (xor_ln16_fu_239_p2 & icmp_ln19_reg_471);
    assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd0];
    assign ap_CS_fsm_pp0_stage1 = ap_CS_fsm[32'd1];
    assign ap_block_pp0_stage0 = 1'b0;
    assign ap_block_pp0_stage0_11001 = 1'b0;
    assign ap_block_pp0_stage0_subdone = 1'b0;
    assign ap_block_pp0_stage1 = 1'b0;
    assign ap_block_pp0_stage1_11001 = 1'b0;
    assign ap_block_pp0_stage1_subdone = 1'b0;
    always @* begin
        ap_condition_104 = (((icmp_ln16_reg_439 == 1'b0) & (1'b0 == 1'b0)));
    end
    always @* begin
        ap_condition_148 = (((1'b0 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b1)) & (1'b1 == ap_CS_fsm_pp0_stage0));
    end
    always @* begin
        ap_condition_368 = (((1'b0 == 1'b0) & (1'b1 == ap_CS_fsm_pp0_stage0)));
    end
    assign ap_loop_exit_ready = ap_condition_exit_pp0_iter0_stage1;
    assign grp_fu_381_p0 = grp_fu_381_p00;
    assign grp_fu_381_p00 = select_ln16_1_fu_205_p3;
    assign grp_fu_381_p1 = 18'd500;
    assign grp_fu_381_p2 = zext_ln20_3_fu_319_p1;
    assign icmp_ln16_fu_161_p2 = ((ap_sig_allocacmp_indvar_flatten13_load == 27'd125000000) ? 1'b1 : 1'b0);
    assign icmp_ln18_fu_191_p2 = ((ap_sig_allocacmp_indvar_flatten_load == 18'd250000) ? 1'b1 : 1'b0);
    assign icmp_ln19_fu_217_p2 = ((ap_sig_allocacmp_j_load == 9'd500) ? 1'b1 : 1'b0);
    assign icmp_ln20_fu_365_p2 = (($signed(path_load_reg_518) < $signed(add_ln20_reg_529)) ? 1'b1 : 1'b0);
    assign mul_ln20_1_fu_271_p0 = mul_ln20_1_fu_271_p00;
    assign mul_ln20_1_fu_271_p00 = select_ln18_1_fu_261_p3;
    assign mul_ln20_1_fu_271_p1 = 18'd500;
    assign or_ln18_fu_249_p2 = (icmp_ln18_reg_453 | and_ln16_fu_244_p2);
    assign path_d0 = ((icmp_ln20_fu_365_p2[0:0] == 1'b1) ? path_load_reg_518 : add_ln20_reg_529);
    assign reuse_select_fu_353_p3 = ((addr_cmp_reg_508[0:0] == 1'b1) ? reuse_reg_fu_66 : path_load_1_reg_524);
    assign select_ln16_1_fu_205_p3 = ((icmp_ln18_fu_191_p2[0:0] == 1'b1) ? add_ln16_fu_185_p2 : ap_sig_allocacmp_k_load);
    assign select_ln16_fu_197_p3 = ((icmp_ln18_fu_191_p2[0:0] == 1'b1) ? 9'd0 : ap_sig_allocacmp_i_load);
    assign select_ln18_1_fu_261_p3 = ((and_ln16_fu_244_p2[0:0] == 1'b1) ? add_ln18_reg_476 : select_ln16_reg_460);
    assign select_ln18_2_fu_288_p3 = ((icmp_ln18_reg_453[0:0] == 1'b1) ? 18'd1 : add_ln18_1_fu_283_p2);
    assign select_ln18_fu_254_p3 = ((or_ln18_fu_249_p2[0:0] == 1'b1) ? 9'd0 : j_load_reg_443);
    assign select_ln20_fu_369_p3 = ((icmp_ln20_fu_365_p2[0:0] == 1'b1) ? path_load_reg_518 : add_ln20_reg_529);
    assign xor_ln16_fu_239_p2 = (icmp_ln18_reg_453 ^ 1'b1);
    assign zext_ln20_2_fu_314_p1 = add_ln20_1_fu_310_p2;
    assign zext_ln20_3_fu_319_p1 = select_ln18_reg_481;
    assign zext_ln20_4_fu_327_p1 = add_ln20_2_fu_322_p2;
    assign zext_ln20_5_fu_346_p1 = grp_fu_381_p3;
    assign zext_ln20_fu_213_p1 = select_ln16_1_fu_205_p3;
    always @(posedge ap_clk) begin
        begin end
    end
endmodule

module kernel_floyd_warshall_mul_9ns_10ns_18_1_1_U1 (
    input logic[8:0] din0,
    input logic[9:0] din1,
    output logic[17:0] dout
);
    wire logic signed[17:0] tmp_product;
    assign tmp_product = ($signed({1'b0, din0}) * $signed({1'b0, din1}));
    assign dout = tmp_product;
endmodule

module kernel_floyd_warshall_mac_muladd_9ns_9ns_9ns_18_4_1_U2 (
    input logic clk,
    input logic reset,
    input logic ce,
    input logic[8:0] din0,
    input logic[8:0] din1,
    input logic[8:0] din2,
    output logic[17:0] dout
);
    kernel_floyd_warshall_mac_muladd_9ns_9ns_9ns_18_4_1_U2_kernel_floyd_warshall_mac_muladd_9ns_9ns_9ns_18_4_1_DSP48_0_U kernel_floyd_warshall_mac_muladd_9ns_9ns_9ns_18_4_1_DSP48_0_U (
        .clk(clk),
        .rst(reset),
        .ce(ce),
        .in0(din0),
        .in1(din1),
        .in2(din2),
        .dout(dout)
    );
endmodule
module kernel_floyd_warshall_mac_muladd_9ns_9ns_9ns_18_4_1_U2_kernel_floyd_warshall_mac_muladd_9ns_9ns_9ns_18_4_1_DSP48_0_U (
    input logic clk,
    input logic rst,
    input logic ce,
    input logic[8:0] in0,
    input logic[8:0] in1,
    input logic[8:0] in2,
    output logic[17:0] dout
);
    wire logic signed[9:0] a;
    wire logic signed[9:0] b;
    wire logic signed[9:0] c;
    wire logic signed[17:0] m;
    wire logic signed[17:0] p;
    reg signed[17:0] m_reg;
    reg signed[9:0] a_reg;
    reg signed[9:0] b_reg;
    reg signed[17:0] p_reg;
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

module kernel_floyd_warshall_flow_control_loop_pipe_U (
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
