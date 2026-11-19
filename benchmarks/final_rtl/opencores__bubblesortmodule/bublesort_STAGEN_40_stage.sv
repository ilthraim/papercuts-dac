
module bublesort_STAGEN_40_stage #(
    parameter logic signed[31:0] N_BITS = 8
) (
    input logic clk,
    input logic load,
    input logic[7:0] data_i,
    output logic[7:0] data_o,
    input logic swap_i,
    output logic swap_o,
    input logic run_i,
    input logic run_late_i,
    output logic run_o,
    input logic bit_i,
    output logic bit_o,
    input logic value_i,
    output logic value_o
);
    reg[7:0] r_data;
    wire logic w_large_bit;
    wire logic w_small_bit;
    wire logic w_swap_o;
    wire logic w_run_o;
    always @(posedge clk) begin
        if (load) begin
            r_data <= data_i;
        end
        else if ((run_i | run_late_i)) begin
            r_data <= {r_data[6:0], value_i};
        end
    end
    bublesort_STAGEN_40_stage_split_module split_module (
        .clk(clk),
        .bit1_i(bit_i),
        .bit2_i(r_data[7]),
        .largebit_o(w_large_bit),
        .smallbit_o(w_small_bit),
        .swap_i(swap_i),
        .swap_o(w_swap_o),
        .run_i(run_i),
        .run_o(w_run_o)
    );
    assign data_o = r_data;
    assign swap_o = w_swap_o;
    assign run_o = w_run_o;
    assign bit_o = w_large_bit;
    assign value_o = w_small_bit;
endmodule