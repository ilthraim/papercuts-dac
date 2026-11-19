
module cavlc_top_cavlc_read_run_befores (
    input logic clk,
    input logic rst_n,
    input logic ena,
    input logic sel,
    input logic clr,
    input logic ZeroLeft_init,
    input logic[0:10] rbsp,
    input logic[3:0] i,
    input logic[3:0] TotalZeros_comb,
    input logic[8:0] level_0,
    input logic[8:0] level_1,
    input logic[8:0] level_2,
    input logic[8:0] level_3,
    input logic[8:0] level_4,
    input logic[8:0] level_5,
    input logic[8:0] level_6,
    input logic[8:0] level_7,
    input logic[8:0] level_8,
    input logic[8:0] level_9,
    input logic[8:0] level_10,
    input logic[8:0] level_11,
    input logic[8:0] level_12,
    input logic[8:0] level_13,
    input logic[8:0] level_14,
    input logic[8:0] level_15,
    output reg[8:0] coeff_0,
    output reg[8:0] coeff_1,
    output reg[8:0] coeff_2,
    output reg[8:0] coeff_3,
    output reg[8:0] coeff_4,
    output reg[8:0] coeff_5,
    output reg[8:0] coeff_6,
    output reg[8:0] coeff_7,
    output reg[8:0] coeff_8,
    output reg[8:0] coeff_9,
    output reg[8:0] coeff_10,
    output reg[8:0] coeff_11,
    output reg[8:0] coeff_12,
    output reg[8:0] coeff_13,
    output reg[8:0] coeff_14,
    output reg[8:0] coeff_15,
    output reg[3:0] ZeroLeft,
    output reg[3:0] len_comb
);
    reg[3:0] run;
    reg[3:0] len;
    reg[8:0] coeff;
    always @(rbsp or ZeroLeft or ena or sel) begin
        if ((ena)) begin
            case (ZeroLeft)
                0: begin
                    len <= 0;
                    run <= 0;
                end
                1: begin
                    len <= 1;
                    run <= (rbsp[0] ? 0 : 1);
                end
                2: begin
                    if (rbsp[0]) begin
                        run <= 0;
                        len <= 1;
                    end
                    else if (rbsp[1]) begin
                        run <= 1;
                        len <= 2;
                    end
                    else begin
                        run <= 2;
                        len <= 2;
                    end
                end
                3: begin
                    run <= (3 - rbsp[0:1]);
                    len <= 2;
                end
                4: begin
                    if ((rbsp[0:1] != 0)) begin
                        run <= (3 - rbsp[0:1]);
                        len <= 2;
                    end
                    else begin
                        run <= (rbsp[2] ? 3 : 4);
                        len <= 3;
                    end
                end
                5: begin
                    if (rbsp[0]) begin
                        run <= (rbsp[1] ? 0 : 1);
                        len <= 2;
                    end
                    else if (rbsp[1]) begin
                        run <= (rbsp[2] ? 2 : 3);
                        len <= 3;
                    end
                    else begin
                        run <= (rbsp[2] ? 4 : 5);
                        len <= 3;
                    end
                end
                6: begin
                    if ((rbsp[0:1] == 2'b11)) begin
                        run <= 0;
                        len <= 2;
                    end
                    else begin
                        len <= 3;
                        case (rbsp[0:2])
                            3'b0: begin
                                run <= 1;
                            end
                            3'b1: begin
                                run <= 2;
                            end
                            3'b11: begin
                                run <= 3;
                            end
                            3'b10: begin
                                run <= 4;
                            end
                            3'b101: begin
                                run <= 5;
                            end
                            default: begin
                                run <= 6;
                            end
                        endcase
                    end
                end
                default: begin
                    if ((rbsp[0:2] != 0)) begin
                        run <= (7 - rbsp[0:2]);
                        len <= 3;
                    end
                    else begin
                        case (1'b1)
                            rbsp[3]: begin
                                run <= 7;
                                len <= 4;
                            end
                            rbsp[4]: begin
                                run <= 8;
                                len <= 5;
                            end
                            rbsp[5]: begin
                                run <= 9;
                                len <= 6;
                            end
                            rbsp[6]: begin
                                run <= 10;
                                len <= 7;
                            end
                            rbsp[7]: begin
                                run <= 11;
                                len <= 8;
                            end
                            rbsp[8]: begin
                                run <= 12;
                                len <= 9;
                            end
                            rbsp[9]: begin
                                run <= 13;
                                len <= 10;
                            end
                            rbsp[10]: begin
                                run <= 14;
                                len <= 11;
                            end
                            default: begin
                                run <= 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
                                len <= 'bxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx;
                            end
                        endcase
                    end
                end
            endcase
        end
        else begin
            len <= 0;
            run <= 0;
        end
    end
    always @* begin
        if ((i > 0)) begin
            len_comb <= len;
        end
        else begin
            len_comb <= 0;
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!(rst_n)) begin
            ZeroLeft <= 0;
        end
        else if (( clr)) begin
            ZeroLeft <= 0;
        end
        else if (( ZeroLeft_init)) begin
            ZeroLeft <= TotalZeros_comb;
        end
        else begin
            ZeroLeft <= (ZeroLeft - run);
        end
    end
    always @* begin begin
            case (i)
                0: begin
                    coeff <= level_0;
                end
                1: begin
                    coeff <= level_1;
                end
                2: begin
                    coeff <= level_2;
                end
                3: begin
                    coeff <= level_3;
                end
                4: begin
                    coeff <= level_4;
                end
                5: begin
                    coeff <= level_5;
                end
                6: begin
                    coeff <= level_6;
                end
                7: begin
                    coeff <= level_7;
                end
                8: begin
                    coeff <= level_8;
                end
                9: begin
                    coeff <= level_9;
                end
                10: begin
                    coeff <= level_10;
                end
                11: begin
                    coeff <= level_11;
                end
                12: begin
                    coeff <= level_12;
                end
                13: begin
                    coeff <= level_13;
                end
                14: begin
                    coeff <= level_14;
                end
                15: begin
                    coeff <= level_15;
                end
            endcase
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (!(rst_n)) begin
            coeff_0 <= 0;
            coeff_1 <= 0;
            coeff_2 <= 0;
            coeff_3 <= 0;
            coeff_4 <= 0;
            coeff_5 <= 0;
            coeff_6 <= 0;
            coeff_7 <= 0;
            coeff_8 <= 0;
            coeff_9 <= 0;
            coeff_10 <= 0;
            coeff_11 <= 0;
            coeff_12 <= 0;
            coeff_13 <= 0;
            coeff_14 <= 0;
            coeff_15 <= 0;
        end
        else if ((ena && clr)) begin
            coeff_0 <= 0;
            coeff_1 <= 0;
            coeff_2 <= 0;
            coeff_3 <= 0;
            coeff_4 <= 0;
            coeff_5 <= 0;
            coeff_6 <= 0;
            coeff_7 <= 0;
            coeff_8 <= 0;
            coeff_9 <= 0;
            coeff_10 <= 0;
            coeff_11 <= 0;
            coeff_12 <= 0;
            coeff_13 <= 0;
            coeff_14 <= 0;
            coeff_15 <= 0;
        end
        else if (((ena && sel) && (ZeroLeft > 0))) begin
            case ((ZeroLeft + i))
                1: begin
                    coeff_1 <= coeff;
                end
                2: begin
                    coeff_2 <= coeff;
                end
                3: begin
                    coeff_3 <= coeff;
                end
                4: begin
                    coeff_4 <= coeff;
                end
                5: begin
                    coeff_5 <= coeff;
                end
                6: begin
                    coeff_6 <= coeff;
                end
                7: begin
                    coeff_7 <= coeff;
                end
                8: begin
                    coeff_8 <= coeff;
                end
                9: begin
                    coeff_9 <= coeff;
                end
                10: begin
                    coeff_10 <= coeff;
                end
                11: begin
                    coeff_11 <= coeff;
                end
                12: begin
                    coeff_12 <= coeff;
                end
                13: begin
                    coeff_13 <= coeff;
                end
                14: begin
                    coeff_14 <= coeff;
                end
                default: begin
                    coeff_15 <= coeff;
                end
            endcase
        end
        else if ((ena && sel)) begin begin
                coeff_0 <= level_0;
            end
            if ((i >= 1)) begin
                coeff_1 <= level_1;
            end
            if ((i >= 2)) begin
                coeff_2 <= level_2;
            end
            if ((i >= 3)) begin
                coeff_3 <= level_3;
            end
            if ((i >= 4)) begin
                coeff_4 <= level_4;
            end
            if ((i >= 5)) begin
                coeff_5 <= level_5;
            end
            if ((i >= 6)) begin
                coeff_6 <= level_6;
            end
            if ((i >= 7)) begin
                coeff_7 <= level_7;
            end
            if ((i >= 8)) begin
                coeff_8 <= level_8;
            end
            if ((i >= 9)) begin
                coeff_9 <= level_9;
            end
            if ((i >= 10)) begin
                coeff_10 <= level_10;
            end
            if ((i >= 11)) begin
                coeff_11 <= level_11;
            end
            if ((i >= 12)) begin
                coeff_12 <= level_12;
            end
            if ((i >= 13)) begin
                coeff_13 <= level_13;
            end
            if ((i >= 14)) begin
                coeff_14 <= level_14;
            end
            if ((i == 15)) begin
                coeff_15 <= level_15;
            end
        end
    end
endmodule