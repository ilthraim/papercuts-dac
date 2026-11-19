
module NextZ80_CPU_REGS_WSelectW (
    input logic[2:0] SEL,
    output reg[3:0] RAMSEL,
    input logic[5:0] rstatus
);
    always @* begin
        RAMSEL = 4'bxxxx;
        case (SEL)
            0: begin
                RAMSEL = {rstatus[1], 3'b0};
            end
            1: begin
                if (rstatus[{1'b1, rstatus[1]}]) begin
                    RAMSEL = {rstatus[1], 3'b10};
                end
                else begin
                    RAMSEL = {rstatus[1], 3'b1};
                end
            end
            2: begin
                case ({rstatus[5:4], rstatus[{1'b1, rstatus[1]}]})
                    0, 4: begin
                        RAMSEL = {rstatus[1], 3'b10};
                    end
                    1, 5: begin
                        RAMSEL = {rstatus[1], 3'b1};
                    end
                    2, 3: begin
                        RAMSEL = 4'b101;
                    end
                    6, 7: begin
                        RAMSEL = 4'b110;
                    end
                endcase
            end
            3: begin
                RAMSEL = {rstatus[0], 3'b11};
            end
            4: begin
                RAMSEL = 4;
            end
            5: begin
                RAMSEL = 12;
            end
            6: begin
                RAMSEL = 13;
            end
            7: begin
                RAMSEL = 7;
            end
        endcase
    end
endmodule