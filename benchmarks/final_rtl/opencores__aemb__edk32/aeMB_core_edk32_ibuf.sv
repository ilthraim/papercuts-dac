module aeMB_core_edk32_ibuf (
    output reg[15:0] rIMM,
    output reg[4:0] rRA,
    output reg[4:0] rRD,
    output logic[4:0] rRB,
    output logic[10:0] rALT,
    output reg[5:0] rOPC,
    output reg[31:0] rSIMM,
    output reg[31:0] xIREG,
    output reg rSTALL,
    output logic iwb_stb_o,
    input logic rBRA,
    input logic rMSR_IE,
    input logic rMSR_BIP,
    input logic[31:0] iwb_dat_i,
    input logic iwb_ack_i,
    input logic sys_int_i,
    input logic gclk,
    input logic grst,
    input logic gena,
    input logic oena
);
    wire logic[31:0] wIDAT = iwb_dat_i;
    assign {rRB, rALT} = rIMM;
    assign iwb_stb_o = 1'b1;
    reg[31:0] xSIMM;
    wire logic[31:0] wINTOP = 32'd3117285392;
    wire logic[31:0] wBRAOP = 32'd2281701376;
    reg rFINT;
    reg[0:0] rDINT;
    wire logic wSHOT = rDINT[0];
    always @(posedge gclk) begin
        if (grst) begin
            rDINT <= 2'b0;
            rFINT <= 1'b0;
        end
        else begin
            if (rMSR_IE) begin
                rDINT <= {rDINT[0], sys_int_i};
            end
            rFINT <= ((rFINT | wSHOT) & rMSR_IE);
        end
    end
    wire logic fIMM = (rOPC == 6'b101100);
    wire logic fRTD = (rOPC == 6'b101101);
    wire logic fBRU = ((rOPC == 6'b100110) | (rOPC == 6'b101110));
    wire logic fBCC = ((rOPC == 6'b100111) | (rOPC == 6'b101111));
    always @(fBCC or fBRU or fIMM or fRTD or rBRA or rFINT or wBRAOP or wIDAT or wINTOP) begin
        xIREG <= (rBRA ? wBRAOP : (((((!(fIMM) & rFINT) & !(fRTD)) & !(fBRU)) & !(fBCC)) ? wINTOP : wIDAT));
    end
    always @(fIMM or rBRA or rIMM or wIDAT or xIREG) begin
        xSIMM <= (!(fIMM) ? {{16{xIREG[15]}}, xIREG[15:0]} : {rIMM, wIDAT[15:0]});
    end
    always @(posedge gclk) begin
        if (grst) begin
            rIMM <= 16'd0;
            rOPC <= 6'b0;
            rRA <= 5'b0;
            rRD <= 5'b0;
            rSIMM <= 32'd0;
        end
        else if (gena) begin
            {rOPC, rRD, rRA, rIMM} <= xIREG;
            rSIMM <= xSIMM;
        end
    end
    wire logic[5:0] wOPC = xIREG[31:26];
    wire logic fMUL = ((wOPC == 6'b10000) | (wOPC == 6'b11000));
    wire logic fBSF = ((wOPC == 6'b10001) | (wOPC == 6'b11001));
    always @(posedge gclk) begin
        if (grst) begin
            rSTALL <= 1'b0;
        end
        else begin
            rSTALL <= ((!(rSTALL) & (fMUL | fBSF)) | (oena & rSTALL));
        end
    end
endmodule
