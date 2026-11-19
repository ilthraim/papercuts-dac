module sub86 (
    input logic CLK,
    input logic RSTN,
    output logic[31:0] IA,
    input logic[15:0] ID,
    output logic[31:0] A,
    input logic[31:0] D,
    output logic[31:0] Q,
    output logic WEN,
    output logic[1:0] BEN,
    input logic CE,
    output reg RD,
    input logic INT
);
    reg[31:0] EAX;
    reg[31:0] EBX;
    reg[31:0] ECX;
    reg[31:0] EDX;
    reg[31:0] EBP;
    reg[31:0] ESP;
    reg[31:0] PC;
    reg[31:0] regsrc;
    reg[31:0] regdest;
    reg[31:0] alu_out;
    reg[5:0] state;
    reg[5:0] nstate;
    reg[2:0] src;
    reg[2:0] dest;
    reg INTreg;
    reg WR;
    reg cry;
    reg ncry;
    reg prefx;
    reg nprefx;
    reg cmpr;
    reg eqF;
    reg gF;
    reg lF;
    reg aF;
    reg bF;
    wire logic INTvalid;
    wire logic nncry;
    wire logic neqF;
    wire logic ngF;
    wire logic nlF;
    wire logic naF;
    wire logic nbF;
    wire logic divF1;
    wire logic divF2;
    wire logic[31:0] pc_ja;
    wire logic[31:0] pc_jae;
    wire logic[31:0] pc_jb;
    wire logic[31:0] pc_jbe;
    wire logic[31:0] pc_jg;
    wire logic[31:0] pc_jge;
    wire logic[31:0] pc_jl;
    wire logic[31:0] pc_jle;
    wire logic[31:0] pc_eq;
    wire logic[31:0] pc_jp;
    wire logic[31:0] pc_neq;
    wire logic[31:0] pc_sh;
    wire logic[31:0] Sregsrc;
    wire logic[31:0] Zregsrc;
    wire logic[31:0] incPC;
    wire logic[31:0] sft_out;
    wire logic[31:0] smlEAX;
    wire logic[31:0] smlECX;
    wire logic[32:0] adder_out;
    wire logic[32:0] sub_out;
    wire logic[4:0] EBX_shtr;
    wire logic signed[31:0] ssregsrc;
    wire logic signed[31:0] ssregdest;
    always @(posedge CLK) begin
        casex ({RSTN, INT, ((RD | WR) & CE)})
            3'b0xx: begin
                INTreg <= 1'b0;
            end
            3'b11x: begin
                INTreg <= 1'b1;
            end
            3'b1x1: begin
                INTreg <= 1'b0;
            end
            default: begin
                INTreg <= INTreg;
            end
        endcase
    end
    always @(posedge CLK) begin
        if (((CE == 1'b1) || (RSTN == 1'b0))) begin
            case (state)
                6'b100100, 6'b101000: begin
                    cry <= (EAX[31] ^ ECX[31]);
                end
                6'b101100: begin
                    cry <= 1'b0;
                end
                default: begin
                    cry <= (ncry & RSTN);
                end
            endcase
            prefx <= (nprefx);
            state <= (nstate & {6{RSTN}});
            if (cmpr) begin
                eqF <= (neqF);
                lF <= (nlF);
                gF <= (ngF);
                bF <= (nbF);
                aF <= (naF);
            end
            else begin
                eqF <= (eqF & RSTN);
                lF <= (lF & RSTN);
                gF <= (gF & RSTN);
                bF <= (bF & RSTN);
                aF <= (aF & RSTN);
            end
            case (state)
                6'b0: begin
                    EAX <= 32'd0;
                end
                6'b11001, 6'b100101: begin
                    EAX <= {EAX[30:0], 1'b0};
                end
                6'b11010: begin
                    EAX <= EBX;
                end
                6'b100100: begin
                    EAX <= smlEAX;
                end
                6'b100110: begin
                    if ((cry == 1'b0)) begin
                        EAX <= EBX;
                    end
                    else begin
                        EAX <= (~(EBX) + 1'b1);
                    end
                end
                6'b101000, 6'b101100: begin
                    EAX <= 32'd0;
                end
                6'b101010: begin
                    if ((nlF == 1'b0)) begin
                        EAX <= (EAX + (1 << EBX_shtr));
                    end
                    else begin
                        EAX <= EAX;
                    end
                end
                6'b101011: begin
                    if ((cry == 1'b1)) begin
                        EAX <= (~(EAX) + 1'b1);
                    end
                    else begin
                        EAX <= EAX;
                    end
                end
                default: begin
                    if ((dest == 3'b0)) begin
                        EAX <= alu_out;
                    end
                    else begin
                        EAX <= EAX;
                    end
                end
            endcase
            case (state)
                6'b0: begin
                    EBX <= 32'd0;
                end
                6'b1, 6'b1111, 6'b11, 6'b10001, 6'b10011, 6'b10101, 6'b10111, 6'b101, 6'b1001, 6'b11100, 6'b11110, 6'b100000, 6'b100010, 6'b111: begin
                    EBX <= {EBX[31:16], ID[7:0], ID[15:8]};
                end
                6'b101101: begin
                    EBX <= ({{24{ID[15]}}, ID[15:8]} + EBP);
                end
                6'b110: begin
                    EBX <= {ID[7:0], ID[15:8], EBX[15:0]};
                end
                6'b1000: begin
                    EBX <= ({ID[7:0], ID[15:8], EBX[15:0]} + EBP);
                end
                6'b11001, 6'b100101: begin
                    if ((ECX[0] == 1'b1)) begin
                        EBX <= (EAX + EBX);
                    end
                    else begin
                        EBX <= EBX;
                    end
                end
                6'b1110: begin
                    EBX <= {EBX[31:5], EBX_shtr};
                end
                6'b101000: begin
                    EBX <= {EAX[31], ECX[31], EBX[29:0]};
                end
                6'b101100: begin
                    EBX <= {2'b0, EBX[29:0]};
                end
                6'b101001: begin
                    if ((divF1 == 1'b0)) begin
                        EBX <= {EBX[31:5], (EBX[4:0] + 1'b1)};
                    end
                    else begin
                        EBX <= EBX;
                    end
                end
                6'b101010: begin
                    if ((divF1 == 1'b1)) begin
                        EBX <= {EBX[31:5], EBX_shtr};
                    end
                    else begin
                        EBX <= EBX;
                    end
                end
                6'b111111: begin
                    if ((ID[15:8] == 8'd179)) begin
                        EBX <= {EBX[31:24], ID[7:0]};
                    end
                    else if ((dest == 3'b11)) begin
                        EBX <= alu_out;
                    end
                    else begin
                        EBX <= EBX;
                    end
                end
                default: begin
                    EBX <= EBX;
                end
            endcase
            case (state)
                6'b0: begin
                    ECX <= 32'd0;
                end
                6'b11001, 6'b100101: begin
                    ECX <= {1'b0, ECX[31:1]};
                end
                6'b100100, 6'b101000: begin
                    ECX <= smlECX;
                end
                6'b101001: begin
                    if ((divF1 == 1'b0)) begin
                        ECX <= {ECX[30:0], 1'b0};
                    end
                    else begin
                        ECX <= ECX;
                    end
                end
                6'b101010: begin
                    if (((divF1 == 1'b1) && (divF2 == 1'b0))) begin
                        ECX <= {1'b0, ECX[31:1]};
                    end
                    else begin
                        ECX <= ECX;
                    end
                end
                6'b101011: begin
                    if ((EBX[30] == 1'b1)) begin
                        ECX <= (~(ECX) + 1);
                    end
                    else begin
                        ECX <= ECX;
                    end
                end
                default: begin
                    if ((dest == 3'b1)) begin
                        ECX <= alu_out;
                    end
                    else begin
                        ECX <= ECX;
                    end
                end
            endcase
            case (state)
                6'b0: begin
                    EDX <= 32'd0;
                end
                6'b101000: begin
                    EDX <= smlEAX;
                end
                6'b101100: begin
                    EDX <= EAX;
                end
                6'b101010: begin
                    if ((nbF == 1'b0)) begin
                        EDX <= (EDX - ECX);
                    end
                    else begin
                        EDX <= EDX;
                    end
                end
                6'b101011: begin
                    if ((EBX[31] == 1'b1)) begin
                        EDX <= (~(EDX) + 1);
                    end
                    else begin
                        EDX <= EDX;
                    end
                end
                default: begin
                    if ((dest == 3'b10)) begin
                        EDX <= alu_out;
                    end
                    else begin
                        EDX <= EDX;
                    end
                end
            endcase
            case (state)
                6'b0: begin
                    ESP <= 32'd102908;
                end
                6'b1001, 6'b101110, 6'b110001: begin
                    ESP <= (ESP - 4'b100);
                end
                6'b1100: begin
                    ESP <= (ESP + 4'b100);
                end
                default: begin
                    if ((dest == 3'b100)) begin
                        ESP <= alu_out;
                    end
                    else begin
                        ESP <= ESP;
                    end
                end
            endcase
            if ((dest == 3'b101)) begin
                EBP <= alu_out;
            end
            else begin
                EBP <= EBP;
            end
            case (state)
                6'b0: begin
                    PC <= 32'd4096;
                end
                6'b110010: begin
                    PC <= 32'd0;
                end
                6'b100011: begin
                    PC <= pc_jae;
                end
                6'b11111: begin
                    PC <= pc_jbe;
                end
                6'b100001: begin
                    PC <= pc_ja;
                end
                6'b11101: begin
                    PC <= pc_jb;
                end
                6'b100: begin
                    PC <= pc_jge;
                end
                6'b10100: begin
                    PC <= pc_jle;
                end
                6'b10000: begin
                    PC <= pc_jg;
                end
                6'b10010: begin
                    PC <= pc_jl;
                end
                6'b10110: begin
                    PC <= pc_eq;
                end
                6'b11000: begin
                    PC <= pc_neq;
                end
                6'b10, 6'b1010: begin
                    PC <= pc_jp;
                end
                6'b101111: begin
                    PC <= EBX;
                end
                6'b1100: begin
                    PC <= D;
                end
                6'b11001, 6'b11010, 6'b100100, 6'b100101, 6'b100110, 6'b100111, 6'b101000, 6'b101001, 6'b101010, 6'b101011, 6'b101100, 6'b1110, 6'b110001: begin
                    PC <= PC;
                end
                6'b111111: begin
                    if ((nstate == 6'b1110)) begin
                        PC <= PC;
                    end
                    else if ((ID[15:8] == 8'd235)) begin
                        PC <= pc_sh;
                    end
                    else if (((ID[15:8] == 8'd117) && (eqF == 1'b0))) begin
                        PC <= pc_sh;
                    end
                    else if (((ID[15:8] == 8'd116) && (eqF == 1'b1))) begin
                        PC <= pc_sh;
                    end
                    else begin
                        PC <= incPC;
                    end
                end
                default: begin
                    PC <= incPC;
                end
            endcase
        end
    end
    always @(src or EAX or ECX or EDX or EBX or ESP or EBP or D) begin
        case (src)
            3'b0: begin
                regsrc = EAX;
            end
            3'b1: begin
                regsrc = ECX;
            end
            3'b10: begin
                regsrc = EDX;
            end
            3'b100: begin
                regsrc = ESP;
            end
            3'b101: begin
                regsrc = EBP;
            end
            3'b110: begin
                regsrc = 32'd4;
            end
            3'b111: begin
                regsrc = D;
            end
            default: begin
                regsrc = EBX;
            end
        endcase
    end
    always @(dest or EAX or ECX or EDX or EBX or ESP or EBP or D) begin
        case (dest)
            3'b0: begin
                regdest = EAX;
            end
            3'b1: begin
                regdest = ECX;
            end
            3'b10: begin
                regdest = EDX;
            end
            3'b100: begin
                regdest = ESP;
            end
            3'b101: begin
                regdest = EBP;
            end
            3'b110: begin
                regdest = 32'd4;
            end
            3'b111: begin
                regdest = D;
            end
            default: begin
                regdest = EBX;
            end
        endcase
    end
    always @(state or regdest or regsrc or ID or cry or Zregsrc or Sregsrc or sft_out or adder_out or sub_out) begin
        if ((state == 6'b111111)) begin
            case (ID[15:10])
                6'b0: begin
                    {ncry, alu_out} = adder_out;
                end
                6'b10: begin
                    {ncry, alu_out} = {cry, (regdest | regsrc)};
                end
                6'b100: begin
                    {ncry, alu_out} = adder_out;
                end
                6'b110: begin
                    {ncry, alu_out} = sub_out;
                end
                6'b1000: begin
                    {ncry, alu_out} = {cry, (regdest & regsrc)};
                end
                6'b1010: begin
                    {ncry, alu_out} = sub_out;
                end
                6'b1100: begin
                    {ncry, alu_out} = {cry, (regdest ^ regsrc)};
                end
                6'b100010: begin
                    {ncry, alu_out} = {cry, regsrc};
                end
                6'b101101: begin
                    {ncry, alu_out} = {cry, Zregsrc};
                end
                6'b101111: begin
                    {ncry, alu_out} = {cry, Sregsrc};
                end
                default: begin
                    {ncry, alu_out} = {cry, regdest};
                end
            endcase
        end
        else if ((state == 6'b1110)) begin
            {ncry, alu_out} = {cry, sft_out};
        end
        else begin
            {ncry, alu_out} = {cry, regdest};
        end
    end
    always @(ID or state or ECX or EBX_shtr or EAX or divF1 or divF2 or INTvalid) begin
        if (((state == 6'b111111) || (state == 6'b1110))) begin
            casex ({ID[15:12], ID[10:9], ID[7]})
                7'b10x0000: begin
                    RD = 0;
                    WR = 1;
                    src = ID[5:3];
                    dest = 3'b111;
                end
                7'b100xx10: begin
                    RD = 1;
                    WR = 0;
                    src = 3'b111;
                    dest = ID[5:3];
                end
                7'b101xx10: begin
                    RD = 0;
                    WR = 0;
                    src = 3'b111;
                    dest = ID[5:3];
                end
                7'b10xxx11: begin
                    RD = 0;
                    WR = 0;
                    src = ID[2:0];
                    dest = ID[5:3];
                end
                7'b0xxx11: begin
                    RD = 0;
                    WR = 0;
                    src = ID[2:0];
                    dest = ID[5:3];
                end
                default: begin
                    RD = 0;
                    WR = 0;
                    src = ID[5:3];
                    dest = ID[2:0];
                end
            endcase
        end
        else if ((state == 6'b1011)) begin
            src = 3'b11;
            dest = 3'b100;
            RD = 0;
            WR = 0;
        end
        else if ((state == 6'b101010)) begin
            src = 3'b1;
            dest = 3'b10;
            RD = 0;
            WR = 0;
        end
        else begin
            src = 3'b0;
            dest = 3'b0;
            RD = 0;
            WR = 0;
        end
        if ((state == 6'b111111)) begin
            casex ({INTvalid, ID})
                17'b1xxxxxxxxxxxxxxxx: begin
                    nstate = 6'b110001;
                end
                17'd37097: begin
                    nstate = 6'b1;
                end
                17'd3975: begin
                    nstate = 6'b100000;
                end
                17'd3974: begin
                    nstate = 6'b11110;
                end
                17'd3971: begin
                    nstate = 6'b100010;
                end
                17'd3970: begin
                    nstate = 6'b11100;
                end
                17'd3983: begin
                    nstate = 6'b1111;
                end
                17'd3982: begin
                    nstate = 6'b10011;
                end
                17'd3981: begin
                    nstate = 6'b11;
                end
                17'd3980: begin
                    nstate = 6'b10001;
                end
                17'd3973: begin
                    nstate = 6'b10111;
                end
                17'd3972: begin
                    nstate = 6'b10101;
                end
                17'd37051: begin
                    nstate = 6'b101;
                end
                17'd36253: begin
                    nstate = 6'b111;
                end
                17'd36189: begin
                    nstate = 6'b101101;
                end
                17'd37096: begin
                    nstate = 6'b1001;
                end
                17'd37059: begin
                    nstate = 6'b1011;
                end
                17'b11000001xxxxxxxx: begin
                    nstate = 6'b1110;
                end
                17'b11010011xxxxxxxx: begin
                    nstate = 6'b1110;
                end
                17'd63457: begin
                    nstate = 6'b11001;
                end
                17'd63481: begin
                    nstate = 6'b101000;
                end
                17'd63473: begin
                    nstate = 6'b101100;
                end
                17'd44993: begin
                    nstate = 6'b100100;
                end
                17'd65491: begin
                    nstate = 6'b101110;
                end
                default: begin
                    nstate = 6'b111111;
                end
            endcase
            if ((ID == 16'd36966)) begin
                nprefx = 1'b1;
            end
            else begin
                nprefx = 1'b0;
            end
            if ((ID[15:8] == 8'd57)) begin
                cmpr = 1'b1;
            end
            else begin
                cmpr = 1'b0;
            end
        end
        else begin
            nprefx = 1'b0;
            cmpr = 1'b0;
            if ((state == 6'b110001)) begin
                nstate = 6'b110010;
            end
            else if (((state == 6'b11001) && !((ECX == 32'd0)))) begin
                nstate = 6'b11001;
            end
            else if (((state == 6'b11001))) begin
                nstate = 6'b11010;
            end
            else if ((state == 6'b100100)) begin
                nstate = 6'b100101;
            end
            else if (((state == 6'b100101) && !((ECX == 32'd0)))) begin
                nstate = 6'b100101;
            end
            else if (((state == 6'b100101))) begin
                nstate = 6'b100110;
            end
            else if ((state == 6'b101100)) begin
                nstate = 6'b101001;
            end
            else if ((state == 6'b101000)) begin
                nstate = 6'b101001;
            end
            else if (((state == 6'b101001) && (divF1 == 1'b0))) begin
                nstate = 6'b101001;
            end
            else if (((state == 6'b101001))) begin
                nstate = 6'b101010;
            end
            else if (((state == 6'b101010) && (divF2 == 1'b0))) begin
                nstate = 6'b101010;
            end
            else if (((state == 6'b101010))) begin
                nstate = 6'b101011;
            end
            else if ((state == 6'b1)) begin
                nstate = 6'b10;
            end
            else if ((state == 6'b10111)) begin
                nstate = 6'b11000;
            end
            else if ((state == 6'b10101)) begin
                nstate = 6'b10110;
            end
            else if ((state == 6'b11)) begin
                nstate = 6'b100;
            end
            else if ((state == 6'b1111)) begin
                nstate = 6'b10000;
            end
            else if ((state == 6'b10011)) begin
                nstate = 6'b10100;
            end
            else if ((state == 6'b10001)) begin
                nstate = 6'b10010;
            end
            else if ((state == 6'b100010)) begin
                nstate = 6'b100011;
            end
            else if ((state == 6'b100000)) begin
                nstate = 6'b100001;
            end
            else if ((state == 6'b11110)) begin
                nstate = 6'b11111;
            end
            else if ((state == 6'b11100)) begin
                nstate = 6'b11101;
            end
            else if ((state == 6'b101)) begin
                nstate = 6'b110;
            end
            else if ((state == 6'b111)) begin
                nstate = 6'b1000;
            end
            else if ((state == 6'b1001)) begin
                nstate = 6'b1010;
            end
            else if ((state == 6'b101110)) begin
                nstate = 6'b101111;
            end
            else if ((state == 6'b1011)) begin
                nstate = 6'b1100;
            end
            else if (((state == 6'b1110) && !((EBX_shtr == 5'b0)))) begin
                nstate = 6'b1110;
            end
            else if (((state == 6'b1110))) begin
                nstate = 6'b11011;
            end
            else if ((state == 6'b11011)) begin
                nstate = 6'b110000;
            end
            else begin
                nstate = 6'b111111;
            end
        end
    end
    assign INTvalid = (INTreg & (WR | RD));
    assign ssregsrc = regsrc;
    assign ssregdest = regdest;
    assign IA = PC;
    assign A = ((((state == 6'b1010) | (state == 6'b101111)) | (state == 6'b110010)) ? ESP : EBX);
    assign Q = ((((state == 6'b1010) | (state == 6'b101111)) | (state == 6'b110010)) ? incPC : regsrc);
    assign WEN = ((CE == 1'b0) ? 1'b1 : ((WR == 1'b1) ? 1'b0 : ((state == 6'b1010) ? 1'b0 : ((state == 6'b110010) ? 1'b0 : ((state == 6'b101111) ? 1'b0 : 1'b1)))));
    assign Sregsrc = (ID[8] ? {{16{regsrc[15]}}, regsrc[15:0]} : {{24{regsrc[7]}}, regsrc[7:0]});
    assign Zregsrc = (ID[8] ? {16'd0, regsrc[15:0]} : {24'd0, regsrc[7:0]});
    assign BEN = ((state == 6'b111111) ? {prefx, ID[8]} : 1'b1);
    assign neqF = ((regsrc == regdest) ? 1'b1 : 1'b0);
    assign nbF = ((regsrc > regdest) ? 1'b1 : 1'b0);
    assign naF = ~((nlF | neqF));
    assign nlF = ((ssregsrc > ssregdest) ? 1'b1 : 1'b0);
    assign ngF = ~((nbF | neqF));
    assign incPC = (PC + 3'b10);
    assign pc_jge = ((eqF | gF) ? pc_jp : incPC);
    assign pc_jle = ((eqF | lF) ? pc_jp : incPC);
    assign pc_jg = (gF ? pc_jp : incPC);
    assign pc_jl = (lF ? pc_jp : incPC);
    assign pc_jae = ((eqF | aF) ? pc_jp : incPC);
    assign pc_jbe = ((eqF | bF) ? pc_jp : incPC);
    assign pc_ja = (aF ? pc_jp : incPC);
    assign pc_jb = (bF ? pc_jp : incPC);
    assign pc_eq = (eqF ? pc_jp : incPC);
    assign pc_neq = (eqF ? incPC : pc_jp);
    assign pc_jp = (incPC + {ID, EBX[15:0]});
    assign pc_sh = (incPC + {{24{ID[7]}}, ID[7:0]});
    assign sft_out = ((src == 3'b111) ? {regdest[31], regdest[31:1]} : ((src == 3'b101) ? {1'b0, regdest[31:1]} : {regdest[30:0], 1'b0}));
    assign adder_out = ((nncry + regsrc) + regdest);
    assign sub_out = ((regdest - regsrc) - nncry);
    assign nncry = (ID[12] ? cry : 1'b0);
    assign EBX_shtr = (EBX[4:0] - 1'b1);
    assign smlEAX = (EAX[31] ? (~(EAX) + 1) : EAX);
    assign smlECX = (ECX[31] ? (~(ECX) + 1) : ECX);
    assign divF1 = (({ECX[31:0], 1'b0} > {1'b0, EDX}) ? 1'b1 : 1'b0);
    assign divF2 = ((EBX_shtr == 5'b0) ? 1'b1 : 1'b0);
endmodule