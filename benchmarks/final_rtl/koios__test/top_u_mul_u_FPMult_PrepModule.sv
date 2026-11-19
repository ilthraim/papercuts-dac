module top_u_mul_u_FPMult_PrepModule (
    input logic clk,
    input logic rst,
    input logic[15:0] a,
    input logic[15:0] b,
    output logic Sa,
    output logic Sb,
    output logic[7:0] Ea,
    output logic[7:0] Eb,
    output logic[15:0] Mp,
    output logic[4:0] InputExc
);
    assign InputExc = 5'b11111;
    assign Sa = a[15];
    assign Sb = b[15];
    assign Ea = a[14:7];
    assign Eb = b[14:7];
    assign Mp = ({1'b1, a[6:0]} * {1'b1, b[6:0]});
endmodule
