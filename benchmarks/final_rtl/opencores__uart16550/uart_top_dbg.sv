
module uart_top_dbg (
    output reg[31:0] wb_dat32_o,
    input logic[4:0] wb_adr_i,
    input logic[3:0] ier,
    input logic[3:0] iir,
    input logic[1:0] fcr,
    input logic[4:0] mcr,
    input logic[7:0] lcr,
    input logic[7:0] msr,
    input logic[7:0] lsr,
    input logic[4:0] rf_count,
    input logic[4:0] tf_count,
    input logic[2:0] tstate,
    input logic[3:0] rstate
);
    always @(fcr or ier or iir or lcr or lsr or mcr or msr or rf_count or rstate or tf_count or tstate or wb_adr_i) begin
        case (wb_adr_i)
            5'b1000: begin
                wb_dat32_o = {msr, lcr, iir, ier, lsr};
            end
            5'b1100: begin
                wb_dat32_o = {8'd0, fcr, mcr, rf_count, rstate, tf_count, tstate};
            end
            default: begin
                wb_dat32_o = 0;
            end
        endcase
    end
endmodule