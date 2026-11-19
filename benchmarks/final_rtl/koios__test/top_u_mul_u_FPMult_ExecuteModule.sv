module top_u_mul_u_FPMult_ExecuteModule (
    input logic[6:0] a,
    input logic[16:0] b,
    input logic[15:0] MpC,
    input logic[7:0] Ea,
    input logic[7:0] Eb,
    input logic Sa,
    input logic Sb,
    output logic Sp,
    output logic[8:0] NormE,
    output logic[6:0] NormM,
    output logic GRS
);
    wire logic[15:0] Mp;
    assign Sp = (Sa ^ Sb);
    assign Mp = MpC;
    assign NormM = (Mp[15] ? Mp[14:8] : Mp[13:7]);
    assign NormE = ((Ea + Eb) + Mp[15]);
    assign GRS = Mp[7];
endmodule
