module P16C5x_ALU (
    input logic Rst,
    input logic Clk,
    input logic CE,
    input logic[11:0] ALU_Op,
    input logic WE_PSW,
    input logic[7:0] DI,
    input logic[7:0] KI,
    output reg[7:0] DO,
    output logic Z_Tst,
    output logic g,
    output reg[7:0] W,
    output reg Z,
    output reg DC,
    output reg C
);
    wire logic[7:0] A;
    wire logic[7:0] B;
    wire logic[7:0] Y;
    wire logic[7:0] X;
    wire logic C3;
    wire logic C7;
    wire logic[1:0] LU_Op;
    reg[7:0] V;
    wire logic[1:0] S_Sel;
    reg[7:0] S;
    wire logic[2:0] Bit;
    reg[7:0] Msk;
    wire logic[7:0] U;
    wire logic[7:0] T;
    wire logic[1:0] D_Sel;
    wire logic C_In;
    assign C_In = ALU_Op[0];
    wire logic B_Inv;
    assign B_Inv = ALU_Op[1];
    wire logic B_Sel;
    assign B_Sel = ALU_Op[2];
    wire logic A_Sel;
    assign A_Sel = ALU_Op[3];
    assign A = (A_Sel ? KI : DI);
    assign B = (B_Sel ? W : 0);
    assign Y = (B_Inv ? ~(B) : B);
    assign {C3, X[3:0]} = ((A[3:0] + Y[3:0]) + C_In);
    assign {C7, X[7:4]} = ((A[7:4] + Y[7:4]) + C3);
    assign LU_Op = ALU_Op[1:0];
    always @* begin
        case (LU_Op)
            2'b0: begin
                V <= ~(A);
            end
            2'b1: begin
                V <= (A | B);
            end
            2'b10: begin
                V <= (A & B);
            end
            2'b11: begin
                V <= (A ^ B);
            end
        endcase
    end
    assign S_Sel = ALU_Op[1:0];
    always @* begin
        case (S_Sel)
            2'b0: begin
                S <= B;
            end
            2'b1: begin
                S <= {A[3:0], A[7:4]};
            end
            2'b10: begin
                S <= {C, A[7:1]};
            end
            2'b11: begin
                S <= {A[6:0], C};
            end
        endcase
    end
    assign Bit = ALU_Op[2:0];
    wire logic Set;
    assign Set = ALU_Op[3];
    always @* begin
        case (Bit)
            3'b0: begin
                Msk <= 8'd1;
            end
            3'b1: begin
                Msk <= 8'd2;
            end
            3'b10: begin
                Msk <= 8'd4;
            end
            3'b11: begin
                Msk <= 8'd8;
            end
            3'b100: begin
                Msk <= 8'd16;
            end
            3'b101: begin
                Msk <= 8'd32;
            end
            3'b110: begin
                Msk <= 8'd64;
            end
            3'b111: begin
                Msk <= 8'd128;
            end
        endcase
    end
    assign U = (Set ? (DI | Msk) : (DI & ~(Msk)));
    assign T = (DI & Msk);
    assign g = (Set ? |(T) : ~|(T));
    assign D_Sel = ALU_Op[7:6];
    always @(posedge Clk) begin
        if (Rst) begin
            DO <= 0;
        end
        else begin
            case (D_Sel)
                2'b0: begin
                    DO <= X;
                end
                2'b1: begin
                    DO <= V;
                end
                2'b10: begin
                    DO <= S;
                end
                2'b11: begin
                    DO <= U;
                end
            endcase
        end
    end
    wire logic WE_W;
    assign WE_W = ALU_Op[9];
    always @(posedge Clk) begin
        if (Rst) begin
            W <= 8'd0;
        end
        else if (CE) begin
            W <= (WE_W ? DO : W);
        end
    end
    wire logic Z_Sel;
    assign Z_Sel = ALU_Op[5];
    assign Z_Tst = ~|(DO);
    always @(posedge Clk) begin
        if (Rst) begin
            Z <= 1'b0;
        end
        else if (CE) begin
            Z <= (Z_Sel ? Z_Tst : (WE_PSW ? DO[2] : Z));
        end
    end
    wire logic DC_Sel;
    assign DC_Sel = (ALU_Op[5] & ALU_Op[4]);
    always @(posedge Clk) begin
        if (Rst) begin
            DC <= 1'b0;
        end
        else if (CE) begin
            DC <= (DC_Sel ? C3 : (WE_PSW ? DO[1] : DC));
        end
    end
    wire logic C_Sel;
    assign C_Sel = ALU_Op[4];
    wire logic S_Dir;
    assign S_Dir = (ALU_Op[1] & ALU_Op[0]);
    wire logic C_Drv;
    assign C_Drv = ((~(ALU_Op[7]) & ~(ALU_Op[6])) ? C7 : (S_Dir ? A[7] : A[0]));
    always @(posedge Clk) begin
        if (Rst) begin
            C <= 1'b0;
        end
        else if (CE) begin
            C <= (C_Sel ? C_Drv : (WE_PSW ? DO[0] : C));
        end
    end
endmodule
