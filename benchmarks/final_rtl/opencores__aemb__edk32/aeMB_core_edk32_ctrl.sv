module aeMB_core_edk32_ctrl (
    output reg[1:0] rMXDST,
    output reg[1:0] rMXSRC,
    output reg[1:0] rMXTGT,
    output reg[1:0] rMXALT,
    output reg[2:0] rMXALU,
    output reg[4:0] rRW,
    output logic dwb_stb_o,
    output logic dwb_wre_o,
    output logic fsl_stb_o,
    output logic fsl_wre_o,
    input logic rDLY,
    input logic[15:0] rIMM,
    input logic[10:0] rALT,
    input logic[5:0] rOPC,
    input logic[4:0] rRD,
    input logic[4:0] rRA,
    input logic[4:0] rRB,
    input logic[31:2] rPC,
    input logic rBRA,
    input logic rMSR_IE,
    input logic[31:0] xIREG,
    input logic dwb_ack_i,
    input logic iwb_ack_i,
    input logic fsl_ack_i,
    input logic gclk,
    input logic grst,
    input logic gena
);
    wire logic[5:0] wOPC;
    wire logic[4:0] wRD;
    wire logic[4:0] wRA;
    wire logic[4:0] wRB;
    wire logic[10:0] wALT;
    assign {wOPC, wRD, wRA, wRB, wALT} = xIREG;
    wire logic fRTD = (rOPC == 6'b101101);
    wire logic fBCC = ((rOPC == 6'b100111) | (rOPC == 6'b101111));
    wire logic fBRU = ((rOPC == 6'b100110) | (rOPC == 6'b101110));
    wire logic fLOD = ({rOPC[5:4], rOPC[2]} == 3'b110);
    wire logic fSTR = ({rOPC[5:4], rOPC[2]} == 3'b111);
    wire logic fPUT = ((rOPC == 6'b11011) & rRB[4]);
    wire logic fGET = ((rOPC == 6'b11011) & !(rRB[4]));
    wire logic wSFT = (wOPC == 6'b100100);
    wire logic wLOG = ({wOPC[5:4], wOPC[2]} == 3'b100);
    wire logic wMUL = ((wOPC == 6'b10000) | (wOPC == 6'b11000));
    wire logic wBSF = ((wOPC == 6'b10001) | (wOPC == 6'b11001));
    wire logic wDIV = (wOPC == 6'b10010);
    wire logic wBCC = ((wOPC == 6'b100111) | (wOPC == 6'b101111));
    wire logic wBRU = ((wOPC == 6'b100110) | (wOPC == 6'b101110));
    wire logic wBRA = (wBRU & wRA[3]);
    wire logic wMOV = (wOPC == 6'b100101);
    reg[1:0] xMXDST;
    reg[4:0] xRW;
    reg[1:0] xMXSRC;
    reg[1:0] xMXTGT;
    reg[1:0] xMXALT;
    wire logic wRDWE = |(xRW);
    wire logic wAFWD_M = (((xRW == wRA) & (xMXDST == 2'b10)) & wRDWE);
    wire logic wBFWD_M = (((xRW == wRB) & (xMXDST == 2'b10)) & wRDWE);
    wire logic wAFWD_R = (((xRW == wRA) & (xMXDST == 2'b0)) & wRDWE);
    wire logic wBFWD_R = (((xRW == wRB) & (xMXDST == 2'b0)) & wRDWE);
    always @(rBRA or wAFWD_M or wAFWD_R or wBCC or wBFWD_M or wBFWD_R or wBRU or wOPC) begin
        xMXSRC <= ((wBRU | wBCC) ? 2'b11 : (wAFWD_M ? 2'b10 : (wAFWD_R ? 2'b1 : 2'b0)));
        xMXTGT <= (wOPC[3] ? 2'b11 : (wBFWD_M ? 2'b10 : (wBFWD_R ? 2'b1 : 2'b0)));
        xMXALT <= (wAFWD_M ? 2'b10 : (wAFWD_R ? 2'b1 : 2'b0));
    end
    reg[2:0] xMXALU;
    always @(rBRA or wBRA or wBSF or wDIV or wLOG or wMOV or wMUL or wSFT) begin
        xMXALU <= ((wBRA | wMOV) ? 3'b11 : (wSFT ? 3'b10 : (wLOG ? 3'b1 : (wMUL ? 3'b100 : (wBSF ? 3'b101 : (wDIV ? 3'b110 : 3'b0))))));
    end
    wire logic fSKIP = (rBRA & !(rDLY));
    always @(fBCC or fBRU or fGET or fLOD or fRTD or fSKIP or fSTR or rRD) begin
        if (fSKIP) begin
            xMXDST <= 2'b0;
            xRW <= 5'b0;
        end
        else begin
            xMXDST <= (((fSTR | fRTD) | fBCC) ? 2'b11 : ((fLOD | fGET) ? 2'b10 : (fBRU ? 2'b1 : 2'b0)));
            xRW <= rRD;
        end
    end
    wire logic fDACK = !((dwb_stb_o ^ dwb_ack_i));
    reg rDWBSTB;
    reg xDWBSTB;
    reg rDWBWRE;
    reg xDWBWRE;
    assign dwb_stb_o = rDWBSTB;
    assign dwb_wre_o = rDWBWRE;
    always @(fLOD or fSKIP or fSTR or iwb_ack_i) begin
        if (fSKIP) begin
            xDWBSTB <= 1'b0;
            xDWBWRE <= 1'b0;
        end
        else begin
            xDWBSTB <= ((fLOD | fSTR) & iwb_ack_i);
            xDWBWRE <= (fSTR & iwb_ack_i);
        end
    end
    always @(posedge gclk) begin
        if (grst) begin
            rDWBSTB <= 1'b0;
            rDWBWRE <= 1'b0;
        end
        else if (fDACK) begin
            rDWBSTB <= xDWBSTB;
            rDWBWRE <= xDWBWRE;
        end
    end
    wire logic fFACK = !((fsl_stb_o ^ fsl_ack_i));
    reg rFSLSTB;
    reg xFSLSTB;
    reg rFSLWRE;
    reg xFSLWRE;
    assign fsl_stb_o = rFSLSTB;
    assign fsl_wre_o = rFSLWRE;
    always @(fGET or fPUT or fSKIP or iwb_ack_i) begin
        if (fSKIP) begin
            xFSLSTB <= 1'b0;
            xFSLWRE <= 1'b0;
        end
        else begin
            xFSLSTB <= ((fPUT | fGET) & iwb_ack_i);
            xFSLWRE <= (fPUT & iwb_ack_i);
        end
    end
    always @(posedge gclk) begin
        if (grst) begin
            rFSLSTB <= 1'b0;
            rFSLWRE <= 1'b0;
        end
        else if (fFACK) begin
            rFSLSTB <= xFSLSTB;
            rFSLWRE <= xFSLWRE;
        end
    end
    always @(posedge gclk) begin
        if (grst) begin
            rMXALT <= 2'b0;
            rMXALU <= 3'b0;
            rMXDST <= 2'b0;
            rMXSRC <= 2'b0;
            rMXTGT <= 2'b0;
            rRW <= 5'b0;
        end
        else if (gena) begin
            rMXDST <= xMXDST;
            rRW <= xRW;
            rMXSRC <= xMXSRC;
            rMXTGT <= xMXTGT;
            rMXALT <= xMXALT;
            rMXALU <= xMXALU;
        end
    end
endmodule
