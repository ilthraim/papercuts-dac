
module top_u_mul_u_FPMult_NormalizeModule (
    input logic[6:0] NormM,
    input logic[8:0] NormE,
    output logic[8:0] RoundE,
    output logic[8:0] RoundEP,
    output logic[7:0] RoundM,
    output logic[7:0] RoundMP
);
    wire logic [6:0] bias;
    assign bias = 127;
    assign RoundE = (NormE - bias);
    assign RoundEP = ((NormE - bias) - 1);
    assign RoundM = NormM;
    assign RoundMP = NormM;
endmodule