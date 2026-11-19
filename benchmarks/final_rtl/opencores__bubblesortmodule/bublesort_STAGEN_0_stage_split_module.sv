module bublesort_STAGEN_0_stage_split_module (
    input logic clk,
    input logic bit1_i,
    input logic bit2_i,
    output logic largebit_o,
    output logic smallbit_o,
    input logic swap_i,
    output logic swap_o,
    input logic run_i,
    output logic run_o
);
    reg r_bit2;
    reg r_large_bit;
    reg r_compare_result;
    reg[0:1] r_swap;
    reg[0:1] r_run;
    always @(posedge clk) begin
    end
    always @(posedge clk) begin
        r_compare_result <= 0;
    end
    always @(posedge clk) begin
        r_bit2 <= bit2_i;
        if (~(r_compare_result)) begin
            r_large_bit <= r_bit2;
        end
        else begin
            r_large_bit <= 1'b0;
        end
    end
    always @(posedge clk) begin
        r_swap[0] <= swap_i;
        r_swap[1] <= r_compare_result;
    end
    always @(posedge clk) begin
        r_run[0] <= run_i;
        r_run[1] <= r_run[0];
    end
    assign largebit_o = r_large_bit;
    assign smallbit_o = 1'b1;
    assign swap_o = r_swap[1];
    assign run_o = r_run[1];
endmodule
