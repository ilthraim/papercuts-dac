module aeMB_core_edk32_regf (
    output logic[31:0] rREGA,
    output logic[31:0] rREGB,
    output reg[31:0] rDWBDI,
    output logic[31:0] dwb_dat_o,
    output logic[31:0] fsl_dat_o,
    input logic[5:0] rOPC,
    input logic[4:0] rRA,
    input logic[4:0] rRB,
    input logic[4:0] rRW,
    input logic[4:0] rRD,
    input logic[1:0] rMXDST,
    input logic[31:2] rPCLNK,
    input logic[31:0] rRESULT,
    input logic[3:0] rDWBSEL,
    input logic rBRA,
    input logic rDLY,
    input logic[31:0] dwb_dat_i,
    input logic[31:0] fsl_dat_i,
    input logic gclk,
    input logic grst,
    input logic gena
);
    wire logic[31:0] wDWBDI = dwb_dat_i;
    wire logic[31:0] wFSLDI = fsl_dat_i;
    always @(rDWBSEL or wDWBDI or wFSLDI) begin
        case (rDWBSEL)
            4'b1000: begin
                rDWBDI <= {24'd0, wDWBDI[31:24]};
            end
            4'b100: begin
                rDWBDI <= {24'd0, wDWBDI[23:16]};
            end
            4'b10: begin
                rDWBDI <= {24'd0, wDWBDI[15:8]};
            end
            4'b1: begin
                rDWBDI <= {24'd0, wDWBDI[7:0]};
            end
            4'b1100: begin
                rDWBDI <= {16'd0, wDWBDI[31:16]};
            end
            4'b11: begin
                rDWBDI <= {16'd0, wDWBDI[15:0]};
            end
            4'b1111: begin
                rDWBDI <= wDWBDI;
            end
            4'b0: begin
                rDWBDI <= wFSLDI;
            end
            default: begin
                rDWBDI <= 32'dx;
            end
        endcase
    end
    reg[31:0] mARAM[0:31];
    reg[31:0] mBRAM[0:31];
    reg[31:0] mDRAM[0:31];
    wire logic[31:0] rREGW = mDRAM[rRW];
    wire logic[31:0] rREGD = mDRAM[rRD];
    assign rREGA = mARAM[rRA];
    assign rREGB = mBRAM[rRB];
    wire logic fRDWE = |(rRW);
    reg[31:0] xWDAT;
    always @(rDWBDI or rMXDST or rPCLNK or rREGW or rRESULT) begin
        case (rMXDST)
            2'b10: begin
                xWDAT <= rDWBDI;
            end
            2'b1: begin
                xWDAT <= {rPCLNK, 2'b0};
            end
            2'b0: begin
                xWDAT <= rRESULT;
            end
            2'b11: begin
                xWDAT <= rREGW;
            end
        endcase
    end
    always @(posedge gclk) begin
        if ((grst | fRDWE)) begin
            mARAM[rRW] <= xWDAT;
            mBRAM[rRW] <= xWDAT;
            mDRAM[rRW] <= xWDAT;
        end
    end
    reg[31:0] rDWBDO;
    reg[31:0] xDWBDO;
    wire logic[31:0] xFSL;
    wire logic fFFWD_M = (((rRA == rRW) & (rMXDST == 2'b10)) & fRDWE);
    wire logic fFFWD_R = (((rRA == rRW) & (rMXDST == 2'b0)) & fRDWE);
    assign fsl_dat_o = rDWBDO;
    assign xFSL = (fFFWD_M ? rDWBDI : (fFFWD_R ? rRESULT : rREGA));
    wire logic[31:0] xDST;
    wire logic fDFWD_M = (((rRW == rRD) & (rMXDST == 2'b10)) & fRDWE);
    wire logic fDFWD_R = (((rRW == rRD) & (rMXDST == 2'b0)) & fRDWE);
    assign dwb_dat_o = rDWBDO;
    assign xDST = (fDFWD_M ? rDWBDI : (fDFWD_R ? rRESULT : rREGD));
    always @(rOPC or xDST or xFSL) begin
        case (rOPC[1:0])
            2'b0: begin
                xDWBDO <= {4{xDST[7:0]}};
            end
            2'b1: begin
                xDWBDO <= {2{xDST[15:0]}};
            end
            2'b10: begin
                xDWBDO <= xDST;
            end
            2'b11: begin
                xDWBDO <= xFSL;
            end
        endcase
    end
    always @(posedge gclk) begin
        if (grst) begin
            rDWBDO <= 32'd0;
        end
        else if (gena) begin
            rDWBDO <= xDWBDO;
        end
    end
endmodule
