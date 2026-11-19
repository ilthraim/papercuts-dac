
module Datetime_sync0 (
    input logic rst,
    input logic clk,
    input logic i,
    output logic o
);
    reg[1:0] s;
    always @(posedge clk) begin
        if (rst) begin
            s <= 0;
        end
        else begin
            s <= {s[0], i};
        end
    end
    assign o = s[1];
endmodule