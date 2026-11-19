module NextZ80 (
    input logic[7:0] DI,
    output logic[7:0] DO,
    output logic[15:0] ADDR,
    output reg WR,
    output reg MREQ,
    output reg IORQ,
    output reg HALT,
    output reg M1,
    input logic CLK,
    input logic RESET,
    input logic INT,
    input logic NMI,
    input logic WAIT
);
    reg[9:0] CPUStatus = 0;
    wire logic[7:0] ALU8FLAGS;
    wire logic[7:0] FLAGS;
    wire logic[7:0] ALU80;
    wire logic[7:0] ALU81;
    wire logic[15:0] ALU160;
    wire logic[7:0] ALU161;
    wire logic[15:0] ALU8OUT;
    reg[9:0] FETCH = 0;
    reg[2:0] STAGE = 0;
    wire logic[5:0] opd;
    wire logic[2:0] op16;
    wire logic op0mem = (FETCH[2:0] == 6);
    wire logic op1mem = (FETCH[5:3] == 6);
    reg[1:0] fetch98;
    reg[1:0] DO_SEL;
    reg ALU160_SEL;
    reg DINW_SEL;
    reg[5:0] WE;
    reg[4:0] ALU8OP;
    reg[2:0] ALU16OP;
    reg next_stage;
    reg[3:0] REG_WSEL;
    reg[3:0] REG_RSEL;
    reg[11:0] status;
    wire logic[7:0] FlagMux = {FLAGS[7], !(FLAGS[7]), FLAGS[2], !(FLAGS[2]), FLAGS[0], !(FLAGS[0]), FLAGS[6], !(FLAGS[6])};
    reg tzf;
    reg FNMI = 0;
    reg SNMI = 0;
    reg SRESET = 0;
    reg SINT = 0;
    wire logic[2:0] intop = (FETCH[1] ? 4 : (FETCH[0] ? 5 : 6));
    reg xmask;
    NextZ80_CPU_REGS CPU_REGS (
        .rstatus(CPUStatus[7:0]),
        .M1(M1),
        .WE(WE),
        .CLK(CLK),
        .ALU8OUT(ALU8OUT),
        .DI(DI),
        .DO(DO),
        .ADDR(ADDR),
        .CONST((FETCH[7] ? {2'b0, FETCH[5:3], 3'b0} : 8'd102)),
        .ALU80(ALU80),
        .ALU81(ALU81),
        .ALU160(ALU160),
        .ALU161(ALU161),
        .ALU8FLAGS(ALU8FLAGS),
        .FLAGS(FLAGS),
        .DO_SEL(DO_SEL),
        .ALU160_sel(ALU160_SEL),
        .REG_WSEL(REG_WSEL),
        .REG_RSEL(REG_RSEL),
        .DINW_SEL(DINW_SEL),
        .XMASK(xmask),
        .ALU16OP(ALU16OP),
        .WAIT(WAIT)
    );
    NextZ80_CPU_ALU8 CPU_ALU8 (
        .D0(ALU80),
        .D1(ALU81),
        .FIN(FLAGS),
        .FOUT(ALU8FLAGS),
        .ALU8DOUT(ALU8OUT),
        .OP(ALU8OP),
        .EXOP(FETCH[8:3]),
        .LDIFLAGS(REG_WSEL[2]),
        .DSTHI(!(REG_WSEL[0]))
    );
    NextZ80_CPU_ALU16 CPU_ALU16 (
        .D0(ALU160),
        .D1(ALU161),
        .DOUT(ADDR),
        .OP(ALU16OP)
    );
    always @(posedge CLK) begin
        if (!(WAIT)) begin
            SRESET <= RESET;
            SNMI <= NMI;
            SINT <= INT;
            if (!(SNMI)) begin
                FNMI <= 0;
            end
            if (SRESET) begin
                FETCH <= 10'd896;
            end
            else if ((FETCH[9:6] == 4'b1110)) begin
                {FETCH[9:7]} <= 3'b0;
            end
            else begin
                if (M1) begin
                    case ({MREQ, CPUStatus[9:8]})
                        3'b0, 3'b1, 3'b100, 3'b101, 3'b110, 3'b111: begin
                            FETCH <= {fetch98, DI};
                        end
                        3'b10: begin
                            FETCH <= {fetch98, 8'd255};
                        end
                        3'b11: begin
                            ;
                        end
                    endcase
                end
                if (~|({next_stage, fetch98[1:0], status[4]})) begin
                    if ((SNMI & !(FNMI))) begin
                        {FETCH[9:6], FETCH[1:0]} <= {4'b1101, HALT, M1};
                        FNMI <= 1;
                    end
                    else if (((SINT & CPUStatus[6]) & !(status[11]))) begin
                        {FETCH[9:6], FETCH[1:0]} <= {4'b1100, HALT, M1};
                    end
                end
            end
            if (next_stage) begin
                STAGE <= (STAGE + 3'b1);
            end
            else begin
                STAGE <= 0;
            end
            if (status[4]) begin
                CPUStatus[5:4] <= status[5:4];
            end
            else if ((~|({next_stage, fetch98[1]}))) begin
                CPUStatus[4] <= 1'b0;
            end
            CPUStatus[3:0] <= (CPUStatus[3:0] ^ status[3:0]);
            if (status[11]) begin
                CPUStatus[7:6] <= status[7:6];
            end
            if (status[10]) begin
                CPUStatus[9:8] <= status[9:8];
            end
            tzf <= ALU8FLAGS[6];
        end
    end
    assign opd[0] = (FETCH[0] ^ &(FETCH[2:1]));
    assign opd[2:1] = FETCH[2:1];
    assign opd[3] = (FETCH[3] ^ &(FETCH[5:4]));
    assign opd[5:4] = FETCH[5:4];
    assign op16[2:0] = (&(FETCH[5:4]) ? 3'b101 : {1'b0, FETCH[5:4]});
    always @* begin
        DO_SEL = 2'bxx;
        ALU160_SEL = 1'bx;
        DINW_SEL = 1'bx;
        WE = 6'bxxxxxx;
        ALU8OP = 5'bxxxxx;
        ALU16OP = 3'b0;
        next_stage = 0;
        REG_WSEL = 4'bxxxx;
        REG_RSEL = 4'bxxxx;
        M1 = 1;
        MREQ = 1;
        WR = 0;
        HALT = 0;
        IORQ = 0;
        status = 12'b0xxxxx00000;
        fetch98 = 2'b0;
        case ({FETCH[7:6], op1mem, op0mem})
            4'b0, 4'b1, 4'b10, 4'b11, 4'b100, 4'b1000, 4'b1100: begin
                xmask = 1;
            end
            default: begin
                xmask = 0;
            end
        endcase
        case (FETCH[9:6])
            4'b0: begin
                case (FETCH[3:0])
                    4'b0, 4'b1000: begin
                        case (FETCH[5:4])
                            2'b0: begin
                                DO_SEL = 2'bxx;
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                status[0] = FETCH[3];
                            end
                            2'b1: begin
                                if (!(STAGE[0])) begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10100;
                                    if (!(FETCH[3])) begin
                                        ALU8OP = 5'b1010;
                                        REG_WSEL = 4'b0;
                                    end
                                    next_stage = 1;
                                    M1 = 0;
                                end
                                else if (FETCH[3]) begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                    ALU16OP = 3;
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    DINW_SEL = 0;
                                    WE = 6'b10x10;
                                    ALU8OP = 5'b1010;
                                    ALU16OP = (tzf ? 3'b0 : 3'b11);
                                    REG_WSEL = 4'b0;
                                end
                            end
                            2'b10, 2'b11: begin
                                case ({STAGE[0], FlagMux[{1'b0, FETCH[4:3]}]})
                                    2'b0, 2'b11: begin
                                        ALU160_SEL = 1;
                                        WE = 6'b10x00;
                                        ALU16OP = (STAGE[0] ? 3'b11 : 3'b1);
                                    end
                                    2'b1: begin
                                        ALU160_SEL = 1;
                                        WE = 6'b10100;
                                        next_stage = 1;
                                        M1 = 0;
                                    end
                                endcase
                            end
                        endcase
                    end
                    4'b1: begin
                        case ({STAGE[1:0], op16[2]})
                            3'b0, 3'b1, 3'b10, 3'b11: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 1;
                                WE = {4'b10x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                next_stage = 1;
                                REG_WSEL = {op16, 1'bx};
                                M1 = 0;
                            end
                            3'b100, 3'b111: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                            end
                            3'b101: begin
                                ALU160_SEL = 0;
                                WE = 6'b1x00;
                                ALU16OP = 4;
                                next_stage = 1;
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                                MREQ = 0;
                            end
                        endcase
                    end
                    4'b10, 4'b1010: begin
                        case (STAGE[2:0])
                            3'b0: begin
                                if ((FETCH[5] == 0)) begin
                                    if (FETCH[3]) begin
                                        DINW_SEL = 1;
                                    end
                                    else begin
                                        DO_SEL = 2'b0;
                                    end
                                    ALU160_SEL = 0;
                                    WE = {4'b0x, FETCH[3], 1'bx};
                                    next_stage = 1;
                                    REG_WSEL = (FETCH[3] ? 4'b11x : 4'b110);
                                    REG_RSEL = {op16, 1'bx};
                                    M1 = 0;
                                    WR = !(FETCH[3]);
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    DINW_SEL = 1;
                                    WE = 6'b10xx1;
                                    next_stage = 1;
                                    REG_WSEL = 4'b111x;
                                    M1 = 0;
                                end
                            end
                            3'b1: begin
                                if ((FETCH[5] == 0)) begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    DINW_SEL = 1;
                                    WE = 6'b10x10;
                                    next_stage = 1;
                                    REG_WSEL = 4'b111x;
                                    M1 = 0;
                                end
                            end
                            3'b10: begin
                                ALU160_SEL = 1'b0;
                                REG_RSEL = 4'b111x;
                                M1 = 0;
                                WR = !(FETCH[3]);
                                next_stage = 1;
                                if (FETCH[3]) begin
                                    DINW_SEL = 1;
                                    WE = {4'b0x, (FETCH[4] ? 1'b1 : 1'bx), (FETCH[4] ? 1'bx : 1'b1)};
                                    REG_WSEL = (FETCH[4] ? 4'b11x : 4'b10x);
                                end
                                else begin
                                    DO_SEL = 2'b0;
                                    WE = 6'b0x00;
                                    REG_WSEL = (FETCH[4] ? 4'b110 : 4'b101);
                                end
                            end
                            3'b11: begin
                                if (FETCH[4]) begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                                else begin
                                    REG_RSEL = 4'b111x;
                                    M1 = 0;
                                    WR = !(FETCH[3]);
                                    ALU160_SEL = 1'b0;
                                    ALU16OP = 1;
                                    next_stage = 1;
                                    if (FETCH[3]) begin
                                        DINW_SEL = 1;
                                        WE = 6'b0x10;
                                        REG_WSEL = 4'b10x;
                                    end
                                    else begin
                                        DO_SEL = 2'b0;
                                        WE = 6'b0x00;
                                        REG_WSEL = 4'b100;
                                    end
                                end
                            end
                            3'b100: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                            end
                        endcase
                    end
                    4'b11, 4'b1011: begin
                        if (!(STAGE[0])) begin
                            if (op16[2]) begin
                                ALU160_SEL = 0;
                                WE = 6'b1x00;
                                ALU16OP = {FETCH[3], 1'b0, FETCH[3]};
                                next_stage = 1;
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                                MREQ = 0;
                            end
                            else begin
                                ALU160_SEL = 1;
                                DINW_SEL = 0;
                                WE = 6'b10x11;
                                ALU8OP = {4'b111, FETCH[3]};
                                REG_WSEL = {op16, 1'b0};
                                REG_RSEL = {op16, 1'b1};
                            end
                        end
                        else begin
                            ALU160_SEL = 1;
                            WE = 6'b10x00;
                        end
                    end
                    4'b100, 4'b101, 4'b1100, 4'b1101: begin
                        if (!(op1mem)) begin
                            DINW_SEL = 0;
                            ALU160_SEL = 1;
                            WE = (opd[3] ? 6'b110x01 : 6'b110x10);
                            ALU8OP = {3'b10, FETCH[0], 1'b0};
                            REG_WSEL = {1'b0, opd[5:3]};
                        end
                        else begin
                            case ({STAGE[1:0], CPUStatus[4]})
                                3'b0, 3'b11: begin
                                    ALU160_SEL = 0;
                                    DINW_SEL = 1;
                                    WE = 6'b1;
                                    ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                                    next_stage = 1;
                                    REG_WSEL = 4'b11x;
                                    REG_RSEL = 4'b10x;
                                    M1 = 0;
                                end
                                3'b1: begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10100;
                                    next_stage = 1;
                                    M1 = 0;
                                end
                                3'b10, 3'b101: begin
                                    DO_SEL = 2'b11;
                                    ALU160_SEL = 0;
                                    WE = 6'b100x0x;
                                    ALU8OP = {3'b10, FETCH[0], 1'b0};
                                    ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                                    next_stage = 1;
                                    REG_WSEL = 4'b111;
                                    REG_RSEL = 4'b10x;
                                    M1 = 0;
                                    WR = 1;
                                end
                                3'b100, 3'b111: begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                            endcase
                        end
                    end
                    4'b110, 4'b1110: begin
                        case ({STAGE[1:0], CPUStatus[4], op1mem})
                            4'b0, 4'b1, 4'b10, 4'b111: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 1;
                                WE = (opd[3] ? 6'b10001 : 6'b10010);
                                next_stage = 1;
                                REG_WSEL = {1'b0, opd[5:4], 1'bx};
                                M1 = 0;
                            end
                            4'b100, 4'b110, 4'b1001, 4'b1111: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                            end
                            4'b101, 4'b1011: begin
                                DO_SEL = 2'b0;
                                ALU160_SEL = 0;
                                WE = 6'b0x0x;
                                ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                                next_stage = 1;
                                REG_WSEL = 4'b111;
                                REG_RSEL = 4'b10x;
                                M1 = 0;
                                WR = 1;
                            end
                            4'b11: begin
                                ALU160_SEL = 1;
                                WE = 6'b10100;
                                next_stage = 1;
                                M1 = 0;
                            end
                        endcase
                    end
                    4'b111, 4'b1111: begin
                        case (FETCH[5:3])
                            3'b0, 3'b1, 3'b10, 3'b11, 3'b100, 3'b101: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 0;
                                WE = 6'b110x1x;
                                ALU8OP = (FETCH[5] ? {2'b1, !(FETCH[3]), 2'b1} : {3'b110, FETCH[4:3]});
                                REG_WSEL = 4'b110;
                            end
                            3'b110, 3'b111: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 0;
                                WE = 6'b110x0x;
                                ALU8OP = {4'b1010, !(FETCH[3])};
                            end
                        endcase
                    end
                    4'b1001: begin
                        if (!(STAGE[0])) begin
                            DINW_SEL = 0;
                            WE = 6'b100x01;
                            ALU8OP = 5'b10000;
                            next_stage = 1;
                            REG_WSEL = 4'b101;
                            REG_RSEL = {op16, 1'b1};
                            M1 = 0;
                            MREQ = 0;
                        end
                        else begin
                            ALU160_SEL = 1;
                            DINW_SEL = 0;
                            WE = 6'b110x10;
                            ALU8OP = 5'b10001;
                            REG_WSEL = 4'b100;
                            REG_RSEL = {op16, 1'b0};
                        end
                    end
                endcase
            end
            4'b1: begin
                case ({STAGE[1:0], CPUStatus[4], op1mem, op0mem})
                    5'b0, 5'b100, 5'b1001, 5'b10101: begin
                        ALU160_SEL = 1;
                        DINW_SEL = 0;
                        WE = (opd[3] ? 6'b10x01 : 6'b10x10);
                        ALU8OP = 29;
                        REG_WSEL = {1'b0, opd[5:4], 1'bx};
                        REG_RSEL = {1'b0, opd[2:0]};
                    end
                    5'b1, 5'b1101: begin
                        ALU160_SEL = 0;
                        DINW_SEL = 1;
                        WE = 6'b0x01;
                        ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                        next_stage = 1;
                        REG_WSEL = 4'b11x;
                        REG_RSEL = 4'b10x;
                        M1 = 0;
                    end
                    5'b101, 5'b110: begin
                        ALU160_SEL = 1;
                        WE = 6'b10100;
                        next_stage = 1;
                        M1 = 0;
                    end
                    5'b10, 5'b1110: begin
                        DO_SEL = 0;
                        ALU160_SEL = 0;
                        WE = 6'b0x00;
                        ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                        next_stage = 1;
                        REG_WSEL = {1'b0, opd[2:0]};
                        REG_RSEL = 4'b10x;
                        M1 = 0;
                        WR = 1;
                    end
                    5'b1010, 5'b10110: begin
                        ALU160_SEL = 1;
                        WE = 6'b10x00;
                    end
                    5'b11, 5'b111: begin
                        WE = 6'b0x00;
                        M1 = 0;
                        MREQ = 0;
                        HALT = 1;
                    end
                endcase
            end
            4'b10: begin
                case ({STAGE[1:0], CPUStatus[4], op0mem})
                    4'b0, 4'b10, 4'b101, 4'b1011: begin
                        ALU160_SEL = 1;
                        DINW_SEL = 0;
                        WE = {4'b110x, ~&(FETCH[5:3]), 1'bx};
                        ALU8OP = {2'b0, FETCH[5:3]};
                        REG_WSEL = 4'b110;
                        REG_RSEL = {1'b0, opd[2:0]};
                    end
                    4'b1, 4'b111: begin
                        ALU160_SEL = 0;
                        DINW_SEL = 1;
                        WE = 6'b0x01;
                        ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                        next_stage = 1;
                        REG_WSEL = 4'b11x;
                        REG_RSEL = 4'b10x;
                        M1 = 0;
                    end
                    4'b11: begin
                        ALU160_SEL = 1;
                        WE = 6'b10100;
                        next_stage = 1;
                        M1 = 0;
                    end
                endcase
            end
            4'b11: begin
                case (FETCH[3:0])
                    4'b0, 4'b1000: begin
                        case (STAGE[1:0])
                            2'b0, 2'b1: begin
                                if (FlagMux[FETCH[5:3]]) begin
                                    ALU160_SEL = 0;
                                    DINW_SEL = 1;
                                    WE = {4'b1x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                    next_stage = 1;
                                    REG_WSEL = 4'b111x;
                                    REG_RSEL = 4'b101x;
                                    M1 = 0;
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                            end
                            2'b10: begin
                                ALU160_SEL = 0;
                                WE = 6'b10x00;
                                REG_RSEL = 4'b111x;
                            end
                        endcase
                    end
                    4'b1: begin
                        case (STAGE[1:0])
                            2'b0, 2'b1: begin
                                if (op16[2]) begin
                                    WE = (STAGE[0] ? 6'b101x1x : 6'b1xx1);
                                    REG_WSEL = {3'b11, (STAGE[0] ? 1'b1 : 1'bx)};
                                    if (STAGE[0]) begin
                                        ALU8OP = 30;
                                    end
                                end
                                else begin
                                    WE = (STAGE[0] ? 6'b1x10 : 6'b1xx1);
                                    REG_WSEL = {1'b0, FETCH[5:4], 1'bx};
                                end
                                ALU160_SEL = 0;
                                DINW_SEL = 1;
                                next_stage = 1;
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                            end
                            2'b10: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                            end
                        endcase
                    end
                    4'b10, 4'b1010: begin
                        case (STAGE[1:0])
                            2'b0, 2'b1: begin
                                if (FlagMux[FETCH[5:3]]) begin
                                    ALU160_SEL = 1;
                                    DINW_SEL = 1;
                                    WE = {4'b10x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                    next_stage = 1;
                                    REG_WSEL = 4'b111x;
                                    M1 = 0;
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                    ALU16OP = 2;
                                end
                            end
                            2'b10: begin
                                ALU160_SEL = 0;
                                WE = 6'b10x00;
                                REG_RSEL = 4'b111x;
                            end
                        endcase
                    end
                    4'b11: begin
                        case (FETCH[5:4])
                            2'b0: begin
                                case (STAGE[1:0])
                                    2'b0, 2'b1: begin
                                        ALU160_SEL = 1;
                                        DINW_SEL = 1;
                                        WE = {4'b10x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                        next_stage = 1;
                                        REG_WSEL = 4'b111x;
                                        M1 = 0;
                                    end
                                    2'b10: begin
                                        ALU160_SEL = 0;
                                        WE = 6'b10x00;
                                        REG_RSEL = 4'b111x;
                                    end
                                endcase
                            end
                            2'b1: begin
                                case (STAGE[1:0])
                                    2'b0: begin
                                        ALU160_SEL = 1;
                                        DINW_SEL = 1;
                                        WE = 6'b10x01;
                                        next_stage = 1;
                                        REG_WSEL = 4'b11x;
                                        M1 = 0;
                                    end
                                    2'b1: begin
                                        DO_SEL = 2'b0;
                                        ALU160_SEL = 0;
                                        WE = 6'b0x00;
                                        next_stage = 1;
                                        REG_WSEL = 4'b110;
                                        REG_RSEL = 4'b11x;
                                        M1 = 0;
                                        MREQ = 0;
                                        WR = 1;
                                        IORQ = 1;
                                    end
                                    2'b10: begin
                                        ALU160_SEL = 1;
                                        WE = 6'b10x00;
                                    end
                                endcase
                            end
                            2'b10: begin
                                case (STAGE[2:0])
                                    3'b0, 3'b1: begin
                                        ALU160_SEL = 0;
                                        DINW_SEL = 1;
                                        WE = {4'b1x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                        next_stage = 1;
                                        REG_WSEL = 4'b111x;
                                        REG_RSEL = 4'b101x;
                                        M1 = 0;
                                    end
                                    3'b10, 3'b11: begin
                                        DO_SEL = 2'b0;
                                        ALU160_SEL = 0;
                                        WE = 6'b1x00;
                                        ALU16OP = 5;
                                        next_stage = 1;
                                        REG_WSEL = {3'b10, STAGE[0]};
                                        REG_RSEL = 4'b101x;
                                        M1 = 0;
                                        WR = 1;
                                    end
                                    3'b100, 3'b101: begin
                                        ALU160_SEL = 1;
                                        DINW_SEL = 0;
                                        WE = {1'b0, STAGE[0], 2'b0x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                        ALU8OP = 29;
                                        next_stage = !(STAGE[0]);
                                        REG_WSEL = 4'b10x;
                                        REG_RSEL = {3'b111, !(STAGE[0])};
                                        M1 = STAGE[0];
                                        MREQ = STAGE[0];
                                    end
                                endcase
                            end
                            2'b11: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                status[11] = 1'b1;
                                status[7:6] = 2'b0;
                            end
                        endcase
                    end
                    4'b100, 4'b1100: begin
                        case (STAGE[2:0])
                            3'b0, 3'b1: begin
                                if (FlagMux[FETCH[5:3]]) begin
                                    ALU160_SEL = 1;
                                    DINW_SEL = 1;
                                    WE = {4'b10x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                    next_stage = 1;
                                    REG_WSEL = 4'b111x;
                                    M1 = 0;
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                    ALU16OP = 2;
                                end
                            end
                            3'b10, 3'b11: begin
                                DO_SEL = {1'b0, STAGE[0]};
                                ALU160_SEL = 0;
                                WE = 6'b1x00;
                                ALU16OP = 5;
                                next_stage = 1;
                                REG_WSEL = 4'b1xxx;
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                                WR = 1;
                            end
                            3'b100: begin
                                ALU160_SEL = 0;
                                WE = 6'b10x00;
                                REG_RSEL = 4'b111x;
                            end
                        endcase
                    end
                    4'b101: begin
                        case (STAGE[1:0])
                            2'b0, 2'b1: begin
                                DO_SEL = {(STAGE[0] & op16[2]), 1'b0};
                                ALU160_SEL = 0;
                                WE = 6'b1x00;
                                ALU16OP = 5;
                                next_stage = 1;
                                REG_WSEL = {1'b0, FETCH[5:4], STAGE[0]};
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                                WR = 1;
                            end
                            2'b10: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                            end
                        endcase
                    end
                    4'b110, 4'b1110: begin
                        if (!(STAGE[0])) begin
                            ALU160_SEL = 1;
                            DINW_SEL = 1;
                            WE = 6'b10x01;
                            next_stage = 1;
                            REG_WSEL = 4'b11x;
                            M1 = 0;
                        end
                        else begin
                            DINW_SEL = 0;
                            ALU160_SEL = 1;
                            WE = {4'b110x, ~&(FETCH[5:3]), 1'bx};
                            ALU8OP = {2'b0, FETCH[5:3]};
                            REG_WSEL = 4'b110;
                            REG_RSEL = 4'b111;
                        end
                    end
                    4'b111, 4'b1111: begin
                        case (STAGE[1:0])
                            2'b0, 2'b1: begin
                                DO_SEL = {1'b0, STAGE[0]};
                                ALU160_SEL = 0;
                                WE = 6'b1x00;
                                ALU16OP = 5;
                                next_stage = 1;
                                REG_WSEL = 4'b1xxx;
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                                WR = 1;
                            end
                            2'b10: begin
                                ALU160_SEL = 0;
                                WE = 6'b10x00;
                                REG_RSEL = 4'b110x;
                            end
                        endcase
                    end
                    4'b1001: begin
                        case (FETCH[5:4])
                            2'b0: begin
                                case (STAGE[1:0])
                                    2'b0, 2'b1: begin
                                        ALU160_SEL = 0;
                                        DINW_SEL = 1;
                                        WE = {4'b1x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                        next_stage = 1;
                                        REG_WSEL = 4'b111x;
                                        REG_RSEL = 4'b101x;
                                        M1 = 0;
                                    end
                                    2'b10: begin
                                        ALU160_SEL = 0;
                                        WE = 6'b10x00;
                                        REG_RSEL = 4'b111x;
                                    end
                                endcase
                            end
                            2'b1: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                status[1] = 1;
                            end
                            2'b10: begin
                                ALU160_SEL = 0;
                                WE = 6'b10x00;
                                REG_RSEL = 4'b10x;
                            end
                            2'b11: begin
                                if (!(STAGE[0])) begin
                                    ALU160_SEL = 0;
                                    WE = 6'b1x00;
                                    ALU16OP = 4;
                                    next_stage = 1;
                                    REG_RSEL = 4'b10x;
                                    M1 = 0;
                                    MREQ = 0;
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                            end
                        endcase
                    end
                    4'b1011: begin
                        case (FETCH[5:4])
                            2'b0: begin
                                case ({STAGE[0], CPUStatus[4]})
                                    2'b0, 2'b11: begin
                                        ALU160_SEL = 1;
                                        WE = 6'b10000;
                                        fetch98 = 2'b10;
                                    end
                                    2'b1: begin
                                        ALU160_SEL = 1;
                                        WE = 6'b10100;
                                        next_stage = 1;
                                        M1 = 0;
                                    end
                                endcase
                            end
                            2'b1: begin
                                case (STAGE[1:0])
                                    2'b0: begin
                                        ALU160_SEL = 1;
                                        DINW_SEL = 1;
                                        WE = 6'b10x01;
                                        next_stage = 1;
                                        REG_WSEL = 4'b11x;
                                        M1 = 0;
                                    end
                                    2'b1: begin
                                        ALU160_SEL = 0;
                                        DINW_SEL = 1;
                                        WE = 6'b0x1x;
                                        next_stage = 1;
                                        REG_WSEL = 4'b11x;
                                        REG_RSEL = 4'b11x;
                                        M1 = 0;
                                        MREQ = 0;
                                        IORQ = 1;
                                    end
                                    2'b10: begin
                                        ALU160_SEL = 1;
                                        WE = 6'b10x00;
                                    end
                                endcase
                            end
                            2'b10: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                if (CPUStatus[1]) begin
                                    status[3] = 1;
                                end
                                else begin
                                    status[2] = 1;
                                end
                            end
                            2'b11: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                status[11] = 1'b1;
                                status[7:6] = 2'b11;
                            end
                        endcase
                    end
                    4'b1101: begin
                        case (FETCH[5:4])
                            2'b0: begin
                                case (STAGE[2:0])
                                    3'b0, 3'b1: begin
                                        ALU160_SEL = 1;
                                        DINW_SEL = 1;
                                        WE = {4'b10x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                        next_stage = 1;
                                        REG_WSEL = 4'b111x;
                                        M1 = 0;
                                    end
                                    3'b10, 3'b11: begin
                                        DO_SEL = {1'b0, STAGE[0]};
                                        ALU160_SEL = 0;
                                        WE = 6'b1x00;
                                        ALU16OP = 5;
                                        next_stage = 1;
                                        REG_WSEL = 4'b1xxx;
                                        REG_RSEL = 4'b101x;
                                        M1 = 0;
                                        WR = 1;
                                    end
                                    3'b100: begin
                                        ALU160_SEL = 0;
                                        WE = 6'b10x00;
                                        REG_RSEL = 4'b111x;
                                    end
                                endcase
                            end
                            2'b1: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                status[5:4] = 2'b1;
                            end
                            2'b10: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                fetch98 = 2'b1;
                            end
                            2'b11: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                                status[5:4] = 2'b11;
                            end
                        endcase
                    end
                endcase
            end
            4'b100, 4'b111: begin
                ALU160_SEL = 1;
                WE = 6'b10x00;
            end
            4'b101: begin
                case (FETCH[2:0])
                    3'b0: begin
                        if (!(STAGE[0])) begin
                            ALU160_SEL = 0;
                            DINW_SEL = 1;
                            WE = {4'b0x, !(opd[3]), opd[3]};
                            next_stage = 1;
                            REG_WSEL = {1'b0, opd[5:4], 1'bx};
                            REG_RSEL = 4'b0x;
                            M1 = 0;
                            MREQ = 0;
                            IORQ = 1;
                        end
                        else begin
                            ALU160_SEL = 1;
                            WE = 6'b110x00;
                            ALU8OP = 29;
                            REG_RSEL = {1'b0, opd[5:3]};
                        end
                    end
                    3'b1: begin
                        if (!(STAGE[0])) begin
                            DO_SEL = 2'b0;
                            ALU160_SEL = 0;
                            WE = 6'b0x00;
                            next_stage = 1;
                            REG_WSEL = (&(opd[5:3]) ? 4'b110x : {1'b0, opd[5:3]});
                            REG_RSEL = 4'b0x;
                            M1 = 0;
                            MREQ = 0;
                            WR = 1;
                            IORQ = 1;
                        end
                        else begin
                            ALU160_SEL = 1;
                            WE = 6'b10x00;
                        end
                    end
                    3'b10: begin
                        if (!(STAGE[0])) begin
                            DINW_SEL = 0;
                            WE = 6'b100x01;
                            ALU8OP = {3'b0, !(FETCH[3]), 1'b1};
                            next_stage = 1;
                            REG_WSEL = 4'b101;
                            REG_RSEL = {op16, 1'b1};
                            M1 = 0;
                            MREQ = 0;
                        end
                        else begin
                            ALU160_SEL = 1;
                            DINW_SEL = 0;
                            WE = 6'b110x10;
                            ALU8OP = {3'b0, !(FETCH[3]), 1'b1};
                            REG_WSEL = 4'b100;
                            REG_RSEL = {op16, 1'b0};
                        end
                    end
                    3'b11: begin
                        case (STAGE[2:1])
                            2'b0: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 1;
                                WE = {4'b10x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                next_stage = 1;
                                REG_WSEL = 4'b111x;
                                M1 = 0;
                            end
                            2'b1: begin
                                ALU160_SEL = 0;
                                next_stage = 1;
                                ALU16OP = {2'b0, STAGE[0]};
                                REG_RSEL = 4'b111x;
                                REG_WSEL = {op16, !(STAGE[0])};
                                M1 = 0;
                                if (FETCH[3]) begin
                                    DINW_SEL = 1;
                                    WE = {4'b0x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                end
                                else begin
                                    DO_SEL = (op16[2] ? {1'b1, !(STAGE[0])} : 2'b0);
                                    WE = 6'b0x00;
                                    WR = 1;
                                end
                            end
                            2'b10: begin
                                if (((FETCH[3] & op16[2]) & !(STAGE[0]))) begin
                                    ALU160_SEL = 0;
                                    WE = 6'b1x00;
                                    ALU16OP = 4;
                                    next_stage = 1;
                                    REG_RSEL = 4'b101x;
                                    M1 = 0;
                                    MREQ = 0;
                                end
                                else begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                            end
                        endcase
                    end
                    3'b100: begin
                        ALU160_SEL = 1;
                        DINW_SEL = 0;
                        WE = 6'b110x10;
                        ALU8OP = 5'b11111;
                        REG_WSEL = 4'b11x;
                        REG_RSEL = 4'b110;
                    end
                    3'b101: begin
                        case (STAGE[1:0])
                            2'b0, 2'b1: begin
                                ALU160_SEL = 0;
                                DINW_SEL = 1;
                                WE = {4'b1x, (STAGE[0] ? 1'b1 : 1'bx), !(STAGE[0])};
                                next_stage = 1;
                                REG_WSEL = 4'b111x;
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                            end
                            2'b10: begin
                                ALU160_SEL = 0;
                                WE = 6'b10x00;
                                REG_RSEL = 4'b111x;
                                status[11] = 1'b1;
                                status[7:6] = {CPUStatus[7], CPUStatus[7]};
                            end
                        endcase
                    end
                    3'b110: begin
                        ALU160_SEL = 1;
                        WE = 6'b10x00;
                        status[10:8] = {1'b1, FETCH[4:3]};
                    end
                    3'b111: begin
                        case (FETCH[5:4])
                            2'b0: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 1'b0;
                                WE = {4'b10x, !(FETCH[3]), FETCH[3]};
                                ALU8OP = 29;
                                REG_WSEL = 4'b1001;
                                REG_RSEL = 4'b110;
                            end
                            2'b1: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 1'b0;
                                WE = 6'b110x1x;
                                ALU8OP = 29;
                                REG_WSEL = 4'b11x;
                                REG_RSEL = {3'b100, FETCH[3]};
                            end
                            2'b10: begin
                                case (STAGE[1:0])
                                    2'b0: begin
                                        ALU160_SEL = 0;
                                        DINW_SEL = 1;
                                        WE = 6'b0x01;
                                        next_stage = 1;
                                        REG_WSEL = 4'b11x;
                                        REG_RSEL = 4'b10x;
                                        M1 = 0;
                                    end
                                    2'b1: begin
                                        DINW_SEL = 0;
                                        WE = 6'b100x11;
                                        ALU8OP = (FETCH[3] ? 5'b1100 : 5'b1011);
                                        next_stage = 1;
                                        REG_WSEL = 4'b110;
                                        REG_RSEL = 4'b111;
                                        M1 = 0;
                                        MREQ = 0;
                                    end
                                    2'b10: begin
                                        DO_SEL = 2'b0;
                                        ALU160_SEL = 0;
                                        WE = 6'b0x0x;
                                        next_stage = 1;
                                        REG_WSEL = 4'b111;
                                        REG_RSEL = 4'b10x;
                                        M1 = 0;
                                        WR = 1;
                                    end
                                    2'b11: begin
                                        ALU160_SEL = 1;
                                        WE = 6'b10x00;
                                    end
                                endcase
                            end
                            2'b11: begin
                                ALU160_SEL = 1;
                                WE = 6'b10x00;
                            end
                        endcase
                    end
                endcase
            end
            4'b110: begin
                if (({FETCH[5], FETCH[2]} == 4'b10)) begin
                    case (FETCH[1:0])
                        2'b0: begin
                            case (STAGE[1:0])
                                2'b0: begin
                                    ALU160_SEL = 0;
                                    DINW_SEL = 0;
                                    WE = 6'b100111;
                                    ALU8OP = {4'b111, FETCH[3]};
                                    next_stage = 1;
                                    REG_WSEL = 4'b100;
                                    REG_RSEL = 4'b101;
                                    M1 = 0;
                                end
                                2'b1: begin
                                    DINW_SEL = 0;
                                    WE = 6'b100011;
                                    ALU8OP = 5'b1111;
                                    next_stage = 1;
                                    REG_WSEL = 4'b0;
                                    REG_RSEL = 4'b1;
                                    M1 = 0;
                                    MREQ = 0;
                                end
                                2'b10: begin
                                    DO_SEL = 2'b1;
                                    ALU160_SEL = 0;
                                    DINW_SEL = 0;
                                    WE = 6'b0x11;
                                    ALU8OP = {4'b111, FETCH[3]};
                                    next_stage = (FETCH[4] ? !(FLAGS[2]) : 1'b1);
                                    REG_WSEL = 4'b10;
                                    REG_RSEL = 4'b11;
                                    M1 = 0;
                                    WR = 1;
                                end
                                2'b11: begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                            endcase
                        end
                        2'b1: begin
                            case (STAGE[1:0])
                                2'b0: begin
                                    ALU160_SEL = 0;
                                    DINW_SEL = 1;
                                    WE = 6'b0x01;
                                    next_stage = 1;
                                    REG_WSEL = 4'b11x;
                                    REG_RSEL = 4'b10x;
                                    M1 = 0;
                                end
                                2'b1: begin
                                    WE = 6'b100x0x;
                                    ALU8OP = 7;
                                    next_stage = 1;
                                    REG_WSEL = 4'b110;
                                    REG_RSEL = 4'b111;
                                    M1 = 0;
                                    MREQ = 0;
                                end
                                2'b10: begin
                                    DINW_SEL = 0;
                                    WE = 6'b100x11;
                                    ALU8OP = 5'b1111;
                                    next_stage = 1;
                                    REG_WSEL = 4'b0;
                                    REG_RSEL = 4'b1;
                                    M1 = 0;
                                    MREQ = 0;
                                end
                                2'b11: begin
                                    ALU160_SEL = 1;
                                    DINW_SEL = 0;
                                    M1 = (FETCH[4] ? (!(FLAGS[2]) || FLAGS[6]) : 1'b1);
                                    WE = {1'b0, M1, 4'b0x11};
                                    ALU8OP = {4'b111, FETCH[3]};
                                    REG_WSEL = 4'b100;
                                    REG_RSEL = 4'b101;
                                    MREQ = M1;
                                end
                            endcase
                        end
                        2'b10: begin
                            case (STAGE[1:0])
                                2'b0: begin
                                    ALU160_SEL = 0;
                                    DINW_SEL = 0;
                                    WE = 6'b100110;
                                    ALU8OP = 10;
                                    next_stage = 1;
                                    REG_WSEL = 4'b0;
                                    REG_RSEL = 4'b0x;
                                    M1 = 0;
                                    MREQ = 0;
                                    IORQ = 1;
                                end
                                2'b1: begin
                                    DO_SEL = 2'b1;
                                    ALU160_SEL = 0;
                                    DINW_SEL = 0;
                                    WE = 6'b0x11;
                                    ALU8OP = {4'b111, FETCH[3]};
                                    next_stage = (FETCH[4] ? FLAGS[6] : 1'b1);
                                    REG_WSEL = 4'b100;
                                    REG_RSEL = 4'b101;
                                    M1 = 0;
                                    WR = 1;
                                end
                                2'b10: begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                            endcase
                        end
                        2'b11: begin
                            case (STAGE[1:0])
                                2'b0: begin
                                    ALU160_SEL = 0;
                                    DINW_SEL = 0;
                                    WE = 6'b111;
                                    ALU8OP = {4'b111, FETCH[3]};
                                    next_stage = 1;
                                    REG_WSEL = 4'b100;
                                    REG_RSEL = 4'b101;
                                    M1 = 0;
                                end
                                2'b1: begin
                                    DO_SEL = 2'b1;
                                    ALU160_SEL = 0;
                                    DINW_SEL = 0;
                                    WE = 6'b100x10;
                                    ALU8OP = 10;
                                    next_stage = (FETCH[4] ? (ALU80 == 8'd1) : 1'b1);
                                    REG_WSEL = 4'b0;
                                    REG_RSEL = 4'b0x;
                                    M1 = 0;
                                    MREQ = 0;
                                    IORQ = 1;
                                    WR = 1;
                                end
                                2'b10: begin
                                    ALU160_SEL = 1;
                                    WE = 6'b10x00;
                                end
                            endcase
                        end
                    endcase
                end
                else begin
                    ALU160_SEL = 1;
                    WE = 6'b10x00;
                end
            end
            4'b1000, 4'b1001, 4'b1010, 4'b1011: begin
                case ({STAGE[1:0], CPUStatus[4], op0mem})
                    4'b0: begin
                        DINW_SEL = 0;
                        ALU160_SEL = 1;
                        WE = {!(FETCH[7]), 3'b10x, ((FETCH[7:6] == 2'b1) ? 2'b0 : {!(opd[0]), opd[0]})};
                        ALU8OP = 28;
                        REG_WSEL = {1'b0, opd[2:0]};
                    end
                    4'b1, 4'b10, 4'b11: begin
                        ALU160_SEL = 0;
                        DINW_SEL = 1;
                        WE = (opd[0] ? 6'b1 : 6'b10);
                        ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                        next_stage = 1;
                        REG_WSEL = ((FETCH[7:6] == 2'b1) ? 4'b111x : {1'b0, opd[2:0]});
                        REG_RSEL = 4'b10x;
                        M1 = 0;
                    end
                    4'b101, 4'b110, 4'b111: begin
                        case (FETCH[7:6])
                            2'b0, 2'b10, 2'b11: begin
                                DINW_SEL = 0;
                                DO_SEL = 2'b11;
                                ALU160_SEL = 0;
                                WE = {!(FETCH[7]), 3'b0x, !(opd[0]), opd[0]};
                                ALU8OP = 28;
                                ALU16OP = (CPUStatus[4] ? 3'b11 : 3'b0);
                                next_stage = 1;
                                REG_WSEL = {1'b0, opd[2:0]};
                                REG_RSEL = 4'b10x;
                                M1 = 0;
                                WR = 1;
                            end
                            2'b1: begin
                                ALU160_SEL = 1;
                                WE = 6'b110xxx;
                                ALU8OP = 28;
                                REG_WSEL = {3'b111, opd[0]};
                            end
                        endcase
                    end
                    4'b1001, 4'b1010, 4'b1011: begin
                        ALU160_SEL = 1;
                        WE = 6'b10x00;
                    end
                endcase
            end
            4'b1110: begin
                ALU160_SEL = 0;
                DINW_SEL = 0;
                WE = 6'bx1xx11;
                ALU8OP = 29;
                ALU16OP = 4;
                REG_WSEL = 4'b1001;
                REG_RSEL = 4'b110x;
                M1 = 0;
                MREQ = 0;
                status[11:6] = 6'b110000;
            end
            4'b1101: begin
                case (STAGE[1:0])
                    2'b0: begin
                        ALU160_SEL = 1;
                        WE = 6'b10x00;
                        ALU16OP = intop;
                        next_stage = 1;
                        M1 = 0;
                        MREQ = 0;
                    end
                    2'b1, 2'b10: begin
                        DO_SEL = {1'b0, !(STAGE[0])};
                        ALU160_SEL = 0;
                        WE = 6'b1x00;
                        ALU16OP = 5;
                        next_stage = 1;
                        REG_WSEL = 4'b1xxx;
                        REG_RSEL = 4'b101x;
                        M1 = 0;
                        WR = 1;
                        status[11] = 1'b1;
                        status[7:6] = {CPUStatus[7], 1'b0};
                    end
                    2'b11: begin
                        ALU160_SEL = 0;
                        WE = 6'b10x00;
                        REG_RSEL = 4'b110x;
                    end
                endcase
            end
            4'b1100: begin
                case (CPUStatus[9:8])
                    2'b0, 2'b1, 2'b10: begin
                        ALU160_SEL = 1;
                        WE = 6'b10x00;
                        ALU16OP = intop;
                        MREQ = 0;
                        IORQ = 1;
                        status[11] = 1'b1;
                        status[7:6] = 2'b0;
                    end
                    2'b11: begin
                        case (STAGE[2:0])
                            3'b0: begin
                                ALU160_SEL = 1;
                                DINW_SEL = 1;
                                WE = 6'b10x01;
                                ALU16OP = intop;
                                next_stage = 1;
                                REG_WSEL = 4'b1000;
                                MREQ = 0;
                                IORQ = 1;
                                status[11] = 1'b1;
                                status[7:6] = 2'b0;
                            end
                            3'b1, 3'b10: begin
                                DO_SEL = {1'b0, !(STAGE[0])};
                                ALU160_SEL = 0;
                                WE = 6'b1x00;
                                ALU16OP = 5;
                                next_stage = 1;
                                REG_WSEL = 4'b1xxx;
                                REG_RSEL = 4'b101x;
                                M1 = 0;
                                WR = 1;
                            end
                            3'b11, 3'b100: begin
                                ALU160_SEL = 0;
                                DINW_SEL = 1;
                                WE = {4'b0x0x, (STAGE[0] ? 1'bx : 1'b1), STAGE[0]};
                                ALU16OP = {2'b0, !(STAGE[0])};
                                next_stage = 1;
                                REG_WSEL = 4'b111x;
                                REG_RSEL = 4'b1000;
                                M1 = 0;
                            end
                            3'b101: begin
                                ALU160_SEL = 0;
                                WE = 6'b10x00;
                                REG_RSEL = 4'b111x;
                            end
                        endcase
                    end
                endcase
            end
        endcase
    end
endmodule