module aeMB_core_edk32_bpcu (
    output logic[31:2] iwb_adr_o,
    output reg[31:2] rPC,
    output reg[31:2] rPCLNK,
    output reg rBRA,
    output reg rDLY,
    input logic[1:0] rMXALT,
    input logic[5:0] rOPC,
    input logic[4:0] rRD,
    input logic[4:0] rRA,
    input logic[31:0] rRESULT,
    input logic[31:0] rDWBDI,
    input logic[31:0] rREGA,
    input logic gclk,
    input logic grst,
    input logic gena
);
    wire logic fRTD = (rOPC == 6'b101101);
    wire logic fBCC = ((rOPC == 6'b100111) | (rOPC == 6'b101111));
    wire logic fBRU = ((rOPC == 6'b100110) | (rOPC == 6'b101110));
    wire logic[31:0] wREGA;
    assign wREGA = ((rMXALT == 2'b10) ? rDWBDI : ((rMXALT == 2'b1) ? rRESULT : rREGA));
    wire logic wBEQ = (wREGA == 32'd0);
    wire logic wBNE = ~(wBEQ);
    wire logic wBLT = wREGA[31];
    wire logic wBLE = (wBLT | wBEQ);
    wire logic wBGE = ~(wBLT);
    wire logic wBGT = ~(wBLE);
    reg xXCC;
    always @(rRD or wBEQ or wBGE or wBGT or wBLE or wBLT or wBNE) begin
        case (rRD[2:0])
            3'b0: begin
                xXCC <= wBEQ;
            end
            3'b1: begin
                xXCC <= wBNE;
            end
            3'b10: begin
                xXCC <= wBLT;
            end
            3'b11: begin
                xXCC <= wBLE;
            end
            3'b100: begin
                xXCC <= wBGT;
            end
            3'b101: begin
                xXCC <= wBGE;
            end
            default: begin
                xXCC <= 1'bx;
            end
        endcase
    end
    reg xBRA;
    reg xDLY;
    always @(fBCC or fBRU or fRTD or rBRA or rRA or rRD or xXCC) begin
        if (rBRA) begin
            xBRA <= 1'b0;
            xDLY <= 1'b0;
        end
        else begin
            xDLY <= (((fBRU & rRA[4]) | (fBCC & rRD[4])) | fRTD);
            xBRA <= ((fRTD | fBRU) ? 1'b1 : (fBCC ? xXCC : 1'b0));
        end
    end
    reg[31:2] rIPC;
    reg[31:2] xIPC;
    reg[31:2] xPC;
    reg[31:2] xPCLNK;
    assign iwb_adr_o = rIPC[31:2];
    always @(rBRA or rIPC or rPC or rRESULT) begin
        xPCLNK <= rPC;
        xPC <= rIPC;
        xIPC <= (rBRA ? rRESULT[31:2] : (rIPC + 1));
    end
    reg[0:0] rATOM;
    reg[0:0] xATOM;
    always @(1'b1 or rATOM) begin
        xATOM <= {rATOM[0], (rATOM[0] ^ 1'b1)};
    end
    always @(posedge gclk) begin
        if (grst) begin
            rATOM <= 2'b0;
            rBRA <= 1'b0;
            rDLY <= 1'b0;
            rIPC <= 30'd0;
            rPC <= 30'd0;
            rPCLNK <= 30'd0;
        end
        else if (gena) begin
            rIPC <= xIPC;
            rBRA <= xBRA;
            rPC <= xPC;
            rPCLNK <= xPCLNK;
            rDLY <= xDLY;
            rATOM <= xATOM;
        end
    end
endmodule
