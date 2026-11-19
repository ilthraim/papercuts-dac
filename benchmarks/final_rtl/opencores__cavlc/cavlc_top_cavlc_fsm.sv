
module cavlc_top_cavlc_fsm (
    input logic clk,
    input logic rst_n,
    input logic ena,
    input logic start,
    input logic[4:0] max_coeff_num,
    input logic[4:0] TotalCoeff,
    input logic[4:0] TotalCoeff_comb,
    input logic[1:0] TrailingOnes,
    input logic[1:0] TrailingOnes_comb,
    input logic[3:0] ZeroLeft,
    output reg[7:0] state,
    output reg[3:0] i,
    output logic idle,
    output reg valid
);
    always @(posedge clk or negedge rst_n) begin
        if (!(rst_n)) begin
            state <= 8'd1;
            i <= 0;
            valid <= 0;
        end
        else if (ena) begin
            case (state)
                8'd1: begin
                    if (start) begin
                        state <= 8'd2;
                        valid <= 0;
                    end
                    else begin
                        state <= 8'd1;
                    end
                end
                8'd2: begin
                    i <= (TotalCoeff_comb - 1);
                    if (((TrailingOnes_comb > 0))) begin
                        state <= 8'd4;
                    end
                    else if ((TotalCoeff_comb > 0)) begin
                        state <= 8'd8;
                    end
                    else begin
                        state <= 8'd1;
                        valid <= 1;
                    end
                end
                8'd4: begin
                    if ((TrailingOnes == TotalCoeff)) begin
                        state <= 8'd64;
                    end
                    else begin
                        state <= 8'd8;
                        i <= (i - TrailingOnes);
                    end
                end
                8'd8: begin
                    state <= 8'd16;
                end
                8'd16: begin
                    state <= 8'd32;
                end
                8'd32: begin
                    if (((i == 0) && (TotalCoeff < max_coeff_num))) begin
                        state <= 8'd64;
                    end
                    else if ((i == 0)) begin
                        state <= 8'd128;
                        i <= (TotalCoeff - 1);
                    end
                    else begin
                        state <= 8'd8;
                        i <= (i - 1);
                    end
                end
                8'd64: begin
                    state <= 8'd128;
                    i <= (TotalCoeff - 1);
                end
                8'd128: begin
                    if (((i == 0) || (ZeroLeft == 0))) begin
                        state <= 8'd1;
                        valid <= 1;
                    end
                    else begin
                        state <= 8'd128;
                        i <= (i - 1);
                    end
                end
            endcase
        end
    end
    assign idle = state[0];
endmodule