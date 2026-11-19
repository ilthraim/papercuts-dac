
module Next186_CPU_EA (
    input logic[15:0] SP,
    input logic[15:0] BX,
    input logic[15:0] BP,
    input logic[15:0] SI,
    input logic[15:0] DI,
    input logic[15:0] PIO,
    input logic[15:0] TMP16,
    input logic[7:0] AL,
    input logic[15:0] AIMM,
    input logic[3:0] EAC,
    output logic[15:0] ADDR16
);
    reg[15:0] OP1;
    reg[15:0] OP2;
    reg[15:0] OP3;
    always @* begin
        case (EAC)
            4'b0, 4'b1, 4'b111, 4'b1010: begin
                OP1 = BX;
            end
            4'b10, 4'b11, 4'b110: begin
                OP1 = BP;
            end
            4'b1000, 4'b1001, 4'b1101: begin
                OP1 = SP;
            end
            4'b1011: begin
                OP1 = TMP16;
            end
            default: begin
                OP1 = 16'd0;
            end
        endcase
        case (EAC)
            4'b0, 4'b10, 4'b100: begin
                OP2 = SI;
            end
            4'b1, 4'b11, 4'b101: begin
                OP2 = DI;
            end
            4'b1001, 4'b1011, 4'b1101: begin
                OP2 = 16'd2;
            end
            default: begin
                OP2 = 16'd0;
            end
        endcase
        case (EAC)
            4'b1000: begin
                OP3 = 16'd65534;
            end
            4'b1010: begin
                OP3 = {8'd0, AL};
            end
            4'b1001, 4'b1011: begin
                OP3 = 16'd0;
            end
            4'b1110: begin
                OP3 = {6'b0, AIMM[7:0], 2'b0};
            end
            4'b1111: begin
                OP3 = PIO;
            end
            default: begin
                OP3 = AIMM;
            end
        endcase
    end
    assign ADDR16 = ((OP1 + OP2) + OP3);
endmodule