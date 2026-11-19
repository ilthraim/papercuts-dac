module kernel_gemm_grp_kernel_gemm_Pipeline_VITIS_LOOP_23_2_fu_128_flow_control_loop_pipe_sequential_init_U (
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
