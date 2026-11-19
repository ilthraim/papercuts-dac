module cavlc_top_cavlc_read_total_zeros (
    input logic ena,
    input logic sel,
    input logic chroma_DC_sel,
    input logic[0:8] rbsp,
    input logic[3:0] TotalCoeff,
    output reg[3:0] TotalZeros_comb,
    output reg[3:0] len_comb
);
    reg[0:2] rbsp_chroma_DC;
    reg[1:0] TotalZeros_chroma_DC;
    reg[1:0] len_chroma_DC;
    reg[0:8] rbsp_LE3;
    reg[3:0] TotalZeros_LE3;
    reg[3:0] len_LE3;
    reg[0:5] rbsp_G3;
    reg[3:0] TotalZeros_G3;
    reg[2:0] len_G3;
    always @* begin
        if (chroma_DC_sel) begin
            rbsp_chroma_DC <= rbsp[0:2];
            rbsp_LE3 <= 32'd65535;
            rbsp_G3 <= 32'd65535;
        end
        else if ((TotalCoeff[3:2] == 2'b0)) begin
            rbsp_chroma_DC <= 32'd65535;
            rbsp_LE3 <= rbsp[0:8];
            rbsp_G3 <= 32'd65535;
        end
        else begin
            rbsp_chroma_DC <= 32'd65535;
            rbsp_LE3 <= 32'd65535;
            rbsp_G3 <= rbsp[0:5];
        end
    end
    always @* begin
        if (rbsp_chroma_DC[0]) begin
            TotalZeros_chroma_DC <= 0;
            len_chroma_DC <= 1;
        end
        else if (((TotalCoeff == 1) && rbsp_chroma_DC[1])) begin
            TotalZeros_chroma_DC <= 1;
            len_chroma_DC <= 2;
        end
        else if (((TotalCoeff == 1) && rbsp_chroma_DC[2])) begin
            TotalZeros_chroma_DC <= 2;
            len_chroma_DC <= 3;
        end
        else if ((TotalCoeff == 1)) begin
            TotalZeros_chroma_DC <= 3;
            len_chroma_DC <= 3;
        end
        else if (rbsp_chroma_DC[0]) begin
            TotalZeros_chroma_DC <= 0;
            len_chroma_DC <= 1;
        end
        else if (((TotalCoeff == 2) && rbsp_chroma_DC[1])) begin
            TotalZeros_chroma_DC <= 1;
            len_chroma_DC <= 2;
        end
        else if ((TotalCoeff == 2)) begin
            TotalZeros_chroma_DC <= 2;
            len_chroma_DC <= 2;
        end
        else if (rbsp_chroma_DC[0]) begin
            TotalZeros_chroma_DC <= 0;
            len_chroma_DC <= 1;
        end
        else begin
            TotalZeros_chroma_DC <= 1;
            len_chroma_DC <= 1;
        end
    end
    always @(rbsp_LE3 or TotalCoeff) begin
        case (TotalCoeff[1:0])
            1: begin
                case (1'b1)
                    rbsp_LE3[0]: begin
                        TotalZeros_LE3 <= 0;
                        len_LE3 <= 1;
                    end
                    rbsp_LE3[1]: begin
                        len_LE3 <= 3;
                        if (rbsp_LE3[2]) begin
                            TotalZeros_LE3 <= 1;
                        end
                        else begin
                            TotalZeros_LE3 <= 2;
                        end
                    end
                    rbsp_LE3[2]: begin
                        len_LE3 <= 4;
                        if (rbsp_LE3[3]) begin
                            TotalZeros_LE3 <= 3;
                        end
                        else begin
                            TotalZeros_LE3 <= 4;
                        end
                    end
                    rbsp_LE3[3]: begin
                        len_LE3 <= 5;
                        if (rbsp_LE3[4]) begin
                            TotalZeros_LE3 <= 5;
                        end
                        else begin
                            TotalZeros_LE3 <= 6;
                        end
                    end
                    rbsp_LE3[4]: begin
                        len_LE3 <= 6;
                        if (rbsp_LE3[5]) begin
                            TotalZeros_LE3 <= 7;
                        end
                        else begin
                            TotalZeros_LE3 <= 8;
                        end
                    end
                    rbsp_LE3[5]: begin
                        len_LE3 <= 7;
                        if (rbsp_LE3[6]) begin
                            TotalZeros_LE3 <= 9;
                        end
                        else begin
                            TotalZeros_LE3 <= 10;
                        end
                    end
                    rbsp_LE3[6]: begin
                        len_LE3 <= 8;
                        if (rbsp_LE3[7]) begin
                            TotalZeros_LE3 <= 11;
                        end
                        else begin
                            TotalZeros_LE3 <= 12;
                        end
                    end
                    rbsp_LE3[7]: begin
                        len_LE3 <= 9;
                        if (rbsp_LE3[8]) begin
                            TotalZeros_LE3 <= 13;
                        end
                        else begin
                            TotalZeros_LE3 <= 14;
                        end
                    end
                    default: begin
                        len_LE3 <= 9;
                        TotalZeros_LE3 <= 15;
                    end
                endcase
            end
            2: begin
                case (1'b1)
                    rbsp_LE3[0]: begin
                        len_LE3 <= 3;
                        case (rbsp_LE3[1:2])
                            32'd3: begin
                                TotalZeros_LE3 <= 0;
                            end
                            32'd2: begin
                                TotalZeros_LE3 <= 1;
                            end
                            32'd1: begin
                                TotalZeros_LE3 <= 2;
                            end
                            32'd0: begin
                                TotalZeros_LE3 <= 3;
                            end
                        endcase
                    end
                    rbsp_LE3[1]: begin
                        if (rbsp_LE3[2]) begin
                            TotalZeros_LE3 <= 4;
                            len_LE3 <= 3;
                        end
                        else begin
                            len_LE3 <= 4;
                            if (rbsp_LE3[3]) begin
                                TotalZeros_LE3 <= 5;
                            end
                            else begin
                                TotalZeros_LE3 <= 6;
                            end
                        end
                    end
                    rbsp_LE3[2]: begin
                        len_LE3 <= 4;
                        if (rbsp_LE3[3]) begin
                            TotalZeros_LE3 <= 7;
                        end
                        else begin
                            TotalZeros_LE3 <= 8;
                        end
                    end
                    rbsp_LE3[3]: begin
                        len_LE3 <= 5;
                        if (rbsp_LE3[4]) begin
                            TotalZeros_LE3 <= 9;
                        end
                        else begin
                            TotalZeros_LE3 <= 10;
                        end
                    end
                    default: begin
                        len_LE3 <= 6;
                        case (rbsp_LE3[4:5])
                            32'd3: begin
                                TotalZeros_LE3 <= 11;
                            end
                            32'd2: begin
                                TotalZeros_LE3 <= 12;
                            end
                            32'd1: begin
                                TotalZeros_LE3 <= 13;
                            end
                            32'd0: begin
                                TotalZeros_LE3 <= 14;
                            end
                        endcase
                    end
                endcase
            end
            3: begin
                case (1'b1)
                    rbsp_LE3[0]: begin
                        len_LE3 <= 3;
                        case (rbsp_LE3[1:2])
                            32'd3: begin
                                TotalZeros_LE3 <= 1;
                            end
                            32'd2: begin
                                TotalZeros_LE3 <= 2;
                            end
                            32'd1: begin
                                TotalZeros_LE3 <= 3;
                            end
                            32'd0: begin
                                TotalZeros_LE3 <= 6;
                            end
                        endcase
                    end
                    rbsp_LE3[1]: begin
                        if (rbsp_LE3[2]) begin
                            TotalZeros_LE3 <= 7;
                            len_LE3 <= 3;
                        end
                        else begin
                            len_LE3 <= 4;
                            if (rbsp_LE3[3]) begin
                                TotalZeros_LE3 <= 0;
                            end
                            else begin
                                TotalZeros_LE3 <= 4;
                            end
                        end
                    end
                    rbsp_LE3[2]: begin
                        len_LE3 <= 4;
                        if (rbsp_LE3[3]) begin
                            TotalZeros_LE3 <= 5;
                        end
                        else begin
                            TotalZeros_LE3 <= 8;
                        end
                    end
                    rbsp_LE3[3]: begin
                        len_LE3 <= 5;
                        if (rbsp_LE3[4]) begin
                            TotalZeros_LE3 <= 9;
                        end
                        else begin
                            TotalZeros_LE3 <= 10;
                        end
                    end
                    rbsp_LE3[4]: begin
                        len_LE3 <= 5;
                        TotalZeros_LE3 <= 12;
                    end
                    default: begin
                        len_LE3 <= 6;
                        if (rbsp_LE3[5]) begin
                            TotalZeros_LE3 <= 11;
                        end
                        else begin
                            TotalZeros_LE3 <= 13;
                        end
                    end
                endcase
            end
            default: begin
                len_LE3 <= 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
                TotalZeros_LE3 <= 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    always @(rbsp_G3 or TotalCoeff) begin
        case (TotalCoeff)
            4: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 3;
                        case (rbsp_G3[1:2])
                            32'd3: begin
                                TotalZeros_G3 <= 1;
                            end
                            32'd2: begin
                                TotalZeros_G3 <= 4;
                            end
                            32'd1: begin
                                TotalZeros_G3 <= 5;
                            end
                            32'd0: begin
                                TotalZeros_G3 <= 6;
                            end
                        endcase
                    end
                    rbsp_G3[1]: begin
                        if (rbsp_G3[2]) begin
                            TotalZeros_G3 <= 8;
                            len_G3 <= 3;
                        end
                        else begin
                            len_G3 <= 4;
                            if (rbsp_G3[3]) begin
                                TotalZeros_G3 <= 2;
                            end
                            else begin
                                TotalZeros_G3 <= 3;
                            end
                        end
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 4;
                        if (rbsp_G3[3]) begin
                            TotalZeros_G3 <= 7;
                        end
                        else begin
                            TotalZeros_G3 <= 9;
                        end
                    end
                    default: begin
                        len_G3 <= 5;
                        case (rbsp_G3[3:4])
                            32'd3: begin
                                TotalZeros_G3 <= 0;
                            end
                            32'd2: begin
                                TotalZeros_G3 <= 10;
                            end
                            32'd1: begin
                                TotalZeros_G3 <= 11;
                            end
                            32'd0: begin
                                TotalZeros_G3 <= 12;
                            end
                        endcase
                    end
                endcase
            end
            5: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 3;
                        case (rbsp_G3[1:2])
                            32'd3: begin
                                TotalZeros_G3 <= 3;
                            end
                            32'd2: begin
                                TotalZeros_G3 <= 4;
                            end
                            32'd1: begin
                                TotalZeros_G3 <= 5;
                            end
                            32'd0: begin
                                TotalZeros_G3 <= 6;
                            end
                        endcase
                    end
                    rbsp_G3[1]: begin
                        if (rbsp_G3[2]) begin
                            TotalZeros_G3 <= 7;
                            len_G3 <= 3;
                        end
                        else begin
                            len_G3 <= 4;
                            if (rbsp_G3[3]) begin
                                TotalZeros_G3 <= 0;
                            end
                            else begin
                                TotalZeros_G3 <= 1;
                            end
                        end
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 4;
                        if (rbsp_G3[3]) begin
                            TotalZeros_G3 <= 2;
                        end
                        else begin
                            TotalZeros_G3 <= 8;
                        end
                    end
                    rbsp_G3[3]: begin
                        len_G3 <= 4;
                        TotalZeros_G3 <= 10;
                    end
                    default: begin
                        len_G3 <= 5;
                        if (rbsp_G3[4]) begin
                            TotalZeros_G3 <= 9;
                        end
                        else begin
                            TotalZeros_G3 <= 11;
                        end
                    end
                endcase
            end
            6: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 3;
                        case (rbsp_G3[1:2])
                            32'd3: begin
                                TotalZeros_G3 <= 2;
                            end
                            32'd2: begin
                                TotalZeros_G3 <= 3;
                            end
                            32'd1: begin
                                TotalZeros_G3 <= 4;
                            end
                            32'd0: begin
                                TotalZeros_G3 <= 5;
                            end
                        endcase
                    end
                    rbsp_G3[1]: begin
                        len_G3 <= 3;
                        if (rbsp_G3[2]) begin
                            TotalZeros_G3 <= 6;
                        end
                        else begin
                            TotalZeros_G3 <= 7;
                        end
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 3;
                        TotalZeros_G3 <= 9;
                    end
                    rbsp_G3[3]: begin
                        len_G3 <= 4;
                        TotalZeros_G3 <= 8;
                    end
                    rbsp_G3[4]: begin
                        len_G3 <= 5;
                        TotalZeros_G3 <= 1;
                    end
                    default: begin
                        len_G3 <= 6;
                        if (rbsp_G3[5]) begin
                            TotalZeros_G3 <= 0;
                        end
                        else begin
                            TotalZeros_G3 <= 10;
                        end
                    end
                endcase
            end
            7: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        if (rbsp_G3[1]) begin
                            TotalZeros_G3 <= 5;
                            len_G3 <= 2;
                        end
                        else begin
                            len_G3 <= 3;
                            if (rbsp_G3[2]) begin
                                TotalZeros_G3 <= 2;
                            end
                            else begin
                                TotalZeros_G3 <= 3;
                            end
                        end
                    end
                    rbsp_G3[1]: begin
                        len_G3 <= 3;
                        if (rbsp_G3[2]) begin
                            TotalZeros_G3 <= 4;
                        end
                        else begin
                            TotalZeros_G3 <= 6;
                        end
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 3;
                        TotalZeros_G3 <= 8;
                    end
                    rbsp_G3[3]: begin
                        len_G3 <= 4;
                        TotalZeros_G3 <= 7;
                    end
                    rbsp_G3[4]: begin
                        len_G3 <= 5;
                        TotalZeros_G3 <= 1;
                    end
                    default: begin
                        len_G3 <= 6;
                        if (rbsp_G3[5]) begin
                            TotalZeros_G3 <= 0;
                        end
                        else begin
                            TotalZeros_G3 <= 9;
                        end
                    end
                endcase
            end
            8: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 2;
                        if (rbsp_G3[1]) begin
                            TotalZeros_G3 <= 4;
                        end
                        else begin
                            TotalZeros_G3 <= 5;
                        end
                    end
                    rbsp_G3[1]: begin
                        len_G3 <= 3;
                        if (rbsp_G3[2]) begin
                            TotalZeros_G3 <= 3;
                        end
                        else begin
                            TotalZeros_G3 <= 6;
                        end
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 3;
                        TotalZeros_G3 <= 7;
                    end
                    rbsp_G3[3]: begin
                        len_G3 <= 4;
                        TotalZeros_G3 <= 1;
                    end
                    rbsp_G3[4]: begin
                        len_G3 <= 5;
                        TotalZeros_G3 <= 2;
                    end
                    default: begin
                        len_G3 <= 6;
                        if (rbsp_G3[5]) begin
                            TotalZeros_G3 <= 0;
                        end
                        else begin
                            TotalZeros_G3 <= 8;
                        end
                    end
                endcase
            end
            9: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 2;
                        if (rbsp_G3[1]) begin
                            TotalZeros_G3 <= 3;
                        end
                        else begin
                            TotalZeros_G3 <= 4;
                        end
                    end
                    rbsp_G3[1]: begin
                        len_G3 <= 2;
                        TotalZeros_G3 <= 6;
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 3;
                        TotalZeros_G3 <= 5;
                    end
                    rbsp_G3[3]: begin
                        len_G3 <= 4;
                        TotalZeros_G3 <= 2;
                    end
                    rbsp_G3[4]: begin
                        len_G3 <= 5;
                        TotalZeros_G3 <= 7;
                    end
                    default: begin
                        len_G3 <= 6;
                        if (rbsp_G3[5]) begin
                            TotalZeros_G3 <= 0;
                        end
                        else begin
                            TotalZeros_G3 <= 1;
                        end
                    end
                endcase
            end
            10: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 2;
                        if (rbsp_G3[1]) begin
                            TotalZeros_G3 <= 3;
                        end
                        else begin
                            TotalZeros_G3 <= 4;
                        end
                    end
                    rbsp_G3[1]: begin
                        len_G3 <= 2;
                        TotalZeros_G3 <= 5;
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 3;
                        TotalZeros_G3 <= 2;
                    end
                    rbsp_G3[3]: begin
                        len_G3 <= 4;
                        TotalZeros_G3 <= 6;
                    end
                    default: begin
                        len_G3 <= 5;
                        if (rbsp_G3[4]) begin
                            TotalZeros_G3 <= 0;
                        end
                        else begin
                            TotalZeros_G3 <= 1;
                        end
                    end
                endcase
            end
            11: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 1;
                        TotalZeros_G3 <= 4;
                    end
                    rbsp_G3[1]: begin
                        len_G3 <= 3;
                        if (rbsp_G3[2]) begin
                            TotalZeros_G3 <= 5;
                        end
                        else begin
                            TotalZeros_G3 <= 3;
                        end
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 3;
                        TotalZeros_G3 <= 2;
                    end
                    default: begin
                        len_G3 <= 4;
                        if (rbsp_G3[3]) begin
                            TotalZeros_G3 <= 1;
                        end
                        else begin
                            TotalZeros_G3 <= 0;
                        end
                    end
                endcase
            end
            12: begin
                case (1'b1)
                    rbsp_G3[0]: begin
                        len_G3 <= 1;
                        TotalZeros_G3 <= 3;
                    end
                    rbsp_G3[1]: begin
                        len_G3 <= 2;
                        TotalZeros_G3 <= 2;
                    end
                    rbsp_G3[2]: begin
                        len_G3 <= 3;
                        TotalZeros_G3 <= 4;
                    end
                    default: begin
                        len_G3 <= 4;
                        if (rbsp_G3[3]) begin
                            TotalZeros_G3 <= 1;
                        end
                        else begin
                            TotalZeros_G3 <= 0;
                        end
                    end
                endcase
            end
            13: begin
                if (rbsp_G3[0]) begin
                    TotalZeros_G3 <= 2;
                    len_G3 <= 1;
                end
                else if (rbsp_G3[1]) begin
                    TotalZeros_G3 <= 3;
                    len_G3 <= 2;
                end
                else if (rbsp_G3[2]) begin
                    TotalZeros_G3 <= 1;
                    len_G3 <= 3;
                end
                else begin
                    TotalZeros_G3 <= 0;
                    len_G3 <= 3;
                end
            end
            14: begin
                if (rbsp_G3[0]) begin
                    TotalZeros_G3 <= 2;
                    len_G3 <= 1;
                end
                else if (rbsp_G3[1]) begin
                    TotalZeros_G3 <= 1;
                    len_G3 <= 2;
                end
                else begin
                    TotalZeros_G3 <= 0;
                    len_G3 <= 2;
                end
            end
            15: begin
                len_G3 <= 1;
                if (rbsp_G3[0]) begin
                    TotalZeros_G3 <= 1;
                end
                else begin
                    TotalZeros_G3 <= 0;
                end
            end
            default: begin
                len_G3 <= 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
                TotalZeros_G3 <= 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
            end
        endcase
    end
    always @* begin
        if ((ena && chroma_DC_sel)) begin
            TotalZeros_comb <= TotalZeros_chroma_DC;
            len_comb <= len_chroma_DC;
        end
        else if ((ena && (TotalCoeff[3:2] == 2'b0))) begin
            TotalZeros_comb <= TotalZeros_LE3;
            len_comb <= len_LE3;
        end
        else if (ena) begin
            TotalZeros_comb <= TotalZeros_G3;
            len_comb <= len_G3;
        end
        else begin
            TotalZeros_comb <= 0;
            len_comb <= 0;
        end
    end
endmodule
