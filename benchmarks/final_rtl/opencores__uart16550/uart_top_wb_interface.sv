
module uart_top_wb_interface (
    input logic clk,
    input logic wb_rst_i,
    input logic wb_we_i,
    input logic wb_stb_i,
    input logic wb_cyc_i,
    output reg wb_ack_o,
    input logic[4:0] wb_adr_i,
    output logic[4:0] wb_adr_int,
    input logic[31:0] wb_dat_i,
    output reg[31:0] wb_dat_o,
    output reg[7:0] wb_dat8_i,
    input logic[7:0] wb_dat8_o,
    input logic[31:0] wb_dat32_o,
    input logic[3:0] wb_sel_i,
    output logic we_o,
    output logic re_o
);
    reg[31:0] wb_dat_is;
    reg[4:0] wb_adr_is;
    reg wb_we_is;
    reg wb_cyc_is;
    reg wb_stb_is;
    reg[3:0] wb_sel_is;
    reg wre;
    reg[1:0] wbstate;
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_ack_o <= 1'b0;
            wbstate <= 0;
            wre <= 1'b1;
        end
        else begin
            case (wbstate)
                0: begin
                    if ((wb_stb_is & wb_cyc_is)) begin
                        wre <= 0;
                        wbstate <= 1;
                        wb_ack_o <= 1;
                    end
                    else begin
                        wre <= 1;
                        wb_ack_o <= 0;
                    end
                end
                1: begin
                    wb_ack_o <= 0;
                    wbstate <= 2;
                    wre <= 0;
                end
                2, 3: begin
                    wb_ack_o <= 0;
                    wbstate <= 0;
                    wre <= 0;
                end
            endcase
        end
    end
    assign we_o = (((wb_we_is & wb_stb_is) & wb_cyc_is) & wre);
    assign re_o = (((~(wb_we_is) & wb_stb_is) & wb_cyc_is) & wre);
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_adr_is <= 0;
            wb_we_is <= 0;
            wb_cyc_is <= 0;
            wb_stb_is <= 0;
            wb_dat_is <= 0;
            wb_sel_is <= 0;
        end
        else begin
            wb_adr_is <= wb_adr_i;
            wb_we_is <= wb_we_i;
            wb_cyc_is <= wb_cyc_i;
            wb_stb_is <= wb_stb_i;
            wb_dat_is <= wb_dat_i;
            wb_sel_is <= wb_sel_i;
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_dat_o <= 0;
        end
        else if (re_o) begin
            case (wb_sel_is)
                4'b1: begin
                    wb_dat_o <= {24'd0, wb_dat8_o};
                end
                4'b10: begin
                    wb_dat_o <= {16'd0, wb_dat8_o, 8'd0};
                end
                4'b100: begin
                    wb_dat_o <= {8'd0, wb_dat8_o, 16'd0};
                end
                4'b1000: begin
                    wb_dat_o <= {wb_dat8_o, 24'd0};
                end
                4'b1111: begin
                    wb_dat_o <= wb_dat32_o;
                end
                default: begin
                    wb_dat_o <= 0;
                end
            endcase
        end
    end
    reg[1:0] wb_adr_int_lsb;
    always @(wb_sel_is or wb_dat_is) begin
        case (wb_sel_is)
            4'b10: begin
                wb_dat8_i = wb_dat_is[15:8];
            end
            4'b100: begin
                wb_dat8_i = wb_dat_is[23:16];
            end
            4'b1000: begin
                wb_dat8_i = wb_dat_is[31:24];
            end
            default: begin
                wb_dat8_i = wb_dat_is[7:0];
            end
        endcase
        case (wb_sel_is)
            4'b1: begin
                wb_adr_int_lsb = 2'b11;
            end
            4'b10: begin
                wb_adr_int_lsb = 2'b10;
            end
            4'b100: begin
                wb_adr_int_lsb = 2'b1;
            end
            default: begin
                wb_adr_int_lsb = 2'b0;
            end
        endcase
    end
    assign wb_adr_int = {wb_adr_is[4:2], wb_adr_int_lsb};
endmodule