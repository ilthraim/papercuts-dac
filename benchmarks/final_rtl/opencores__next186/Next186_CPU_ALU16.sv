module Next186_CPU_ALU16 (
    input logic[15:0] RA,
    input logic[15:0] RB,
    input logic[15:0] TMP16,
    input logic[15:0] FETCH23,
    input logic[15:0] FIN,
    input logic[4:0] ALUOP,
    input logic[2:0] EXOP,
    input logic[3:0] FLAGOP,
    input logic WORD,
    input logic INC2,
    output reg[15:0] FOUT,
    output reg[15:0] ALUOUT,
    output reg ALUCONT,
    output logic NULLSHIFT,
    output logic COUT,
    input logic[2:0] STAGE,
    input logic CLK
);
    reg CPLOP2;
    wire logic[15:0] SUMOP1 = ((ALUOP[3:1] == 3'b101) ? 16'd0 : RA);
    reg[15:0] SUMOP21;
    wire logic[15:0] SUMOP2 = (CPLOP2 ? ~(SUMOP21) : SUMOP21);
    wire logic SCIN1 = ((ALUOP[3:1] == 3'b1) ? FIN[0] : ((ALUOP[3:0] == 4'b1010) ? 1'b1 : 1'b0));
    wire logic SCIN = (CPLOP2 ? ~(SCIN1) : SCIN1);
    wire logic SC16OUT;
    wire logic SC8OUT;
    wire logic AF;
    wire logic[15:0] SUMOUT;
    wire logic parity = ~^(ALUOUT[7:0]);
    wire logic zero8 = ~|(ALUOUT[7:0]);
    wire logic zero = ~|(ALUOUT[15:0]);
    wire logic overflow8 = (((SUMOP1[7] & SUMOP2[7]) & !(SUMOUT[7])) | ((!(SUMOP1[7]) & !(SUMOP2[7])) & SUMOUT[7]));
    wire logic overflow = (((SUMOP1[15] & SUMOP2[15]) & !(SUMOUT[15])) | ((!(SUMOP1[15]) & !(SUMOP2[15])) & SUMOUT[15]));
    wire logic LONIBBLE = ((RA[3:0] > 4'b1001) || FIN[4]);
    wire logic HINIBBLE = ((RA[7:0] > 8'd153) || FIN[0]);
    assign {AF, SUMOUT[3:0]} = ((SUMOP1[3:0] + SUMOP2[3:0]) + SCIN);
    assign {SC8OUT, SUMOUT[7:4]} = ((SUMOP1[7:4] + SUMOP2[7:4]) + AF);
    assign {SC16OUT, SUMOUT[15:8]} = ((SUMOP1[15:8] + SUMOP2[15:8]) + SC8OUT);
    assign COUT = ((WORD ? SC16OUT : SC8OUT) ^ CPLOP2);
    reg[4:0] SHNOPT;
    wire logic[4:0] SHN = {(STAGE[2:1] ^ SHNOPT[4:3]), SHNOPT[2:0]};
    assign NULLSHIFT = ~|(SHNOPT);
    wire logic[2:0] COUNT = (|(SHN[4:3]) ? 0 : SHN[2:0]);
    wire logic[2:0] SCOUNT = ((EXOP[0] ? COUNT[2:0] : 3'b0) - (EXOP[0] ? 3'b1 : COUNT[2:0]));
    reg[7:0] SHEX;
    wire logic[17:0] SHBAR = ((EXOP[0] ? {1'bx, SHEX, (WORD ? RA[15:8] : SHEX), RA[7:0]} : {RA, SHEX, 1'bx}) >> SCOUNT);
    wire logic signed[16:0] MULOP1 = (WORD ? {(ALUOP[0] & TMP16[15]), TMP16} : {(ALUOP[0] ? {9{TMP16[7]}} : 9'd0), TMP16[7:0]});
    wire logic signed[16:0] MULOP2 = (WORD ? {(ALUOP[0] & FETCH23[15]), FETCH23} : {(ALUOP[0] ? {9{FETCH23[7]}} : 9'd0), FETCH23[7:0]});
    wire logic signed[31:0] MUL = (MULOP1 * MULOP2);
    always @* begin
        FOUT[15:8] = {4'bxxxx, (WORD ? overflow : overflow8), FIN[10:8]};
        FOUT[7] = (WORD ? ALUOUT[15] : ALUOUT[7]);
        FOUT[6] = (WORD ? zero : zero8);
        FOUT[5] = 1'bx;
        FOUT[4] = (AF ^ CPLOP2);
        FOUT[3] = 1'bx;
        FOUT[2] = parity;
        FOUT[1] = 1'bx;
        FOUT[0] = COUT;
        ALUOUT = 16'dx;
        ALUCONT = 1'bx;
        case (ALUOP[3:0])
            4'b0, 4'b10, 4'b1000, 4'b1100, 4'b1110: begin
                CPLOP2 = 1'b0;
            end
            default: begin
                CPLOP2 = 1'b1;
            end
        endcase
        case (ALUOP[3:0])
            4'b1000, 4'b1001: begin
                SUMOP21 = ((INC2 && WORD) ? 2 : 1);
            end
            4'b1100, 4'b1101: begin
                SUMOP21 = {9'd0, HINIBBLE, HINIBBLE, 2'b0, LONIBBLE, LONIBBLE, 1'b0};
            end
            4'b1110, 4'b1111: begin
                SUMOP21 = {7'b0, LONIBBLE, 5'b0, LONIBBLE, LONIBBLE, 1'b0};
            end
            default: begin
                SUMOP21 = RB;
            end
        endcase
        if (ALUOP[0]) begin
            case ({WORD, EXOP[2:1]})
                3'b0: begin
                    SHNOPT = {2'b0, RB[2:0]};
                end
                3'b1, 3'b101: begin
                    SHNOPT = RB[4:0];
                end
                3'b10, 3'b11: begin
                    SHNOPT = (|(RB[4:3]) ? 5'b1000 : RB[4:0]);
                end
                3'b100: begin
                    SHNOPT = {1'b0, RB[3:0]};
                end
                3'b110, 3'b111: begin
                    SHNOPT = (RB[4] ? 5'b10000 : RB[4:0]);
                end
            endcase
        end
        else begin
            SHNOPT = 5'b1;
        end
        case ({WORD, EXOP})
            4'b1000: begin
                SHEX = RA[15:8];
            end
            4'b10: begin
                SHEX = {FIN[0], RA[7:1]};
            end
            4'b11, 4'b1011: begin
                SHEX = {RA[6:0], FIN[0]};
            end
            4'b111: begin
                SHEX = {8{RA[7]}};
            end
            4'b0, 4'b1, 4'b1001: begin
                SHEX = RA[7:0];
            end
            4'b1010: begin
                SHEX = {FIN[0], RA[15:9]};
            end
            4'b1111: begin
                SHEX = {8{RA[15]}};
            end
            default: begin
                SHEX = 8'd0;
            end
        endcase
        case (ALUOP)
            5'b0, 5'b10, 5'b11, 5'b101, 5'b111, 5'b1010, 5'b1011: begin
                ALUOUT = SUMOUT;
            end
            5'b1: begin
                ALUOUT = (RA | RB);
                FOUT[0] = 1'b0;
                FOUT[11] = 1'b0;
                FOUT[4] = FIN[4];
            end
            5'b100: begin
                ALUOUT = (RA & RB);
                FOUT[0] = 1'b0;
                FOUT[11] = 1'b0;
                FOUT[4] = FIN[4];
            end
            5'b110: begin
                ALUOUT = (RA ^ RB);
                FOUT[0] = 1'b0;
                FOUT[11] = 1'b0;
                FOUT[4] = FIN[4];
            end
            5'b1000, 5'b1001: begin
                ALUOUT = SUMOUT;
                FOUT[0] = FIN[0];
            end
            5'b1100, 5'b1101: begin
                ALUOUT = SUMOUT;
                FOUT[0] = HINIBBLE;
                FOUT[4] = LONIBBLE;
            end
            5'b1110, 5'b1111: begin
                ALUOUT = {SUMOUT[15:8], 4'b0, SUMOUT[3:0]};
                FOUT[0] = LONIBBLE;
                FOUT[4] = LONIBBLE;
            end
            5'b10000, 5'b10001: begin
                ALUOUT = (STAGE[1] ? MUL[31:16] : MUL[15:0]);
                FOUT[0] = (WORD ? (MUL[31:16] != {16{(MUL[15] & ALUOP[0])}}) : (MUL[15:8] != {8{(MUL[7] & ALUOP[0])}}));
                FOUT[11] = FOUT[0];
            end
            5'b11001: begin
                FOUT[11:8] = FIN[11:8];
                FOUT[7] = FIN[7];
                FOUT[6] = FIN[6];
                FOUT[4] = FIN[4];
                FOUT[2] = FIN[2];
                FOUT[0] = FIN[0];
                case (FLAGOP)
                    4'b1000: begin
                        FOUT[0] = 1'b0;
                    end
                    4'b101: begin
                        FOUT[0] = !(FIN[0]);
                    end
                    4'b1001: begin
                        FOUT[0] = 1'b1;
                    end
                    4'b1100: begin
                        FOUT[10] = 1'b0;
                    end
                    4'b1101: begin
                        FOUT[10] = 1'b1;
                    end
                    4'b1010: begin
                        FOUT[9] = 1'b0;
                    end
                    default: begin
                        FOUT[9] = 1'b1;
                    end
                endcase
            end
            5'b11010: begin
                ALUOUT[7:0] = {8{RB[7]}};
            end
            5'b11011: begin
                ALUOUT[15:0] = {16{RB[15]}};
            end
            5'b11100, 5'b11101: begin
                ALUOUT = SHBAR[16:1];
                FOUT[0] = (EXOP[0] ? SHBAR[0] : (WORD ? SHBAR[17] : SHBAR[9]));
                FOUT[11] = (WORD ? (RA[15] ^ ALUOUT[15]) : (RA[7] ^ ALUOUT[7]));
                if (!(EXOP[2])) begin
                    FOUT[7] = FIN[7];
                    FOUT[6] = FIN[6];
                    FOUT[4] = FIN[4];
                    FOUT[2] = FIN[2];
                end
                case ({SHN[4:3], STAGE[2:1]})
                    4'b100, 4'b1101, 4'b110: begin
                        ALUCONT = |(SHN[2:0]);
                    end
                    4'b1000, 4'b1100, 4'b1001: begin
                        ALUCONT = 1'b1;
                    end
                    default: begin
                        ALUCONT = 1'b0;
                    end
                endcase
            end
            5'b11110: begin
                ALUOUT = FIN;
                FOUT[11] = FIN[11];
                FOUT[9] = 1'b0;
                FOUT[8] = 1'b0;
                FOUT[7] = FIN[7];
                FOUT[6] = FIN[6];
                FOUT[4] = FIN[4];
                FOUT[2] = FIN[2];
                FOUT[0] = FIN[0];
            end
            5'b11111: begin
                ALUOUT = RB;
                FOUT = {(WORD ? RA[15:8] : FIN[15:8]), RA[7:0]};
            end
        endcase
    end
endmodule
