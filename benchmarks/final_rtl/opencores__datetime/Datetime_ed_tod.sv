module Datetime_ed_tod (
    input logic rst,
    input logic clk,
    input logic ce,
    input logic i,
    output logic pe,
    output logic ne,
    output logic ee
);
    reg ed;
    always @(posedge clk) begin
        ed <= i;
    end
    assign pe = (~(ed) & i);
    assign ne = ed;
    assign ee = ed;
endmodule
