module Next186_CPU_REGS (
    input logic[2:0] RASEL,
    input logic[2:0] RBSEL,
    input logic BASEL,
    input logic[1:0] BBSEL,
    input logic[1:0] RSSEL,
    input logic[15:0] DIN,
    input logic[15:0] ALUOUT,
    input logic[15:0] ADDR16,
    input logic[15:0] DIMM,
    input logic[4:0] WE,
    input logic IFETCH,
    input logic[15:0] FIN,
    input logic[1:0] DISEL,
    input logic[15:0] IPIN,
    input logic WORD,
    input logic INCSP,
    input logic DECCX,
    input logic DIVOP,
    input logic DIVEND,
    input logic DIVC,
    input logic DIVSGN,
    output logic[1:0] CXZ,
    output logic[15:0] FOUT,
    output logic[15:0] RA,
    output logic[15:0] RB,
    output reg[15:0] TMP16,
    output reg[15:0] SP,
    output reg[15:0] IP,
    output reg[15:0] AX,
    output reg[15:0] BX,
    output reg[15:0] BP,
    output reg[15:0] SI,
    output reg[15:0] DI,
    output logic[15:0] RS,
    output logic[15:0] CS,
    output reg[15:0] DX,
    output logic DIVEXC,
    input logic CLK,
    input logic CLKEN
);
    reg[15:0] CX;
    reg[15:0] SREG[3:0];
    reg[8:0] FLG;
    reg[15:0] REG_ASEL;
    reg[15:0] REG_BSEL;
    wire logic[15:0] RW = (DISEL[0] ? ALUOUT : ADDR16);
    wire logic[2:0] ASEL = {(WORD & RASEL[2]), RASEL[1:0]};
    wire logic[2:0] BSEL = {(WORD & RBSEL[2]), RBSEL[1:0]};
    wire logic[7:0] RWHI = ((WORD || &(WE[1:0])) ? RW[15:8] : RW[7:0]);
    wire logic[8:0] RWDL = {((DIVOP && ~(DIVC)) ? DX[7:0] : RW[7:0]), AX[15]};
    wire logic[8:0] RWDH = {((DIVOP && ~(DIVC)) ? DX[15:7] : {RWHI, RW[7]})};
    wire logic[8:0] RWAH = {((DIVOP && ~(DIVC)) ? AX[15:8] : RWHI), AX[7]};
    assign DIVEXC = (WORD ? RWDH[8] : RWAH[8]);
    wire logic FASTDIN = ~|(DISEL);
    wire logic[15:0] FDRW = (FASTDIN ? DIN : RW);
    wire logic[7:0] FASTDINH = (&(WE[1:0]) ? DIN[15:8] : DIN[7:0]);
    wire logic[15:0] CXM1 = (CX + 16'd65535);
    assign FOUT = {4'b0, FLG[8:3], 1'b0, FLG[2], 1'b0, FLG[1], 1'b1, FLG[0]};
    assign CS = SREG[1];
    assign CXZ = {|(CX[15:1]), CX[0]};
    wire logic[15:0] RA1 = {REG_ASEL[15:8], ((WORD | !(RASEL[2])) ? REG_ASEL[7:0] : REG_ASEL[15:8])};
    assign RA = (BASEL ? RA1 : TMP16);
    assign RB = (BBSEL[1] ? (BBSEL[0] ? SREG[BSEL[1:0]] : DIMM) : (BBSEL[0] ? {REG_BSEL[15:8], ((WORD | !(RBSEL[2])) ? REG_BSEL[7:0] : REG_BSEL[15:8])} : TMP16));
    assign RS = SREG[RSSEL];
    always @* begin
        case (ASEL)
            0: begin
                REG_ASEL = AX;
            end
            1: begin
                REG_ASEL = CX;
            end
            2: begin
                REG_ASEL = DX;
            end
            3: begin
                REG_ASEL = BX;
            end
            4: begin
                REG_ASEL = SP;
            end
            5: begin
                REG_ASEL = BP;
            end
            6: begin
                REG_ASEL = SI;
            end
            7: begin
                REG_ASEL = DI;
            end
        endcase
        case (BSEL)
            0: begin
                REG_BSEL = AX;
            end
            1: begin
                REG_BSEL = CX;
            end
            2: begin
                REG_BSEL = DX;
            end
            3: begin
                REG_BSEL = BX;
            end
            4: begin
                REG_BSEL = SP;
            end
            5: begin
                REG_BSEL = BP;
            end
            6: begin
                REG_BSEL = SI;
            end
            7: begin
                REG_BSEL = DI;
            end
        endcase
    end
    always @(posedge CLK) begin
        if (CLKEN) begin
            if ((WE[0] && (ASEL == 0))) begin
                AX[7:0] <= FDRW[7:0];
            end
            else if (DIVOP) begin
                AX[7:0] <= {AX[6:0], (DIVC ^ DIVSGN)};
            end
            if ((WE[1] && (ASEL == 0))) begin
                AX[15:8] <= (FASTDIN ? FASTDINH : ((DIVOP && ~(DIVEND)) ? RWAH[7:0] : RWAH[8:1]));
            end
            else if (DIVOP) begin
                AX[15:8] <= AX[14:7];
            end
            if ((WE[0] && (ASEL == 1))) begin
                CX[7:0] <= FDRW[7:0];
            end
            else if (DECCX) begin
                CX[7:0] <= CXM1[7:0];
            end
            if ((WE[1] && (ASEL == 1))) begin
                CX[15:8] <= (FASTDIN ? FASTDINH : RWHI);
            end
            else if (DECCX) begin
                CX[15:8] <= CXM1[15:8];
            end
            if ((WE[0] && (ASEL == 2))) begin
                DX[7:0] <= (FASTDIN ? DIN[7:0] : ((DIVOP && ~(DIVEND)) ? RWDL[7:0] : RWDL[8:1]));
            end
            if ((WE[1] && (ASEL == 2))) begin
                DX[15:8] <= (FASTDIN ? FASTDINH : ((DIVOP && ~(DIVEND)) ? RWDH[7:0] : RWDH[8:1]));
            end
            if ((WE[0] && (ASEL == 3))) begin
                BX[7:0] <= FDRW[7:0];
            end
            if ((WE[1] && (ASEL == 3))) begin
                BX[15:8] <= (FASTDIN ? FASTDINH : RWHI);
            end
            if ((WE[0] && (ASEL == 4))) begin
                SP <= FDRW;
            end
            else if (INCSP) begin
                SP <= ADDR16;
            end
            if ((WE[0] && (ASEL == 5))) begin
                BP <= FDRW;
            end
            if ((WE[0] && (ASEL == 6))) begin
                SI <= FDRW;
            end
            if ((WE[0] && (ASEL == 7))) begin
                DI <= FDRW;
            end
            if (WE[2]) begin
                case (RASEL[1:0])
                    0: begin
                        SREG[0] <= FDRW;
                    end
                    1: begin
                        SREG[1] <= FDRW;
                    end
                    2: begin
                        SREG[2] <= FDRW;
                    end
                    3: begin
                        SREG[3] <= FDRW;
                    end
                endcase
            end
            if (WE[3]) begin
                TMP16 <= (|(WE[1:0]) ? (&(DISEL[1:0]) ? DIN : ADDR16) : FDRW);
            end
            else begin
                TMP16 <= RA;
            end
            if (WE[4]) begin
                FLG <= {FIN[11:6], FIN[4], FIN[2], FIN[0]};
            end
            if (IFETCH) begin
                IP <= IPIN;
            end
        end
    end
endmodule
