
module NextZ80_CPU_ALU8 (
    input logic[7:0] D0,
    input logic[7:0] D1,
    input logic[7:0] FIN,
    output reg[7:0] FOUT,
    output reg[15:0] ALU8DOUT,
    input logic[4:0] OP,
    input logic[5:0] EXOP,
    input logic LDIFLAGS,
    input logic DSTHI
);
    wire logic[7:0] daaadjust;
    wire logic cdaa;
    wire logic hdaa;
    NextZ80_CPU_ALU8_daa_adjust daa_adjust (
        .flags(FIN),
        .val(D0),
        .adjust(daaadjust),
        .cdaa(cdaa),
        .hdaa(hdaa)
    );
    wire logic parity = ~^(ALU8DOUT[15:8]);
    wire logic zero = (ALU8DOUT[15:8] == 0);
    reg csin;
    reg cin;
    wire logic[7:0] d0mux = ((OP[4:1] == 4'b1111) ? 0 : D0);
    reg[7:0] _d1mux;
    wire logic[7:0] d1mux = (OP[1] ? ~(_d1mux) : _d1mux);
    wire logic[8:0] sum;
    wire logic hf;
    assign {hf, sum[3:0]} = ((d0mux[3:0] + d1mux[3:0]) + cin);
    assign sum[8:4] = ((d0mux[7:4] + d1mux[7:4]) + hf);
    wire logic overflow = (((d0mux[7] & d1mux[7]) & !(sum[7])) | ((!(d0mux[7]) & !(d1mux[7])) & sum[7]));
    reg[7:0] dbit;
    always @* begin
        ALU8DOUT = 16'dx;
        FOUT = 8'dx;
        case ({OP[4:2]})
            0, 1, 4, 7: begin
                _d1mux = D1;
            end
            2: begin
                _d1mux = 1;
            end
            3: begin
                _d1mux = daaadjust;
            end
            6, 5: begin
                _d1mux = 8'dx;
            end
        endcase
        case ({OP[2:0], FIN[0]})
            0, 1, 2, 7, 8, 9, 10, 11, 12, 13: begin
                cin = 0;
            end
            3, 4, 5, 6, 14, 15: begin
                cin = 1;
            end
        endcase
        case (EXOP[3:0])
            0: begin
                dbit = 8'd254;
            end
            1: begin
                dbit = 8'd253;
            end
            2: begin
                dbit = 8'd251;
            end
            3: begin
                dbit = 8'd247;
            end
            4: begin
                dbit = 8'd239;
            end
            5: begin
                dbit = 8'd223;
            end
            6: begin
                dbit = 8'd191;
            end
            7: begin
                dbit = 8'd127;
            end
            8: begin
                dbit = 8'd1;
            end
            9: begin
                dbit = 8'd2;
            end
            10: begin
                dbit = 8'd4;
            end
            11: begin
                dbit = 8'd8;
            end
            12: begin
                dbit = 8'd16;
            end
            13: begin
                dbit = 8'd32;
            end
            14: begin
                dbit = 8'd64;
            end
            15: begin
                dbit = 8'd128;
            end
        endcase
        case (( EXOP[2:0]))
            0, 5: begin
                csin = D0[7];
            end
            1: begin
                csin = D0[0];
            end
            2, 3: begin
                csin = FIN[0];
            end
            4, 7: begin
                csin = 0;
            end
            6: begin
                csin = 1;
            end
        endcase
        case (OP[4:0])
            0, 1, 2, 3, 8, 10: begin
                ALU8DOUT[15:8] = sum[7:0];
                ALU8DOUT[7:0] = sum[7:0];
                FOUT[0] = (OP[3] ? FIN[0] : (sum[8] ^ OP[1]));
                FOUT[1] = OP[1];
                FOUT[2] = overflow;
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = (hf ^ OP[1]);
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = (zero & (((FIN[6] | ~(EXOP[5])) | ~(DSTHI)) | OP[3]));
                FOUT[7] = ALU8DOUT[15];
            end
            16, 17: begin
                ALU8DOUT[15:8] = sum[7:0];
                ALU8DOUT[7:0] = sum[7:0];
                FOUT[0] = sum[8];
                FOUT[1] = OP[1];
                FOUT[2] = FIN[2];
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = (hf);
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = FIN[6];
                FOUT[7] = FIN[7];
            end
            7: begin
                ALU8DOUT[15:8] = sum[7:0];
                FOUT[0] = (EXOP[5] ? FIN[0] : !(sum[8]));
                FOUT[1] = OP[1];
                FOUT[2] = overflow;
                FOUT[3] = D1[3];
                FOUT[4] = !(hf);
                FOUT[5] = D1[5];
                FOUT[6] = zero;
                FOUT[7] = ALU8DOUT[15];
            end
            31: begin
                ALU8DOUT[15:8] = sum[7:0];
                FOUT[0] = !(sum[8]);
                FOUT[1] = OP[1];
                FOUT[2] = overflow;
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = !(hf);
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = zero;
                FOUT[7] = ALU8DOUT[15];
            end
            4: begin
                ALU8DOUT[15:8] = (D0 & D1);
                FOUT[0] = 0;
                FOUT[1] = 0;
                FOUT[2] = parity;
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = 1;
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = zero;
                FOUT[7] = ALU8DOUT[15];
            end
            5, 6: begin
                ALU8DOUT[15:8] = (OP[0] ? (D0 ^ D1) : (D0 | D1));
                FOUT[0] = 0;
                FOUT[1] = 0;
                FOUT[2] = parity;
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = 0;
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = zero;
                FOUT[7] = ALU8DOUT[15];
            end
            9: begin
                ALU8DOUT[15:8] = ~(D0);
                FOUT[0] = FIN[0];
                FOUT[1] = 1;
                FOUT[2] = FIN[2];
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = 1;
                FOUT[5] = ALU8DOUT[13];
                FOUT[7:6] = FIN[7:6];
            end
            11, 12: begin
                if (OP[0]) begin
                    ALU8DOUT = {D0[7:4], D1[3:0], D0[3:0], D1[7:4]};
                end
                else begin
                    ALU8DOUT = {D0[7:4], D1[7:0], D0[3:0]};
                end
                FOUT[0] = FIN[0];
                FOUT[1] = 0;
                FOUT[2] = parity;
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = 0;
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = zero;
                FOUT[7] = ALU8DOUT[15];
            end
            13: begin
                ALU8DOUT[15:8] = sum[7:0];
                FOUT[0] = cdaa;
                FOUT[1] = FIN[1];
                FOUT[2] = parity;
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = hdaa;
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = zero;
                FOUT[7] = ALU8DOUT[15];
            end
            14, 15: begin
                ALU8DOUT = ({D0, D1} + (OP[0] ? 16'd65535 : 16'd1));
                FOUT[0] = FIN[0];
                FOUT[1] = (LDIFLAGS ? 1'b0 : FIN[1]);
                FOUT[2] = (ALU8DOUT != 0);
                FOUT[3] = FIN[3];
                FOUT[4] = (LDIFLAGS ? 1'b0 : FIN[4]);
                FOUT[5] = FIN[5];
                FOUT[6] = FIN[6];
                FOUT[7] = FIN[7];
            end
            20, 21: begin
                ALU8DOUT[15:8] = D0;
                FOUT[0] = (OP[0] ? 1'b1 : !(FIN[0]));
                FOUT[1] = 1'b0;
                FOUT[2] = FIN[2];
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = (OP[0] ? 1'b0 : FIN[0]);
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = FIN[6];
                FOUT[7] = FIN[7];
            end
            24, 25, 26, 27, 28: begin
                case ({OP[2], EXOP[4:3]})
                    0, 1, 2, 3, 4: begin
                        if ((OP[2] ? EXOP[0] : OP[0])) begin
                            {ALU8DOUT[15:8], FOUT[0]} = {csin, D0};
                        end
                        else begin
                            {FOUT[0], ALU8DOUT[15:8]} = {D0, csin};
                        end
                    end
                    5, 6: begin
                        FOUT[0] = FIN[0];
                        ALU8DOUT[15:8] = (D0 & dbit);
                    end
                    7: begin
                        FOUT[0] = FIN[0];
                        ALU8DOUT[15:8] = (D0 | dbit);
                    end
                endcase
                ALU8DOUT[7:0] = ALU8DOUT[15:8];
                FOUT[1] = 0;
                FOUT[2] = (OP[2] ? (EXOP[3] ? zero : parity) : FIN[2]);
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = (OP[2] & EXOP[3]);
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = (OP[2] ? zero : FIN[6]);
                FOUT[7] = (OP[2] ? ALU8DOUT[15] : FIN[7]);
            end
            29: begin
                ALU8DOUT = {D1, D1};
                FOUT[0] = FIN[0];
                FOUT[1] = 0;
                FOUT[2] = parity;
                FOUT[3] = ALU8DOUT[11];
                FOUT[4] = 0;
                FOUT[5] = ALU8DOUT[13];
                FOUT[6] = zero;
                FOUT[7] = ALU8DOUT[15];
            end
            30: begin
                FOUT = D0;
            end
            default: begin
                ;
            end
        endcase
    end
endmodule