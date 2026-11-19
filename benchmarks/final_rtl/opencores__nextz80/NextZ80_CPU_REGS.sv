
module NextZ80_CPU_REGS (
    input logic[7:0] rstatus,
    input logic M1,
    input logic[5:0] WE,
    input logic CLK,
    input logic[15:0] ALU8OUT,
    input logic[7:0] DI,
    output reg[7:0] DO,
    input logic[15:0] ADDR,
    input logic[7:0] CONST,
    output reg[7:0] ALU80,
    output reg[7:0] ALU81,
    output reg[15:0] ALU160,
    output logic[7:0] ALU161,
    input logic[7:0] ALU8FLAGS,
    output logic[7:0] FLAGS,
    input logic[1:0] DO_SEL,
    input logic ALU160_sel,
    input logic[3:0] REG_WSEL,
    input logic[3:0] REG_RSEL,
    input logic DINW_SEL,
    input logic XMASK,
    input logic[2:0] ALU16OP,
    input logic WAIT
);
    reg[15:0] pc = 0;
    reg[15:0] sp;
    reg[7:0] r;
    reg[15:0] flg = 0;
    reg[7:0] th;
    wire logic[15:0] rdor;
    wire logic[15:0] rdow;
    wire logic[3:0] SELW;
    wire logic[3:0] SELR;
    reg[15:0] DIN;
    reg[15:0] mux_rdor;
    NextZ80_CPU_REGS_regs_lo regs_lo (
        .DPO(rdor[7:0]),
        .SPO(rdow[7:0]),
        .A(SELW),
        .D(DIN[7:0]),
        .DPRA(SELR),
        .WCLK(CLK),
        .WE((WE[0] & !(WAIT)))
    );
    NextZ80_CPU_REGS_regs_hi regs_hi (
        .DPO(rdor[15:8]),
        .SPO(rdow[15:8]),
        .A(SELW),
        .D(DIN[15:8]),
        .DPRA(SELR),
        .WCLK(CLK),
        .WE((WE[1] & !(WAIT)))
    );
    wire logic[15:0] ADDR1 = (ADDR + !(ALU16OP[2]));
    wire logic[7:0] flgmux = {ALU8FLAGS[7:3], ((SELR[3:0] == 4'b100) ? rstatus[7] : ALU8FLAGS[2]), ALU8FLAGS[1:0]};
    always @(posedge CLK) begin
        if (!(WAIT)) begin
            if (WE[2]) begin
                th <= DI;
            end
            if (WE[3]) begin
                sp <= ADDR1;
            end
            if (WE[4]) begin
                pc <= ADDR1;
            end
            if (({REG_WSEL, WE[0]} == 5'b10011)) begin
                r <= ALU8OUT[7:0];
            end
            else if (M1) begin
                r[6:0] <= (r[6:0] + 1);
            end
            if (WE[5]) begin
                if (rstatus[0]) begin
                    flg[15:8] <= flgmux;
                end
                else begin
                    flg[7:0] <= flgmux;
                end
            end
        end
    end
    assign ALU161 = th;
    assign FLAGS = (rstatus[0] ? flg[15:8] : flg[7:0]);
    always @* begin
        DIN = (DINW_SEL ? {DI, DI} : ALU8OUT);
        ALU80 = (REG_WSEL[0] ? rdow[7:0] : rdow[15:8]);
        ALU81 = (REG_RSEL[0] ? mux_rdor[7:0] : mux_rdor[15:8]);
        ALU160 = (ALU160_sel ? pc : mux_rdor);
        case ({REG_WSEL[3], DO_SEL})
            0: begin
                DO = ALU80;
            end
            1: begin
                DO = th;
            end
            2: begin
                DO = FLAGS;
            end
            3: begin
                DO = ALU8OUT[7:0];
            end
            4: begin
                DO = pc[15:8];
            end
            5: begin
                DO = pc[7:0];
            end
            6: begin
                DO = sp[15:8];
            end
            7: begin
                DO = sp[7:0];
            end
        endcase
        case ({(ALU16OP == 4), REG_RSEL[3:0]})
            5'b1001, 5'b11001: begin
                mux_rdor = {rdor[15:8], r};
            end
            5'b1010, 5'b1011: begin
                mux_rdor = sp;
            end
            5'b1100, 5'b1101, 5'b11100, 5'b11101: begin
                mux_rdor = {8'd0, CONST};
            end
            default: begin
                mux_rdor = rdor;
            end
        endcase
    end
    NextZ80_CPU_REGS_WSelectW WSelectW (
        .SEL(REG_WSEL[3:1]),
        .RAMSEL(SELW),
        .rstatus({rstatus[5], (rstatus[4] & XMASK), rstatus[3:0]})
    );
    NextZ80_CPU_REGS_WSelectR WSelectR (
        .SEL(REG_RSEL[3:1]),
        .RAMSEL(SELR),
        .rstatus(rstatus[5:0])
    );
endmodule