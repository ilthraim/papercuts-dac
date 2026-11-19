module sv_chip3_hierarchy_no_mem (
    input logic tm3_clk_v0,
    input logic tm3_clk_v2,
    input logic tm3_vidin_llc,
    input logic tm3_vidin_vs,
    input logic tm3_vidin_href,
    input logic tm3_vidin_cref,
    input logic tm3_vidin_rts0,
    input logic[15:0] tm3_vidin_vpo,
    output logic tm3_vidin_sda,
    output reg tm3_vidin_scl,
    output reg vidin_new_data,
    output reg[7:0] vidin_rgb_reg,
    output reg[18:0] vidin_addr_reg
);
    reg tm3_vidin_sda_xhdl0;
    reg temp_reg1;
    reg temp_reg2;
    reg[9:0] horiz;
    reg[7:0] vert;
    reg creg1;
    reg creg2;
    reg creg3;
    reg[18:0] vidin_addr_reg1;
    reg[7:0] vidin_rgb_reg1;
    reg[7:0] vidin_rgb_reg2;
    reg rst;
    reg[4:0] iicaddr;
    reg[7:0] iicdata;
    reg[6:0] iic_state;
    reg iic_stop;
    reg iic_start;
    reg[4:0] reg_prog_state;
    reg[4:0] reg_prog_nextstate;
    assign tm3_vidin_sda = tm3_vidin_sda_xhdl0;
    always @(posedge tm3_clk_v0) begin
        if ((tm3_vidin_href == 1'b0)) begin
            horiz <= 10'd0;
        end
        else begin
            if ((tm3_vidin_cref == 1'b0)) begin
                horiz <= (horiz + 1);
            end
        end
        if ((tm3_vidin_vs == 1'b1)) begin
            vert <= 8'd0;
        end
        else begin
            if (((tm3_vidin_href == 1'b0) & (horiz != 10'd0))) begin
                vert <= (vert + 1);
            end
        end
        if ((tm3_vidin_cref == 1'b1)) begin
            begin
            end
            begin
            end
            begin
            end
            begin
            end
            vidin_rgb_reg1[2:0] <= tm3_vidin_vpo[2:0];
            vidin_rgb_reg2 <= vidin_rgb_reg1;
        end
        else begin
            begin
            end
            vidin_rgb_reg1[7:3] <= tm3_vidin_vpo[4:0];
            vidin_addr_reg1 <= {vert, tm3_vidin_rts0, horiz};
        end
    end
    always @(posedge tm3_clk_v0) begin
        creg1 <= tm3_vidin_cref;
        creg2 <= creg1;
        creg3 <= creg2;
        if (((((creg2 == 1'b0) & (creg3 == 1'b1)) & (vidin_addr_reg1[10] == 1'b0)) & (vidin_addr_reg1[0] == 1'b0))) begin
            vidin_new_data <= 1'b1;
            vidin_rgb_reg <= vidin_rgb_reg2[7:0];
            vidin_addr_reg <= {{2'b0, vidin_addr_reg1[18:11]}, vidin_addr_reg1[9:1]};
        end
        else begin
            vidin_new_data <= 1'b0;
        end
    end
    always @(posedge tm3_clk_v2) begin
        case (iic_state)
            7'b0: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b1: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b1;
            end
            7'b10: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b11: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b0;
            end
            7'b111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b1;
            end
            7'b1000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b0;
            end
            7'b1001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b1010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b1011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b1100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b1101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b1110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b0;
            end
            7'b1111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b1;
            end
            7'b10000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b0;
            end
            7'b10001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b10010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b10011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b10101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b10110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b10111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b11000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b11001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b11010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b11011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b11100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b11101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b11110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b11111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b100000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b100001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b100010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b100011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[4];
                tm3_vidin_scl <= 1'b0;
            end
            7'b100100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[4];
                tm3_vidin_scl <= 1'b1;
            end
            7'b100101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[4];
                tm3_vidin_scl <= 1'b0;
            end
            7'b100110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[3];
                tm3_vidin_scl <= 1'b0;
            end
            7'b100111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[3];
                tm3_vidin_scl <= 1'b1;
            end
            7'b101000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[3];
                tm3_vidin_scl <= 1'b0;
            end
            7'b101001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[2];
                tm3_vidin_scl <= 1'b0;
            end
            7'b101010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[2];
                tm3_vidin_scl <= 1'b1;
            end
            7'b101011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[2];
                tm3_vidin_scl <= 1'b0;
            end
            7'b101100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[1];
                tm3_vidin_scl <= 1'b0;
            end
            7'b101101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[1];
                tm3_vidin_scl <= 1'b1;
            end
            7'b101110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[1];
                tm3_vidin_scl <= 1'b0;
            end
            7'b101111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[0];
                tm3_vidin_scl <= 1'b0;
            end
            7'b110000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[0];
                tm3_vidin_scl <= 1'b1;
            end
            7'b110001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicaddr[0];
                tm3_vidin_scl <= 1'b0;
            end
            7'b110010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b110011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b110100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b110101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[7];
                tm3_vidin_scl <= 1'b0;
            end
            7'b110110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[7];
                tm3_vidin_scl <= 1'b1;
            end
            7'b110111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[7];
                tm3_vidin_scl <= 1'b0;
            end
            7'b111000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[6];
                tm3_vidin_scl <= 1'b0;
            end
            7'b111001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[6];
                tm3_vidin_scl <= 1'b1;
            end
            7'b111010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[6];
                tm3_vidin_scl <= 1'b0;
            end
            7'b111011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[5];
                tm3_vidin_scl <= 1'b0;
            end
            7'b111100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[5];
                tm3_vidin_scl <= 1'b1;
            end
            7'b111101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[5];
                tm3_vidin_scl <= 1'b0;
            end
            7'b111110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[4];
                tm3_vidin_scl <= 1'b0;
            end
            7'b111111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[4];
                tm3_vidin_scl <= 1'b1;
            end
            7'b1000000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[4];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1000001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[3];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1000010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[3];
                tm3_vidin_scl <= 1'b1;
            end
            7'b1000011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[3];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1000100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[2];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1000101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[2];
                tm3_vidin_scl <= 1'b1;
            end
            7'b1000110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[2];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1000111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[1];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1001000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[1];
                tm3_vidin_scl <= 1'b1;
            end
            7'b1001001: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[1];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1001010: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[0];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1001011: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[0];
                tm3_vidin_scl <= 1'b1;
            end
            7'b1001100: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= iicdata[0];
                tm3_vidin_scl <= 1'b0;
            end
            7'b1001101: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b1001110: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            7'b1001111: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b0;
            end
            7'b1010000: begin
                iic_stop <= 1'b0;
                tm3_vidin_sda_xhdl0 <= 1'b0;
                tm3_vidin_scl <= 1'b1;
            end
            default: begin
                iic_stop <= 1'b1;
                tm3_vidin_sda_xhdl0 <= 1'b1;
                tm3_vidin_scl <= 1'b1;
            end
        endcase
    end
    always @* begin
        case (reg_prog_state)
            5'b1: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b10;
                end
                else begin
                    reg_prog_nextstate = 5'b1;
                end
            end
            5'b10: begin
                iicaddr = 8'd2;
                iicdata = 8'd192;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b11;
                end
                else begin
                    reg_prog_nextstate = 5'b10;
                end
            end
            5'b11: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b100;
                end
                else begin
                    reg_prog_nextstate = 5'b11;
                end
            end
            5'b100: begin
                iicaddr = 8'd3;
                iicdata = 8'd35;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b101;
                end
                else begin
                    reg_prog_nextstate = 5'b100;
                end
            end
            5'b101: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b110;
                end
                else begin
                    reg_prog_nextstate = 5'b101;
                end
            end
            5'b110: begin
                iicaddr = 8'd6;
                iicdata = 8'd235;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b111;
                end
                else begin
                    reg_prog_nextstate = 5'b110;
                end
            end
            5'b111: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b1000;
                end
                else begin
                    reg_prog_nextstate = 5'b111;
                end
            end
            5'b1000: begin
                iicaddr = 8'd7;
                iicdata = 8'd224;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b1001;
                end
                else begin
                    reg_prog_nextstate = 5'b1000;
                end
            end
            5'b1001: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b1010;
                end
                else begin
                    reg_prog_nextstate = 5'b1001;
                end
            end
            5'b1010: begin
                iicaddr = 8'd8;
                iicdata = 8'd128;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b1011;
                end
                else begin
                    reg_prog_nextstate = 5'b1010;
                end
            end
            5'b1011: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b1100;
                end
                else begin
                    reg_prog_nextstate = 5'b1011;
                end
            end
            5'b1100: begin
                iicaddr = 8'd9;
                iicdata = 8'd1;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b1101;
                end
                else begin
                    reg_prog_nextstate = 5'b1100;
                end
            end
            5'b1101: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b1110;
                end
                else begin
                    reg_prog_nextstate = 5'b1101;
                end
            end
            5'b1110: begin
                iicaddr = 8'd10;
                iicdata = 8'd128;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b1111;
                end
                else begin
                    reg_prog_nextstate = 5'b1110;
                end
            end
            5'b1111: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b10000;
                end
                else begin
                    reg_prog_nextstate = 5'b1111;
                end
            end
            5'b10000: begin
                iicaddr = 8'd11;
                iicdata = 8'd71;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b10001;
                end
                else begin
                    reg_prog_nextstate = 5'b10000;
                end
            end
            5'b10001: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b10010;
                end
                else begin
                    reg_prog_nextstate = 5'b10001;
                end
            end
            5'b10010: begin
                iicaddr = 8'd12;
                iicdata = 8'd64;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b10011;
                end
                else begin
                    reg_prog_nextstate = 5'b10010;
                end
            end
            5'b10011: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b10100;
                end
                else begin
                    reg_prog_nextstate = 5'b10011;
                end
            end
            5'b10100: begin
                iicaddr = 8'd14;
                iicdata = 8'd1;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b10101;
                end
                else begin
                    reg_prog_nextstate = 5'b10100;
                end
            end
            5'b10101: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b10110;
                end
                else begin
                    reg_prog_nextstate = 5'b10101;
                end
            end
            5'b10110: begin
                iicaddr = 8'd16;
                iicdata = 8'd0;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b10111;
                end
                else begin
                    reg_prog_nextstate = 5'b10110;
                end
            end
            5'b10111: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                if ((iic_stop == 1'b0)) begin
                    reg_prog_nextstate = 5'b11000;
                end
                else begin
                    reg_prog_nextstate = 5'b10111;
                end
            end
            5'b11000: begin
                iicaddr = 8'd17;
                iicdata = 8'd28;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b11001;
                end
                else begin
                    reg_prog_nextstate = 5'b11000;
                end
            end
            5'b11001: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b1;
                begin
                    reg_prog_nextstate = 5'b11010;
                end
            end
            5'b11010: begin
                iicaddr = 8'd18;
                iicdata = 8'd9;
                iic_start = 1'b0;
                if ((iic_stop == 1'b1)) begin
                    reg_prog_nextstate = 5'b11011;
                end
                else begin
                    reg_prog_nextstate = 5'b11010;
                end
            end
            default: begin
                iicaddr = 8'd0;
                iicdata = 8'd0;
                iic_start = 1'b0;
                reg_prog_nextstate = reg_prog_state;
            end
        endcase
    end
    always @(posedge tm3_clk_v2) begin
        begin
            rst <= 1'b1;
        end
        temp_reg1 <= tm3_vidin_rts0;
        temp_reg2 <= temp_reg1;
        if ((rst == 1'b0)) begin
            reg_prog_state <= 5'b1;
        end
        else if (((temp_reg1 == 1'b0) & (temp_reg2 == 1'b1))) begin
            reg_prog_state <= 5'b1;
        end
        else begin
            reg_prog_state <= reg_prog_nextstate;
        end
        if ((iic_stop == 1'b0)) begin
            iic_state <= (iic_state + 1);
        end
        else if ((iic_start == 1'b1)) begin
            iic_state <= 7'b1;
        end
    end
endmodule
