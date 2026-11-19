module aeMB_core_edk32_xecu (
    output logic[31:2] dwb_adr_o,
    output logic[3:0] dwb_sel_o,
    output logic[6:2] fsl_adr_o,
    output logic[1:0] fsl_tag_o,
    output reg[31:0] rRESULT,
    output reg[3:0] rDWBSEL,
    output reg rMSR_IE,
    output reg rMSR_BIP,
    input logic[31:0] rREGA,
    input logic[31:0] rREGB,
    input logic[1:0] rMXSRC,
    input logic[1:0] rMXTGT,
    input logic[4:0] rRA,
    input logic[4:0] rRB,
    input logic[2:0] rMXALU,
    input logic rBRA,
    input logic rDLY,
    input logic[10:0] rALT,
    input logic rSTALL,
    input logic[31:0] rSIMM,
    input logic[15:0] rIMM,
    input logic[5:0] rOPC,
    input logic[4:0] rRD,
    input logic[31:0] rDWBDI,
    input logic[31:2] rPC,
    input logic gclk,
    input logic grst,
    input logic gena
);
    reg rMSR_C;
    reg xMSR_C;
    reg xMSR_IE;
    reg rMSR_BE;
    reg xMSR_BE;
    reg xMSR_BIP;
    wire logic fSKIP = (rBRA & !(rDLY));
    reg[31:0] rOPA;
    reg[31:0] rOPB;
    always @(rDWBDI or rMXSRC or rPC or rREGA or rRESULT) begin
        case (rMXSRC)
            2'b0: begin
                rOPA <= rREGA;
            end
            2'b1: begin
                rOPA <= rRESULT;
            end
            2'b10: begin
                rOPA <= rDWBDI;
            end
            2'b11: begin
                rOPA <= {rPC, 2'b0};
            end
        endcase
    end
    always @(rDWBDI or rMXTGT or rREGB or rRESULT or rSIMM) begin
        case (rMXTGT)
            2'b0: begin
                rOPB <= rREGB;
            end
            2'b1: begin
                rOPB <= rRESULT;
            end
            2'b10: begin
                rOPB <= rDWBDI;
            end
            2'b11: begin
                rOPB <= rSIMM;
            end
        endcase
    end
    reg rRES_ADDC;
    reg[31:0] rRES_ADD;
    wire logic[31:0] wADD;
    wire logic wADC;
    wire logic fCCC = (!(rOPC[5]) & rOPC[1]);
    wire logic fSUB = (!(rOPC[5]) & rOPC[0]);
    wire logic fCMP = (!(rOPC[3]) & rIMM[1]);
    wire logic wCMP = (fCMP ? !(wADC) : wADD[31]);
    wire logic[31:0] wOPA = (fSUB ? ~(rOPA) : rOPA);
    wire logic wOPC = (fCCC ? rMSR_C : fSUB);
    assign {wADC, wADD} = ((rOPB + wOPA) + wOPC);
    always @(wADC or wADD or wCMP) begin
        {rRES_ADDC, rRES_ADD} <= {wADC, wCMP, wADD[30:0]};
    end
    reg[31:0] rRES_LOG;
    always @(rOPA or rOPB or rOPC) begin
        case (rOPC[1:0])
            2'b0: begin
                rRES_LOG <= (rOPA | rOPB);
            end
            2'b1: begin
                rRES_LOG <= (rOPA & rOPB);
            end
            2'b10: begin
                rRES_LOG <= (rOPA ^ rOPB);
            end
            2'b11: begin
                rRES_LOG <= (rOPA & ~(rOPB));
            end
        endcase
    end
    reg[31:0] rRES_SFT;
    reg rRES_SFTC;
    always @(rIMM or rMSR_C or rOPA) begin
        case (rIMM[6:5])
            2'b0: begin
                {rRES_SFT, rRES_SFTC} <= {rOPA[31], rOPA[31:0]};
            end
            2'b1: begin
                {rRES_SFT, rRES_SFTC} <= {rMSR_C, rOPA[31:0]};
            end
            2'b10: begin
                {rRES_SFT, rRES_SFTC} <= {1'b0, rOPA[31:0]};
            end
            2'b11: begin
                {rRES_SFT, rRES_SFTC} <= (rIMM[0] ? {{16{rOPA[15]}}, rOPA[15:0], rMSR_C} : {{24{rOPA[7]}}, rOPA[7:0], rMSR_C});
            end
        endcase
    end
    wire logic[31:0] wMSR = {rMSR_C, 3'b0, 20'd60722, 4'b0, rMSR_BIP, rMSR_C, rMSR_IE, rMSR_BE};
    wire logic fMFSR = (((rOPC == 6'b100101) & !(rIMM[14])) & rIMM[0]);
    wire logic fMFPC = ((rOPC == 6'b100101) & !(rIMM[14]));
    reg[31:0] rRES_MOV;
    always @(fMFPC or fMFSR or rOPA or rOPB or rPC or rRA or wMSR) begin
        rRES_MOV <= (fMFSR ? wMSR : (fMFPC ? rPC : (rRA[3] ? rOPB : rOPA)));
    end
    reg[31:0] rRES_MUL;
    reg[31:0] xRES_MUL;
    always @(rOPA or rOPB) begin
        xRES_MUL <= (rOPA * rOPB);
    end
    always @(posedge gclk) begin
        if (rSTALL) begin
            rRES_MUL <= xRES_MUL;
        end
    end
    reg[31:0] rRES_BSF;
    reg[31:0] xBSRL;
    reg[31:0] xBSRA;
    reg[31:0] xBSLL;
    always @(rOPA or rOPB) begin
        xBSLL <= (rOPA << rOPB[4:0]);
    end
    always @(rOPA or rOPB) begin
        xBSRL <= (rOPA >> rOPB[4:0]);
    end
    always @(rOPA or rOPB) begin
        case (rOPB[4:0])
            5'b0: begin
                xBSRA <= rOPA;
            end
            5'b1: begin
                xBSRA <= {{1{rOPA[31]}}, rOPA[31:1]};
            end
            5'b10: begin
                xBSRA <= {{2{rOPA[31]}}, rOPA[31:2]};
            end
            5'b11: begin
                xBSRA <= {{3{rOPA[31]}}, rOPA[31:3]};
            end
            5'b100: begin
                xBSRA <= {{4{rOPA[31]}}, rOPA[31:4]};
            end
            5'b101: begin
                xBSRA <= {{5{rOPA[31]}}, rOPA[31:5]};
            end
            5'b110: begin
                xBSRA <= {{6{rOPA[31]}}, rOPA[31:6]};
            end
            5'b111: begin
                xBSRA <= {{7{rOPA[31]}}, rOPA[31:7]};
            end
            5'b1000: begin
                xBSRA <= {{8{rOPA[31]}}, rOPA[31:8]};
            end
            5'b1001: begin
                xBSRA <= {{9{rOPA[31]}}, rOPA[31:9]};
            end
            5'b1010: begin
                xBSRA <= {{10{rOPA[31]}}, rOPA[31:10]};
            end
            5'b1011: begin
                xBSRA <= {{11{rOPA[31]}}, rOPA[31:11]};
            end
            5'b1100: begin
                xBSRA <= {{12{rOPA[31]}}, rOPA[31:12]};
            end
            5'b1101: begin
                xBSRA <= {{13{rOPA[31]}}, rOPA[31:13]};
            end
            5'b1110: begin
                xBSRA <= {{14{rOPA[31]}}, rOPA[31:14]};
            end
            5'b1111: begin
                xBSRA <= {{15{rOPA[31]}}, rOPA[31:15]};
            end
            5'b10000: begin
                xBSRA <= {{16{rOPA[31]}}, rOPA[31:16]};
            end
            5'b10001: begin
                xBSRA <= {{17{rOPA[31]}}, rOPA[31:17]};
            end
            5'b10010: begin
                xBSRA <= {{18{rOPA[31]}}, rOPA[31:18]};
            end
            5'b10011: begin
                xBSRA <= {{19{rOPA[31]}}, rOPA[31:19]};
            end
            5'b10100: begin
                xBSRA <= {{20{rOPA[31]}}, rOPA[31:20]};
            end
            5'b10101: begin
                xBSRA <= {{21{rOPA[31]}}, rOPA[31:21]};
            end
            5'b10110: begin
                xBSRA <= {{22{rOPA[31]}}, rOPA[31:22]};
            end
            5'b10111: begin
                xBSRA <= {{23{rOPA[31]}}, rOPA[31:23]};
            end
            5'b11000: begin
                xBSRA <= {{24{rOPA[31]}}, rOPA[31:24]};
            end
            5'b11001: begin
                xBSRA <= {{25{rOPA[31]}}, rOPA[31:25]};
            end
            5'b11010: begin
                xBSRA <= {{26{rOPA[31]}}, rOPA[31:26]};
            end
            5'b11011: begin
                xBSRA <= {{27{rOPA[31]}}, rOPA[31:27]};
            end
            5'b11100: begin
                xBSRA <= {{28{rOPA[31]}}, rOPA[31:28]};
            end
            5'b11101: begin
                xBSRA <= {{29{rOPA[31]}}, rOPA[31:29]};
            end
            5'b11110: begin
                xBSRA <= {{30{rOPA[31]}}, rOPA[31:30]};
            end
            5'b11111: begin
                xBSRA <= {{31{rOPA[31]}}, rOPA[31]};
            end
        endcase
    end
    reg[31:0] rBSRL;
    reg[31:0] rBSRA;
    reg[31:0] rBSLL;
    always @(posedge gclk) begin
        if (rSTALL) begin
            rBSRL <= xBSRL;
            rBSRA <= xBSRA;
            rBSLL <= xBSLL;
        end
    end
    always @(rALT or rBSLL or rBSRA or rBSRL) begin
        case (rALT[10:9])
            2'b0: begin
                rRES_BSF <= rBSRL;
            end
            2'b1: begin
                rRES_BSF <= rBSRA;
            end
            2'b10: begin
                rRES_BSF <= rBSLL;
            end
            default: begin
                rRES_BSF <= 32'dx;
            end
        endcase
    end
    wire logic fMTS = (((rOPC == 6'b100101) & rIMM[14]) & !(fSKIP));
    wire logic fADDC = ({rOPC[5:4], rOPC[2]} == 3'b0);
    always @(fADDC or fMTS or fSKIP or rMSR_C or rMXALU or rOPA or rRES_ADDC or rRES_SFTC) begin
        if (fSKIP) begin
            xMSR_C <= rMSR_C;
        end
        else begin
            case (rMXALU)
                3'b0: begin
                    xMSR_C <= (fADDC ? rRES_ADDC : rMSR_C);
                end
                3'b1: begin
                    xMSR_C <= rMSR_C;
                end
                3'b10: begin
                    xMSR_C <= rRES_SFTC;
                end
                3'b11: begin
                    xMSR_C <= (fMTS ? rOPA[2] : rMSR_C);
                end
                3'b100: begin
                    xMSR_C <= rMSR_C;
                end
                3'b101: begin
                    xMSR_C <= rMSR_C;
                end
                default: begin
                    xMSR_C <= 1'bx;
                end
            endcase
        end
    end
    wire logic fRTID = (((rOPC == 6'b101101) & rRD[0]) & !(fSKIP));
    wire logic fRTBD = (((rOPC == 6'b101101) & rRD[1]) & !(fSKIP));
    wire logic fBRK = (((rOPC == 6'b101110) | (rOPC == 6'b110110)) & (rRA == 5'b1100));
    wire logic fINT = (((rOPC == 6'b101110) | (rOPC == 6'b110110)) & (rRA == 5'b1110));
    always @(fINT or fMTS or fRTID or rMSR_IE or rOPA) begin
        xMSR_IE <= (fINT ? 1'b0 : (fRTID ? 1'b1 : (fMTS ? rOPA[1] : rMSR_IE)));
    end
    always @(fBRK or fMTS or fRTBD or rMSR_BIP or rOPA) begin
        xMSR_BIP <= (fBRK ? 1'b1 : (fRTBD ? 1'b0 : (fMTS ? rOPA[3] : rMSR_BIP)));
    end
    always @(fMTS or rMSR_BE or rOPA) begin
        xMSR_BE <= (fMTS ? rOPA[0] : rMSR_BE);
    end
    reg[31:0] xRESULT;
    always @(fSKIP or rMXALU or rRES_ADD or rRES_BSF or rRES_LOG or rRES_MOV or rRES_MUL or rRES_SFT) begin
        if (fSKIP) begin
            xRESULT <= 32'd0;
        end
        else begin
            case (rMXALU)
                3'b0: begin
                    xRESULT <= rRES_ADD;
                end
                3'b1: begin
                    xRESULT <= rRES_LOG;
                end
                3'b10: begin
                    xRESULT <= rRES_SFT;
                end
                3'b11: begin
                    xRESULT <= rRES_MOV;
                end
                3'b100: begin
                    xRESULT <= rRES_MUL;
                end
                3'b101: begin
                    xRESULT <= rRES_BSF;
                end
                default: begin
                    xRESULT <= 32'dx;
                end
            endcase
        end
    end
    reg[3:0] xDWBSEL;
    assign dwb_adr_o = rRESULT[31:2];
    assign dwb_sel_o = rDWBSEL;
    always @(rOPC or wADD) begin
        case (rOPC[1:0])
            2'b0: begin
                case (wADD[1:0])
                    2'b0: begin
                        xDWBSEL <= 4'b1000;
                    end
                    2'b1: begin
                        xDWBSEL <= 4'b100;
                    end
                    2'b10: begin
                        xDWBSEL <= 4'b10;
                    end
                    2'b11: begin
                        xDWBSEL <= 4'b1;
                    end
                endcase
            end
            2'b1: begin
                xDWBSEL <= (wADD[1] ? 4'b11 : 4'b1100);
            end
            2'b10: begin
                xDWBSEL <= 4'b1111;
            end
            2'b11: begin
                xDWBSEL <= 4'b0;
            end
        endcase
    end
    reg[8:2] rFSLADR;
    reg[8:2] xFSLADR;
    assign {fsl_adr_o, fsl_tag_o} = rFSLADR[8:2];
    always @(rALT or rRB) begin
        xFSLADR <= {rALT, rRB[3:2]};
    end
    always @(posedge gclk) begin
        if (grst) begin
            rDWBSEL <= 4'b0;
            rFSLADR <= 13'd0;
            rMSR_BE <= 1'b0;
            rMSR_BIP <= 1'b0;
            rMSR_C <= 1'b0;
            rMSR_IE <= 1'b0;
            rRESULT <= 32'd0;
        end
        else if (gena) begin
            rRESULT <= xRESULT;
            rDWBSEL <= xDWBSEL;
            rMSR_C <= xMSR_C;
            rMSR_IE <= xMSR_IE;
            rMSR_BE <= xMSR_BE;
            rMSR_BIP <= xMSR_BIP;
            rFSLADR <= xFSLADR;
        end
    end
endmodule
