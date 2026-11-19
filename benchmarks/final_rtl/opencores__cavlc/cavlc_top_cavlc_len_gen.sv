
module cavlc_top_cavlc_len_gen (
    input logic[7:0] cavlc_state,
    input logic[4:0] len_read_total_coeffs_comb,
    input logic[4:0] len_read_levels_comb,
    input logic[3:0] len_read_total_zeros_comb,
    input logic[3:0] len_read_run_befores_comb,
    output reg[4:0] len_comb
);
    always @* begin
        case (1'b1)  // synthesis parallel_case
            cavlc_state[1]: begin
                len_comb <= len_read_total_coeffs_comb;
            end
            cavlc_state[2], cavlc_state[3], cavlc_state[4]: begin
                len_comb <= len_read_levels_comb;
            end
            cavlc_state[6]: begin
                len_comb <= len_read_total_zeros_comb;
            end
            cavlc_state[7]: begin
                len_comb <= len_read_run_befores_comb;
            end
            cavlc_state[5], cavlc_state[0]: begin
                len_comb <= 0;
            end
            default: begin
                len_comb <= 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
endmodule