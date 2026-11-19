
module reduction_layer_ucu_compute28_stage6 (
    input logic[19:0] A,
    input logic[19:0] B,
    output logic[19:0] OUT,
    input logic[1:0] MODE
);
    wire logic [16:0] greater;
    wire logic [16:0] smaller;
    wire logic [17:0] sum;
    assign greater = ((A > B) ? A : B);
    assign smaller = ((A < B) ? A : B);
    assign sum = (A + B);
    assign OUT = ((MODE == 0) ? sum : ((MODE == 1) ? greater : smaller));
endmodule