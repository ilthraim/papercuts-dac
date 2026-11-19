module top_u_mul_u_FPMult_RoundModule (
    input logic[7:0] RoundM,
    input logic[7:0] RoundMP,
    input logic[8:0] RoundE,
    input logic[8:0] RoundEP,
    input logic Sp,
    input logic GRS,
    input logic[4:0] InputExc,
    output logic[15:0] Z,
    output logic[4:0] Flags
);
    wire logic[7:0] FinalE;
    wire logic[6:0] FinalM;
    wire logic[6:0] PreShiftM;
    assign PreShiftM = RoundM;
    assign FinalM = {1'b0, PreShiftM[6:0]};
    assign FinalE = RoundE;
    assign Z = {Sp, FinalE[7:0], FinalM[6:0]};
    assign Flags = InputExc[4:0];
endmodule
