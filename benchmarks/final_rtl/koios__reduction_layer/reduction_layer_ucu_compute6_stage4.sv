
module reduction_layer_ucu_compute6_stage4 (
    input logic[19:0] A,
    input logic[19:0] B,
    output logic[19:0] OUT,
    input logic[1:0] MODE
);
    wire logic [18:0] greater;
    wire logic [18:0] smaller;
    wire logic[19:0] sum;
    assign greater = ((A > B) ? A : B);
    assign smaller = ((A < B) ? A : B);
    assign sum = (A + B);
    assign OUT = ((MODE == 0) ? sum : ((MODE == 1) ? greater : smaller));
endmodule