module Next186_CPU (
    output logic[20:0] ADDR,
    input logic[15:0] DIN,
    output logic[15:0] DOUT,
    input logic CLK,
    input logic CE,
    input logic INTR,
    input logic NMI,
    input logic RST,
    output reg MREQ,
    output logic IORQ,
    output reg INTA,
    output reg WR,
    output reg WORD,
    output logic LOCK,
    output logic[20:0] IADDR,
    input logic[47:0] INSTR,
    output reg IFETCH,
    output logic FLUSH,
    output reg[2:0] ISIZE,
    output reg HALT
);
    wire logic[15:0] RA;
    wire logic[15:0] RB;
    wire logic[15:0] TMP16;
    wire logic[15:0] SP;
    wire logic[15:0] IP;
    wire logic[15:0] AX;
    wire logic[15:0] BX;
    wire logic[15:0] BP;
    wire logic[15:0] SI;
    wire logic[15:0] DI;
    wire logic[15:0] DX;
    wire logic [11:0] FLAGS;
    wire logic [11:0] FIN;
    wire logic[15:0] ALUOUT;
    wire logic[15:0] AIMM1;
    reg[15:0] DIMM1;
    wire logic[15:0] RS;
    wire logic[15:0] ADDR16;
    wire logic[15:0] CS;
    wire logic ALUCONT;
    wire logic NULLSHIFT;
    wire logic[1:0] CXZ;
    wire logic COUT;
    wire logic DIVEXC;
    reg[7:0] FETCH[5:0];
    reg[6:0] STAGE = 0;
    reg[5:0] CPUStatus = 0;
    reg TZF = 0;
    reg TLF = 0;
    reg SRST = 0;
    reg SNMI = 0;
    reg FNMI = 0;
    reg SINTR = 0;
    reg[15:0] CRTIP;
    reg DIVQSGN;
    reg RDIVEXC;
    reg[2:0] RASEL;
    reg[2:0] RBSEL;
    reg BASEL;
    reg[1:0] BBSEL;
    reg[1:0] RSSEL;
    reg[4:0] WE;
    reg[4:0] ALUOP;
    reg[3:0] EAC;
    reg[1:0] DISEL;
    reg[1:0] ISEL;
    reg ASEL;
    reg AEXT;
    reg DEXT;
    reg[1:0] DOSEL;
    reg IPWSEL;
    reg[5:0] status;
    reg NOBP;
    reg ALUSTAGE;
    reg DIVSTAGE;
    reg DISP16;
    reg DECCX;
    reg IRQ;
    reg[2:0] IRQL;
    reg REPINT;
    reg[5:0] ICODE1 = 23;
    reg NULLSEG;
    reg DIVOP;
    assign IORQ = &(EAC);
    assign LOCK = CPUStatus[5];
    assign FLUSH = (~(IPWSEL) || (ISIZE == 3'b0));
    wire logic[15:0] IPADD = ((ISIZE == 3'b0) ? CRTIP : (IP + ISIZE));
    wire logic[15:0] IPIN = (IPWSEL ? IPADD : ALUOUT);
    wire logic[1:0] MOD = FETCH[1][7:6];
    wire logic[2:0] REG = FETCH[1][5:3];
    wire logic[2:0] RM = FETCH[1][2:0];
    wire logic USEBP = (RM[1] && ~&(RM));
    wire logic POP = ({EAC[3], EAC[1:0]} == 3'b101);
    wire logic[15:0] ADDR16_SP = (POP ? SP : ADDR16);
    wire logic[1:0] WBIT = {(WORD | RASEL[2]), (WORD | !(RASEL[2]))};
    wire logic[1:0] ISELS = {(DISP16 | AEXT), ( ~(AEXT))};
    wire logic[2:0] ISIZES = (DISP16 ? 4 : (AEXT ? 3 : 2));
    reg[2:0] ISIZEW;
    reg[2:0] ISIZEI;
    wire logic[1:0] WRBIT = (WR ? 2'b0 : WBIT);
    wire logic RCXZ = (CPUStatus[4] && ~|(CXZ));
    wire logic NRORCXLE1 = (~(CPUStatus[4]) || ~(CXZ[1]));
    wire logic[7:0] JMPC = {((FLAGS[7] ^ FLAGS[11]) | FLAGS[6]), (FLAGS[7] ^ FLAGS[11]), FLAGS[2], FLAGS[7], (FLAGS[0] | FLAGS[6]), FLAGS[6], FLAGS[0], FLAGS[11]};
    wire logic[3:0] LOOPC = {(CXZ != 2'b0), (CXZ == 2'b1), ((CXZ == 2'b1) || !(FLAGS[6])), ((CXZ == 2'b1) || FLAGS[6])};
    wire logic IDIV = (FETCH[0][1] & FETCH[1][3]);
    wire logic DIVRSGN = ((WORD ? FETCH[3][7] : FETCH[2][7]) & IDIV);
    wire logic DIVSGN = (DIVQSGN ^ DIVRSGN);
    wire logic DIVEND = (FETCH[0][0] ? STAGE[6] : STAGE[5]);
    wire logic DIVC = ((COUT & ~(RDIVEXC)) ^ ~(DIVRSGN));
    wire logic QSGN = ((WORD ? DX[15] : AX[15]) & IDIV);
    wire logic SAMPLEINT = (((~((WE[2] & (RASEL[1:0] == 2'b10))) & ~(status[2])) & ~(status[4])) & ~(status[5]));
    wire logic NMIACK = (SNMI & ~(FNMI));
    wire logic INTRACK = ((FLAGS[9] & (~(WE[4]) | FIN[9])) & SINTR);
    wire logic IACK = (IRQ | (SAMPLEINT & ((NMIACK | INTRACK) | (~(HALT) & FLAGS[8]))));
    reg CMPS;
    reg SCAS;
    Next186_CPU_REGS REGS (
        .RASEL(RASEL),
        .RBSEL(RBSEL),
        .BASEL(BASEL),
        .BBSEL(BBSEL),
        .RSSEL(RSSEL),
        .DIN(DIN),
        .ALUOUT(ALUOUT),
        .ADDR16(ADDR16),
        .DIMM((DEXT ? {{8{DIMM1[7]}}, DIMM1[7:0]} : DIMM1)),
        .WE(WE),
        .IFETCH(IFETCH),
        .FIN({4'b0, FIN}),
        .DISEL(DISEL),
        .IPIN(IPIN),
        .WORD((WORD | &(DISEL))),
        .INCSP(POP),
        .DECCX(DECCX),
        .DIVOP(DIVOP),
        .DIVEND(DIVEND),
        .DIVC(DIVC),
        .DIVSGN(DIVSGN),
        .CXZ(CXZ),
        .FOUT(FLAGS),
        .RA(RA),
        .RB(RB),
        .TMP16(TMP16),
        .SP(SP),
        .IP(IP),
        .AX(AX),
        .BX(BX),
        .BP(BP),
        .SI(SI),
        .DI(DI),
        .RS(RS),
        .CS(CS),
        .DX(DX),
        .DIVEXC(DIVEXC),
        .CLK(CLK),
        .CLKEN(CE)
    );
    Next186_CPU_ALU16 ALU16 (
        .RA(((DOSEL == 2'b1) ? IPADD : RA)),
        .RB(RB),
        .TMP16(TMP16),
        .FETCH23({FETCH[3], FETCH[2]}),
        .FIN({4'b0, FLAGS}),
        .ALUOP(ALUOP),
        .EXOP(FETCH[1][5:3]),
        .FLAGOP(FETCH[0][3:0]),
        .WORD(WORD),
        .INC2(&(DISEL)),
        .FOUT(FIN),
        .ALUOUT(ALUOUT),
        .ALUCONT(ALUCONT),
        .NULLSHIFT(NULLSHIFT),
        .COUT(COUT),
        .STAGE(STAGE[2:0]),
        .CLK(CLK)
    );
    Next186_CPU_EA EA (
        .SP(SP),
        .BX(BX),
        .BP((NOBP ? 16'd0 : BP)),
        .SI(SI),
        .DI(DI),
        .PIO((FETCH[0][3] ? DX : {8'd0, FETCH[1]})),
        .TMP16(TMP16),
        .AL(AX[7:0]),
        .AIMM((AEXT ? {{8{AIMM1[7]}}, AIMM1[7:0]} : (DISP16 ? AIMM1 : 16'd0))),
        .EAC(EAC),
        .ADDR16(ADDR16)
    );
    assign DOUT = (DOSEL[1] ? (DOSEL[0] ? AX : TMP16) : (DOSEL[0] ? IPADD : ALUOUT));
    assign ADDR = {({(NULLSEG ? 16'd0 : RS)} + {5'b0, ADDR16_SP[15:4]}), ADDR16_SP[3:0]};
    assign IADDR = {(CS + {5'b0, IPIN[15:4]}), IPIN[3:0]};
    assign AIMM1 = (ASEL ? {FETCH[3], FETCH[2]} : {FETCH[2], FETCH[1]});
    always @(posedge CLK) begin
        if (CE) begin
            if (SRST) begin
                FETCH[0][0] <= 1'b1;
                ICODE1 <= 54;
                FETCH[5][1:0] <= 2'b1;
                STAGE <= 4'b1000;
            end
            else begin
                if ((IACK & ((IFETCH | HALT) | REPINT))) begin
                    FETCH[0][1:0] <= 2'b11;
                    ICODE1 <= 54;
                    STAGE <= 4'b1000;
                    FETCH[5][2:0] <= {HALT, 2'b0};
                    if (IRQ) begin
                        FETCH[2] <= ((IRQL != 3'b10) ? {5'b0, IRQL} : FETCH[1]);
                    end
                    else if (NMIACK) begin
                        FETCH[2] <= 8'd2;
                        FNMI <= 1'b1;
                    end
                    else if (INTRACK) begin
                        FETCH[5][1:0] <= 2'b10;
                    end
                    else begin
                        FETCH[2] <= 8'd1;
                    end
                end
                else if (IFETCH) begin
                    FETCH[5] <= INSTR[47:40];
                    FETCH[4] <= INSTR[39:32];
                    FETCH[3] <= INSTR[31:24];
                    FETCH[2] <= INSTR[23:16];
                    FETCH[1] <= INSTR[15:8];
                    FETCH[0] <= INSTR[7:0];
                    STAGE <= 0;
                    CPUStatus[5:0] <= status[5:0];
                    ICODE1 <= ICODE(INSTR[7:0]);
                end
                else begin
                    STAGE <= ((STAGE + {DIVSTAGE, ALUSTAGE}) + 1);
                    if (&(DOSEL)) begin
                        {FETCH[3], FETCH[2]} <= (|(DISEL) ? DIN : RB);
                    end
                    TZF <= FIN[6];
                    TLF <= (FIN[7] != FIN[11]);
                end
            end
            if ((((IFETCH & ~(status[2])) & ~(status[4])) & ~(status[5]))) begin
                CRTIP <= IPIN;
            end
            SRST <= RST;
            SINTR <= INTR;
            if (NMI) begin
                SNMI <= 1'b1;
            end
            else if (FNMI) begin
                SNMI <= 1'b0;
                FNMI <= 1'b0;
            end
            if (~|(STAGE[1:0])) begin
                DIVQSGN <= QSGN;
            end
            RDIVEXC <= ((DIVOP & DIVEXC) & ~(IDIV));
            CMPS <= ((~(FETCH[0][0]) | (FETCH[3] == DIN[15:8])) & (FETCH[2] == DIN[7:0]));
            SCAS <= ((~(FETCH[0][0]) | (AX[15:8] == DIN[15:8])) & (AX[7:0] == DIN[7:0]));
        end
    end
    always @(ISEL or FETCH[0] or FETCH[1] or FETCH[2] or FETCH[3] or FETCH[4] or FETCH[5]) begin
        case (ISEL)
            2'b0: begin
                DIMM1 = {FETCH[2], FETCH[1]};
            end
            2'b1: begin
                DIMM1 = {FETCH[3], FETCH[2]};
            end
            2'b10: begin
                DIMM1 = {FETCH[4], FETCH[3]};
            end
            2'b11: begin
                DIMM1 = {FETCH[5], FETCH[4]};
            end
        endcase
    end
    always @(FETCH[0] or WORD or DISP16 or AEXT) begin
        case ({WORD, DISP16, AEXT})
            3'b0: begin
                ISIZEW = 3;
            end
            3'b1, 3'b100: begin
                ISIZEW = 4;
            end
            3'b10, 3'b101: begin
                ISIZEW = 5;
            end
            default: begin
                ISIZEW = 6;
            end
        endcase
        case ({(FETCH[0][1:0] == 2'b1), DISP16, AEXT})
            3'b0: begin
                ISIZEI = 3;
            end
            3'b1, 3'b100: begin
                ISIZEI = 4;
            end
            3'b110: begin
                ISIZEI = 6;
            end
            default: begin
                ISIZEI = 5;
            end
        endcase
    end
    always @(FETCH[0] or FETCH[1] or FETCH[2] or FETCH[3] or FETCH[4] or FETCH[5] or MOD or REG or RM or CPUStatus or USEBP or NOBP or RASEL or ISIZEI or TLF or EAC or COUT or DIVEND or DIVC or QSGN or CMPS or SCAS or WBIT or ISIZES or ISELS or WRBIT or ISIZEW or STAGE or NULLSHIFT or ALUCONT or FLAGS or CXZ or RCXZ or NRORCXLE1 or TZF or JMPC or LOOPC or ICODE1 or DIVQSGN or DIVSGN or DIVRSGN or FIN or IDIV or AX) begin
        WORD = FETCH[0][0];
        BASEL = (FETCH[0][1] | &(MOD));
        RASEL = (FETCH[0][1] ? REG : RM);
        BBSEL = {1'b0, (!(FETCH[0][1]) | &(MOD))};
        RBSEL = (FETCH[0][1] ? RM : REG);
        RSSEL = (CPUStatus[2] ? CPUStatus[1:0] : ((USEBP && !(NOBP)) ? 2'b10 : 2'b11));
        WE = 5'b0;
        ALUOP = 5'bxxxxx;
        EAC = {1'b0, RM};
        DISEL = 2'b1;
        ISEL = 2'bxx;
        ASEL = 1'bx;
        AEXT = (MOD == 2'b1);
        DEXT = 1'b0;
        DOSEL = 2'b0;
        MREQ = 1'b1;
        WR = 1'b0;
        ISIZE = 3'bxxx;
        IPWSEL = 1'b1;
        IFETCH = 1'b1;
        status = 6'b0x0xx;
        DISP16 = ((MOD == 2'b10) || NOBP);
        NOBP = ({MOD, RM} == 5'b110);
        HALT = 1'b0;
        INTA = 1'b0;
        ALUSTAGE = 1'b0;
        DIVSTAGE = 1'b0;
        DECCX = 1'b0;
        IRQ = 1'b0;
        IRQL = 3'b110;
        REPINT = 1'b0;
        NULLSEG = 1'b0;
        DIVOP = 1'b0;
        case (ICODE1)
            0: begin
                if (FETCH[0][2]) begin
                    WORD = 1'b1;
                end
                if ((FETCH[0][2:1] == 2'b10)) begin
                    BBSEL = 2'b11;
                end
                ALUOP = 31;
                DISEL = {1'b0, &(MOD)};
                ASEL = 1'b1;
                IRQ = (FETCH[0][2] & FETCH[1][5]);
                MREQ = (~&(MOD) & ~(IRQ));
                WR = (MREQ & !(FETCH[0][1]));
                WE = ((WR | IRQ) ? 5'b0 : (&(FETCH[0][2:1]) ? {2'b0, (FETCH[1][4:3] != 2'b1), 2'b0} : {3'b0, WBIT}));
                ISIZE = (IRQ ? 0 : ISIZES);
            end
            1: begin
                RASEL = RM;
                BBSEL = 2'b10;
                ALUOP = 31;
                ISEL = ISELS;
                ASEL = 1'b1;
                MREQ = ~&(MOD);
                WR = MREQ;
                WE[1:0] = WRBIT;
                ISIZE = ISIZEW;
            end
            2: begin
                WORD = FETCH[0][3];
                RASEL = FETCH[0][2:0];
                BBSEL = 2'b10;
                WE[1:0] = WBIT;
                ALUOP = 31;
                ISEL = 2'b0;
                MREQ = 1'b0;
                ISIZE = (WORD ? 3 : 2);
            end
            3: begin
                RASEL = 0;
                BBSEL = 2'b1;
                RBSEL = 0;
                ALUOP = 31;
                EAC = 4'b110;
                DISEL = 2'b0;
                ASEL = 1'b0;
                AEXT = 1'b0;
                MREQ = 1'b1;
                WR = FETCH[0][1];
                WE[1:0] = WRBIT;
                ISIZE = 3;
                NOBP = 1'b1;
            end
            4: begin
                status = {CPUStatus[5:3], 1'b1, FETCH[0][4:3]};
                MREQ = 1'b0;
                ISIZE = 1;
            end
            5: begin
                status = {CPUStatus[5], 1'b1, FETCH[0][0], CPUStatus[2:0]};
                MREQ = 1'b0;
                ISIZE = 1;
            end
            6: begin
                status = {1'b1, CPUStatus[4:0]};
                MREQ = 1'b0;
                ISIZE = 1;
            end
            7: begin
                ISIZE = ISIZES;
                case ({FETCH[0][0], REG})
                    4'b1110: begin
                        if (!((&(MOD) || STAGE[0]))) begin
                            WE[3] = 1'b1;
                            DISEL = 2'b0;
                            ASEL = 1'b1;
                            IFETCH = 1'b0;
                        end
                        else begin
                            RASEL = 3'b100;
                            RSSEL = 2'b10;
                            ALUOP = 31;
                            WE[1:0] = 2'b11;
                            EAC = 4'b1000;
                            DISEL = 2'b10;
                            WR = 1'b1;
                        end
                    end
                    4'b0, 4'b1000, 4'b1, 4'b1001: begin
                        ASEL = 1'b1;
                        if (!((&(MOD) || STAGE[0]))) begin
                            WE[3] = 1'b1;
                            DISEL = 2'b0;
                            IFETCH = 1'b0;
                        end
                        else begin
                            BASEL = &(MOD);
                            RASEL = RM;
                            ALUOP = {2'b1, FETCH[1][5:3]};
                            MREQ = ~(BASEL);
                            WR = MREQ;
                            WE = {3'b100, WRBIT};
                        end
                    end
                    4'b1010, 4'b1100: begin
                        if ((!(STAGE[0]) && ~&(MOD))) begin
                            ASEL = 1'b1;
                            WE[3] = 1'b1;
                            DISEL = 2'b0;
                            IFETCH = 1'b0;
                        end
                        else begin
                            RASEL = 3'b100;
                            RSSEL = 2'b10;
                            ALUOP = 31;
                            EAC = 4'b1000;
                            DISEL = 2'b10;
                            DOSEL = 2'b1;
                            MREQ = REG[1];
                            WR = MREQ;
                            WE[1:0] = {WR, WR};
                            IPWSEL = 1'b0;
                        end
                    end
                    4'b1011, 4'b1101: begin
                        ALUOP = 31;
                        IRQ = &(MOD);
                        case ({STAGE[1:0], REG[1]})
                            3'b1: begin
                                RASEL = 3'b100;
                                BBSEL = 2'b11;
                                RBSEL = 3'b1;
                                RSSEL = 2'b10;
                                EAC = 4'b1000;
                                DISEL = 2'b10;
                                MREQ = ~(IRQ);
                                WR = MREQ;
                                IFETCH = IRQ;
                                WE[1:0] = (IRQ ? 2'b0 : 2'b11);
                                ISIZE = 0;
                            end
                            3'b11, 3'b0: begin
                                RASEL = 3'b100;
                                BBSEL = 2'b1;
                                RBSEL = 3'b100;
                                WE[3:0] = (IRQ ? 4'b0 : 4'b1011);
                                ASEL = 1'b1;
                                DOSEL = 2'b11;
                                IFETCH = IRQ;
                                MREQ = ~(IRQ);
                                ISIZE = 0;
                            end
                            3'b101, 3'b10: begin
                                RASEL = 3'b1;
                                WE[2] = 1'b1;
                                EAC = 4'b1011;
                                DISEL = 2'b0;
                                IFETCH = 1'b0;
                            end
                            3'b111, 3'b100: begin
                                RASEL = 3'b100;
                                BBSEL = 2'b10;
                                RSSEL = 2'b10;
                                EAC = 4'b1000;
                                DISEL = 2'b10;
                                DOSEL = 2'b1;
                                ISEL = 2'b1;
                                MREQ = REG[1];
                                WR = MREQ;
                                WE[1:0] = {WR, WR};
                                IPWSEL = 1'b0;
                            end
                        endcase
                    end
                    default: begin
                        MREQ = 1'b0;
                        IRQ = 1'b1;
                        ISIZE = 0;
                    end
                endcase
            end
            8: begin
                WORD = 1'b1;
                RASEL = 3'b100;
                BBSEL = {~(FETCH[0][6]), 1'b1};
                RBSEL = (FETCH[0][6] ? FETCH[0][2:0] : {1'b0, FETCH[0][4:3]});
                RSSEL = 2'b10;
                EAC = 4'b1000;
                DISEL = 2'b10;
                WE[1:0] = 2'b11;
                ALUOP = 31;
                WR = 1'b1;
                ISIZE = 1;
            end
            9: begin
                WORD = 1'b1;
                RASEL = 3'b100;
                BBSEL = 2'b10;
                RSSEL = 2'b10;
                WE[1:0] = 2'b11;
                ALUOP = 31;
                EAC = 4'b1000;
                DISEL = 2'b10;
                ISEL = 2'b0;
                DEXT = FETCH[0][1];
                WR = 1'b1;
                ISIZE = (FETCH[0][1] ? 2 : 3);
            end
            10: begin
                WORD = 1'b1;
                RASEL = 3'b100;
                RBSEL = STAGE[2:0];
                RSSEL = 2'b10;
                ALUOP = 31;
                EAC = 4'b1000;
                DISEL = 2'b10;
                WR = 1'b1;
                ISIZE = 1;
                IFETCH = (STAGE[2:0] == 3'b111);
                WE[1:0] = 2'b11;
                BASEL = (STAGE[1:0] == 2'b0);
                BBSEL[0] = (STAGE[2:0] != 3'b100);
            end
            11: begin
                case (REG)
                    3'b0: begin
                        ISIZE = ISIZES;
                        if (!(STAGE[0])) begin
                            RASEL = RM;
                            RSSEL = 2'b10;
                            EAC = 4'b1001;
                            DISEL = 2'b0;
                            IFETCH = &(MOD);
                            WE[3:0] = (IFETCH ? 4'b11 : 4'b1000);
                        end
                        else begin
                            RASEL = RM;
                            BBSEL = 2'b0;
                            ALUOP = 31;
                            ASEL = 1'b1;
                            MREQ = ~&(MOD);
                            WR = MREQ;
                            WE[1:0] = (WR ? 2'b0 : 2'b11);
                        end
                    end
                    default: begin
                        MREQ = 1'b0;
                        ISIZE = 0;
                        IRQ = 1'b1;
                    end
                endcase
            end
            12: begin
                WORD = 1'b1;
                RASEL = (FETCH[0][6] ? FETCH[0][2:0] : {1'b0, FETCH[0][4:3]});
                RSSEL = 2'b10;
                WE[2:0] = (FETCH[0][6] ? 3'b11 : 3'b100);
                EAC = 4'b1001;
                DISEL = 2'b0;
                ISIZE = 1;
            end
            13: begin
                RASEL = ~(STAGE[2:0]);
                RSSEL = 2'b10;
                EAC = 4'b1001;
                DISEL = 2'b0;
                ISIZE = 1;
                IFETCH = &(STAGE[2:0]);
                WE[1:0] = {((STAGE[2:0] == 3'b11) ? 2'b0 : 2'b11)};
            end
            14: begin
                WORD = (FETCH[0][0] | FETCH[0][4]);
                ASEL = 1'b1;
                MREQ = (~&(MOD) && !(FETCH[0][4]));
                ALUOP = 31;
                ISIZE = (FETCH[0][4] ? 1 : ISIZES);
                if (!(STAGE[0])) begin
                    BASEL = 1'b1;
                    RASEL = (FETCH[0][4] ? FETCH[0][2:0] : REG);
                    BBSEL = 2'b1;
                    RBSEL = (FETCH[0][4] ? 3'b0 : RM);
                    DISEL = {1'b0, !(MREQ)};
                    WE[1:0] = WBIT;
                    IFETCH = ~|(FETCH[0][2:0]);
                end
                else begin
                    RASEL = (FETCH[0][4] ? 3'b0 : RM);
                    BBSEL = 2'b0;
                    WR = MREQ;
                    WE[1:0] = WRBIT;
                end
            end
            15: begin
                RASEL = 3'b0;
                WE[1:0] = {WORD, 1'b1};
                DISEL = 2'b0;
                MREQ = 1'b0;
                ISIZE = (FETCH[0][3] ? 1 : 2);
                EAC = 4'b1111;
                NULLSEG = 1'b1;
            end
            16: begin
                DOSEL = 2'b11;
                MREQ = 1'b0;
                WR = 1'b1;
                ISIZE = (FETCH[0][3] ? 1 : 2);
                EAC = 4'b1111;
                NULLSEG = 1'b1;
            end
            17: begin
                WORD = 1'b0;
                RASEL = 3'b0;
                WE[0] = 1'b1;
                EAC = 4'b1010;
                DISEL = 2'b0;
                ISIZE = 1;
                NOBP = 1'b1;
            end
            18: begin
                RASEL = REG;
                WE[1:0] = {(&(MOD) ? 2'b0 : 2'b11)};
                DISEL = 2'b10;
                ASEL = 1'b1;
                MREQ = 1'b0;
                ISIZE = ISIZES;
            end
            19: begin
                WORD = 1'b1;
                DISEL = 2'b0;
                ASEL = 1'b1;
                if (!(STAGE[0])) begin
                    RASEL = REG;
                    IFETCH = &(MOD);
                    IRQ = IFETCH;
                    ISIZE = 0;
                    WE[3:0] = {2'b10, (IFETCH ? 2'b0 : 2'b11)};
                end
                else begin
                    RASEL = (FETCH[0][0] ? 3'b11 : 3'b0);
                    WE[2] = 1'b1;
                    EAC = 4'b1011;
                    ISIZE = ISIZES;
                end
            end
            20: begin
                WORD = 1'b0;
                RASEL = 3'b100;
                WE = {!(FETCH[0][0]), 2'b0, FETCH[0][0], 1'b0};
                ALUOP = (FETCH[0][0] ? 30 : 31);
                MREQ = 1'b0;
                ISIZE = 1;
            end
            21: begin
                WORD = 1'b1;
                RASEL = 3'b100;
                RSSEL = 2'b10;
                WE[1:0] = 2'b11;
                ALUOP = 30;
                EAC = 4'b1000;
                DISEL = 2'b10;
                WR = 1'b1;
                ISIZE = 1;
            end
            22: begin
                ISIZE = 1;
                IFETCH = STAGE[0];
                if (!(STAGE[0])) begin
                    RSSEL = 2'b10;
                    WE[3] = 1'b1;
                    EAC = 4'b1001;
                    DISEL = 2'b0;
                end
                else begin
                    BASEL = 1'b0;
                    WE[4] = 1'b1;
                    ALUOP = 31;
                    MREQ = 1'b0;
                end
            end
            23: begin
                ASEL = 1'b1;
                if (!((&(MOD) || STAGE[0]))) begin
                    WE[3] = 1'b1;
                    DISEL = 2'b0;
                    IFETCH = 1'b0;
                end
                else begin
                    ALUOP = {2'b0, (FETCH[0][2] ? 3'b100 : FETCH[0][5:3])};
                    MREQ = ((~&(MOD) & ~|(FETCH[0][2:1])) & ~&(FETCH[0][5:3]));
                    WR = MREQ;
                    WE = {3'b100, (((WR | &(FETCH[0][5:3])) | FETCH[0][2]) ? 2'b0 : WBIT)};
                    ISIZE = ISIZES;
                end
            end
            24: begin
                ASEL = 1'b1;
                if (!((&(MOD) || STAGE[0]))) begin
                    WE[3] = 1'b1;
                    DISEL = 2'b0;
                    IFETCH = 1'b0;
                end
                else begin
                    BASEL = &(MOD);
                    RASEL = RM;
                    BBSEL = 2'b10;
                    ALUOP = {2'b0, FETCH[1][5:3]};
                    ISEL = ISELS;
                    DEXT = FETCH[0][1];
                    MREQ = (~(BASEL) & ~&(FETCH[1][5:3]));
                    WR = MREQ;
                    WE = {3'b100, ((WR | &(FETCH[1][5:3])) ? 2'b0 : WBIT)};
                    ISIZE = ISIZEI;
                end
            end
            25: begin
                BASEL = 1'b1;
                RASEL = 3'b0;
                BBSEL = 2'b10;
                WE = {3'b100, ((&(FETCH[0][5:3]) | FETCH[0][7]) ? 2'b0 : WBIT)};
                ALUOP = {2'b0, (FETCH[0][7] ? 3'b100 : FETCH[0][5:3])};
                ISEL = 2'b0;
                MREQ = 1'b0;
                ISIZE = (WORD ? 3 : 2);
            end
            26: begin
                WORD = 1'b1;
                BASEL = 1'b1;
                RASEL = FETCH[0][2:0];
                WE = 5'b10011;
                ALUOP = {2'b1, FETCH[0][5:3]};
                MREQ = 1'b0;
                ISIZE = 1;
            end
            27: begin
                ASEL = 1'b1;
                case (REG)
                    3'b0: begin
                        if (!((&(MOD) || |(STAGE[1:0])))) begin
                            DISEL = 2'b0;
                            WE[3] = 1'b1;
                            IFETCH = 1'b0;
                        end
                        else begin
                            BASEL = &(MOD);
                            RASEL = RM;
                            BBSEL = 2'b10;
                            ALUOP = 5'b100;
                            ISEL = ISELS;
                            MREQ = 1'b0;
                            WE[4] = 1'b1;
                            ISIZE = ISIZEW;
                        end
                    end
                    3'b10, 3'b11: begin
                        if (!((&(MOD) || |(STAGE[1:0])))) begin
                            DISEL = 2'b0;
                            WE[3] = 1'b1;
                            IFETCH = 1'b0;
                        end
                        else begin
                            BASEL = &(MOD);
                            RASEL = RM;
                            ALUOP = {2'b1, REG};
                            MREQ = ~&(MOD);
                            WR = MREQ;
                            WE = {REG[0], 2'b0, WRBIT};
                            ISIZE = ISIZES;
                        end
                    end
                    3'b100, 3'b101: begin
                        ISIZE = ISIZES;
                        ALUOP = {4'b1000, REG[0]};
                        WE[4] = 1'b1;
                        case (STAGE[1:0])
                            2'b0: begin
                                MREQ = ~&(MOD);
                                DISEL = {1'b0, MREQ};
                                RASEL = 3'b0;
                                DOSEL = 2'b11;
                                IFETCH = 1'b0;
                            end
                            2'b1: begin
                                WE[1:0] = 2'b11;
                                RASEL = 3'b0;
                                MREQ = 1'b0;
                                IFETCH = ~(FETCH[0][0]);
                            end
                            2'b10: begin
                                WE[1:0] = 2'b11;
                                RASEL = 3'b10;
                                MREQ = 1'b0;
                            end
                        endcase
                    end
                    3'b110, 3'b111: begin
                        ISIZE = ISIZES;
                        IRQL = 3'b0;
                        MREQ = 1'b0;
                        case ({DIVEND, STAGE[1:0]})
                            3'b0: begin
                                MREQ = ~&(MOD);
                                DISEL = {1'b0, MREQ};
                                DOSEL = 2'b11;
                                IFETCH = 1'b0;
                                DIVSTAGE = ~(QSGN);
                            end
                            3'b1: begin
                                RASEL = 3'b0;
                                WE[1:0] = 2'b11;
                                ALUOP = 5'b1001;
                                IFETCH = 1'b0;
                                ALUSTAGE = ~(((DIVQSGN && FETCH[0][0]) && COUT));
                            end
                            3'b10: begin
                                RASEL = 3'b10;
                                WE[1:0] = 2'b11;
                                ALUOP = 5'b1001;
                                IFETCH = 1'b0;
                            end
                            3'b11, 3'b111: begin
                                RASEL = (WORD ? 3'b10 : 3'b100);
                                BBSEL = 2'b10;
                                WE[1:0] = {1'b1, WORD};
                                ALUOP = {2'b0, (DIVSGN ? 3'b0 : 3'b101)};
                                ISEL = 2'b1;
                                DIVSTAGE = ~(DIVEND);
                                ALUSTAGE = (~(DIVEND) | ~(DIVQSGN));
                                DIVOP = 1'b1;
                                IRQ = ((~|(STAGE[6:3]) & DIVC) & (~(STAGE[2]) | (~(DIVSGN) & IDIV)));
                                IFETCH = (((DIVEND && ~(DIVQSGN)) && ~(DIVRSGN)) || IRQ);
                            end
                            3'b100: begin
                                RASEL = (WORD ? 3'b10 : 3'b100);
                                WE[1:0] = {1'b1, WORD};
                                ALUOP = 5'b1000;
                                IFETCH = ~(DIVSGN);
                            end
                            default: begin
                                RASEL = 3'b0;
                                WE[1:0] = {WORD, 1'b1};
                                ALUOP = 5'b1000;
                                IRQ = ~((FIN[7] | (FETCH[0][0] ? AX[15] : AX[7])));
                            end
                        endcase
                    end
                    default: begin
                        MREQ = 1'b0;
                        ISIZE = 0;
                        IRQ = 1'b1;
                    end
                endcase
            end
            28: begin
                ASEL = 1'b1;
                if (!(STAGE[0])) begin
                    RASEL = RM;
                    DISEL = 2'b0;
                    DOSEL = 2'b11;
                    ISEL = ISELS;
                    DEXT = FETCH[0][1];
                    BBSEL = 2'b10;
                    MREQ = ~&(MOD);
                    WE[3] = MREQ;
                    IFETCH = 1'b0;
                end
                else begin
                    RASEL = REG;
                    ALUOP = 5'b10001;
                    MREQ = 1'b0;
                    WE = 5'b10011;
                    ISIZE = ISIZEI;
                end
            end
            29: begin
                MREQ = 1'b0;
                WORD = 1'b0;
                BASEL = 1'b1;
                IFETCH = &(STAGE[1:0]);
                case (STAGE[1:0])
                    2'b0: begin
                        RASEL = 3'b100;
                        DISEL = 2'b0;
                        DOSEL = 2'b11;
                        ISEL = 2'b0;
                        BBSEL = 2'b10;
                    end
                    2'b1: begin
                        ALUOP = 5'b10000;
                        WE[3] = 1'b1;
                    end
                    2'b10: begin
                        RASEL = 3'b0;
                        BBSEL = 2'b0;
                        WE = 5'b10001;
                        ALUOP = 5'b0;
                    end
                    2'b11: begin
                        RASEL = 3'b100;
                        RBSEL = 3'b100;
                        WE[1] = 1'b1;
                        ALUOP = 5'b101;
                        ISIZE = 2;
                    end
                endcase
            end
            30: begin
                WORD = FETCH[0][4];
                RASEL = 3'b0;
                WE = {3'b100, FETCH[0][4], 1'b1};
                ALUOP = {2'b1, FETCH[0][5:3]};
                MREQ = 1'b0;
                ISIZE = 1;
            end
            31: begin
                ALUOP = {4'b1110, (FETCH[0][4:1] != 4'b1000)};
                ASEL = 1'b1;
                if (!((&(MOD) || STAGE[0]))) begin
                    WE[3] = 1'b1;
                    DISEL = 2'b0;
                    IFETCH = 1'b0;
                end
                else begin
                    BASEL = (&(MOD) && ~|(STAGE[2:1]));
                    RASEL = RM;
                    BBSEL = (FETCH[0][1] ? 2'b1 : 2'b10);
                    RBSEL = 3'b1;
                    ISEL = ISELS;
                    IRQ = (REG == 3'b110);
                    MREQ = (((~&(MOD) && ~(NULLSHIFT)) && ~(ALUCONT)) && ~(IRQ));
                    WR = MREQ;
                    WE = ((NULLSHIFT || IRQ) ? 5'b0 : (ALUCONT ? 5'b11000 : {3'b100, WRBIT}));
                    IFETCH = (~(ALUCONT) || IRQ);
                    ALUSTAGE = 1'b1;
                    if (IRQ) begin
                        ISIZE = 0;
                    end
                    else begin
                        case ({|(FETCH[0][4:1]), DISP16, AEXT})
                            3'b100: begin
                                ISIZE = 2;
                            end
                            3'b0, 3'b101: begin
                                ISIZE = 3;
                            end
                            3'b1, 3'b110: begin
                                ISIZE = 4;
                            end
                            default: begin
                                ISIZE = 5;
                            end
                        endcase
                    end
                end
            end
            32: begin
                BASEL = 1'b1;
                AEXT = 1'b0;
                DISP16 = 1'b0;
                NOBP = 1'b1;
                if (!(STAGE[0])) begin
                    RASEL = 3'b110;
                    ALUOP = {4'b100, FLAGS[10]};
                    EAC = 4'b100;
                    DISEL = 2'b11;
                    IFETCH = RCXZ;
                    MREQ = ~(RCXZ);
                    WE = (IFETCH ? 5'b0 : 5'b1011);
                end
                else begin
                    RASEL = 3'b111;
                    RSSEL = 2'b0;
                    WE[1:0] = 2'b11;
                    ALUOP = {4'b100, FLAGS[10]};
                    EAC = 4'b101;
                    DISEL = 2'b11;
                    DOSEL = 2'b10;
                    WR = 1'b1;
                    IFETCH = NRORCXLE1;
                    DECCX = CPUStatus[4];
                    REPINT = 1'b1;
                end
                ISIZE = (IFETCH ? 1 : 0);
            end
            33: begin
                DISP16 = 1'b0;
                AEXT = 1'b0;
                NOBP = 1'b1;
                case (STAGE[1:0])
                    2'b0: begin
                        RASEL = 3'b111;
                        RSSEL = 2'b0;
                        ALUOP = {4'b100, FLAGS[10]};
                        EAC = 4'b101;
                        DISEL = 2'b11;
                        DOSEL = 2'b11;
                        IFETCH = RCXZ;
                        MREQ = ~(RCXZ);
                        WE[1:0] = (IFETCH ? 2'b0 : 2'b11);
                    end
                    2'b1: begin
                        RASEL = 3'b110;
                        ALUOP = {4'b100, FLAGS[10]};
                        EAC = 4'b100;
                        DISEL = 2'b11;
                        IFETCH = 1'b0;
                        WE[3:0] = 4'b1011;
                    end
                    2'b10: begin
                        BASEL = 1'b0;
                        BBSEL = 2'b10;
                        ISEL = 2'b1;
                        WE[4] = 1'b1;
                        ALUOP = 5'b111;
                        MREQ = 1'b0;
                        IFETCH = (NRORCXLE1 | (CPUStatus[3] ^ CMPS));
                        DECCX = CPUStatus[4];
                        ALUSTAGE = 1'b1;
                        REPINT = 1'b1;
                    end
                endcase
                ISIZE = (IFETCH ? 1 : 0);
            end
            34: begin
                DISP16 = 1'b0;
                AEXT = 1'b0;
                if (!(STAGE[0])) begin
                    RASEL = 3'b111;
                    RSSEL = 2'b0;
                    ALUOP = {4'b100, FLAGS[10]};
                    EAC = 4'b101;
                    DISEL = 2'b11;
                    IFETCH = RCXZ;
                    MREQ = ~(RCXZ);
                    WE[3:0] = (IFETCH ? 4'b0 : 4'b1011);
                end
                else begin
                    RASEL = 3'b0;
                    BBSEL = 2'b0;
                    WE[4] = 1'b1;
                    ALUOP = 5'b111;
                    MREQ = 1'b0;
                    IFETCH = (NRORCXLE1 | (CPUStatus[3] ^ SCAS));
                    DECCX = CPUStatus[4];
                    REPINT = 1'b1;
                end
                ISIZE = (IFETCH ? 1 : 0);
            end
            35: begin
                BASEL = 1'b1;
                DISP16 = 1'b0;
                AEXT = 1'b0;
                NOBP = 1'b1;
                if (!(STAGE[0])) begin
                    RASEL = 3'b0;
                    EAC = 4'b100;
                    DISEL = 2'b0;
                    IFETCH = RCXZ;
                    MREQ = ~(RCXZ);
                    WE[1:0] = (IFETCH ? 2'b0 : {WORD, 1'b1});
                end
                else begin
                    RASEL = 3'b110;
                    ALUOP = {4'b100, FLAGS[10]};
                    DISEL = 2'b11;
                    IFETCH = NRORCXLE1;
                    MREQ = 1'b0;
                    WE[1:0] = 2'b11;
                    DECCX = CPUStatus[4];
                    REPINT = 1'b1;
                end
                ISIZE = (IFETCH ? 1 : 0);
            end
            36: begin
                BASEL = 1'b1;
                DISP16 = 1'b0;
                AEXT = 1'b0;
                RASEL = 3'b111;
                RSSEL = 2'b0;
                ALUOP = {4'b100, FLAGS[10]};
                EAC = 4'b101;
                DISEL = 2'b11;
                DOSEL = 2'b11;
                IFETCH = NRORCXLE1;
                MREQ = ~(RCXZ);
                WR = ~(RCXZ);
                WE[1:0] = {MREQ, MREQ};
                DECCX = (CPUStatus[4] && |(CXZ));
                REPINT = 1'b1;
                ISIZE = (IFETCH ? 1 : 0);
            end
            37: begin
                BASEL = 1'b1;
                DISP16 = 1'b0;
                AEXT = 1'b0;
                if (!(STAGE[0])) begin
                    WE[3] = 1'b1;
                    DISEL = 2'b0;
                    IFETCH = RCXZ;
                    MREQ = 1'b0;
                    EAC = {~(RCXZ), 3'b111};
                    NULLSEG = 1'b1;
                end
                else begin
                    RASEL = 3'b111;
                    RSSEL = 2'b0;
                    WE[1:0] = 2'b11;
                    ALUOP = {4'b100, FLAGS[10]};
                    EAC = 4'b101;
                    DISEL = 2'b11;
                    DOSEL = 2'b10;
                    WR = 1'b1;
                    IFETCH = NRORCXLE1;
                    DECCX = CPUStatus[4];
                    REPINT = 1'b1;
                end
                ISIZE = (IFETCH ? 1 : 0);
            end
            38: begin
                BASEL = 1'b1;
                DISP16 = 1'b0;
                NOBP = 1'b1;
                if (!(STAGE[0])) begin
                    AEXT = 1'b0;
                    RASEL = 3'b110;
                    ALUOP = {4'b100, FLAGS[10]};
                    EAC = 4'b100;
                    DISEL = 2'b11;
                    IFETCH = RCXZ;
                    MREQ = ~(RCXZ);
                    WE[3:0] = (IFETCH ? 4'b0 : 4'b1011);
                end
                else begin
                    DOSEL = 2'b10;
                    MREQ = 1'b0;
                    EAC = 4'b1111;
                    WR = 1'b1;
                    IFETCH = NRORCXLE1;
                    DECCX = CPUStatus[4];
                    REPINT = 1'b1;
                    NULLSEG = 1'b1;
                end
                ISIZE = (IFETCH ? 1 : 0);
            end
            39: begin
                WORD = 1'b1;
                ALUOP = 0;
                DISEL = 2'b10;
                ISIZE = (FETCH[0][1] ? 2 : 3);
                RASEL = 3'b100;
                RSSEL = 2'b10;
                DOSEL = 2'b1;
                EAC = 4'b1000;
                BBSEL = 2'b10;
                ISEL = 2'b0;
                DEXT = FETCH[0][1];
                MREQ = !(FETCH[0][0]);
                WR = MREQ;
                WE[1:0] = (FETCH[0][0] ? 2'b0 : 2'b11);
                IPWSEL = 1'b0;
            end
            40: begin
                WORD = 1'b1;
                ALUOP = 31;
                case ({STAGE[1:0], FETCH[0][6]})
                    3'b0: begin
                        RASEL = 3'b100;
                        BBSEL = 2'b11;
                        RBSEL = 3'b1;
                        RSSEL = 2'b10;
                        EAC = 4'b1000;
                        DISEL = 2'b10;
                        WR = 1'b1;
                        IFETCH = 1'b0;
                        WE[1:0] = 2'b11;
                    end
                    3'b10, 3'b1: begin
                        RASEL = 3'b1;
                        BBSEL = 2'b10;
                        WE[2] = 1'b1;
                        ISEL = 2'b10;
                        MREQ = 1'b0;
                        IFETCH = 1'b0;
                    end
                    3'b100, 3'b11: begin
                        RASEL = 3'b100;
                        BBSEL = 2'b10;
                        RSSEL = 2'b10;
                        EAC = 4'b1000;
                        DISEL = 2'b10;
                        DOSEL = 2'b1;
                        ISEL = 2'b0;
                        MREQ = FETCH[0][4];
                        WR = MREQ;
                        WE[1:0] = {WR, WR};
                        IPWSEL = 1'b0;
                        ISIZE = 5;
                    end
                endcase
            end
            41: begin
                WORD = 1'b1;
                ISIZE = (FETCH[0][0] ? 1 : 3);
                IFETCH = STAGE[0];
                ALUOP = 31;
                if (!(STAGE[0])) begin
                    RSSEL = 2'b10;
                    WE[3] = 1'b1;
                    ASEL = 1'b0;
                    AEXT = 1'b0;
                    DISP16 = 1'b1;
                    EAC = {1'b1, !(FETCH[0][0]), 2'b1};
                    DISEL = 2'b0;
                end
                else begin
                    BBSEL = 2'b0;
                    IPWSEL = 1'b0;
                    MREQ = 1'b0;
                end
            end
            42: begin
                WORD = 1'b1;
                ALUOP = 31;
                RSSEL = 2'b10;
                IFETCH = STAGE[1];
                DISEL = 2'b0;
                case (STAGE[1:0])
                    2'b0: begin
                        WE[3] = 1'b1;
                        EAC = 4'b1001;
                    end
                    2'b1: begin
                        RASEL = 3'b1;
                        WE[2] = 1'b1;
                        EAC = {1'b1, !(FETCH[0][0]), 2'b1};
                        ASEL = 1'b0;
                        AEXT = 1'b0;
                        DISP16 = 1'b1;
                        BASEL = 1'b0;
                    end
                    2'b10: begin
                        BBSEL = 2'b0;
                        IPWSEL = 1'b0;
                        MREQ = 1'b0;
                        ISIZE = (FETCH[0][0] ? 1 : 3);
                    end
                endcase
            end
            43: begin
                ALUOP = 31;
                RSSEL = 2'b10;
                ISIZE = 1;
                IFETCH = &(STAGE[1:0]);
                case (STAGE[1:0])
                    2'b0: begin
                        EAC = 4'b1001;
                        DOSEL = 2'b11;
                    end
                    2'b1: begin
                        RASEL = 3'b1;
                        WE[2] = 1'b1;
                        EAC = {1'b1, !(FETCH[0][0]), 2'b1};
                        DISEL = 2'b0;
                        ASEL = 1'b0;
                        AEXT = 1'b0;
                        DISP16 = 1'b1;
                    end
                    2'b10: begin
                        WE[3] = 1'b1;
                        EAC = 4'b1001;
                        DISEL = 2'b0;
                    end
                    2'b11: begin
                        BASEL = 1'b0;
                        BBSEL = 2'b10;
                        WE[4] = 1'b1;
                        ISEL = 2'b1;
                        DEXT = 1'b0;
                        IPWSEL = 1'b0;
                        MREQ = 1'b0;
                    end
                endcase
            end
            44: begin
                RASEL = (FETCH[0][0] ? 3'b10 : 3'b100);
                RBSEL = 3'b0;
                WE[1:0] = {1'b1, FETCH[0][0]};
                ALUOP = {4'b1101, FETCH[0][0]};
                MREQ = 1'b0;
                ISIZE = 1;
            end
            45: begin
                ALUOP = 0;
                ISIZE = 2;
                DOSEL = 2'b1;
                BBSEL = 2'b10;
                ISEL = 2'b0;
                DEXT = 1'b1;
                MREQ = 1'b0;
                IPWSEL = (FETCH[0][7] ? LOOPC[FETCH[0][1:0]] : (JMPC[FETCH[0][3:1]] ~^ FETCH[0][0]));
                DECCX = (FETCH[0][7] && (FETCH[0][1:0] != 2'b11));
            end
            46: begin
                WE[4] = 1'b1;
                ALUOP = 5'b11001;
                ISIZE = 1;
                MREQ = 1'b0;
            end
            47: begin
                WORD = 1'b1;
                WE[1:0] = 2'b11;
                case (STAGE[1:0])
                    2'b0: begin
                        RASEL = 3'b100;
                        RBSEL = 3'b101;
                        RSSEL = 2'b10;
                        EAC = 4'b1000;
                        DISEL = 2'b10;
                        ALUOP = 31;
                        WR = 1'b1;
                        IFETCH = 1'b0;
                    end
                    2'b1: begin
                        RASEL = 3'b101;
                        RBSEL = 3'b100;
                        ALUOP = 31;
                        MREQ = 1'b0;
                        IFETCH = 1'b0;
                    end
                    2'b10: begin
                        BASEL = 1'b1;
                        RASEL = 3'b100;
                        BBSEL = 2'b10;
                        ALUOP = 5'b101;
                        ISEL = 2'b0;
                        MREQ = 1'b0;
                        ISIZE = 4;
                    end
                endcase
            end
            48: begin
                WE[1:0] = 2'b11;
                if (!(STAGE[0])) begin
                    RASEL = 3'b100;
                    RBSEL = 3'b101;
                    ALUOP = 31;
                    MREQ = 1'b0;
                    IFETCH = 1'b0;
                end
                else begin
                    RASEL = 3'b101;
                    RSSEL = 2'b10;
                    EAC = 4'b1001;
                    DISEL = 2'b0;
                    ISIZE = 1;
                end
            end
            49: begin
                MREQ = 1'b0;
                ISIZE = ((FETCH[0][1:0] == 2'b1) ? 2 : 1);
                IRQ = (~(FETCH[0][1]) | FLAGS[11]);
                IRQL = (FETCH[0][1] ? 3'b100 : {1'b0, ~(FETCH[0][1:0])});
            end
            50: begin
                WORD = 1'b1;
                DOSEL = 2'b11;
                case (STAGE[1:0])
                    2'b0: begin
                        RASEL = 3'b100;
                        BBSEL = 2'b1;
                        RBSEL = 3'b100;
                        ALUOP = 31;
                        WE[3:0] = 4'b1011;
                        ASEL = 1'b1;
                        IRQ = &(MOD);
                        ISIZE = 0;
                        IFETCH = IRQ;
                    end
                    2'b1, 2'b10, 2'b11: begin
                        BBSEL = 2'b10;
                        ALUOP = 5'b111;
                        EAC = 4'b1011;
                        ISEL = 2'b1;
                        IRQ = (STAGE[1] & (STAGE[0] ? (~(TLF) & ~(TZF)) : TLF));
                        MREQ = ~&(STAGE[1:0]);
                        IFETCH = (IRQ | ~(MREQ));
                        IRQL = 3'b101;
                        ISIZE = (IRQ ? 0 : ISIZES);
                    end
                endcase
            end
            51: begin
                IFETCH = 1'b0;
                HALT = 1'b1;
                MREQ = 1'b0;
            end
            52: begin
                ISIZE = 1;
                MREQ = 1'b0;
            end
            53: begin
                MREQ = 1'b0;
                IRQL = 3'b0;
                ISIZE = 2;
                case ({DIVEND, STAGE[1:0]})
                    3'b0: begin
                        BASEL = 1'b0;
                        RASEL = 3'b100;
                        BBSEL = 2'b0;
                        WE[1] = 1'b1;
                        ALUOP = 5'b101;
                        IFETCH = 1'b0;
                    end
                    3'b1, 3'b101: begin
                        RASEL = 3'b100;
                        BASEL = 1'b1;
                        BBSEL = 2'b10;
                        WE[1] = 1'b1;
                        ALUOP = 5'b101;
                        ISEL = 2'b0;
                        DIVSTAGE = ~(DIVEND);
                        ALUSTAGE = ~(DIVEND);
                        DIVOP = 1'b1;
                        IRQ = (~|(STAGE[6:2]) & DIVC);
                        IFETCH = IRQ;
                    end
                    3'b110: begin
                        RASEL = 3'b100;
                        BASEL = 1'b1;
                        RBSEL = 3'b0;
                        WE[1] = 1'b1;
                        ALUOP = 31;
                        IFETCH = 1'b0;
                    end
                    3'b111: begin
                        RASEL = 3'b0;
                        BASEL = 1'b0;
                        BBSEL = 2'b0;
                        WE = 5'b10001;
                        ALUOP = 5'b1;
                    end
                endcase
            end
            54: begin
                if (STAGE[3]) begin
                    if (FETCH[5][0]) begin
                        RASEL = {1'b0, STAGE[1:0]};
                        WE = 5'b11100;
                        BASEL = 1'b0;
                        BBSEL = 2'b0;
                        ALUOP = (STAGE[0] ? (STAGE[1] ? 31 : 5'b1001) : 5'b101);
                        MREQ = 1'b0;
                        IPWSEL = 1'b0;
                        IFETCH = &(STAGE[1:0]);
                    end
                    else begin
                        case ({FETCH[5][1], STAGE[2:0]})
                            4'b1000: begin
                                DOSEL = 2'b11;
                                MREQ = 1'b0;
                                IFETCH = 1'b0;
                                INTA = 1'b1;
                            end
                            4'b1001, 4'b0: begin
                                RASEL = 3'b100;
                                RSSEL = 2'b10;
                                WE = 5'b10011;
                                ALUOP = 30;
                                EAC = 4'b1000;
                                DISEL = 2'b10;
                                WR = 1'b1;
                                IFETCH = 1'b0;
                            end
                            4'b1010, 4'b1: begin
                                RASEL = 3'b100;
                                BBSEL = 2'b11;
                                RBSEL = 3'b1;
                                RSSEL = 2'b10;
                                ALUOP = 31;
                                EAC = 4'b1000;
                                DISEL = 2'b10;
                                WR = 1'b1;
                                IFETCH = 1'b0;
                                WE[1:0] = 2'b11;
                            end
                            4'b1011, 4'b10: begin
                                RASEL = 3'b100;
                                BBSEL = 2'b1;
                                RBSEL = 3'b100;
                                ALUOP = 31;
                                EAC = 4'b1110;
                                WE[3:0] = 4'b1011;
                                ASEL = 1'b1;
                                DISP16 = 1'b1;
                                DOSEL = 2'b11;
                                IFETCH = 1'b0;
                                NULLSEG = 1'b1;
                            end
                            4'b1100, 4'b11: begin
                                RASEL = 3'b1;
                                WE[2] = 1'b1;
                                EAC = 4'b1011;
                                DISEL = 2'b0;
                                IFETCH = 1'b0;
                                NULLSEG = 1'b1;
                            end
                            4'b1101, 4'b100: begin
                                RASEL = 3'b100;
                                BBSEL = 2'b10;
                                RSSEL = 2'b10;
                                ALUOP = 31;
                                EAC = 4'b1000;
                                DISEL = 2'b10;
                                DOSEL = 2'b1;
                                ISEL = 2'b1;
                                WR = 1'b1;
                                WE[1:0] = 2'b11;
                                ISIZE = (FETCH[5][2] ? 1 : 0);
                                IPWSEL = 1'b0;
                            end
                        endcase
                    end
                end
                else begin
                    MREQ = 1'b0;
                    ISIZE = 0;
                    IRQ = 1'b1;
                end
            end
            default: begin
                MREQ = 1'b0;
                ISIZE = 0;
                IRQ = 1'b1;
                if ((FETCH[0][7:3] == 5'b11011)) begin
                    IRQL = 3'b111;
                end
            end
        endcase
    end
    function logic[5:0] ICODE(input logic[7:0] INSTR);
        case (INSTR[7:0])
            8'd136, 8'd137, 8'd138, 8'd139, 8'd142, 8'd140: begin
                ICODE = 0;
            end
            8'd198, 8'd199: begin
                ICODE = 1;
            end
            8'd176, 8'd177, 8'd178, 8'd179, 8'd180, 8'd181, 8'd182, 8'd183, 8'd184, 8'd185, 8'd186, 8'd187, 8'd188, 8'd189, 8'd190, 8'd191: begin
                ICODE = 2;
            end
            8'd160, 8'd161, 8'd162, 8'd163: begin
                ICODE = 3;
            end
            8'd38, 8'd46, 8'd54, 8'd62: begin
                ICODE = 4;
            end
            8'd242, 8'd243: begin
                ICODE = 5;
            end
            8'd240: begin
                ICODE = 6;
            end
            8'd255, 8'd254: begin
                ICODE = 7;
            end
            8'd80, 8'd81, 8'd82, 8'd83, 8'd84, 8'd85, 8'd86, 8'd87, 8'd6, 8'd14, 8'd22, 8'd30: begin
                ICODE = 8;
            end
            8'd104, 8'd106: begin
                ICODE = 9;
            end
            8'd96: begin
                ICODE = 10;
            end
            8'd143: begin
                ICODE = 11;
            end
            8'd88, 8'd89, 8'd90, 8'd91, 8'd92, 8'd93, 8'd94, 8'd95, 8'd7, 8'd23, 8'd31: begin
                ICODE = 12;
            end
            8'd97: begin
                ICODE = 13;
            end
            8'd134, 8'd135, 8'd144, 8'd145, 8'd146, 8'd147, 8'd148, 8'd149, 8'd150, 8'd151: begin
                ICODE = 14;
            end
            8'd228, 8'd229, 8'd236, 8'd237: begin
                ICODE = 15;
            end
            8'd230, 8'd231, 8'd238, 8'd239: begin
                ICODE = 16;
            end
            8'd215: begin
                ICODE = 17;
            end
            8'd141: begin
                ICODE = 18;
            end
            8'd197, 8'd196: begin
                ICODE = 19;
            end
            8'd159, 8'd158: begin
                ICODE = 20;
            end
            8'd156: begin
                ICODE = 21;
            end
            8'd157: begin
                ICODE = 22;
            end
            8'd0, 8'd1, 8'd2, 8'd3, 8'd8, 8'd9, 8'd10, 8'd11, 8'd16, 8'd17, 8'd18, 8'd19, 8'd24, 8'd25, 8'd26, 8'd27, 8'd32, 8'd33, 8'd34, 8'd35, 8'd40, 8'd41, 8'd42, 8'd43, 8'd48, 8'd49, 8'd50, 8'd51, 8'd56, 8'd57, 8'd58, 8'd59, 8'd132, 8'd133: begin
                ICODE = 23;
            end
            8'd128, 8'd129, 8'd130, 8'd131: begin
                ICODE = 24;
            end
            8'd4, 8'd5, 8'd12, 8'd13, 8'd20, 8'd21, 8'd28, 8'd29, 8'd36, 8'd37, 8'd44, 8'd45, 8'd52, 8'd53, 8'd60, 8'd61, 8'd168, 8'd169: begin
                ICODE = 25;
            end
            8'd64, 8'd65, 8'd66, 8'd67, 8'd68, 8'd69, 8'd70, 8'd71, 8'd72, 8'd73, 8'd74, 8'd75, 8'd76, 8'd77, 8'd78, 8'd79: begin
                ICODE = 26;
            end
            8'd246, 8'd247: begin
                ICODE = 27;
            end
            8'd105, 8'd107: begin
                ICODE = 28;
            end
            8'd213: begin
                ICODE = 29;
            end
            8'd39, 8'd47, 8'd55, 8'd63: begin
                ICODE = 30;
            end
            8'd208, 8'd209, 8'd210, 8'd211, 8'd192, 8'd193: begin
                ICODE = 31;
            end
            8'd164, 8'd165: begin
                ICODE = 32;
            end
            8'd166, 8'd167: begin
                ICODE = 33;
            end
            8'd174, 8'd175: begin
                ICODE = 34;
            end
            8'd172, 8'd173: begin
                ICODE = 35;
            end
            8'd170, 8'd171: begin
                ICODE = 36;
            end
            8'd108, 8'd109: begin
                ICODE = 37;
            end
            8'd110, 8'd111: begin
                ICODE = 38;
            end
            8'd232, 8'd235, 8'd233: begin
                ICODE = 39;
            end
            8'd154, 8'd234: begin
                ICODE = 40;
            end
            8'd195, 8'd194: begin
                ICODE = 41;
            end
            8'd203, 8'd202: begin
                ICODE = 42;
            end
            8'd207: begin
                ICODE = 43;
            end
            8'd152, 8'd153: begin
                ICODE = 44;
            end
            8'd112, 8'd113, 8'd114, 8'd115, 8'd116, 8'd117, 8'd118, 8'd119, 8'd120, 8'd121, 8'd122, 8'd123, 8'd124, 8'd125, 8'd126, 8'd127, 8'd226, 8'd225, 8'd224, 8'd227: begin
                ICODE = 45;
            end
            8'd248, 8'd245, 8'd249, 8'd252, 8'd253, 8'd250, 8'd251: begin
                ICODE = 46;
            end
            8'd200: begin
                ICODE = 47;
            end
            8'd201: begin
                ICODE = 48;
            end
            8'd205, 8'd204, 8'd206: begin
                ICODE = 49;
            end
            8'd98: begin
                ICODE = 50;
            end
            8'd244: begin
                ICODE = 51;
            end
            8'd155: begin
                ICODE = 52;
            end
            8'd212: begin
                ICODE = 53;
            end
            default: begin
                ICODE = 55;
            end
        endcase
    endfunction
endmodule