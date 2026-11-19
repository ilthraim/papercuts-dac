module SPIxIF (
    input logic Rst,
    input logic Clk,
    input logic LSB,
    input logic[1:0] Mode,
    input logic[2:0] Rate,
    input logic DAV,
    output reg FRE,
    input logic[8:0] TD,
    output reg FWE,
    output logic[7:0] RD,
    output reg SS,
    output reg SCK,
    output logic MOSI,
    input logic MISO
);
    reg Dir;
    reg SCK_Lvl;
    reg SCK_Inv;
    reg COS_SCK_Lvl;
    reg[2:0] rRate;
    reg[6:0] CE_Cntr;
    wire logic CE;
    wire logic CE_SCK;
    wire logic Rst_SCK;
    reg Ld;
    wire logic CE_OSR;
    wire logic CE_ISR;
    reg[7:0] OSR;
    reg[7:0] ISR;
    reg RdEn;
    reg[2:0] BitCnt;
    wire logic TC_BitCnt;
    always @(posedge Clk) begin if (~(SS)) begin
            Dir <= LSB;
        end
    end
    always @(posedge Clk) begin
        if (Rst) begin
            SCK_Inv <= 0;
            SCK_Lvl <= 0;
        end
        else if (~(SS)) begin
            SCK_Inv <= ^(Mode);
            SCK_Lvl <= Mode[0];
        end
    end
    always @(posedge Clk) begin begin
            COS_SCK_Lvl <= ( (SCK_Lvl ^ Mode[0]));
        end
    end
    always @(posedge Clk) begin if (~(SS)) begin
            rRate <= Rate;
        end
    end
    always @(posedge Clk) begin
        if (Rst) begin
            Ld <= 0;
        end
        else if (~(SS)) begin
            Ld <= (DAV & ~(Ld));
        end
        else begin end
    end
    always @(posedge Clk) begin if (CE) begin
            case (rRate)
                3'b0: begin
                    CE_Cntr <= 0;
                end
                3'b1: begin
                    CE_Cntr <= 1;
                end
                3'b10: begin
                    CE_Cntr <= 3;
                end
                3'b11: begin
                    CE_Cntr <= 7;
                end
                3'b100: begin
                    CE_Cntr <= 15;
                end
                3'b101: begin
                    CE_Cntr <= 31;
                end
                3'b110: begin
                    CE_Cntr <= 63;
                end
                3'b111: begin
                    CE_Cntr <= 127;
                end
            endcase
        end
        else begin
            CE_Cntr <= (CE_Cntr - 1);
        end
    end
    assign CE = (Ld | ~|(CE_Cntr));
    assign CE_SCK = (CE & SS);
    assign Rst_SCK = (((Rst | Ld) | (COS_SCK_Lvl & ~(SS))) | ((TC_BitCnt & CE_OSR) & ~(DAV)));
    always @(posedge Clk) begin
        if (Rst_SCK) begin
            SCK <= (Ld ? SCK_Inv : SCK_Lvl);
        end
        else if (CE_SCK) begin
            SCK <= ~(SCK);
        end
    end
    assign CE_OSR = (CE_SCK & (SCK_Inv ^ SCK));
    wire logic Ld_OSR;
    assign Ld_OSR = (Ld | (TC_BitCnt & CE_OSR));
    always @(posedge Clk) begin if (Ld_OSR) begin
            OSR <= TD;
        end
        else if (CE_OSR) begin
            OSR <= (Dir ? {SCK_Lvl, OSR[7:1]} : {OSR[6:0], SCK_Lvl});
        end
    end
    assign MOSI = (SS & (Dir ? OSR[0] : OSR[7]));
    assign CE_ISR = (CE_SCK & (SCK_Inv ^ ~(SCK)));
    always @(posedge Clk) begin
        if (Rst) begin
            ISR <= 0;
        end
        else if (Ld) begin
            ISR <= 0;
        end
        else if (CE_ISR) begin
            ISR <= (Dir ? {MISO, ISR[7:1]} : {ISR[6:0], MISO});
        end
    end
    wire logic CE_BitCnt;
    assign CE_BitCnt = (CE_OSR);
    wire logic Rst_BitCnt;
    assign Rst_BitCnt = ((Rst));
    always @(posedge Clk) begin
        if (Rst_BitCnt) begin
            BitCnt <= 7;
        end
        else if (CE_BitCnt) begin
            BitCnt <= (BitCnt - 1);
        end
    end
    assign TC_BitCnt = ~|(BitCnt);
    always @(posedge Clk) begin
        if (Rst) begin
            SS <= 0;
        end
        else if (Ld_OSR) begin
            SS <= DAV;
        end
    end
    always @(posedge Clk) begin if (Ld_OSR) begin
            RdEn <= ( TD[8]);
        end
    end
    always @(posedge Clk) begin begin
            FRE <= (Ld | (DAV & (TC_BitCnt & CE_OSR)));
        end
    end
    always @(posedge Clk) begin begin
            FWE <= (RdEn & (TC_BitCnt & CE_ISR));
        end
    end
    assign RD = ISR;
endmodule