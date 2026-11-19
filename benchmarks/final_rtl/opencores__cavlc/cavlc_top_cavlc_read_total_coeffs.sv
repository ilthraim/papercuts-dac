
module cavlc_top_cavlc_read_total_coeffs (
    input logic clk,
    input logic rst_n,
    input logic ena,
    input logic start,
    input logic sel,
    input logic[0:15] rbsp,
    input logic signed[5:0] nC,
    output reg[1:0] TrailingOnes,
    output reg[4:0] TotalCoeff,
    output reg[1:0] TrailingOnes_comb,
    output reg[4:0] TotalCoeff_comb,
    output reg[4:0] len_comb
);
    reg[4:0] TotalCoeff_1;
    reg[1:0] TrailingOnes_1;
    reg[4:0] len_1;
    reg[4:0] TotalCoeff_2;
    reg[1:0] TrailingOnes_2;
    reg [3:0] len_2;
    reg[4:0] TotalCoeff_3;
    reg[1:0] TrailingOnes_3;
    reg [3:0] len_3;
    reg[4:0] TotalCoeff_4;
    reg[1:0] TrailingOnes_4;
    reg [2:0] len_4;
    reg [2:0] TotalCoeff_5;
    reg[1:0] TrailingOnes_5;
    reg [3:0] len_5;
    reg[0:15] rbsp_1;
    reg[0:13] rbsp_2;
    reg[0:9] rbsp_3;
    reg[0:5] rbsp_4;
    reg[0:7] rbsp_5;
    always @(posedge clk or negedge rst_n) begin
        if (!(rst_n)) begin
            rbsp_1 <= 0;
            rbsp_2 <= 0;
            rbsp_3 <= 0;
            rbsp_4 <= 0;
            rbsp_5 <= 0;
        end
        else if ((ena && start)) begin
            if (nC[5]) begin
                rbsp_5 <= rbsp[0:7];
            end
            else if ((nC[4] || nC[3])) begin
                rbsp_4 <= rbsp[0:5];
            end
            else if (nC[2]) begin
                rbsp_3 <= rbsp[0:9];
            end
            else if (nC[1]) begin
                rbsp_2 <= rbsp[0:13];
            end
            else begin
                rbsp_1 <= rbsp;
            end
        end
    end
    always @(rbsp_1) begin
        case (1'b1)
            rbsp_1[0]: begin
                TrailingOnes_1 <= 0;
                TotalCoeff_1 <= 0;
                len_1 <= 1;
            end
            rbsp_1[1]: begin
                TrailingOnes_1 <= 1;
                TotalCoeff_1 <= 1;
                len_1 <= 2;
            end
            rbsp_1[2]: begin
                TrailingOnes_1 <= 2;
                TotalCoeff_1 <= 2;
                len_1 <= 3;
            end
            rbsp_1[3]: begin
                if ((rbsp_1[4] == 32'd1)) begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 3;
                    len_1 <= 5;
                end
                else if ((rbsp_1[5] == 32'd1)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 1;
                    len_1 <= 6;
                end
                else begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 2;
                    len_1 <= 6;
                end
            end
            rbsp_1[4]: begin
                if ((rbsp_1[5] == 32'd1)) begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 4;
                    len_1 <= 6;
                end
                else if ((rbsp_1[6] == 32'd1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 3;
                    len_1 <= 7;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 5;
                    len_1 <= 7;
                end
            end
            rbsp_1[5]: begin
                len_1 <= 8;
                if ((rbsp_1[6:7] == 32'd3)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 2;
                end
                else if ((rbsp_1[6:7] == 32'd2)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 3;
                end
                else if ((rbsp_1[6:7] == 32'd1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 4;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 6;
                end
            end
            rbsp_1[6]: begin
                len_1 <= 9;
                if ((rbsp_1[7:8] == 2'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 3;
                end
                else if ((rbsp_1[7:8] == 2'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 4;
                end
                else if ((rbsp_1[7:8] == 2'b1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 5;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 7;
                end
            end
            rbsp_1[7]: begin
                len_1 <= 10;
                if ((rbsp_1[8:9] == 2'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 4;
                end
                else if ((rbsp_1[8:9] == 2'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 5;
                end
                else if ((rbsp_1[8:9] == 2'b1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 6;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 8;
                end
            end
            rbsp_1[8]: begin
                len_1 <= 11;
                if ((rbsp_1[9:10] == 2'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 5;
                end
                else if ((rbsp_1[9:10] == 2'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 6;
                end
                else if ((rbsp_1[9:10] == 2'b1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 7;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 9;
                end
            end
            rbsp_1[9]: begin
                len_1 <= 13;
                if ((rbsp_1[10:12] == 3'b111)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 6;
                end
                else if ((rbsp_1[10:12] == 3'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 7;
                end
                else if ((rbsp_1[10:12] == 3'b110)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 7;
                end
                else if ((rbsp_1[10:12] == 3'b0)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 8;
                end
                else if ((rbsp_1[10:12] == 3'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 8;
                end
                else if ((rbsp_1[10:12] == 3'b101)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 8;
                end
                else if ((rbsp_1[10:12] == 3'b1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 9;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 10;
                end
            end
            rbsp_1[10]: begin
                len_1 <= 14;
                if ((rbsp_1[11:13] == 3'b111)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 9;
                end
                else if ((rbsp_1[11:13] == 3'b110)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 9;
                end
                else if ((rbsp_1[11:13] == 3'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 10;
                end
                else if ((rbsp_1[11:13] == 3'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 10;
                end
                else if ((rbsp_1[11:13] == 3'b101)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 10;
                end
                else if ((rbsp_1[11:13] == 3'b1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 11;
                end
                else if ((rbsp_1[11:13] == 3'b100)) begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 11;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 12;
                end
            end
            rbsp_1[11]: begin
                len_1 <= 15;
                if ((rbsp_1[12:14] == 3'b111)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 11;
                end
                else if ((rbsp_1[12:14] == 3'b110)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 11;
                end
                else if ((rbsp_1[12:14] == 3'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 12;
                end
                else if ((rbsp_1[12:14] == 3'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 12;
                end
                else if ((rbsp_1[12:14] == 3'b101)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 12;
                end
                else if ((rbsp_1[12:14] == 3'b1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 13;
                end
                else if ((rbsp_1[12:14] == 3'b100)) begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 13;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 14;
                end
            end
            rbsp_1[12]: begin
                len_1 <= 16;
                if ((rbsp_1[13:15] == 3'b111)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 13;
                end
                else if ((rbsp_1[13:15] == 3'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 14;
                end
                else if ((rbsp_1[13:15] == 3'b110)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 14;
                end
                else if ((rbsp_1[13:15] == 3'b101)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 14;
                end
                else if ((rbsp_1[13:15] == 3'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 15;
                end
                else if ((rbsp_1[13:15] == 3'b1)) begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 15;
                end
                else if ((rbsp_1[13:15] == 3'b100)) begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 15;
                end
                else begin
                    TrailingOnes_1 <= 3;
                    TotalCoeff_1 <= 16;
                end
            end
            rbsp_1[13]: begin
                len_1 <= 16;
                if ((rbsp_1[14:15] == 2'b11)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 15;
                end
                else if ((rbsp_1[14:15] == 2'b0)) begin
                    TrailingOnes_1 <= 0;
                    TotalCoeff_1 <= 16;
                end
                else if ((rbsp_1[14:15] == 2'b10)) begin
                    TrailingOnes_1 <= 1;
                    TotalCoeff_1 <= 16;
                end
                else begin
                    TrailingOnes_1 <= 2;
                    TotalCoeff_1 <= 16;
                end
            end
            default: begin
                len_1 <= 15;
                TrailingOnes_1 <= 1;
                TotalCoeff_1 <= 13;
            end
        endcase
    end
    always @(rbsp_2) begin
        case (1'b1)
            rbsp_2[0]: begin
                len_2 <= 2;
                if ((rbsp_2[1] == 32'd1)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 0;
                end
                else begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 1;
                end
            end
            rbsp_2[1]: begin
                if ((rbsp_2[2] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 2;
                    len_2 <= 3;
                end
                else if ((rbsp_2[3] == 32'd1)) begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 3;
                    len_2 <= 4;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 4;
                    len_2 <= 4;
                end
            end
            rbsp_2[2]: begin
                if ((rbsp_2[3:4] == 32'd3)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 2;
                    len_2 <= 5;
                end
                else if ((rbsp_2[3:4] == 32'd2)) begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 5;
                    len_2 <= 5;
                end
                else if ((rbsp_2[4:5] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 1;
                    len_2 <= 6;
                end
                else if ((rbsp_2[4:5] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 3;
                    len_2 <= 6;
                end
                else if ((rbsp_2[4:5] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 3;
                    len_2 <= 6;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 6;
                    len_2 <= 6;
                end
            end
            rbsp_2[3]: begin
                len_2 <= 6;
                if ((rbsp_2[4:5] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 2;
                end
                else if ((rbsp_2[4:5] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 4;
                end
                else if ((rbsp_2[4:5] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 4;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 7;
                end
            end
            rbsp_2[4]: begin
                len_2 <= 7;
                if ((rbsp_2[5:6] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 3;
                end
                else if ((rbsp_2[5:6] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 5;
                end
                else if ((rbsp_2[5:6] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 5;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 8;
                end
            end
            rbsp_2[5]: begin
                len_2 <= 8;
                if ((rbsp_2[6:7] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 4;
                end
                else if ((rbsp_2[6:7] == 32'd0)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 5;
                end
                else if ((rbsp_2[6:7] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 6;
                end
                else begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 6;
                end
            end
            rbsp_2[6]: begin
                len_2 <= 9;
                if ((rbsp_2[7:8] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 6;
                end
                else if ((rbsp_2[7:8] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 7;
                end
                else if ((rbsp_2[7:8] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 7;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 9;
                end
            end
            rbsp_2[7]: begin
                len_2 <= 11;
                if ((rbsp_2[8:10] == 32'd7)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 7;
                end
                else if ((rbsp_2[8:10] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 8;
                end
                else if ((rbsp_2[8:10] == 32'd6)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 8;
                end
                else if ((rbsp_2[8:10] == 32'd5)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 8;
                end
                else if ((rbsp_2[8:10] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 9;
                end
                else if ((rbsp_2[8:10] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 9;
                end
                else if ((rbsp_2[8:10] == 32'd4)) begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 10;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 11;
                end
            end
            rbsp_2[8]: begin
                len_2 <= 12;
                if ((rbsp_2[9:11] == 32'd7)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 9;
                end
                else if ((rbsp_2[9:11] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 10;
                end
                else if ((rbsp_2[9:11] == 32'd6)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 10;
                end
                else if ((rbsp_2[9:11] == 32'd5)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 10;
                end
                else if ((rbsp_2[9:11] == 32'd0)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 11;
                end
                else if ((rbsp_2[9:11] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 11;
                end
                else if ((rbsp_2[9:11] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 11;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 12;
                end
            end
            rbsp_2[9]: begin
                len_2 <= 13;
                if ((rbsp_2[10:12] == 32'd7)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 12;
                end
                else if ((rbsp_2[10:12] == 32'd6)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 12;
                end
                else if ((rbsp_2[10:12] == 32'd5)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 12;
                end
                else if ((rbsp_2[10:12] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 13;
                end
                else if ((rbsp_2[10:12] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 13;
                end
                else if ((rbsp_2[10:12] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 13;
                end
                else if ((rbsp_2[10:12] == 32'd4)) begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 13;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 14;
                end
            end
            rbsp_2[10]: begin
                if ((rbsp_2[11:12] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 14;
                    len_2 <= 13;
                end
                else if ((rbsp_2[11:12] == 32'd2)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 14;
                    len_2 <= 13;
                end
                else if ((rbsp_2[12:13] == 32'd3)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 14;
                    len_2 <= 14;
                end
                else if ((rbsp_2[12:13] == 32'd1)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 15;
                    len_2 <= 14;
                end
                else if ((rbsp_2[12:13] == 32'd0)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 15;
                    len_2 <= 14;
                end
                else begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 15;
                    len_2 <= 14;
                end
            end
            rbsp_2[11]: begin
                len_2 <= 14;
                if ((rbsp_2[12:13] == 32'd3)) begin
                    TrailingOnes_2 <= 0;
                    TotalCoeff_2 <= 16;
                end
                else if ((rbsp_2[12:13] == 32'd2)) begin
                    TrailingOnes_2 <= 1;
                    TotalCoeff_2 <= 16;
                end
                else if ((rbsp_2[12:13] == 32'd1)) begin
                    TrailingOnes_2 <= 2;
                    TotalCoeff_2 <= 16;
                end
                else begin
                    TrailingOnes_2 <= 3;
                    TotalCoeff_2 <= 16;
                end
            end
            default: begin
                TrailingOnes_2 <= 3;
                TotalCoeff_2 <= 15;
                len_2 <= 13;
            end
        endcase
    end
    always @(rbsp_3) begin
        case (1'b1)
            rbsp_3[0]: begin
                len_3 <= 4;
                case (rbsp_3[1:3])
                    32'd7: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 0;
                    end
                    32'd6: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 1;
                    end
                    32'd5: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 2;
                    end
                    32'd4: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 3;
                    end
                    32'd3: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 4;
                    end
                    32'd2: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 5;
                    end
                    32'd1: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 6;
                    end
                    32'd0: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 7;
                    end
                endcase
            end
            rbsp_3[1]: begin
                len_3 <= 5;
                case (rbsp_3[2:4])
                    32'd7: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 2;
                    end
                    32'd4: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 3;
                    end
                    32'd6: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 3;
                    end
                    32'd2: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 4;
                    end
                    32'd3: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 4;
                    end
                    32'd0: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 5;
                    end
                    32'd1: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 5;
                    end
                    32'd5: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 8;
                    end
                endcase
            end
            rbsp_3[2]: begin
                len_3 <= 6;
                case (rbsp_3[3:5])
                    3'b111: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 1;
                    end
                    3'b11: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 2;
                    end
                    3'b0: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 3;
                    end
                    3'b110: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 6;
                    end
                    3'b101: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 6;
                    end
                    3'b10: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 7;
                    end
                    3'b1: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 7;
                    end
                    3'b100: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 9;
                    end
                endcase
            end
            rbsp_3[3]: begin
                len_3 <= 7;
                case (rbsp_3[4:6])
                    32'd7: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 4;
                    end
                    32'd3: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 5;
                    end
                    32'd1: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 6;
                    end
                    32'd0: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 7;
                    end
                    32'd6: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 8;
                    end
                    32'd5: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 8;
                    end
                    32'd2: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 9;
                    end
                    32'd4: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 10;
                    end
                endcase
            end
            rbsp_3[4]: begin
                len_3 <= 8;
                case (rbsp_3[5:7])
                    32'd7: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 8;
                    end
                    32'd3: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 9;
                    end
                    32'd6: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 9;
                    end
                    32'd2: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 10;
                    end
                    32'd5: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 10;
                    end
                    32'd1: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 11;
                    end
                    32'd4: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 11;
                    end
                    32'd0: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 12;
                    end
                endcase
            end
            rbsp_3[5]: begin
                len_3 <= 9;
                case (rbsp_3[6:8])
                    32'd7: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 10;
                    end
                    32'd3: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 11;
                    end
                    32'd6: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 11;
                    end
                    32'd0: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 12;
                    end
                    32'd2: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 12;
                    end
                    32'd5: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 12;
                    end
                    32'd1: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 13;
                    end
                    32'd4: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 13;
                    end
                endcase
            end
            rbsp_3[6]: begin
                if ((rbsp_3[7:8] == 32'd3)) begin
                    TrailingOnes_3 <= 1;
                    TotalCoeff_3 <= 13;
                    len_3 <= 9;
                end
                else if ((rbsp_3[7:9] == 32'd5)) begin
                    TrailingOnes_3 <= 0;
                    TotalCoeff_3 <= 13;
                    len_3 <= 10;
                end
                else if ((rbsp_3[7:9] == 32'd1)) begin
                    TrailingOnes_3 <= 0;
                    TotalCoeff_3 <= 14;
                    len_3 <= 10;
                end
                else if ((rbsp_3[7:9] == 32'd4)) begin
                    TrailingOnes_3 <= 1;
                    TotalCoeff_3 <= 14;
                    len_3 <= 10;
                end
                else if ((rbsp_3[7:9] == 32'd3)) begin
                    TrailingOnes_3 <= 2;
                    TotalCoeff_3 <= 14;
                    len_3 <= 10;
                end
                else if ((rbsp_3[7:9] == 32'd2)) begin
                    TrailingOnes_3 <= 3;
                    TotalCoeff_3 <= 14;
                    len_3 <= 10;
                end
                else begin
                    TrailingOnes_3 <= 1;
                    TotalCoeff_3 <= 15;
                    len_3 <= 10;
                end
            end
            rbsp_3[7]: begin
                len_3 <= 10;
                case (rbsp_3[8:9])
                    32'd1: begin
                        TrailingOnes_3 <= 0;
                        TotalCoeff_3 <= 15;
                    end
                    32'd3: begin
                        TrailingOnes_3 <= 2;
                        TotalCoeff_3 <= 15;
                    end
                    32'd2: begin
                        TrailingOnes_3 <= 3;
                        TotalCoeff_3 <= 15;
                    end
                    32'd0: begin
                        TrailingOnes_3 <= 1;
                        TotalCoeff_3 <= 16;
                    end
                endcase
            end
            rbsp_3[8]: begin
                len_3 <= 10;
                if ((rbsp_3[9] == 32'd1)) begin
                    TrailingOnes_3 <= 2;
                    TotalCoeff_3 <= 16;
                end
                else begin
                    TrailingOnes_3 <= 3;
                    TotalCoeff_3 <= 16;
                end
            end
            default: begin
                len_3 <= 10;
                TrailingOnes_3 <= 0;
                TotalCoeff_3 <= 16;
            end
        endcase
    end
    always @(rbsp_4) begin
        len_4 <= 6;
        if ((rbsp_4[0:4] == 5'b1)) begin
            TrailingOnes_4 <= 0;
            TotalCoeff_4 <= 0;
        end
        else begin
            TrailingOnes_4 <= rbsp_4[4:5];
            TotalCoeff_4 <= (rbsp_4[0:3] + 1'b1);
        end
    end
    always @(rbsp_5) begin
        case (1'b1)
            rbsp_5[0]: begin
                TrailingOnes_5 <= 1;
                TotalCoeff_5 <= 1;
                len_5 <= 1;
            end
            rbsp_5[1]: begin
                TrailingOnes_5 <= 0;
                TotalCoeff_5 <= 0;
                len_5 <= 2;
            end
            rbsp_5[2]: begin
                TrailingOnes_5 <= 2;
                TotalCoeff_5 <= 2;
                len_5 <= 3;
            end
            rbsp_5[3]: begin
                len_5 <= 6;
                if ((rbsp_5[4:5] == 32'd3)) begin
                    TrailingOnes_5 <= 0;
                    TotalCoeff_5 <= 1;
                end
                else if ((rbsp_5[4:5] == 32'd0)) begin
                    TrailingOnes_5 <= 0;
                    TotalCoeff_5 <= 2;
                end
                else if ((rbsp_5[4:5] == 32'd2)) begin
                    TrailingOnes_5 <= 1;
                    TotalCoeff_5 <= 2;
                end
                else begin
                    TrailingOnes_5 <= 3;
                    TotalCoeff_5 <= 3;
                end
            end
            rbsp_5[4]: begin
                len_5 <= 6;
                if ((rbsp_5[5] == 32'd1)) begin
                    TrailingOnes_5 <= 0;
                    TotalCoeff_5 <= 3;
                end
                else begin
                    TrailingOnes_5 <= 0;
                    TotalCoeff_5 <= 4;
                end
            end
            rbsp_5[5]: begin
                len_5 <= 7;
                if ((rbsp_5[6] == 32'd1)) begin
                    TrailingOnes_5 <= 1;
                    TotalCoeff_5 <= 3;
                end
                else begin
                    TrailingOnes_5 <= 2;
                    TotalCoeff_5 <= 3;
                end
            end
            rbsp_5[6]: begin
                len_5 <= 8;
                if ((rbsp_5[7] == 32'd1)) begin
                    TrailingOnes_5 <= 1;
                    TotalCoeff_5 <= 4;
                end
                else begin
                    TrailingOnes_5 <= 2;
                    TotalCoeff_5 <= 4;
                end
            end
            default: begin
                len_5 <= 7;
                TrailingOnes_5 <= 3;
                TotalCoeff_5 <= 4;
            end
        endcase
    end
    always @* begin
        if ((nC == -1)) begin
            TrailingOnes_comb <= TrailingOnes_5;
            TotalCoeff_comb <= TotalCoeff_5;
            len_comb <= len_5;
        end
        else if ((nC[4] | nC[3])) begin
            TrailingOnes_comb <= TrailingOnes_4;
            TotalCoeff_comb <= TotalCoeff_4;
            len_comb <= len_4;
        end
        else if (nC[2]) begin
            TrailingOnes_comb <= TrailingOnes_3;
            TotalCoeff_comb <= TotalCoeff_3;
            len_comb <= len_3;
        end
        else if (nC[1]) begin
            TrailingOnes_comb <= TrailingOnes_2;
            TotalCoeff_comb <= TotalCoeff_2;
            len_comb <= len_2;
        end
        else begin
            TrailingOnes_comb <= TrailingOnes_1;
            TotalCoeff_comb <= TotalCoeff_1;
            len_comb <= len_1;
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!(rst_n)) begin
            TrailingOnes <= 0;
            TotalCoeff <= 0;
        end
        else if ((ena && sel)) begin
            TrailingOnes <= TrailingOnes_comb;
            TotalCoeff <= TotalCoeff_comb;
        end
    end
endmodule