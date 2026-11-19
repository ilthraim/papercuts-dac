
module mod3_MA0 (
    input logic[1:0] din_a,
    input logic[1:0] din_b,
    output reg[1:0] dat_o
);
    always @* begin
        case ({din_a, din_b})
            4'b1: begin
                dat_o = 2'b1;
            end
            4'b10: begin
                dat_o = 2'b10;
            end
            4'b100: begin
                dat_o = 2'b1;
            end
            4'b101: begin
                dat_o = 2'b10;
            end
            4'b1000: begin
                dat_o = 2'b10;
            end
            4'b1010: begin
                dat_o = 2'b1;
            end
            default: begin
                dat_o = 2'b0;
            end
        endcase
    end
endmodule