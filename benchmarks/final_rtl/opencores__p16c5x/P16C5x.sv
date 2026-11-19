module P16C5x #(
    parameter logic[11:0] pRstVector = 12'd2047,
    parameter logic signed[31:0] pWDT_Size = 20,
    parameter logic[95:0] pRAMA_Init = 96'h5372632f52414d412e636f65,
    parameter logic[95:0] pRAMB_Init = 96'h5372632f52414d422e636f65
) (
    input logic POR,
    input logic Clk,
    input logic ClkEn,
    input logic MCLR,
    input logic T0CKI,
    input logic WDTE,
    output reg[11:0] PC,
    input logic[11:0] ROM,
    output logic WE_TRISA,
    output logic WE_TRISB,
    output logic WE_TRISC,
    output logic WE_PORTA,
    output logic WE_PORTB,
    output logic WE_PORTC,
    output logic RE_PORTA,
    output logic RE_PORTB,
    output logic RE_PORTC,
    output logic[7:0] IO_DO,
    input logic[7:0] IO_DI,
    output reg Rst,
    output reg[5:0] OPTION,
    output reg[11:0] IR,
    output logic[9:0] dIR,
    output logic[11:0] ALU_Op,
    output logic[8:0] KI,
    output logic Err,
    output reg Skip,
    output reg[11:0] TOS,
    output reg[11:0] NOS,
    output logic[7:0] W,
    output logic[7:0] FA,
    output logic[7:0] DO,
    output logic[7:0] DI,
    output reg[7:0] TMR0,
    output reg[7:0] FSR,
    output logic[7:0] STATUS,
    output logic T0CKI_Pls,
    output reg WDTClr,
    output reg[19:0] WDT,
    output reg WDT_TC,
    output logic WDT_TO,
    output reg[7:0] PSCntr,
    output logic PSC_Pls
);
    wire logic Rst_M16C5x;
    wire logic CE;
    reg[2:0] PA;
    reg[7:0] SFR;
    wire logic Rst_TO;
    reg TO;
    wire logic Rst_PD;
    reg PD;
    reg PwrDn;
    wire logic[5:0] Addrs;
    reg[7:0] RAMA[7:0];
    reg[7:0] RAMB[63:0];
    wire logic T0CS;
    wire logic T0SE;
    wire logic PSA;
    wire logic[2:0] PS;
    reg[2:0] dT0CKI;
    reg PSC_Out;
    reg[1:0] dPSC_Out;
    wire logic GOTO;
    wire logic CALL;
    wire logic RETLW;
    wire logic WE_SLEEP;
    wire logic WE_WDTCLR;
    wire logic WE_OPTION;
    wire logic WE_TMR0;
    wire logic WE_PCL;
    wire logic WE_STATUS;
    wire logic WE_FSR;
    wire logic WE_PSW;
    wire logic C;
    wire logic DC;
    wire logic Z;
    wire logic Z_Tst;
    wire logic g;
    assign CE = (ClkEn & ~(PwrDn));
    assign Rst_M16C5x = ((POR | MCLR) | WDT_TO);
    always @(posedge Clk or posedge Rst_M16C5x) begin
        if (Rst_M16C5x) begin
            Rst <= -1;
        end
        else if (CE) begin
            Rst <= 0;
        end
    end
    always @(posedge Clk) begin
        if (Rst) begin
            IR <= 0;
        end
        else if (CE) begin
            IR <= ROM;
        end
    end
    P16C5x_IDEC IDEC (
        .Rst(Rst),
        .Clk(Clk),
        .CE(CE),
        .DI(ROM),
        .Skip(Skip),
        .dIR(dIR),
        .ALU_Op(ALU_Op),
        .KI(KI),
        .Err(Err)
    );
    P16C5x_ALU ALU (
        .Rst(Rst),
        .Clk(Clk),
        .CE(CE),
        .ALU_Op(ALU_Op),
        .WE_PSW(WE_PSW),
        .DI(DI),
        .KI(KI[7:0]),
        .DO(DO),
        .Z_Tst(Z_Tst),
        .g(g),
        .W(W),
        .Z(Z),
        .DC(DC),
        .C(C)
    );
    assign GOTO = dIR[0];
    assign CALL = dIR[1];
    assign RETLW = dIR[2];
    assign WE_SLEEP = dIR[3];
    assign WE_WDTCLR = dIR[4];
    assign WE_TRISA = dIR[5];
    assign WE_TRISB = dIR[6];
    assign WE_TRISC = dIR[7];
    assign WE_OPTION = dIR[8];
    wire logic LITERAL;
    assign LITERAL = dIR[9];
    wire logic Tst;
    assign Tst = ALU_Op[8];
    always @* begin
        Skip <= ((WE_SLEEP | WE_PCL) | (Tst ? ((ALU_Op[7] & ALU_Op[6]) ? g : Z_Tst) : (((GOTO | CALL) | RETLW) ? 1'b1 : 1'b0)));
    end
    wire logic INDF;
    assign INDF = ALU_Op[10];
    assign FA = (INDF ? FSR : (KI[4] ? {FSR[6:5], KI[4:0]} : {2'b0, KI[4:0]}));
    wire logic WE_F;
    assign WE_F = ALU_Op[11];
    assign WE_TMR0 = (WE_F & (FA[4:0] == 5'b1));
    assign WE_PCL = (WE_F & (FA[4:0] == 5'b10));
    assign WE_STATUS = (WE_F & (FA[4:0] == 5'b11));
    assign WE_FSR = (WE_F & (FA[4:0] == 5'b100));
    assign WE_PORTA = ((WE_F & (FA[4:0] == 5'b101)) & ~(LITERAL));
    assign WE_PORTB = ((WE_F & (FA[4:0] == 5'b110)) & ~(LITERAL));
    assign WE_PORTC = ((WE_F & (FA[4:0] == 5'b111)) & ~(LITERAL));
    assign RE_PORTA = (((~(WE_F) & (FA[4:0] == 5'b101)) & ~(LITERAL)) & ~(WE_TRISA));
    assign RE_PORTB = (((~(WE_F) & (FA[4:0] == 5'b110)) & ~(LITERAL)) & ~(WE_TRISB));
    assign RE_PORTC = (((~(WE_F) & (FA[4:0] == 5'b111)) & ~(LITERAL)) & ~(WE_TRISC));
    assign WE_PSW = ((WE_STATUS & (ALU_Op[5:4] == 2'b0)) & (ALU_Op[8] == 1'b0));
    wire logic Ld_PCL;
    assign Ld_PCL = (CALL | WE_PCL);
    always @(posedge Clk) begin
        if (Rst) begin
            PC <= 12'd2047;
        end
        else if (CE) begin
            PC <= (GOTO ? {PA, KI} : (Ld_PCL ? {PA, 1'b0, DO} : (RETLW ? TOS : (PC + 1))));
        end
    end
    always @(posedge Clk) begin
        if (POR) begin
            TOS <= 12'd2047;
        end
        else if (CE) begin
            TOS <= (CALL ? PC : (RETLW ? NOS : TOS));
        end
    end
    always @(posedge Clk) begin
        if (POR) begin
            NOS <= 12'd2047;
        end
        else if (CE) begin
            NOS <= (CALL ? TOS : NOS);
        end
    end
    always @(posedge Clk) begin
        if (POR) begin
            OPTION <= 8'd63;
        end
        else if (CE) begin
            OPTION <= (WE_OPTION ? W : OPTION);
        end
    end
    always @(posedge Clk) begin
        if (Rst) begin
            WDTClr <= 0;
        end
        else begin
            WDTClr <= ((WE_WDTCLR | WE_SLEEP) & ~(PwrDn));
        end
    end
    assign Rst_TO = ((POR | (MCLR & PD)) | WE_WDTCLR);
    always @(posedge Clk) begin
        if (Rst_TO) begin
            TO <= 0;
        end
        else if (WDT_TO) begin
            TO <= -1;
        end
    end
    assign Rst_PD = (POR | (WE_WDTCLR & ~(PwrDn)));
    always @(posedge Clk) begin
        if (Rst_PD) begin
            PD <= 0;
        end
        else if (CE) begin
            PD <= (WE_SLEEP ? 1'b1 : PD);
        end
    end
    always @(posedge Clk) begin
        if (Rst) begin
            PwrDn <= 0;
        end
        else if (ClkEn) begin
            PwrDn <= (WE_SLEEP ? 1'b1 : PwrDn);
        end
    end
    assign Addrs = {FA[6:5], FA[3:0]};
    wire logic WE_RAMA;
    assign WE_RAMA = ((WE_F & ~(FA[4])) & FA[3]);
    always @(posedge Clk) begin
        if (CE) begin
            if (WE_RAMA) begin
                RAMA[Addrs[2:0]] <= DO;
            end
        end
    end
    wire logic WE_RAMB;
    assign WE_RAMB = (WE_F & FA[4]);
    always @(posedge Clk) begin
        if (CE) begin
            if (WE_RAMB) begin
                RAMB[Addrs] <= DO;
            end
        end
    end
    always @(posedge Clk) begin
        if (POR) begin
            PA <= 0;
        end
        else if (CE) begin
            PA <= (WE_STATUS ? DO[7:5] : PA);
        end
    end
    always @(posedge Clk) begin
        if (POR) begin
            FSR <= 0;
        end
        else if (CE) begin
            FSR <= (WE_FSR ? DO : FSR);
        end
    end
    assign STATUS = {PA, ~(TO), ~(PD), Z, DC, C};
    always @* begin
        case (FA[2:0])
            3'b0: begin
                SFR <= 0;
            end
            3'b1: begin
                SFR <= TMR0;
            end
            3'b10: begin
                SFR <= PC[7:0];
            end
            3'b11: begin
                SFR <= STATUS;
            end
            3'b100: begin
                SFR <= FSR;
            end
            3'b101: begin
                SFR <= IO_DI;
            end
            3'b110: begin
                SFR <= IO_DI;
            end
            3'b111: begin
                SFR <= IO_DI;
            end
        endcase
    end
    assign DI = (FA[4] ? RAMB[Addrs] : (FA[3] ? RAMA[Addrs[2:0]] : SFR));
    assign IO_DO = (|({WE_TRISA, WE_TRISB, WE_TRISC}) ? W : DO);
    assign T0CS = OPTION[5];
    assign T0SE = OPTION[4];
    assign PSA = OPTION[3];
    assign PS = OPTION[2:0];
    wire logic WDT_Rst;
    assign WDT_Rst = (Rst | WDTClr);
    always @(posedge Clk) begin
        if (WDT_Rst) begin
            WDT <= 0;
        end
        else if (WDTE) begin
            WDT <= (WDT + 1);
        end
    end
    always @(posedge Clk) begin
        if (WDT_Rst) begin
            WDT_TC <= 0;
        end
        else begin
            WDT_TC <= &(WDT);
        end
    end
    assign WDT_TO = (PSA ? PSC_Pls : WDT_TC);
    always @(posedge Clk) begin
        if (Rst) begin
            dT0CKI <= 0;
        end
        else begin
            dT0CKI[0] <= T0CKI;
            dT0CKI[1] <= dT0CKI[0];
            dT0CKI[2] <= (T0SE ? (dT0CKI[1] & ~(dT0CKI[0])) : (dT0CKI[0] & ~(dT0CKI[1])));
        end
    end
    assign T0CKI_Pls = dT0CKI[2];
    wire logic Tmr0_CS;
    assign Tmr0_CS = (T0CS ? T0CKI_Pls : CE);
    wire logic Rst_PSC;
    assign Rst_PSC = ((PSA ? WDTClr : WE_TMR0) | Rst);
    wire logic CE_PSCntr;
    assign CE_PSCntr = (PSA ? WDT_TC : Tmr0_CS);
    always @(posedge Clk) begin
        if (Rst_PSC) begin
            PSCntr <= 0;
        end
        else if (CE_PSCntr) begin
            PSCntr <= (PSCntr + 1);
        end
    end
    always @* begin
        case (PS)
            3'b0: begin
                PSC_Out <= PSCntr[0];
            end
            3'b1: begin
                PSC_Out <= PSCntr[1];
            end
            3'b10: begin
                PSC_Out <= PSCntr[2];
            end
            3'b11: begin
                PSC_Out <= PSCntr[3];
            end
            3'b100: begin
                PSC_Out <= PSCntr[4];
            end
            3'b101: begin
                PSC_Out <= PSCntr[5];
            end
            3'b110: begin
                PSC_Out <= PSCntr[6];
            end
            3'b111: begin
                PSC_Out <= PSCntr[7];
            end
        endcase
    end
    always @(posedge Clk) begin
        if (POR) begin
            dPSC_Out <= 0;
        end
        else begin
            dPSC_Out[0] <= PSC_Out;
            dPSC_Out[1] <= (PSC_Out & ~(dPSC_Out[0]));
        end
    end
    assign PSC_Pls = dPSC_Out[1];
    wire logic CE_Tmr0;
    assign CE_Tmr0 = (PSA ? Tmr0_CS : PSC_Pls);
    always @(posedge Clk) begin
        if (POR) begin
            TMR0 <= 0;
        end
        else if (WE_TMR0) begin
            TMR0 <= DO;
        end
        else if (CE_Tmr0) begin
            TMR0 <= (TMR0 + 1);
        end
    end
endmodule