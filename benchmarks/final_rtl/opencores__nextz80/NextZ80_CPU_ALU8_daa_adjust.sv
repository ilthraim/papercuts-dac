module NextZ80_CPU_ALU8_daa_adjust (
    input logic[7:0] flags,
    input logic[7:0] val,
    output logic[7:0] adjust,
    output reg cdaa,
    output reg hdaa
);
    wire logic h08 = (val[7:4] < 9);
    wire logic h09 = (val[7:4] < 10);
    wire logic l05 = (val[3:0] < 6);
    wire logic l09 = (val[3:0] < 10);
    reg[1:0] aa;
    assign adjust = (({1'b0, aa[1], aa[1], 2'b0, aa[0], aa[0], 1'b0} ^ {8{flags[1]}}) + flags[1]);
    always @* begin
        case ({flags[0], h08, h09, flags[4], l09})
            5'b101, 5'b1101: begin
                aa = 0;
            end
            5'b111, 5'b1111, 5'b1000, 5'b1010, 5'b1100, 5'b1110: begin
                aa = 1;
            end
            5'b1, 5'b1001, 5'b10001, 5'b10101, 5'b11001, 5'b11101: begin
                aa = 2;
            end
            default: begin
                aa = 3;
            end
        endcase
        case ({flags[0], h08, h09, l09})
            4'b11, 4'b111, 4'b100, 4'b110: begin
                cdaa = 0;
            end
            default: begin
                cdaa = 1;
            end
        endcase
        case ({flags[1], flags[4], l05, l09})
            4'b0, 4'b10, 4'b100, 4'b110, 4'b1110, 4'b1111: begin
                hdaa = 1;
            end
            default: begin
                hdaa = 0;
            end
        endcase
    end
endmodule
