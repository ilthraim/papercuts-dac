
module aeMB_core_edk32 (
    output logic iwb_stb_o,
    output logic[31:2] iwb_adr_o,
    output logic fsl_wre_o,
    output logic[1:0] fsl_tag_o,
    output logic fsl_stb_o,
    output logic[31:0] fsl_dat_o,
    output logic[6:2] fsl_adr_o,
    output logic dwb_wre_o,
    output logic dwb_stb_o,
    output logic[3:0] dwb_sel_o,
    output logic[31:0] dwb_dat_o,
    output logic[31:2] dwb_adr_o,
    input logic sys_int_i,
    input logic[31:0] iwb_dat_i,
    input logic iwb_ack_i,
    input logic[31:0] fsl_dat_i,
    input logic fsl_ack_i,
    input logic[31:0] dwb_dat_i,
    input logic dwb_ack_i,
    input logic sys_clk_i,
    input logic sys_rst_i
);
    wire logic[10:0] rALT;
    wire logic rBRA;
    wire logic rDLY;
    wire logic[31:0] rDWBDI;
    wire logic[3:0] rDWBSEL;
    wire logic [14:0] rIMM;
    wire logic rMSR_BIP;
    wire logic rMSR_IE;
    wire logic[1:0] rMXALT;
    wire logic[2:0] rMXALU;
    wire logic[1:0] rMXDST;
    wire logic[1:0] rMXSRC;
    wire logic[1:0] rMXTGT;
    wire logic[5:0] rOPC;
    wire logic[31:2] rPC;
    wire logic[31:2] rPCLNK;
    wire logic[4:0] rRA;
    wire logic[4:0] rRB;
    wire logic[4:0] rRD;
    wire logic[31:0] rREGA;
    wire logic[31:0] rREGB;
    wire logic[31:0] rRESULT;
    wire logic[4:0] rRW;
    wire logic[31:0] rSIMM;
    wire logic rSTALL;
    wire logic[31:0] xIREG;
    wire logic grst = sys_rst_i;
    wire logic gclk = sys_clk_i;
    wire logic gena = (!((((dwb_stb_o ^ dwb_ack_i) | (fsl_stb_o ^ fsl_ack_i)) | !(iwb_ack_i))) & !(rSTALL));
    wire logic oena = (((dwb_stb_o ^ dwb_ack_i) | (fsl_stb_o ^ fsl_ack_i)) | !(iwb_ack_i));
    aeMB_core_edk32_ibuf ibuf (
        .rIMM(rIMM[14:0]),
        .rRA(rRA[4:0]),
        .rRD(rRD[4:0]),
        .rRB(rRB[4:0]),
        .rALT(rALT[10:0]),
        .rOPC(rOPC[5:0]),
        .rSIMM(rSIMM[31:0]),
        .xIREG(xIREG[31:0]),
        .rSTALL(rSTALL),
        .iwb_stb_o(iwb_stb_o),
        .rBRA(rBRA),
        .rMSR_IE(rMSR_IE),
        .rMSR_BIP(1'b1),
        .iwb_dat_i(iwb_dat_i[31:0]),
        .iwb_ack_i(iwb_ack_i),
        .sys_int_i(sys_int_i),
        .gclk(gclk),
        .grst(grst),
        .gena(gena),
        .oena(oena)
    );
    aeMB_core_edk32_ctrl ctrl (
        .rMXDST(rMXDST[1:0]),
        .rMXSRC(rMXSRC[1:0]),
        .rMXTGT(rMXTGT[1:0]),
        .rMXALT(rMXALT[1:0]),
        .rMXALU(rMXALU[2:0]),
        .rRW(rRW[4:0]),
        .dwb_stb_o(dwb_stb_o),
        .dwb_wre_o(dwb_wre_o),
        .fsl_stb_o(fsl_stb_o),
        .fsl_wre_o(fsl_wre_o),
        .rDLY(rDLY),
        .rIMM({1'b0, rIMM[14:0]}),
        .rALT(rALT[10:0]),
        .rOPC(rOPC[5:0]),
        .rRD(rRD[4:0]),
        .rRA(rRA[4:0]),
        .rRB(rRB[4:0]),
        .rPC(rPC[31:2]),
        .rBRA(rBRA),
        .rMSR_IE(rMSR_IE),
        .xIREG(xIREG[31:0]),
        .dwb_ack_i(dwb_ack_i),
        .iwb_ack_i(iwb_ack_i),
        .fsl_ack_i(fsl_ack_i),
        .gclk(gclk),
        .grst(grst),
        .gena(gena)
    );
    aeMB_core_edk32_bpcu bpcu (
        .iwb_adr_o(iwb_adr_o[31:2]),
        .rPC(rPC[31:2]),
        .rPCLNK(rPCLNK[31:2]),
        .rBRA(rBRA),
        .rDLY(rDLY),
        .rMXALT(rMXALT[1:0]),
        .rOPC(rOPC[5:0]),
        .rRD(rRD[4:0]),
        .rRA(rRA[4:0]),
        .rRESULT(rRESULT[31:0]),
        .rDWBDI(rDWBDI[31:0]),
        .rREGA(rREGA[31:0]),
        .gclk(gclk),
        .grst(grst),
        .gena(gena)
    );
    aeMB_core_edk32_regf regf (
        .rREGA(rREGA[31:0]),
        .rREGB(rREGB[31:0]),
        .rDWBDI(rDWBDI[31:0]),
        .dwb_dat_o(dwb_dat_o[31:0]),
        .fsl_dat_o(fsl_dat_o[31:0]),
        .rOPC(rOPC[5:0]),
        .rRA(rRA[4:0]),
        .rRB(rRB[4:0]),
        .rRW(rRW[4:0]),
        .rRD(rRD[4:0]),
        .rMXDST(rMXDST[1:0]),
        .rPCLNK(rPCLNK[31:2]),
        .rRESULT(rRESULT[31:0]),
        .rDWBSEL(rDWBSEL[3:0]),
        .rBRA(rBRA),
        .rDLY(rDLY),
        .dwb_dat_i(dwb_dat_i[31:0]),
        .fsl_dat_i(fsl_dat_i[31:0]),
        .gclk(gclk),
        .grst(grst),
        .gena(gena)
    );
    aeMB_core_edk32_xecu xecu (
        .dwb_adr_o(dwb_adr_o[31:2]),
        .dwb_sel_o(dwb_sel_o[3:0]),
        .fsl_adr_o(fsl_adr_o[6:2]),
        .fsl_tag_o(fsl_tag_o[1:0]),
        .rRESULT(rRESULT[31:0]),
        .rDWBSEL(rDWBSEL[3:0]),
        .rMSR_IE(rMSR_IE),
        .rMSR_BIP(rMSR_BIP),
        .rREGA(rREGA[31:0]),
        .rREGB(rREGB[31:0]),
        .rMXSRC(rMXSRC[1:0]),
        .rMXTGT(rMXTGT[1:0]),
        .rRA(rRA[4:0]),
        .rRB(rRB[4:0]),
        .rMXALU(rMXALU[2:0]),
        .rBRA(rBRA),
        .rDLY(rDLY),
        .rALT(rALT[10:0]),
        .rSTALL(rSTALL),
        .rSIMM(rSIMM[31:0]),
        .rIMM({1'b0, rIMM[14:0]}),
        .rOPC(rOPC[5:0]),
        .rRD(rRD[4:0]),
        .rDWBDI(rDWBDI[31:0]),
        .rPC(rPC[31:2]),
        .gclk(gclk),
        .grst(grst),
        .gena(gena)
    );
endmodule