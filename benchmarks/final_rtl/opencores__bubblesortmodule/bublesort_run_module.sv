
module bublesort_run_module #(
    parameter logic signed[31:0] N_BITS = 8
) (
    input logic clk,
    input logic rst,
    input logic start_i,
    input logic all_sorted_i,
    output logic run_o
);
    reg[11:0] r_count;
    reg r_job_done;
    wire logic w_ready_to_stop;
    wire logic w_next_bit;
    always @(posedge clk) begin
        if (rst) begin
            r_count <= 12'd0;
        end
        else if (start_i) begin
            r_count <= 12'd4080;
        end
        else begin
            r_count <= {r_count[10:0], w_next_bit};
        end
    end
    always @(posedge clk) begin if (all_sorted_i) begin
            r_job_done <= 1'b1;
        end
        else if (start_i) begin
            r_job_done <= 1'b0;
        end
    end
    assign w_ready_to_stop = ~(r_count[0]);
    assign w_next_bit = ((r_job_done & w_ready_to_stop) ? 1'b0 : r_count[11]);
    assign run_o = r_count[0];
endmodule