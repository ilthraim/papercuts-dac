module tv80_core (
    output reg m1_n,
    output reg iorq,
    output logic no_read,
    output logic write,
    output logic rfsh_n,
    output reg halt_n,
    output reg busak_n,
    output reg[15:0] A,
    output reg[7:0] dout,
    output reg[6:0] mc,
    output reg[6:0] ts,
    output reg intcycle_n,
    output reg IntE,
    output reg stop,
    input logic reset_n,
    input logic clk,
    input logic cen,
    input logic wait_n,
    input logic int_n,
    input logic nmi_n,
    input logic busrq_n,
    input logic[7:0] dinst,
    input logic[7:0] di
);
    reg[7:0] ACC;
    reg[7:0] F;
    reg[7:0] Ap;
    reg[7:0] Fp;
    reg[7:0] I;
    reg[15:0] SP;
    reg[15:0] PC;
    reg[7:0] RegDIH;
    reg[7:0] RegDIL;
    wire logic[15:0] RegBusA;
    wire logic[15:0] RegBusB;
    wire logic[15:0] RegBusC;
    reg[2:0] RegAddrA_r;
    reg[2:0] RegAddrA;
    reg[2:0] RegAddrB_r;
    reg[2:0] RegAddrB;
    reg[2:0] RegAddrC;
    reg RegWEH;
    reg RegWEL;
    reg Alternate;
    reg[15:0] TmpAddr;
    reg[7:0] IR;
    reg[1:0] ISet;
    reg[15:0] RegBusA_r;
    reg[15:0] ID16;
    reg[7:0] Save_Mux;
    reg[6:0] tstate;
    reg[6:0] mcycle;
    reg last_mcycle;
    reg last_tstate;
    reg IntE_FF1;
    reg IntE_FF2;
    reg Halt_FF;
    reg BusReq_s;
    reg BusAck;
    reg ClkEn;
    reg NMI_s;
    reg INT_s;
    reg[1:0] IStatus;
    reg[7:0] DI_Reg;
    reg T_Res;
    reg[1:0] XY_State;
    reg [0:0] Pre_XY_F_M;
    reg NextIs_XY_Fetch;
    reg XY_Ind;
    reg No_BTR;
    reg BTR_r;
    reg Auto_Wait;
    reg Auto_Wait_t1;
    reg Auto_Wait_t2;
    reg IncDecZ;
    reg[7:0] BusB;
    reg[7:0] BusA;
    wire logic[7:0] ALU_Q;
    wire logic[7:0] F_Out;
    reg[4:0] Read_To_Reg_r;
    reg Arith16_r;
    reg Z16_r;
    reg[3:0] ALU_Op_r;
    reg Save_ALU_r;
    reg PreserveC_r;
    reg[2:0] mcycles;
    wire logic[2:0] mcycles_d;
    wire logic[2:0] tstates;
    reg IntCycle;
    reg NMICycle;
    wire logic Inc_PC;
    wire logic Inc_WZ;
    wire logic[3:0] IncDec_16;
    wire logic[1:0] Prefix;
    wire logic Read_To_Acc;
    wire logic Read_To_Reg;
    wire logic[3:0] Set_BusB_To;
    wire logic[3:0] Set_BusA_To;
    wire logic[3:0] ALU_Op;
    wire logic Save_ALU;
    wire logic PreserveC;
    wire logic Arith16;
    wire logic[2:0] Set_Addr_To;
    wire logic Jump;
    wire logic JumpE;
    wire logic JumpXY;
    wire logic Call;
    wire logic RstP;
    wire logic LDZ;
    wire logic LDW;
    wire logic LDSPHL;
    wire logic iorq_i;
    wire logic[2:0] Special_LD;
    wire logic ExchangeDH;
    wire logic ExchangeRp;
    wire logic ExchangeAF;
    wire logic ExchangeRS;
    wire logic I_DJNZ;
    wire logic I_CPL;
    wire logic I_CCF;
    wire logic I_SCF;
    wire logic I_RETN;
    wire logic I_BT;
    wire logic I_BC;
    wire logic I_BTR;
    wire logic I_RLD;
    wire logic I_RRD;
    wire logic I_INRC;
    wire logic SetDI;
    wire logic SetEI;
    wire logic[1:0] IMode;
    wire logic Halt;
    reg[15:0] PC16;
    reg[15:0] PC16_B;
    reg[15:0] SP16;
    reg[15:0] SP16_A;
    reg[15:0] SP16_B;
    reg[15:0] ID16_B;
    reg Oldnmi_n;
    tv80_core_i_mcode i_mcode (
        .MCycles(mcycles_d),
        .TStates(tstates),
        .Prefix(Prefix),
        .Inc_PC(Inc_PC),
        .Inc_WZ(Inc_WZ),
        .IncDec_16(IncDec_16),
        .Read_To_Reg(Read_To_Reg),
        .Read_To_Acc(Read_To_Acc),
        .Set_BusA_To(Set_BusA_To),
        .Set_BusB_To(Set_BusB_To),
        .ALU_Op(ALU_Op),
        .Save_ALU(Save_ALU),
        .PreserveC(PreserveC),
        .Arith16(Arith16),
        .Set_Addr_To(Set_Addr_To),
        .IORQ(iorq_i),
        .Jump(Jump),
        .JumpE(JumpE),
        .JumpXY(JumpXY),
        .Call(Call),
        .RstP(RstP),
        .LDZ(LDZ),
        .LDW(LDW),
        .LDSPHL(LDSPHL),
        .Special_LD(Special_LD),
        .ExchangeDH(ExchangeDH),
        .ExchangeRp(ExchangeRp),
        .ExchangeAF(ExchangeAF),
        .ExchangeRS(ExchangeRS),
        .I_DJNZ(I_DJNZ),
        .I_CPL(I_CPL),
        .I_CCF(I_CCF),
        .I_SCF(I_SCF),
        .I_RETN(I_RETN),
        .I_BT(I_BT),
        .I_BC(I_BC),
        .I_BTR(I_BTR),
        .I_RLD(I_RLD),
        .I_RRD(I_RRD),
        .I_INRC(I_INRC),
        .SetDI(SetDI),
        .SetEI(SetEI),
        .IMode(IMode),
        .Halt(Halt),
        .NoRead(no_read),
        .Write(write),
        .IR(IR),
        .ISet(ISet),
        .MCycle(mcycle),
        .F(F),
        .NMICycle(NMICycle),
        .IntCycle(IntCycle)
    );
    tv80_core_i_alu i_alu (
        .Q(ALU_Q),
        .F_Out(F_Out),
        .Arith16(Arith16_r),
        .Z16(Z16_r),
        .ALU_Op(ALU_Op_r),
        .IR(IR[5:0]),
        .ISet(ISet),
        .BusA(BusA),
        .BusB(BusB),
        .F_In(F)
    );
    function logic[6:0] number_to_bitvec(input logic[2:0] num);
        case (num)
            2: begin
                number_to_bitvec = 7'b10;
            end
            default: begin
                number_to_bitvec = 7'bxxxxxxx;
            end
        endcase
    endfunction
    function logic[2:0] mcyc_to_number(input logic[6:0] mcyc);
        casez (mcyc)
            default: begin
                mcyc_to_number = 3'b1;
            end
        endcase
    endfunction
    always @(mcycle or mcycles or tstate or tstates) begin
        case (mcycles)
            1: begin
                last_mcycle = mcycle[0];
            end
            2: begin
                last_mcycle = mcycle[1];
            end
            3: begin
                last_mcycle = mcycle[2];
            end
            4: begin
                last_mcycle = mcycle[3];
            end
            5: begin
                last_mcycle = mcycle[4];
            end
            default: begin
                last_mcycle = 1'bx;
            end
        endcase
        case (tstates)
            3: begin
                last_tstate = tstate[3];
            end
            4: begin
                last_tstate = tstate[4];
            end
            5: begin
                last_tstate = tstate[5];
            end
            6: begin
                last_tstate = tstate[6];
            end
            default: begin
                last_tstate = 1'bx;
            end
        endcase
    end
    always @(ALU_Q or BusAck or BusB or DI_Reg or ExchangeRp or IR or Save_ALU_r or Set_Addr_To or XY_Ind or XY_State or cen or last_tstate or mcycle) begin
        ClkEn = (cen && ~(BusAck));
        if (last_tstate) begin
            T_Res = 1'b1;
        end
        else begin
            T_Res = 1'b0;
        end
        if ((((XY_State != 2'b0) && (XY_Ind == 1'b0)) && (((Set_Addr_To == 3'b10) || ( (IR == 8'd203))) || ( (IR == 8'd54))))) begin
            NextIs_XY_Fetch = 1'b1;
        end
        else begin
            NextIs_XY_Fetch = 1'b0;
        end
        if (ExchangeRp) begin
            Save_Mux = BusB;
        end
        else if (!(Save_ALU_r)) begin
            Save_Mux = DI_Reg;
        end
        else begin
            Save_Mux = ALU_Q;
        end
    end
    always @(posedge clk or negedge reset_n) begin
        if ((reset_n == 1'b0)) begin
            PC <= 0;
            A <= 0;
            TmpAddr <= 0;
            IR <= 8'd0;
            ISet <= 2'b0;
            XY_State <= 2'b0;
            IStatus <= 2'b0;
            mcycles <= 3'b0;
            dout <= 8'd0;
            ACC <= 8'd255;
            F <= 8'd255;
            Ap <= 8'd255;
            Fp <= 8'd255;
            I <= 0;
            SP <= 16'd65535;
            Alternate <= 1'b0;
            Read_To_Reg_r <= 5'b0;
            Arith16_r <= 1'b0;
            BTR_r <= 1'b0;
            Z16_r <= 1'b0;
            ALU_Op_r <= 4'b0;
            Save_ALU_r <= 1'b0;
            PreserveC_r <= 1'b0;
            XY_Ind <= 1'b0;
        end
        else begin
            if ((ClkEn == 1'b1)) begin
                ALU_Op_r <= 4'b0;
                Save_ALU_r <= 1'b0;
                Read_To_Reg_r <= 5'b0;
                mcycles <= mcycles_d;
                if ((IMode != 2'b11)) begin
                    IStatus <= IMode;
                end
                Arith16_r <= Arith16;
                PreserveC_r <= PreserveC;
                if (( mcycle[2])) begin
                    Z16_r <= 1'b1;
                end
                else begin
                    Z16_r <= 1'b0;
                end
                if ((mcycle[0] && ((tstate[1] | tstate[2]) | tstate[3]))) begin
                    if ((tstate[2] && (wait_n == 1'b1))) begin
                        if (((( (NMICycle == 1'b0)) && (IntCycle == 1'b0)) && ~(((Halt_FF == 1'b1))))) begin
                            PC <= PC16;
                        end
                        if (((IntCycle == 1'b1) && (IStatus == 2'b1))) begin
                            IR <= 8'd255;
                        end
                        else if ((((Halt_FF == 1'b1) || ((IntCycle == 1'b1) && (IStatus == 2'b10))) || (NMICycle == 1'b1))) begin
                            IR <= 8'd0;
                            TmpAddr[7:0] <= dinst;
                        end
                        else begin
                            IR <= dinst;
                        end
                        ISet <= 2'b0;
                        if ((Prefix != 2'b0)) begin
                            if ((Prefix == 2'b11)) begin
                                if ((IR[5] == 1'b1)) begin
                                    XY_State <= 2'b10;
                                end
                                else begin
                                    XY_State <= 2'b1;
                                end
                            end
                            else begin begin
                                    XY_State <= 2'b0;
                                    XY_Ind <= 1'b0;
                                end
                                ISet <= Prefix;
                            end
                        end
                        else begin
                            XY_State <= 2'b0;
                            XY_Ind <= 1'b0;
                        end
                    end
                end
                else begin
                    if (mcycle[5]) begin
                        XY_Ind <= 1'b1;
                        if ((Prefix == 2'b1)) begin
                            ISet <= 2'b1;
                        end
                    end
                    if ((T_Res == 1'b1)) begin
                        BTR_r <= (((I_BT || I_BC) || I_BTR) && ~(No_BTR));
                        if ((Jump == 1'b1)) begin
                            A[15:8] <= DI_Reg;
                            A[7:0] <= TmpAddr[7:0];
                            PC[15:8] <= DI_Reg;
                            PC[7:0] <= TmpAddr[7:0];
                        end
                        else if ((JumpXY == 1'b1)) begin
                            A <= RegBusC;
                            PC <= RegBusC;
                        end
                        else if (((Call == 1'b1) || (RstP == 1'b1))) begin
                            A <= TmpAddr;
                            PC <= TmpAddr;
                        end
                        else if ((last_mcycle && (NMICycle == 1'b1))) begin
                            A <= 16'd102;
                            PC <= 16'd102;
                        end
                        else if (((mcycle[2] && (IntCycle == 1'b1)) && (IStatus == 2'b10))) begin
                            A[15:8] <= I;
                            A[7:0] <= TmpAddr[7:0];
                            PC[15:8] <= I;
                            PC[7:0] <= TmpAddr[7:0];
                        end
                        else begin
                            case (Set_Addr_To)
                                3'b10: begin
                                    if ((XY_State == 2'b0)) begin
                                        A <= RegBusC;
                                    end
                                    else begin
                                        if ((NextIs_XY_Fetch == 1'b1)) begin
                                            A <= PC;
                                        end
                                        else begin
                                            A <= TmpAddr;
                                        end
                                    end
                                end
                                3'b100: begin begin
                                        A[15:8] <= ACC;
                                    end
                                    A[7:0] <= DI_Reg;
                                end
                                3'b101: begin
                                    A <= SP;
                                end
                                3'b0: begin begin
                                        A <= RegBusC;
                                    end
                                end
                                3'b1: begin
                                    A <= RegBusC;
                                end
                                3'b110: begin
                                    if ((Inc_WZ == 1'b1)) begin
                                        A <= (TmpAddr + 1);
                                    end
                                    else begin
                                        A[15:8] <= DI_Reg;
                                        A[7:0] <= TmpAddr[7:0];
                                    end
                                end
                                default: begin
                                    A <= PC;
                                end
                            endcase
                        end
                        Save_ALU_r <= Save_ALU;
                        ALU_Op_r <= ALU_Op;
                        if ((I_CPL == 1'b1)) begin
                            ACC <= ~(ACC);
                            F[5] <= ~(ACC[5]);
                            F[4] <= 1'b1;
                            F[3] <= ~(ACC[3]);
                            F[1] <= 1'b1;
                        end
                        if ((I_CCF == 1'b1)) begin
                            F[0] <= ~(F[0]);
                            F[5] <= ACC[5];
                            F[4] <= F[0];
                            F[3] <= ACC[3];
                            F[1] <= 1'b0;
                        end
                        if ((I_SCF == 1'b1)) begin
                            F[0] <= 1'b1;
                            F[5] <= ACC[5];
                            F[4] <= 1'b0;
                            F[3] <= ACC[3];
                            F[1] <= 1'b0;
                        end
                    end
                    if ((tstate[2] && (wait_n == 1'b1))) begin
                        if (( mcycle[6])) begin
                            IR <= dinst;
                        end
                        if ((JumpE == 1'b1)) begin
                            PC <= PC16;
                        end
                        else if ((Inc_PC == 1'b1)) begin
                            PC <= PC16;
                        end
                        if ((BTR_r == 1'b1)) begin
                            PC <= PC16;
                        end
                        if ((RstP == 1'b1)) begin
                            TmpAddr <= {10'd0, IR[5:3], 3'b0};
                        end
                    end
                    if ((tstate[3] && mcycle[5])) begin
                        TmpAddr <= SP16;
                    end
                    if (((tstate[2] && (wait_n == 1'b1)) || (tstate[4]))) begin
                        if ((IncDec_16[2:0] == 3'b111)) begin
                            SP <= SP16;
                        end
                    end
                    if ((LDSPHL == 1'b1)) begin
                        SP <= RegBusC;
                    end
                    if ((ExchangeAF == 1'b1)) begin
                        Ap <= ACC;
                        ACC <= Ap;
                        Fp <= F;
                        F <= Fp;
                    end
                    if ((ExchangeRS == 1'b1)) begin
                        Alternate <= ~(Alternate);
                    end
                end
                if (tstate[3]) begin
                    if ((LDZ == 1'b1)) begin
                        TmpAddr[7:0] <= DI_Reg;
                    end
                    if ((LDW == 1'b1)) begin
                        TmpAddr[15:8] <= DI_Reg;
                    end
                    if ((Special_LD[2] == 1'b1)) begin
                        case (Special_LD[1:0])
                            2'b0: begin
                                ACC <= I;
                                F[2] <= IntE_FF2;
                                F[6] <= (I == 0);
                                F[7] <= I[7];
                                F[4] <= 0;
                                F[1] <= 0;
                            end
                            2'b1: begin
                                ACC <= 0;
                                F[2] <= IntE_FF2;
                                F[6] <= (I == 0);
                                F[7] <= I[7];
                                F[4] <= 0;
                                F[1] <= 0;
                            end
                            2'b10: begin
                                I <= ACC;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                end
                if ((((I_DJNZ == 1'b0) && (Save_ALU_r == 1'b1)) || (ALU_Op_r == 4'b1001))) begin begin
                        F[7:1] <= F_Out[7:1];
                        if ((PreserveC_r == 1'b0)) begin
                            F[0] <= F_Out[0];
                        end
                    end
                end
                if (( (I_INRC == 1'b1))) begin
                    F[4] <= 1'b0;
                    F[1] <= 1'b0;
                    if ((DI_Reg[7:0] == 8'd0)) begin
                        F[6] <= 1'b1;
                    end
                    else begin
                        F[6] <= 1'b0;
                    end
                    F[7] <= DI_Reg[7];
                    F[2] <= ~(^(DI_Reg[7:0]));
                end
                if ((tstate[1] && (Auto_Wait_t1 == 1'b0))) begin
                    dout <= BusB;
                    if ((I_RLD == 1'b1)) begin
                        dout[3:0] <= BusA[3:0];
                        dout[7:4] <= BusB[3:0];
                    end
                    if ((I_RRD == 1'b1)) begin
                        dout[3:0] <= BusB[7:4];
                        dout[7:4] <= BusA[3:0];
                    end
                end
                if ((T_Res == 1'b1)) begin
                    Read_To_Reg_r[3:0] <= Set_BusA_To;
                    Read_To_Reg_r[4] <= Read_To_Reg;
                    if ((Read_To_Acc == 1'b1)) begin
                        Read_To_Reg_r[3:0] <= 4'b111;
                        Read_To_Reg_r[4] <= 1'b1;
                    end
                end
                if ((tstate[1] && (I_BT == 1'b1))) begin
                    F[3] <= ALU_Q[3];
                    F[5] <= ALU_Q[1];
                    F[4] <= 1'b0;
                    F[1] <= 1'b0;
                end
                if (((I_BC == 1'b1) || (I_BT == 1'b1))) begin
                    F[2] <= IncDecZ;
                end
                if (((( (Save_ALU_r == 1'b0))) || ( (ALU_Op_r != 4'b111)))) begin
                    case (Read_To_Reg_r)
                        5'b10111: begin
                            ACC <= Save_Mux;
                        end
                        5'b10110: begin
                            dout <= Save_Mux;
                        end
                        5'b11000: begin
                            SP[7:0] <= Save_Mux;
                        end
                        5'b11001: begin
                            SP[15:8] <= Save_Mux;
                        end
                        5'b11011: begin
                            F <= Save_Mux;
                        end
                        default: begin
                            ;
                        end
                    endcase
                end
            end
        end
    end
    always @(posedge clk) begin
        if ((ClkEn == 1'b1)) begin
            RegAddrA_r <= {Alternate, Set_BusA_To[2:1]};
            if ((((XY_Ind == 1'b0) && (XY_State != 2'b0)) && (Set_BusA_To[2:1] == 2'b10))) begin
                RegAddrA_r <= {XY_State[1], 2'b11};
            end
            RegAddrB_r <= {Alternate, Set_BusB_To[2:1]};
            if ((((XY_Ind == 1'b0) && (XY_State != 2'b0)) && (Set_BusB_To[2:1] == 2'b10))) begin
                RegAddrB_r <= {XY_State[1], 2'b11};
            end
            RegAddrC <= {Alternate, Set_Addr_To[1:0]};
            if (((JumpXY == 1'b1) || (LDSPHL == 1'b1))) begin
                RegAddrC <= {Alternate, 2'b10};
            end
            if (((((JumpXY == 1'b1) || (LDSPHL == 1'b1)) && (XY_State != 2'b0)) || mcycle[5])) begin
                RegAddrC <= {XY_State[1], 2'b11};
            end
            if ((((I_DJNZ == 1'b1) && (Save_ALU_r == 1'b1)))) begin
                IncDecZ <= F_Out[6];
            end
            if ((( (tstate[3])) && (IncDec_16[2:0] == 3'b100))) begin
                if ((ID16 == 0)) begin
                    IncDecZ <= 1'b0;
                end
                else begin
                    IncDecZ <= 1'b1;
                end
            end
            RegBusA_r <= RegBusA;
        end
    end
    always @(Alternate or ExchangeDH or IncDec_16 or RegAddrA_r or RegAddrB_r or XY_State or mcycle or tstate) begin
        if (((tstate[2] || ((tstate[3]) && (IncDec_16[2] == 1'b1))) && (XY_State == 2'b0))) begin
            RegAddrA = {Alternate, IncDec_16[1:0]};
        end
        else if ((( ((tstate[3]))) && (IncDec_16[1:0] == 2'b10))) begin
            RegAddrA = {XY_State[1], 2'b11};
        end
        else if (((ExchangeDH == 1'b1) && tstate[3])) begin
            RegAddrA = {Alternate, 2'b10};
        end
        else if (((ExchangeDH == 1'b1))) begin
            RegAddrA = {Alternate, 2'b1};
        end
        else begin
            RegAddrA = RegAddrA_r;
        end
        if (((ExchangeDH == 1'b1) && tstate[3])) begin
            RegAddrB = {Alternate, 2'b1};
        end
        else begin
            RegAddrB = RegAddrB_r;
        end
    end
    always @(ALU_Op_r or Auto_Wait_t1 or ExchangeDH or IncDec_16 or Read_To_Reg_r or Save_ALU_r or mcycle or tstate or wait_n) begin
        RegWEH = 1'b0;
        RegWEL = 1'b0; begin
            case (Read_To_Reg_r)
                5'b10000, 5'b10001, 5'b10010, 5'b10011, 5'b10100, 5'b10101: begin
                    RegWEH = ~(Read_To_Reg_r[0]);
                    RegWEL = Read_To_Reg_r[0];
                end
                default: begin
                    ;
                end
            endcase
        end
        if ((ExchangeDH && (tstate[3] || tstate[4]))) begin
            RegWEH = 1'b1;
            RegWEL = 1'b1;
        end
        if ((IncDec_16[2] && (((tstate[2] && wait_n) && ~(mcycle[0])) || (tstate[3] && mcycle[0])))) begin
            case (IncDec_16[1:0])
                2'b0, 2'b1, 2'b10: begin
                    RegWEH = 1'b1;
                    RegWEL = 1'b1;
                end
                default: begin
                    ;
                end
            endcase
        end
    end
    always @(ExchangeDH or ID16 or IncDec_16 or RegBusA_r or RegBusB or Save_Mux or mcycle or tstate) begin
        RegDIH = Save_Mux;
        RegDIL = Save_Mux;
        if (((ExchangeDH == 1'b1) && tstate[3])) begin
            RegDIH = RegBusB[15:8];
            RegDIL = RegBusB[7:0];
        end
        else if (((ExchangeDH == 1'b1))) begin
            RegDIH = RegBusA_r[15:8];
            RegDIL = RegBusA_r[7:0];
        end
        else if (( ((tstate[2]) || (tstate[3])))) begin
            RegDIH = ID16[15:8];
            RegDIL = ID16[7:0];
        end
    end
    tv80_core_i_reg i_reg (
        .DOBH(RegBusB[15:8]),
        .DOAL(RegBusA[7:0]),
        .DOCL(RegBusC[7:0]),
        .DOBL(RegBusB[7:0]),
        .DOCH(RegBusC[15:8]),
        .DOAH(RegBusA[15:8]),
        .AddrC(RegAddrC),
        .AddrA(RegAddrA),
        .AddrB(RegAddrB),
        .DIH(RegDIH),
        .DIL(RegDIL),
        .clk(clk),
        .CEN(ClkEn),
        .WEH(RegWEH),
        .WEL(RegWEL)
    );
    always @(posedge clk) begin
        if ((ClkEn == 1'b1)) begin
            case (Set_BusB_To)
                4'b111: begin
                    BusB <= ACC;
                end
                4'b0, 4'b1, 4'b10, 4'b11, 4'b100, 4'b101: begin
                    if ((Set_BusB_To[0] == 1'b1)) begin
                        BusB <= RegBusB[7:0];
                    end
                    else begin
                        BusB <= RegBusB[15:8];
                    end
                end
                4'b110: begin
                    BusB <= DI_Reg;
                end
                4'b1000: begin
                    BusB <= SP[7:0];
                end
                4'b1001: begin
                    BusB <= SP[15:8];
                end
                4'b1010: begin
                    BusB <= 8'd1;
                end
                4'b1011: begin
                    BusB <= F;
                end
                4'b1100: begin
                    BusB <= PC[7:0];
                end
                4'b1101: begin
                    BusB <= PC[15:8];
                end
                default: begin
                    BusB <= 8'd0;
                end
            endcase
            case (Set_BusA_To)
                4'b111: begin
                    BusA <= ACC;
                end
                4'b0, 4'b1, 4'b10, 4'b11, 4'b100, 4'b101: begin
                    if ((Set_BusA_To[0] == 1'b1)) begin
                        BusA <= RegBusA[7:0];
                    end
                    else begin
                        BusA <= RegBusA[15:8];
                    end
                end
                4'b110: begin
                    BusA <= DI_Reg;
                end
                default: begin
                    BusA <= 8'd0;
                end
            endcase
        end
    end
    assign rfsh_n = 1'b1;
    always @(BusAck or Halt_FF or I_DJNZ or IntCycle or IntE_FF1 or di or iorq_i or mcycle or tstate) begin
        mc = mcycle;
        ts = tstate;
        DI_Reg = di;
        halt_n = ~(Halt_FF);
        busak_n = ~(BusAck);
        intcycle_n = ~(IntCycle);
        IntE = IntE_FF1;
        iorq = iorq_i;
        stop = I_DJNZ;
    end
    always @(posedge clk or negedge reset_n) begin
        if (~(reset_n)) begin
            BusReq_s <= 1'b0;
            INT_s <= 1'b0;
            NMI_s <= 1'b0;
            Oldnmi_n <= 1'b0;
        end
        else begin
            if ((cen == 1'b1)) begin
                BusReq_s <= ~(busrq_n);
                INT_s <= ~(int_n);
                if ((NMICycle == 1'b1)) begin
                    NMI_s <= 1'b0;
                end
                else if (((nmi_n == 1'b0) && (Oldnmi_n == 1'b1))) begin
                    NMI_s <= 1'b1;
                end
                Oldnmi_n <= nmi_n;
            end
        end
    end
    always @(posedge clk or negedge reset_n) begin
        if ((reset_n == 1'b0)) begin
            mcycle <= 7'b1;
            tstate <= 7'b1;
            Pre_XY_F_M <= 3'b0;
            Halt_FF <= 1'b0;
            BusAck <= 1'b0;
            NMICycle <= 1'b0;
            IntCycle <= 1'b0;
            IntE_FF1 <= 1'b0;
            IntE_FF2 <= 1'b0;
            No_BTR <= 1'b0;
            Auto_Wait_t1 <= 1'b0;
            Auto_Wait_t2 <= 1'b0;
            m1_n <= 1'b1;
        end
        else begin
            if ((cen == 1'b1)) begin
                if ((T_Res == 1'b1)) begin
                    Auto_Wait_t1 <= 1'b0;
                end
                else begin
                    Auto_Wait_t1 <= (Auto_Wait || (iorq_i & ~(Auto_Wait_t2)));
                end
                Auto_Wait_t2 <= (Auto_Wait_t1 & !(T_Res));
                No_BTR <= (((I_BT && (~(IR[4]) || ~(F[2]))) || (I_BC && ((~(IR[4]) || F[6]) || ~(F[2])))) || (I_BTR && (~(IR[4]) || F[6])));
                if (tstate[2]) begin
                    if ((SetEI == 1'b1)) begin
                        if (!(NMICycle)) begin
                            IntE_FF1 <= 1'b1;
                        end
                        IntE_FF2 <= 1'b1;
                    end
                    if ((I_RETN == 1'b1)) begin
                        IntE_FF1 <= IntE_FF2;
                    end
                end begin
                    if ((SetDI == 1'b1)) begin
                        IntE_FF1 <= 1'b0;
                        IntE_FF2 <= 1'b0;
                    end
                end
                if (((IntCycle == 1'b1) || (NMICycle == 1'b1))) begin
                    Halt_FF <= 1'b0;
                end
                if ((( tstate[2]) && (wait_n == 1'b1))) begin
                    m1_n <= 1'b1;
                end
                if (((BusReq_s == 1'b1) && (BusAck == 1'b1))) begin
                end
                else begin
                    BusAck <= 1'b0;
                    if ((tstate[2] && (wait_n == 1'b0))) begin
                    end
                    else if ((T_Res == 1'b1)) begin
                        if ((Halt == 1'b1)) begin
                            Halt_FF <= 1'b1;
                        end
                        if ((BusReq_s == 1'b1)) begin
                            BusAck <= 1'b1;
                        end
                        else begin
                            tstate <= 7'b10;
                            if ((NextIs_XY_Fetch == 1'b1)) begin
                                mcycle <= 7'b100000;
                                Pre_XY_F_M <= mcyc_to_number(mcycle);
                                begin end
                            end
                            else if ((mcycle[6] || ((mcycle[5]) && (ISet != 2'b1)))) begin
                                mcycle <= number_to_bitvec((Pre_XY_F_M + 1));
                            end
                            else if (((last_mcycle || (No_BTR == 1'b1)) || ((mcycle[1] && (I_DJNZ == 1'b1)) && (IncDecZ == 1'b1)))) begin
                                m1_n <= 1'b0;
                                mcycle <= 7'b1;
                                IntCycle <= 1'b0;
                                NMICycle <= 1'b0;
                                if (((NMI_s == 1'b1) && (Prefix == 2'b0))) begin
                                    NMICycle <= 1'b1;
                                    IntE_FF1 <= 1'b0;
                                end
                                else if (((((IntE_FF1 == 1'b1) && (INT_s == 1'b1)) && (Prefix == 2'b0)) && (SetEI == 1'b0))) begin
                                    IntCycle <= 1'b1;
                                    IntE_FF1 <= 1'b0;
                                    IntE_FF2 <= 1'b0;
                                end
                            end
                            else begin
                                mcycle <= {mcycle[5:0], mcycle[6]};
                            end
                        end
                    end
                    else begin
                        if ((~(((Auto_Wait == 1'b1) && (Auto_Wait_t2 == 1'b0))) && ~((( (iorq_i == 1'b1)) && (Auto_Wait_t1 == 1'b0))))) begin
                            tstate <= {tstate[5:0], tstate[6]};
                        end
                    end
                end
                if (tstate[0]) begin
                    m1_n <= 1'b0;
                end
            end
        end
    end
    always @(BTR_r or DI_Reg or IncDec_16 or JumpE or PC or RegBusA or RegBusC or SP or tstate) begin
        if ((JumpE == 1'b1)) begin
            PC16_B = {{8{DI_Reg[7]}}, DI_Reg};
        end
        else if ((BTR_r == 1'b1)) begin
            PC16_B = -2;
        end
        else begin
            PC16_B = 1;
        end
        if (tstate[3]) begin
            SP16_A = RegBusC;
            SP16_B = {{8{DI_Reg[7]}}, DI_Reg};
        end
        else begin
            SP16_A = SP;
            if ((IncDec_16[3] == 1'b1)) begin
                SP16_B = -1;
            end
            else begin
                SP16_B = 1;
            end
        end
        if (IncDec_16[3]) begin
            ID16_B = -1;
        end
        else begin
            ID16_B = 1;
        end
        ID16 = (RegBusA + ID16_B);
        PC16 = (PC + PC16_B);
        SP16 = (SP16_A + SP16_B);
    end
    always @(IntCycle or NMICycle or mcycle) begin
        Auto_Wait = 1'b0;
        if (((IntCycle == 1'b1) || (NMICycle == 1'b1))) begin
            if (mcycle[0]) begin
                Auto_Wait = 1'b1;
            end
        end
    end
endmodule

module tv80_core_i_mcode (
    output reg[2:0] MCycles,
    output reg[2:0] TStates,
    output reg[1:0] Prefix,
    output reg Inc_PC,
    output reg Inc_WZ,
    output reg[3:0] IncDec_16,
    output reg Read_To_Reg,
    output reg Read_To_Acc,
    output reg[3:0] Set_BusA_To,
    output reg[3:0] Set_BusB_To,
    output reg[3:0] ALU_Op,
    output reg Save_ALU,
    output reg PreserveC,
    output reg Arith16,
    output reg[2:0] Set_Addr_To,
    output reg IORQ,
    output reg Jump,
    output reg JumpE,
    output reg JumpXY,
    output reg Call,
    output reg RstP,
    output reg LDZ,
    output reg LDW,
    output reg LDSPHL,
    output reg[2:0] Special_LD,
    output reg ExchangeDH,
    output reg ExchangeRp,
    output reg ExchangeAF,
    output reg ExchangeRS,
    output reg I_DJNZ,
    output reg I_CPL,
    output reg I_CCF,
    output reg I_SCF,
    output reg I_RETN,
    output reg I_BT,
    output reg I_BC,
    output reg I_BTR,
    output reg I_RLD,
    output reg I_RRD,
    output reg I_INRC,
    output reg SetDI,
    output reg SetEI,
    output reg[1:0] IMode,
    output reg Halt,
    output reg NoRead,
    output reg Write,
    input logic[7:0] IR,
    input logic[1:0] ISet,
    input logic[6:0] MCycle,
    input logic[7:0] F,
    input logic NMICycle,
    input logic IntCycle
);
    function logic is_cc_true(input logic[7:0] FF, input logic[2:0] cc); begin
            case (cc)
                3'b0: begin
                    is_cc_true = (FF[6] == 1'b0);
                end
                3'b1: begin
                    is_cc_true = (FF[6] == 1'b1);
                end
                3'b10: begin
                    is_cc_true = (FF[0] == 1'b0);
                end
                3'b11: begin
                    is_cc_true = (FF[0] == 1'b1);
                end
                3'b100: begin
                    is_cc_true = (FF[2] == 1'b0);
                end
                3'b101: begin
                    is_cc_true = (FF[2] == 1'b1);
                end
                3'b110: begin
                    is_cc_true = (FF[7] == 1'b0);
                end
                3'b111: begin
                    is_cc_true = (FF[7] == 1'b1);
                end
            endcase
        end
    endfunction
    reg[2:0] DDD;
    reg[2:0] SSS;
    reg[1:0] DPAIR;
    always @(F or IR or ISet or IntCycle or MCycle or NMICycle) begin
        DDD = IR[5:3];
        SSS = IR[2:0];
        DPAIR = IR[5:4];
        MCycles = 3'b1; begin
            TStates = 3'b100;
        end
        Prefix = 2'b0;
        Inc_PC = 1'b0;
        Inc_WZ = 1'b0;
        IncDec_16 = 4'b0;
        Read_To_Acc = 1'b0;
        Read_To_Reg = 1'b0;
        Set_BusB_To = 4'b0;
        Set_BusA_To = 4'b0;
        ALU_Op = {1'b0, IR[5:3]};
        Save_ALU = 1'b0;
        PreserveC = 1'b0;
        Arith16 = 1'b0;
        IORQ = 1'b0;
        Set_Addr_To = 3'b111;
        Jump = 1'b0;
        JumpE = 1'b0;
        JumpXY = 1'b0;
        Call = 1'b0;
        RstP = 1'b0;
        LDZ = 1'b0;
        LDW = 1'b0;
        LDSPHL = 1'b0;
        Special_LD = 3'b0;
        ExchangeDH = 1'b0;
        ExchangeRp = 1'b0;
        ExchangeAF = 1'b0;
        ExchangeRS = 1'b0;
        I_DJNZ = 1'b0;
        I_CPL = 1'b0;
        I_CCF = 1'b0;
        I_SCF = 1'b0;
        I_RETN = 1'b0;
        I_BT = 1'b0;
        I_BC = 1'b0;
        I_BTR = 1'b0;
        I_RLD = 1'b0;
        I_RRD = 1'b0;
        I_INRC = 1'b0;
        SetDI = 1'b0;
        SetEI = 1'b0;
        IMode = 2'b11;
        Halt = 1'b0;
        NoRead = 1'b0;
        Write = 1'b0;
        case (ISet)
            2'b0: begin
                casez (IR)
                    8'b1zzzzzz: begin
                        if ((IR[5:0] == 6'b110110)) begin
                            Halt = 1'b1;
                        end
                        else if ((IR[2:0] == 3'b110)) begin
                            MCycles = 3'b10;
                            if (MCycle[0]) begin
                                Set_Addr_To = 3'b10;
                            end
                            if (MCycle[1]) begin
                                Set_BusA_To[2:0] = DDD;
                                Read_To_Reg = 1'b1;
                            end
                        end
                        else if ((IR[5:3] == 3'b110)) begin
                            MCycles = 3'b10;
                            if (MCycle[0]) begin
                                Set_Addr_To = 3'b10;
                                Set_BusB_To[2:0] = SSS;
                                Set_BusB_To[3] = 1'b0;
                            end
                            if (MCycle[1]) begin
                                Write = 1'b1;
                            end
                        end
                        else begin
                            Set_BusB_To[2:0] = SSS;
                            ExchangeRp = 1'b1;
                            Set_BusA_To[2:0] = DDD;
                            Read_To_Reg = 1'b1;
                        end
                    end
                    8'b0zzz110: begin
                        if ((IR[5:3] == 3'b110)) begin
                            MCycles = 3'b11;
                            if (MCycle[1]) begin
                                Inc_PC = 1'b1;
                                Set_Addr_To = 3'b10;
                                Set_BusB_To[2:0] = SSS;
                                Set_BusB_To[3] = 1'b0;
                            end
                            if (MCycle[2]) begin
                                Write = 1'b1;
                            end
                        end
                        else begin
                            MCycles = 3'b10;
                            if (MCycle[1]) begin
                                Inc_PC = 1'b1;
                                Set_BusA_To[2:0] = DDD;
                                Read_To_Reg = 1'b1;
                            end
                        end
                    end
                    8'd10: begin
                        MCycles = 3'b10;
                        if (MCycle[0]) begin
                            Set_Addr_To = 3'b0;
                        end begin
                            Read_To_Acc = 1'b1;
                        end
                    end
                    8'd26: begin
                        MCycles = 3'b10;
                        if (MCycle[0]) begin
                            Set_Addr_To = 3'b1;
                        end begin
                            Read_To_Acc = 1'b1;
                        end
                    end
                    8'd58: begin begin
                            MCycles = 3'b100;
                            if (MCycle[1]) begin
                                Inc_PC = 1'b1;
                                LDZ = 1'b1;
                            end
                            if (MCycle[2]) begin
                                Set_Addr_To = 3'b110;
                                Inc_PC = 1'b1;
                            end begin
                                Read_To_Acc = 1'b1;
                            end
                        end
                    end
                    8'd2: begin
                        MCycles = 3'b10;
                        if (MCycle[0]) begin
                            Set_Addr_To = 3'b0;
                            Set_BusB_To = 4'b111;
                        end
                        if (MCycle[1]) begin
                            Write = 1'b1;
                        end
                    end
                    8'd18: begin
                        MCycles = 3'b10;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b1;
                                Set_BusB_To = 4'b111;
                            end
                            MCycle[1]: begin
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd50: begin begin
                            MCycles = 3'b100;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    LDZ = 1'b1;
                                end
                                MCycle[2]: begin
                                    Set_Addr_To = 3'b110;
                                    Inc_PC = 1'b1;
                                    Set_BusB_To = 4'b111;
                                end
                                MCycle[3]: begin
                                    Write = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd1, 8'd17, 8'd33, 8'd49: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[1]: begin
                                Inc_PC = 1'b1;
                                Read_To_Reg = 1'b1;
                                if ((DPAIR == 2'b11)) begin
                                    Set_BusA_To[3:0] = 4'b1000;
                                end
                                else begin
                                    Set_BusA_To[2:1] = DPAIR;
                                    Set_BusA_To[0] = 1'b1;
                                end
                            end
                            MCycle[2]: begin
                                Inc_PC = 1'b1;
                                Read_To_Reg = 1'b1;
                                if ((DPAIR == 2'b11)) begin
                                    Set_BusA_To[3:0] = 4'b1001;
                                end
                                else begin
                                    Set_BusA_To[2:1] = DPAIR;
                                    Set_BusA_To[0] = 1'b0;
                                end
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd42: begin begin
                            MCycles = 3'b101;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    LDZ = 1'b1;
                                end
                                MCycle[2]: begin
                                    Set_Addr_To = 3'b110;
                                    Inc_PC = 1'b1;
                                    LDW = 1'b1;
                                end
                                MCycle[3]: begin
                                    Set_BusA_To[2:0] = 3'b101;
                                    Read_To_Reg = 1'b1;
                                    Inc_WZ = 1'b1;
                                    Set_Addr_To = 3'b110;
                                end
                                MCycle[4]: begin
                                    Set_BusA_To[2:0] = 3'b100;
                                    Read_To_Reg = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd34: begin begin
                            MCycles = 3'b101;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    LDZ = 1'b1;
                                end
                                MCycle[2]: begin
                                    Set_Addr_To = 3'b110;
                                    Inc_PC = 1'b1;
                                    LDW = 1'b1;
                                    Set_BusB_To = 4'b101;
                                end
                                MCycle[3]: begin
                                    Inc_WZ = 1'b1;
                                    Set_Addr_To = 3'b110;
                                    Write = 1'b1;
                                    Set_BusB_To = 4'b100;
                                end
                                MCycle[4]: begin
                                    Write = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd249: begin
                        TStates = 3'b110;
                        LDSPHL = 1'b1;
                    end
                    8'b11zz0101: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0]: begin
                                TStates = 3'b101;
                                IncDec_16 = 4'b1111;
                                Set_Addr_To = 3'b101;
                                if ((DPAIR == 2'b11)) begin
                                    Set_BusB_To = 4'b111;
                                end
                                else begin
                                    Set_BusB_To[2:1] = DPAIR;
                                    Set_BusB_To[0] = 1'b0;
                                    Set_BusB_To[3] = 1'b0;
                                end
                            end
                            MCycle[1]: begin
                                IncDec_16 = 4'b1111;
                                Set_Addr_To = 3'b101;
                                if ((DPAIR == 2'b11)) begin
                                    Set_BusB_To = 4'b1011;
                                end
                                else begin
                                    Set_BusB_To[2:1] = DPAIR;
                                    Set_BusB_To[0] = 1'b1;
                                    Set_BusB_To[3] = 1'b0;
                                end
                                Write = 1'b1;
                            end
                            MCycle[2]: begin
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'b11zz0001: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b101;
                            end
                            MCycle[1]: begin
                                IncDec_16 = 4'b111;
                                Set_Addr_To = 3'b101;
                                Read_To_Reg = 1'b1;
                                if ((DPAIR == 2'b11)) begin
                                    Set_BusA_To[3:0] = 4'b1011;
                                end
                                else begin
                                    Set_BusA_To[2:1] = DPAIR;
                                    Set_BusA_To[0] = 1'b1;
                                end
                            end
                            MCycle[2]: begin
                                IncDec_16 = 4'b111;
                                Read_To_Reg = 1'b1;
                                if ((DPAIR == 2'b11)) begin
                                    Set_BusA_To[3:0] = 4'b111;
                                end
                                else begin
                                    Set_BusA_To[2:1] = DPAIR;
                                    Set_BusA_To[0] = 1'b0;
                                end
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd235: begin begin
                            ExchangeDH = 1'b1;
                        end
                    end
                    8'd8: begin begin
                            ExchangeAF = 1'b1;
                        end
                    end
                    8'd217: begin begin
                            ExchangeRS = 1'b1;
                        end
                    end
                    8'd227: begin begin
                            MCycles = 3'b101;
                            case (1'b1)
                                MCycle[0]: begin
                                    Set_Addr_To = 3'b101;
                                end
                                MCycle[1]: begin
                                    Read_To_Reg = 1'b1;
                                    Set_BusA_To = 4'b101;
                                    Set_BusB_To = 4'b101;
                                    Set_Addr_To = 3'b101;
                                end
                                MCycle[2]: begin
                                    IncDec_16 = 4'b111;
                                    Set_Addr_To = 3'b101;
                                    TStates = 3'b100;
                                    Write = 1'b1;
                                end
                                MCycle[3]: begin
                                    Read_To_Reg = 1'b1;
                                    Set_BusA_To = 4'b100;
                                    Set_BusB_To = 4'b100;
                                    Set_Addr_To = 3'b101;
                                end
                                MCycle[4]: begin
                                    IncDec_16 = 4'b1111;
                                    TStates = 3'b101;
                                    Write = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'b10zzzzzz: begin
                        if ((IR[2:0] == 3'b110)) begin
                            MCycles = 3'b10;
                            case (1'b1)
                                MCycle[0]: begin
                                    Set_Addr_To = 3'b10;
                                end
                                MCycle[1]: begin
                                    Read_To_Reg = 1'b1;
                                    Save_ALU = 1'b1;
                                    Set_BusB_To[2:0] = SSS;
                                    Set_BusA_To[2:0] = 3'b111;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                        else begin
                            Set_BusB_To[2:0] = SSS;
                            Set_BusA_To[2:0] = 3'b111;
                            Read_To_Reg = 1'b1;
                            Save_ALU = 1'b1;
                        end
                    end
                    8'b11zzz110: begin
                        MCycles = 3'b10;
                        if (MCycle[1]) begin
                            Inc_PC = 1'b1;
                            Read_To_Reg = 1'b1;
                            Save_ALU = 1'b1;
                            Set_BusB_To[2:0] = SSS;
                            Set_BusA_To[2:0] = 3'b111;
                        end
                    end
                    8'b0zzz100: begin
                        if ((IR[5:3] == 3'b110)) begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[0]: begin
                                    Set_Addr_To = 3'b10;
                                end
                                MCycle[1]: begin
                                    TStates = 3'b100;
                                    Set_Addr_To = 3'b10;
                                    Read_To_Reg = 1'b1;
                                    Save_ALU = 1'b1;
                                    PreserveC = 1'b1;
                                    ALU_Op = 4'b0;
                                    Set_BusB_To = 4'b1010;
                                    Set_BusA_To[2:0] = DDD;
                                end
                                MCycle[2]: begin
                                    Write = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                        else begin
                            Set_BusB_To = 4'b1010;
                            Set_BusA_To[2:0] = DDD;
                            Read_To_Reg = 1'b1;
                            Save_ALU = 1'b1;
                            PreserveC = 1'b1;
                            ALU_Op = 4'b0;
                        end
                    end
                    8'b0zzz101: begin
                        if ((IR[5:3] == 3'b110)) begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[0]: begin
                                    Set_Addr_To = 3'b10;
                                end
                                MCycle[1]: begin
                                    TStates = 3'b100;
                                    Set_Addr_To = 3'b10;
                                    ALU_Op = 4'b10;
                                    Read_To_Reg = 1'b1;
                                    Save_ALU = 1'b1;
                                    PreserveC = 1'b1;
                                    Set_BusB_To = 4'b1010;
                                    Set_BusA_To[2:0] = DDD;
                                end
                                MCycle[2]: begin
                                    Write = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                        else begin
                            Set_BusB_To = 4'b1010;
                            Set_BusA_To[2:0] = DDD;
                            Read_To_Reg = 1'b1;
                            Save_ALU = 1'b1;
                            PreserveC = 1'b1;
                            ALU_Op = 4'b10;
                        end
                    end
                    8'd39: begin
                        Set_BusA_To[2:0] = 3'b111;
                        Read_To_Reg = 1'b1;
                        ALU_Op = 4'b1100;
                        Save_ALU = 1'b1;
                    end
                    8'd47: begin
                        I_CPL = 1'b1;
                    end
                    8'd63: begin
                        I_CCF = 1'b1;
                    end
                    8'd55: begin
                        I_SCF = 1'b1;
                    end
                    8'd0: begin
                        if ((NMICycle == 1'b1)) begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[0]: begin
                                    TStates = 3'b101;
                                    IncDec_16 = 4'b1111;
                                    Set_Addr_To = 3'b101;
                                    Set_BusB_To = 4'b1101;
                                end
                                MCycle[1]: begin
                                    TStates = 3'b100;
                                    Write = 1'b1;
                                    IncDec_16 = 4'b1111;
                                    Set_Addr_To = 3'b101;
                                    Set_BusB_To = 4'b1100;
                                end
                                MCycle[2]: begin
                                    TStates = 3'b100;
                                    Write = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                        else if ((IntCycle == 1'b1)) begin
                            MCycles = 3'b101;
                            case (1'b1)
                                MCycle[0]: begin
                                    LDZ = 1'b1;
                                    TStates = 3'b101;
                                    IncDec_16 = 4'b1111;
                                    Set_Addr_To = 3'b101;
                                    Set_BusB_To = 4'b1101;
                                end
                                MCycle[1]: begin
                                    TStates = 3'b100;
                                    Write = 1'b1;
                                    IncDec_16 = 4'b1111;
                                    Set_Addr_To = 3'b101;
                                    Set_BusB_To = 4'b1100;
                                end
                                MCycle[2]: begin
                                    TStates = 3'b100;
                                    Write = 1'b1;
                                end
                                MCycle[3]: begin
                                    Inc_PC = 1'b1;
                                    LDZ = 1'b1;
                                end
                                MCycle[4]: begin
                                    Jump = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd243: begin
                        SetDI = 1'b1;
                    end
                    8'd251: begin
                        SetEI = 1'b1;
                    end
                    8'b0zz1001: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[1]: begin
                                NoRead = 1'b1;
                                ALU_Op = 4'b0;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                Set_BusA_To[2:0] = 3'b101;
                                case (IR[5:4])
                                    0, 1, 2: begin
                                        Set_BusB_To[2:1] = IR[5:4];
                                        Set_BusB_To[0] = 1'b1;
                                    end
                                    default: begin
                                        Set_BusB_To = 4'b1000;
                                    end
                                endcase
                                TStates = 3'b100;
                                Arith16 = 1'b1;
                            end
                            MCycle[2]: begin
                                NoRead = 1'b1;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                ALU_Op = 4'b1;
                                Set_BusA_To[2:0] = 3'b100;
                                case (IR[5:4])
                                    0, 1, 2: begin
                                        Set_BusB_To[2:1] = IR[5:4];
                                    end
                                    default: begin
                                        Set_BusB_To = 4'b1001;
                                    end
                                endcase
                                Arith16 = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'b0zz0011: begin
                        TStates = 3'b110;
                        IncDec_16[3:2] = 2'b1;
                        IncDec_16[1:0] = DPAIR;
                    end
                    8'b0zz1011: begin
                        TStates = 3'b110;
                        IncDec_16[3:2] = 2'b11;
                        IncDec_16[1:0] = DPAIR;
                    end
                    8'd7, 8'd23, 8'd15, 8'd31: begin
                        Set_BusA_To[2:0] = 3'b111;
                        ALU_Op = 4'b1000;
                        Read_To_Reg = 1'b1;
                        Save_ALU = 1'b1;
                    end
                    8'd195: begin
                        MCycles = 3'b11; begin
                            Inc_PC = 1'b1;
                            LDZ = 1'b1;
                        end
                        if (MCycle[2]) begin
                            Inc_PC = 1'b1;
                            Jump = 1'b1;
                        end
                    end
                    8'b11zzz010: begin begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    LDZ = 1'b1;
                                end
                                MCycle[2]: begin
                                    Inc_PC = 1'b1;
                                    if (is_cc_true(F, IR[5:3])) begin
                                        Jump = 1'b1;
                                    end
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd24: begin begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                end
                                MCycle[2]: begin
                                    NoRead = 1'b1;
                                    JumpE = 1'b1;
                                    TStates = 3'b101;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'b1zz000: begin begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    case (IR[4:3])
                                        0: begin
                                            MCycles = (F[6] ? 3'b10 : 3'b11);
                                        end
                                        1: begin
                                            MCycles = (!(F[6]) ? 3'b10 : 3'b11);
                                        end
                                        2: begin
                                            MCycles = (F[0] ? 3'b10 : 3'b11);
                                        end
                                        3: begin
                                            MCycles = (!(F[0]) ? 3'b10 : 3'b11);
                                        end
                                    endcase
                                end
                                MCycle[2]: begin
                                    NoRead = 1'b1;
                                    JumpE = 1'b1;
                                    TStates = 3'b101;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd233: begin
                        JumpXY = 1'b1;
                    end
                    8'd16: begin begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[0]: begin
                                    TStates = 3'b101;
                                    I_DJNZ = 1'b1;
                                    Set_BusB_To = 4'b1010;
                                    Set_BusA_To[2:0] = 3'b0;
                                    Read_To_Reg = 1'b1;
                                    Save_ALU = 1'b1;
                                    ALU_Op = 4'b10;
                                end
                                MCycle[1]: begin
                                    I_DJNZ = 1'b1;
                                    Inc_PC = 1'b1;
                                end
                                MCycle[2]: begin
                                    NoRead = 1'b1;
                                    JumpE = 1'b1;
                                    TStates = 3'b101;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd205: begin
                        MCycles = 3'b101;
                        case (1'b1)
                            MCycle[1]: begin
                                Inc_PC = 1'b1;
                                LDZ = 1'b1;
                            end
                            MCycle[2]: begin
                                IncDec_16 = 4'b1111;
                                Inc_PC = 1'b1;
                                TStates = 3'b100;
                                Set_Addr_To = 3'b101;
                                LDW = 1'b1;
                                Set_BusB_To = 4'b1101;
                            end
                            MCycle[3]: begin
                                Write = 1'b1;
                                IncDec_16 = 4'b1111;
                                Set_Addr_To = 3'b101;
                                Set_BusB_To = 4'b1100;
                            end
                            MCycle[4]: begin
                                Write = 1'b1;
                                Call = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'b11zzz100: begin begin
                            MCycles = 3'b101;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    LDZ = 1'b1;
                                end
                                MCycle[2]: begin
                                    Inc_PC = 1'b1;
                                    LDW = 1'b1;
                                    if (is_cc_true(F, IR[5:3])) begin
                                        IncDec_16 = 4'b1111;
                                        Set_Addr_To = 3'b101;
                                        TStates = 3'b100;
                                        Set_BusB_To = 4'b1101;
                                    end
                                    else begin
                                        MCycles = 3'b11;
                                    end
                                end
                                MCycle[3]: begin
                                    Write = 1'b1;
                                    IncDec_16 = 4'b1111;
                                    Set_Addr_To = 3'b101;
                                    Set_BusB_To = 4'b1100;
                                end
                                MCycle[4]: begin
                                    Write = 1'b1;
                                    Call = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd201: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0]: begin
                                TStates = 3'b101;
                                Set_Addr_To = 3'b101;
                            end
                            MCycle[1]: begin
                                IncDec_16 = 4'b111;
                                Set_Addr_To = 3'b101;
                                LDZ = 1'b1;
                            end
                            MCycle[2]: begin
                                Jump = 1'b1;
                                IncDec_16 = 4'b111;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd192, 8'd200, 8'd208, 8'd216, 8'd224, 8'd232, 8'd240, 8'd248: begin begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[0]: begin
                                    if (is_cc_true(F, IR[5:3])) begin
                                        Set_Addr_To = 3'b101;
                                    end
                                    else begin
                                        MCycles = 3'b1;
                                    end
                                    TStates = 3'b101;
                                end
                                MCycle[1]: begin
                                    IncDec_16 = 4'b111;
                                    Set_Addr_To = 3'b101;
                                    LDZ = 1'b1;
                                end
                                MCycle[2]: begin
                                    Jump = 1'b1;
                                    IncDec_16 = 4'b111;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd199, 8'd207, 8'd215, 8'd223, 8'd231, 8'd239, 8'd247, 8'd255: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0]: begin
                                TStates = 3'b101;
                                IncDec_16 = 4'b1111;
                                Set_Addr_To = 3'b101;
                                Set_BusB_To = 4'b1101;
                            end
                            MCycle[1]: begin
                                Write = 1'b1;
                                IncDec_16 = 4'b1111;
                                Set_Addr_To = 3'b101;
                                Set_BusB_To = 4'b1100;
                            end
                            MCycle[2]: begin
                                Write = 1'b1;
                                RstP = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd219: begin begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    Set_Addr_To = 3'b100;
                                end
                                MCycle[2]: begin
                                    Read_To_Acc = 1'b1;
                                    IORQ = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd211: begin begin
                            MCycles = 3'b11;
                            case (1'b1)
                                MCycle[1]: begin
                                    Inc_PC = 1'b1;
                                    Set_Addr_To = 3'b100;
                                    Set_BusB_To = 4'b111;
                                end
                                MCycle[2]: begin
                                    Write = 1'b1;
                                    IORQ = 1'b1;
                                end
                                default: begin
                                    ;
                                end
                            endcase
                        end
                    end
                    8'd203: begin begin
                            Prefix = 2'b1;
                        end
                    end
                    8'd237: begin begin
                            Prefix = 2'b10;
                        end
                    end
                    8'd221, 8'd253: begin begin
                            Prefix = 2'b11;
                        end
                    end
                endcase
            end
            2'b1: begin
                Set_BusA_To[2:0] = IR[2:0];
                Set_BusB_To[2:0] = IR[2:0];
                casez (IR)
                    8'd0, 8'd1, 8'd2, 8'd3, 8'd4, 8'd5, 8'd7, 8'd16, 8'd17, 8'd18, 8'd19, 8'd20, 8'd21, 8'd23, 8'd8, 8'd9, 8'd10, 8'd11, 8'd12, 8'd13, 8'd15, 8'd24, 8'd25, 8'd26, 8'd27, 8'd28, 8'd29, 8'd31, 8'd32, 8'd33, 8'd34, 8'd35, 8'd36, 8'd37, 8'd39, 8'd40, 8'd41, 8'd42, 8'd43, 8'd44, 8'd45, 8'd47, 8'd48, 8'd49, 8'd50, 8'd51, 8'd52, 8'd53, 8'd55, 8'd56, 8'd57, 8'd58, 8'd59, 8'd60, 8'd61, 8'd63: begin
                        if (MCycle[0]) begin
                            ALU_Op = 4'b1000;
                            Read_To_Reg = 1'b1;
                            Save_ALU = 1'b1;
                        end
                    end
                    8'b0zzz110: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0], MCycle[6]: begin
                                Set_Addr_To = 3'b10;
                            end
                            MCycle[1]: begin
                                ALU_Op = 4'b1000;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                Set_Addr_To = 3'b10;
                                TStates = 3'b100;
                            end
                            MCycle[2]: begin
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd64, 8'd65, 8'd66, 8'd67, 8'd68, 8'd69, 8'd71, 8'd72, 8'd73, 8'd74, 8'd75, 8'd76, 8'd77, 8'd79, 8'd80, 8'd81, 8'd82, 8'd83, 8'd84, 8'd85, 8'd87, 8'd88, 8'd89, 8'd90, 8'd91, 8'd92, 8'd93, 8'd95, 8'd96, 8'd97, 8'd98, 8'd99, 8'd100, 8'd101, 8'd103, 8'd104, 8'd105, 8'd106, 8'd107, 8'd108, 8'd109, 8'd111, 8'd112, 8'd113, 8'd114, 8'd115, 8'd116, 8'd117, 8'd119, 8'd120, 8'd121, 8'd122, 8'd123, 8'd124, 8'd125, 8'd127: begin
                        if (MCycle[0]) begin
                            Set_BusB_To[2:0] = IR[2:0];
                            ALU_Op = 4'b1001;
                        end
                    end
                    8'd70, 8'd78, 8'd86, 8'd94, 8'd102, 8'd110, 8'd118, 8'd126: begin
                        MCycles = 3'b10;
                        case (1'b1)
                            MCycle[0], MCycle[6]: begin
                                Set_Addr_To = 3'b10;
                            end
                            MCycle[1]: begin
                                ALU_Op = 4'b1001;
                                TStates = 3'b100;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd192, 8'd193, 8'd194, 8'd195, 8'd196, 8'd197, 8'd199, 8'd200, 8'd201, 8'd202, 8'd203, 8'd204, 8'd205, 8'd207, 8'd208, 8'd209, 8'd210, 8'd211, 8'd212, 8'd213, 8'd215, 8'd216, 8'd217, 8'd218, 8'd219, 8'd220, 8'd221, 8'd223, 8'd224, 8'd225, 8'd226, 8'd227, 8'd228, 8'd229, 8'd231, 8'd232, 8'd233, 8'd234, 8'd235, 8'd236, 8'd237, 8'd239, 8'd240, 8'd241, 8'd242, 8'd243, 8'd244, 8'd245, 8'd247, 8'd248, 8'd249, 8'd250, 8'd251, 8'd252, 8'd253, 8'd255: begin
                        if (MCycle[0]) begin
                            ALU_Op = 4'b1010;
                            Read_To_Reg = 1'b1;
                            Save_ALU = 1'b1;
                        end
                    end
                    8'd198, 8'd206, 8'd214, 8'd222, 8'd230, 8'd238, 8'd246, 8'd254: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0], MCycle[6]: begin
                                Set_Addr_To = 3'b10;
                            end
                            MCycle[1]: begin
                                ALU_Op = 4'b1010;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                Set_Addr_To = 3'b10;
                                TStates = 3'b100;
                            end
                            MCycle[2]: begin
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd128, 8'd129, 8'd130, 8'd131, 8'd132, 8'd133, 8'd135, 8'd136, 8'd137, 8'd138, 8'd139, 8'd140, 8'd141, 8'd143, 8'd144, 8'd145, 8'd146, 8'd147, 8'd148, 8'd149, 8'd151, 8'd152, 8'd153, 8'd154, 8'd155, 8'd156, 8'd157, 8'd159, 8'd160, 8'd161, 8'd162, 8'd163, 8'd164, 8'd165, 8'd167, 8'd168, 8'd169, 8'd170, 8'd171, 8'd172, 8'd173, 8'd175, 8'd176, 8'd177, 8'd178, 8'd179, 8'd180, 8'd181, 8'd183, 8'd184, 8'd185, 8'd186, 8'd187, 8'd188, 8'd189, 8'd191: begin
                        if (MCycle[0]) begin
                            ALU_Op = 4'b1011;
                            Read_To_Reg = 1'b1;
                            Save_ALU = 1'b1;
                        end
                    end
                    8'd134, 8'd142, 8'd150, 8'd158, 8'd166, 8'd174, 8'd182, 8'd190: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0], MCycle[6]: begin
                                Set_Addr_To = 3'b10;
                            end
                            MCycle[1]: begin
                                ALU_Op = 4'b1011;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                Set_Addr_To = 3'b10;
                                TStates = 3'b100;
                            end
                            MCycle[2]: begin
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                endcase
            end
            default: begin
                casez (IR)
                    8'd87: begin
                        Special_LD = 3'b100;
                        TStates = 3'b101;
                    end
                    8'd95: begin
                        Special_LD = 3'b101;
                        TStates = 3'b101;
                    end
                    8'd71: begin
                        Special_LD = 3'b110;
                        TStates = 3'b101;
                    end
                    8'd79: begin
                        Special_LD = 3'b111;
                        TStates = 3'b101;
                    end
                    8'd75, 8'd91, 8'd107, 8'd123: begin
                        MCycles = 3'b101;
                        case (1'b1)
                            MCycle[1]: begin
                                Inc_PC = 1'b1;
                                LDZ = 1'b1;
                            end
                            MCycle[2]: begin
                                Set_Addr_To = 3'b110;
                                Inc_PC = 1'b1;
                                LDW = 1'b1;
                            end
                            MCycle[3]: begin
                                Read_To_Reg = 1'b1;
                                if ((IR[5:4] == 2'b11)) begin
                                    Set_BusA_To = 4'b1000;
                                end
                                else begin
                                    Set_BusA_To[2:1] = IR[5:4];
                                    Set_BusA_To[0] = 1'b1;
                                end
                                Inc_WZ = 1'b1;
                                Set_Addr_To = 3'b110;
                            end
                            MCycle[4]: begin
                                Read_To_Reg = 1'b1;
                                if ((IR[5:4] == 2'b11)) begin
                                    Set_BusA_To = 4'b1001;
                                end
                                else begin
                                    Set_BusA_To[2:1] = IR[5:4];
                                    Set_BusA_To[0] = 1'b0;
                                end
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd67, 8'd83, 8'd99, 8'd115: begin
                        MCycles = 3'b101;
                        case (1'b1)
                            MCycle[1]: begin
                                Inc_PC = 1'b1;
                                LDZ = 1'b1;
                            end
                            MCycle[2]: begin
                                Set_Addr_To = 3'b110;
                                Inc_PC = 1'b1;
                                LDW = 1'b1;
                                if ((IR[5:4] == 2'b11)) begin
                                    Set_BusB_To = 4'b1000;
                                end
                                else begin
                                    Set_BusB_To[2:1] = IR[5:4];
                                    Set_BusB_To[0] = 1'b1;
                                    Set_BusB_To[3] = 1'b0;
                                end
                            end
                            MCycle[3]: begin
                                Inc_WZ = 1'b1;
                                Set_Addr_To = 3'b110;
                                Write = 1'b1;
                                if ((IR[5:4] == 2'b11)) begin
                                    Set_BusB_To = 4'b1001;
                                end
                                else begin
                                    Set_BusB_To[2:1] = IR[5:4];
                                    Set_BusB_To[0] = 1'b0;
                                    Set_BusB_To[3] = 1'b0;
                                end
                            end
                            MCycle[4]: begin
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd160, 8'd168, 8'd176, 8'd184: begin
                        MCycles = 3'b100;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b10;
                                IncDec_16 = 4'b1100;
                            end
                            MCycle[1]: begin
                                Set_BusB_To = 4'b110;
                                Set_BusA_To[2:0] = 3'b111;
                                ALU_Op = 4'b0;
                                Set_Addr_To = 3'b1;
                                if ((IR[3] == 1'b0)) begin
                                    IncDec_16 = 4'b110;
                                end
                                else begin
                                    IncDec_16 = 4'b1110;
                                end
                            end
                            MCycle[2]: begin
                                I_BT = 1'b1;
                                TStates = 3'b101;
                                Write = 1'b1;
                                if ((IR[3] == 1'b0)) begin
                                    IncDec_16 = 4'b101;
                                end
                                else begin
                                    IncDec_16 = 4'b1101;
                                end
                            end
                            MCycle[3]: begin
                                NoRead = 1'b1;
                                TStates = 3'b101;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd161, 8'd169, 8'd177, 8'd185: begin
                        MCycles = 3'b100;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b10;
                                IncDec_16 = 4'b1100;
                            end
                            MCycle[1]: begin
                                Set_BusB_To = 4'b110;
                                Set_BusA_To[2:0] = 3'b111;
                                ALU_Op = 4'b111;
                                Save_ALU = 1'b1;
                                PreserveC = 1'b1;
                                if ((IR[3] == 1'b0)) begin
                                    IncDec_16 = 4'b110;
                                end
                                else begin
                                    IncDec_16 = 4'b1110;
                                end
                            end
                            MCycle[2]: begin
                                NoRead = 1'b1;
                                I_BC = 1'b1;
                                TStates = 3'b101;
                            end
                            MCycle[3]: begin
                                NoRead = 1'b1;
                                TStates = 3'b101;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd68, 8'd76, 8'd84, 8'd92, 8'd100, 8'd108, 8'd116, 8'd124: begin
                        ALU_Op = 4'b10;
                        Set_BusB_To = 4'b111;
                        Set_BusA_To = 4'b1010;
                        Read_To_Acc = 1'b1;
                        Save_ALU = 1'b1;
                    end
                    8'd70, 8'd78, 8'd102, 8'd110: begin
                        IMode = 2'b0;
                    end
                    8'd86, 8'd118: begin
                        IMode = 2'b1;
                    end
                    8'd94, 8'd119: begin
                        IMode = 2'b10;
                    end
                    8'd74, 8'd90, 8'd106, 8'd122: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[1]: begin
                                NoRead = 1'b1;
                                ALU_Op = 4'b1;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                Set_BusA_To[2:0] = 3'b101;
                                case (IR[5:4])
                                    0, 1, 2: begin
                                        Set_BusB_To[2:1] = IR[5:4];
                                        Set_BusB_To[0] = 1'b1;
                                    end
                                    default: begin
                                        Set_BusB_To = 4'b1000;
                                    end
                                endcase
                                TStates = 3'b100;
                            end
                            MCycle[2]: begin
                                NoRead = 1'b1;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                ALU_Op = 4'b1;
                                Set_BusA_To[2:0] = 3'b100;
                                case (IR[5:4])
                                    0, 1, 2: begin
                                        Set_BusB_To[2:1] = IR[5:4];
                                        Set_BusB_To[0] = 1'b0;
                                    end
                                    default: begin
                                        Set_BusB_To = 4'b1001;
                                    end
                                endcase
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd66, 8'd82, 8'd98, 8'd114: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[1]: begin
                                NoRead = 1'b1;
                                ALU_Op = 4'b11;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                Set_BusA_To[2:0] = 3'b101;
                                case (IR[5:4])
                                    0, 1, 2: begin
                                        Set_BusB_To[2:1] = IR[5:4];
                                        Set_BusB_To[0] = 1'b1;
                                    end
                                    default: begin
                                        Set_BusB_To = 4'b1000;
                                    end
                                endcase
                                TStates = 3'b100;
                            end
                            MCycle[2]: begin
                                NoRead = 1'b1;
                                ALU_Op = 4'b11;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                Set_BusA_To[2:0] = 3'b100;
                                case (IR[5:4])
                                    0, 1, 2: begin
                                        Set_BusB_To[2:1] = IR[5:4];
                                    end
                                    default: begin
                                        Set_BusB_To = 4'b1001;
                                    end
                                endcase
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd111: begin
                        MCycles = 3'b100;
                        case (1'b1)
                            MCycle[1]: begin
                                NoRead = 1'b1;
                                Set_Addr_To = 3'b10;
                            end
                            MCycle[2]: begin
                                Read_To_Reg = 1'b1;
                                Set_BusB_To[2:0] = 3'b110;
                                Set_BusA_To[2:0] = 3'b111;
                                ALU_Op = 4'b1101;
                                TStates = 3'b100;
                                Set_Addr_To = 3'b10;
                                Save_ALU = 1'b1;
                            end
                            MCycle[3]: begin
                                I_RLD = 1'b1;
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd103: begin
                        MCycles = 3'b100;
                        case (1'b1)
                            MCycle[1]: begin
                                Set_Addr_To = 3'b10;
                            end
                            MCycle[2]: begin
                                Read_To_Reg = 1'b1;
                                Set_BusB_To[2:0] = 3'b110;
                                Set_BusA_To[2:0] = 3'b111;
                                ALU_Op = 4'b1110;
                                TStates = 3'b100;
                                Set_Addr_To = 3'b10;
                                Save_ALU = 1'b1;
                            end
                            MCycle[3]: begin
                                I_RRD = 1'b1;
                                Write = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd69, 8'd77, 8'd85, 8'd93, 8'd101, 8'd109, 8'd117, 8'd125: begin
                        MCycles = 3'b11;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b101;
                            end
                            MCycle[1]: begin
                                IncDec_16 = 4'b111;
                                Set_Addr_To = 3'b101;
                                LDZ = 1'b1;
                            end
                            MCycle[2]: begin
                                Jump = 1'b1;
                                IncDec_16 = 4'b111;
                                I_RETN = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd64, 8'd72, 8'd80, 8'd88, 8'd96, 8'd104, 8'd112, 8'd120: begin
                        MCycles = 3'b10;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b0;
                            end
                            MCycle[1]: begin
                                IORQ = 1'b1;
                                if ((IR[5:3] != 3'b110)) begin
                                    Read_To_Reg = 1'b1;
                                    Set_BusA_To[2:0] = IR[5:3];
                                end
                                I_INRC = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd65, 8'd73, 8'd81, 8'd89, 8'd97, 8'd105, 8'd113, 8'd121: begin
                        MCycles = 3'b10;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b0;
                                Set_BusB_To[2:0] = IR[5:3];
                                if ((IR[5:3] == 3'b110)) begin
                                    Set_BusB_To[3] = 1'b1;
                                end
                            end
                            MCycle[1]: begin
                                Write = 1'b1;
                                IORQ = 1'b1;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd162, 8'd170, 8'd178, 8'd186: begin
                        MCycles = 3'b100;
                        case (1'b1)
                            MCycle[0]: begin
                                Set_Addr_To = 3'b0;
                                Set_BusB_To = 4'b1010;
                                Set_BusA_To = 4'b0;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                ALU_Op = 4'b10;
                            end
                            MCycle[1]: begin
                                IORQ = 1'b1;
                                Set_BusB_To = 4'b110;
                                Set_Addr_To = 3'b10;
                            end
                            MCycle[2]: begin
                                if ((IR[3] == 1'b0)) begin
                                    IncDec_16 = 4'b110;
                                end
                                else begin
                                    IncDec_16 = 4'b1110;
                                end
                                TStates = 3'b100;
                                Write = 1'b1;
                                I_BTR = 1'b1;
                            end
                            MCycle[3]: begin
                                NoRead = 1'b1;
                                TStates = 3'b101;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    8'd163, 8'd171, 8'd179, 8'd187: begin
                        MCycles = 3'b100;
                        case (1'b1)
                            MCycle[0]: begin
                                TStates = 3'b101;
                                Set_Addr_To = 3'b10;
                                Set_BusB_To = 4'b1010;
                                Set_BusA_To = 4'b0;
                                Read_To_Reg = 1'b1;
                                Save_ALU = 1'b1;
                                ALU_Op = 4'b10;
                            end
                            MCycle[1]: begin
                                Set_BusB_To = 4'b110;
                                Set_Addr_To = 3'b0;
                                if ((IR[3] == 1'b0)) begin
                                    IncDec_16 = 4'b110;
                                end
                                else begin
                                    IncDec_16 = 4'b1110;
                                end
                            end
                            MCycle[2]: begin begin
                                    IncDec_16 = 4'b1010;
                                end
                                IORQ = 1'b1;
                                Write = 1'b1;
                                I_BTR = 1'b1;
                            end
                            MCycle[3]: begin
                                NoRead = 1'b1;
                                TStates = 3'b101;
                            end
                            default: begin
                                ;
                            end
                        endcase
                    end
                    default: begin
                        ;
                    end
                endcase
            end
        endcase begin
            if (MCycle[0]) begin
            end
            else begin
                TStates = 3'b11;
            end
        end
        begin end begin
            if (MCycle[5]) begin
                Inc_PC = 1'b1; begin
                    Set_Addr_To = 3'b10;
                    TStates = 3'b100;
                    Set_BusB_To[2:0] = SSS;
                    Set_BusB_To[3] = 1'b0;
                end
                if (((IR == 8'd54) || (IR == 8'd203))) begin
                    Set_Addr_To = 3'b111;
                end
            end
            if (MCycle[6]) begin
                begin end
                begin end
                Set_BusB_To[2:0] = SSS;
                Set_BusB_To[3] = 1'b0; begin
                    Inc_PC = 1'b1;
                end
            end
        end
    end
endmodule

module tv80_core_i_alu (
    output reg[7:0] Q,
    output reg[7:0] F_Out,
    input logic Arith16,
    input logic Z16,
    input logic[3:0] ALU_Op,
    input logic[5:0] IR,
    input logic[1:0] ISet,
    input logic[7:0] BusA,
    input logic[7:0] BusB,
    input logic[7:0] F_In
);
    function logic[4:0] AddSub4(input logic[3:0] A, input logic[3:0] B, input logic Sub, input logic Carry_In);
        AddSub4 = (({1'b0, A} + {1'b0, (Sub ? ~(B) : B)}) + {4'b0, Carry_In});
    endfunction
    function logic[3:0] AddSub3(input logic[2:0] A, input logic[2:0] B, input logic Sub, input logic Carry_In);
        AddSub3 = (({1'b0, A} + {1'b0, (Sub ? ~(B) : B)}) + {3'b0, Carry_In});
    endfunction
    function logic[1:0] AddSub1(input logic A, input logic B, input logic Sub, input logic Carry_In);
        AddSub1 = (({1'b0, A} + {1'b0, (Sub ? ~(B) : B)}) + {1'b0, Carry_In});
    endfunction
    reg UseCarry;
    reg Carry7_v;
    reg OverFlow_v;
    reg HalfCarry_v;
    reg Carry_v;
    reg[7:0] Q_v;
    reg[7:0] BitMask;
    always @(ALU_Op or BusA or BusB or F_In or IR) begin
        case (IR[5:3])
            3'b0: begin
                BitMask = 8'd1;
            end
            3'b1: begin
                BitMask = 8'd2;
            end
            3'b10: begin
                BitMask = 8'd4;
            end
            3'b11: begin
                BitMask = 8'd8;
            end
            3'b100: begin
                BitMask = 8'd16;
            end
            3'b101: begin
                BitMask = 8'd32;
            end
            3'b110: begin
                BitMask = 8'd64;
            end
            default: begin
                BitMask = 8'd128;
            end
        endcase
        UseCarry = (~(ALU_Op[2]) && ALU_Op[0]);
        {HalfCarry_v, Q_v[3:0]} = AddSub4(BusA[3:0], BusB[3:0], ALU_Op[1], (ALU_Op[1] ^ (UseCarry && F_In[0])));
        {Carry7_v, Q_v[6:4]} = AddSub3(BusA[6:4], BusB[6:4], ALU_Op[1], HalfCarry_v);
        {Carry_v, Q_v[7]} = AddSub1(BusA[7], BusB[7], ALU_Op[1], Carry7_v);
        OverFlow_v = (Carry_v ^ Carry7_v);
    end
    reg[7:0] Q_t;
    reg[8:0] DAA_Q;
    always @(ALU_Op or Arith16 or BitMask or BusA or BusB or Carry_v or F_In or HalfCarry_v or IR or ISet or OverFlow_v or Q_v or Z16) begin
        Q_t = 8'dx;
        DAA_Q = 9'dx;
        F_Out = F_In;
        case (ALU_Op)
            4'b0, 4'b1, 4'b10, 4'b11, 4'b100, 4'b101, 4'b110, 4'b111: begin
                F_Out[1] = 1'b0;
                F_Out[0] = 1'b0;
                case (ALU_Op[2:0])
                    3'b0, 3'b1: begin
                        Q_t = Q_v;
                        F_Out[0] = Carry_v;
                        F_Out[4] = HalfCarry_v;
                        F_Out[2] = OverFlow_v;
                    end
                    3'b10, 3'b11, 3'b111: begin
                        Q_t = Q_v;
                        F_Out[1] = 1'b1;
                        F_Out[0] = ~(Carry_v);
                        F_Out[4] = ~(HalfCarry_v);
                        F_Out[2] = OverFlow_v;
                    end
                    3'b100: begin
                        Q_t[7:0] = (BusA & BusB);
                        F_Out[4] = 1'b1;
                    end
                    3'b101: begin
                        Q_t[7:0] = (BusA ^ BusB);
                        F_Out[4] = 1'b0;
                    end
                    default: begin
                        Q_t[7:0] = (BusA | BusB);
                        F_Out[4] = 1'b0;
                    end
                endcase
                if ((ALU_Op[2:0] == 3'b111)) begin
                    F_Out[3] = BusB[3];
                    F_Out[5] = BusB[5];
                end
                else begin
                    F_Out[3] = Q_t[3];
                    F_Out[5] = Q_t[5];
                end
                if ((Q_t[7:0] == 8'd0)) begin
                    F_Out[6] = 1'b1;
                    if ((Z16 == 1'b1)) begin
                        F_Out[6] = F_In[6];
                    end
                end
                else begin
                    F_Out[6] = 1'b0;
                end
                F_Out[7] = Q_t[7];
                case (ALU_Op[2:0])
                    3'b0, 3'b1, 3'b10, 3'b11, 3'b111: begin
                        ;
                    end
                    default: begin
                        F_Out[2] = ~(^(Q_t));
                    end
                endcase
                if ((Arith16 == 1'b1)) begin
                    F_Out[7] = F_In[7];
                    F_Out[6] = F_In[6];
                    F_Out[2] = F_In[2];
                end
            end
            4'b1100: begin
                F_Out[4] = F_In[4];
                F_Out[0] = F_In[0];
                DAA_Q[7:0] = BusA;
                DAA_Q[8] = 1'b0;
                if ((F_In[1] == 1'b0)) begin
                    if (((DAA_Q[3:0] > 9) || (F_In[4] == 1'b1))) begin
                        if ((DAA_Q[3:0] > 9)) begin
                            F_Out[4] = 1'b1;
                        end
                        else begin
                            F_Out[4] = 1'b0;
                        end
                        DAA_Q = (DAA_Q + 6);
                    end
                    if (((DAA_Q[8:4] > 9) || (F_In[0] == 1'b1))) begin
                        DAA_Q = (DAA_Q + 96);
                    end
                end
                else begin
                    if (((DAA_Q[3:0] > 9) || (F_In[4] == 1'b1))) begin
                        if ((DAA_Q[3:0] > 5)) begin
                            F_Out[4] = 1'b0;
                        end
                        DAA_Q[7:0] = (DAA_Q[7:0] - 6);
                    end
                    if (((BusA > 153) || (F_In[0] == 1'b1))) begin
                        DAA_Q = (DAA_Q - 352);
                    end
                end
                F_Out[3] = DAA_Q[3];
                F_Out[5] = DAA_Q[5];
                F_Out[0] = (F_In[0] || DAA_Q[8]);
                Q_t = DAA_Q[7:0];
                if ((DAA_Q[7:0] == 8'd0)) begin
                    F_Out[6] = 1'b1;
                end
                else begin
                    F_Out[6] = 1'b0;
                end
                F_Out[7] = DAA_Q[7];
                F_Out[2] = ~(^(DAA_Q));
            end
            4'b1101, 4'b1110: begin
                Q_t[7:4] = BusA[7:4];
                if ((ALU_Op[0] == 1'b1)) begin
                    Q_t[3:0] = BusB[7:4];
                end
                else begin
                    Q_t[3:0] = BusB[3:0];
                end
                F_Out[4] = 1'b0;
                F_Out[1] = 1'b0;
                F_Out[3] = Q_t[3];
                F_Out[5] = Q_t[5];
                if ((Q_t[7:0] == 8'd0)) begin
                    F_Out[6] = 1'b1;
                end
                else begin
                    F_Out[6] = 1'b0;
                end
                F_Out[7] = Q_t[7];
                F_Out[2] = ~(^(Q_t));
            end
            4'b1001: begin
                Q_t[7:0] = (BusB & BitMask);
                F_Out[7] = Q_t[7];
                if ((Q_t[7:0] == 8'd0)) begin
                    F_Out[6] = 1'b1;
                    F_Out[2] = 1'b1;
                end
                else begin
                    F_Out[6] = 1'b0;
                    F_Out[2] = 1'b0;
                end
                F_Out[4] = 1'b1;
                F_Out[1] = 1'b0;
                F_Out[3] = 1'b0;
                F_Out[5] = 1'b0;
                if ((IR[2:0] != 3'b110)) begin
                    F_Out[3] = BusB[3];
                    F_Out[5] = BusB[5];
                end
            end
            4'b1010: begin
                Q_t[7:0] = (BusB | BitMask);
            end
            4'b1011: begin
                Q_t[7:0] = (BusB & ~(BitMask));
            end
            4'b1000: begin
                case (IR[5:3])
                    3'b0: begin
                        Q_t[7:1] = BusA[6:0];
                        Q_t[0] = BusA[7];
                        F_Out[0] = BusA[7];
                    end
                    3'b10: begin
                        Q_t[7:1] = BusA[6:0];
                        Q_t[0] = F_In[0];
                        F_Out[0] = BusA[7];
                    end
                    3'b1: begin
                        Q_t[6:0] = BusA[7:1];
                        Q_t[7] = BusA[0];
                        F_Out[0] = BusA[0];
                    end
                    3'b11: begin
                        Q_t[6:0] = BusA[7:1];
                        Q_t[7] = F_In[0];
                        F_Out[0] = BusA[0];
                    end
                    3'b100: begin
                        Q_t[7:1] = BusA[6:0];
                        Q_t[0] = 1'b0;
                        F_Out[0] = BusA[7];
                    end
                    3'b110: begin begin
                            Q_t[7:1] = BusA[6:0];
                            Q_t[0] = 1'b1;
                            F_Out[0] = BusA[7];
                        end
                    end
                    3'b101: begin
                        Q_t[6:0] = BusA[7:1];
                        Q_t[7] = BusA[7];
                        F_Out[0] = BusA[0];
                    end
                    default: begin
                        Q_t[6:0] = BusA[7:1];
                        Q_t[7] = 1'b0;
                        F_Out[0] = BusA[0];
                    end
                endcase
                F_Out[4] = 1'b0;
                F_Out[1] = 1'b0;
                F_Out[3] = Q_t[3];
                F_Out[5] = Q_t[5];
                F_Out[7] = Q_t[7];
                if ((Q_t[7:0] == 8'd0)) begin
                    F_Out[6] = 1'b1;
                end
                else begin
                    F_Out[6] = 1'b0;
                end
                F_Out[2] = ~(^(Q_t));
                if ((ISet == 2'b0)) begin
                    F_Out[2] = F_In[2];
                    F_Out[7] = F_In[7];
                    F_Out[6] = F_In[6];
                end
            end
            default: begin
                ;
            end
        endcase
        Q = Q_t;
    end
endmodule

module tv80_core_i_reg (
    output logic[7:0] DOBH,
    output logic[7:0] DOAL,
    output logic[7:0] DOCL,
    output logic[7:0] DOBL,
    output logic[7:0] DOCH,
    output logic[7:0] DOAH,
    input logic[2:0] AddrC,
    input logic[2:0] AddrA,
    input logic[2:0] AddrB,
    input logic[7:0] DIH,
    input logic[7:0] DIL,
    input logic clk,
    input logic CEN,
    input logic WEH,
    input logic WEL
);
    reg[7:0] RegsH[0:7];
    reg[7:0] RegsL[0:7];
    always @(posedge clk) begin
        if (CEN) begin
            if (WEH) begin
                RegsH[AddrA] <= DIH;
            end
            if (WEL) begin
                RegsL[AddrA] <= DIL;
            end
        end
    end
    assign DOAH = RegsH[AddrA];
    assign DOAL = RegsL[AddrA];
    assign DOBH = RegsH[AddrB];
    assign DOBL = RegsL[AddrB];
    assign DOCH = RegsH[AddrC];
    assign DOCL = RegsL[AddrC];
endmodule