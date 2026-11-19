
module top_u_mul_u_FPMult (
    input logic clk,
    input logic rst,
    input logic[15:0] a,
    input logic[15:0] b,
    output logic[15:0] result,
    output logic[4:0] flags
);
    wire logic[15:0] Z_int;
    wire logic [0:0] Flags_int;
    wire logic Sa;
    wire logic Sb;
    wire logic Sp;
    wire logic[7:0] Ea;
    wire logic[7:0] Eb;
    wire logic[15:0] Mp;
    wire logic [0:0] InputExc;
    wire logic[6:0] NormM;
    wire logic [7:0] NormE;
    wire logic [6:0] RoundM;
    wire logic [7:0] RoundE;
    wire logic [6:0] RoundMP;
    wire logic [0:0] RoundEP;
    wire logic GRS;
    reg[31:0] pipe_0;
    reg [38:0] pipe_1;
    reg [16:0] pipe_2;
    reg [34:0] pipe_3;
    reg[20:0] pipe_4;
    assign result = pipe_4[20:5];
    assign flags = pipe_4[4:0];
    top_u_mul_u_FPMult_PrepModule PrepModule (
        .clk(clk),
        .rst(rst),
        .a(pipe_0[31:16]),
        .b(pipe_0[15:0]),
        .Sa(Sa),
        .Sb(Sb),
        .Ea(Ea[7:0]),
        .Eb(Eb[7:0]),
        .Mp(Mp[15:0]),
        .InputExc(InputExc[0:0])
    );
    top_u_mul_u_FPMult_ExecuteModule ExecuteModule (
        .a({6'b0, pipe_1[38:38]}),
        .b(pipe_1[37:21]),
        .MpC(pipe_1[20:5]),
        .Ea(pipe_1[36:29]),
        .Eb(pipe_1[28:21]),
        .Sa(pipe_1[38]),
        .Sb(pipe_1[37]),
        .Sp(Sp),
        .NormE(NormE[7:0]),
        .NormM(NormM[6:0]),
        .GRS(GRS)
    );
    top_u_mul_u_FPMult_NormalizeModule NormalizeModule (
        .NormM(pipe_2[6:0]),
        .NormE(pipe_2[15:7]),
        .RoundE(RoundE[7:0]),
        .RoundEP(RoundEP[0:0]),
        .RoundM(RoundM[6:0]),
        .RoundMP(RoundMP[6:0])
    );
    top_u_mul_u_FPMult_RoundModule RoundModule (
        .RoundM(pipe_3[15:8]),
        .RoundMP(pipe_3[7:0]),
        .RoundE(pipe_3[33:25]),
        .RoundEP(pipe_3[24:16]),
        .Sp(pipe_3[34]),
        .GRS(1'b0),
        .InputExc(5'b0),
        .Z(Z_int[15:0]),
        .Flags(Flags_int[0:0])
    );
    always @(posedge clk) begin begin
            pipe_0 <= {a, b};
            pipe_1 <= {pipe_0[22:16], pipe_0[8:0], Sa, Sb, Ea[7:0], Eb[7:0], Mp[15:0], {4'b0, InputExc[0:0]}};
            pipe_2 <= {pipe_1[4:0], 1'b1, Sp, {1'b0, NormE[7:0]}, NormM[6:0]};
            pipe_3 <= {{6'b0, pipe_2[16:16]}, {1'b0, RoundE[7:0]}, {8'b0, RoundEP[0:0]}, {1'b0, RoundM[6:0]}, {1'b0, RoundMP[6:0]}};
            pipe_4 <= {Z_int[15:0], {4'b0, Flags_int[0:0]}};
        end
    end
endmodule