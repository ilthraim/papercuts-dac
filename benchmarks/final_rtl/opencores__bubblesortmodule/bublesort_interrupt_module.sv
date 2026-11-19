
module bublesort_interrupt_module #(
    parameter logic signed[31:0] N_BITS = 8,
    parameter logic signed[31:0] K_NUMBERS = 49
) (
    input logic clk,
    input logic rst,
    input logic run_i,
    input logic swap_i,
    output logic done_o,
    output logic interrupt_o
);
    reg r_run_delay;
    reg r_swap_delay;
    reg[5:0] r_pulses;
    reg r_done;
    wire logic w_falling_run;
    always @(posedge clk) begin
        if (rst) begin
            r_run_delay <= 1'b0;
            r_swap_delay <= 1'b0;
        end
        else begin
            r_run_delay <= run_i;
            r_swap_delay <= swap_i;
        end
    end
    always @(posedge clk) begin
        if ((rst || r_pulses[5])) begin
            r_pulses <= 9;
        end
        else if (w_falling_run) begin
            if (~(r_swap_delay)) begin
                r_pulses <= (r_pulses - 1);
            end
            else begin
                r_pulses <= 9;
            end
        end
    end
    always @(posedge clk) begin
        if ((w_falling_run & ~(r_swap_delay))) begin
            r_done <= 1'b1;
        end
        else begin
            r_done <= 1'b0;
        end
    end
    assign w_falling_run = (~(run_i) & r_run_delay);
    assign done_o = r_done;
    assign interrupt_o = r_pulses[5];
endmodule