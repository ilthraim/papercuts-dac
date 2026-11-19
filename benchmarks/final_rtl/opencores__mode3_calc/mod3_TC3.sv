
module mod3_TC3 (
    input logic plus_one,
    input logic minus_one,
    output reg[1:0] dat_o
);
    always @* begin
        case ({plus_one, minus_one})
            2'b1: begin
                dat_o = 2'b10;
            end
            2'b10: begin
                dat_o = 2'b1;
            end
            default: begin
                dat_o = 2'b0;
            end
        endcase
    end
endmodule