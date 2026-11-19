
module P16C5x_IDEC (
    input logic Rst,
    input logic Clk,
    input logic CE,
    input logic[11:0] DI,
    input logic Skip,
    output reg[9:0] dIR,
    output reg[11:0] ALU_Op,
    output reg[8:0] KI,
    output reg Err
);
    reg[9:0] ROM1;
    wire logic[3:0] ROM1_Addr;
    reg [9:0] ROM2;
    wire logic[3:0] ROM2_Addr;
    reg[11:0] ROM3;
    wire logic[5:0] ROM3_Addr;
    wire logic ROM1_Valid;
    wire logic dErr;
    wire logic[11:0] dALU_Op;
    assign ROM1_Addr = {DI[11], (DI[11] ? DI[10:8] : DI[2:0])};
    always @* begin
        case (ROM1_Addr)
            4'b0: begin
                ROM1 <= 10'd0;
            end
            4'b1: begin
                ROM1 <= 10'd0;
            end
            4'b10: begin
                ROM1 <= 10'd256;
            end
            4'b11: begin
                ROM1 <= 10'd8;
            end
            4'b100: begin
                ROM1 <= 10'd16;
            end
            4'b101: begin
                ROM1 <= 10'd32;
            end
            4'b110: begin
                ROM1 <= 10'd64;
            end
            4'b111: begin
                ROM1 <= 10'd128;
            end
            4'b1000: begin
                ROM1 <= 10'd516;
            end
            4'b1001: begin
                ROM1 <= 10'd514;
            end
            4'b1010: begin
                ROM1 <= 10'd513;
            end
            4'b1011: begin
                ROM1 <= 10'd513;
            end
            4'b1100: begin
                ROM1 <= 10'd512;
            end
            4'b1101: begin
                ROM1 <= 10'd512;
            end
            4'b1110: begin
                ROM1 <= 10'd512;
            end
            4'b1111: begin
                ROM1 <= 10'd512;
            end
        endcase
    end
    assign ROM1_Valid = (DI[11] ? DI[11] : ~|(DI[10:3]));
    assign ROM2_Addr = {DI[11], ( DI[10:8])};
    always @* begin
        case (ROM2_Addr)
            4'b0: begin
                ROM2 <= 12'd0;
            end
            4'b1: begin
                ROM2 <= 12'd0;
            end
            4'b10: begin
                ROM2 <= 12'd0;
            end
            4'b11: begin
                ROM2 <= 12'd0;
            end
            4'b100: begin
                ROM2 <= 12'd0;
            end
            4'b101: begin
                ROM2 <= 12'd0;
            end
            4'b110: begin
                ROM2 <= 12'd0;
            end
            4'b111: begin
                ROM2 <= 12'd0;
            end
            4'b1000: begin
                ROM2 <= 12'd520;
            end
            4'b1001: begin
                ROM2 <= 12'd8;
            end
            4'b1010: begin
                ROM2 <= 12'd0;
            end
            4'b1011: begin
                ROM2 <= 12'd0;
            end
            4'b1100: begin
                ROM2 <= 12'd520;
            end
            4'b1101: begin
                ROM2 <= 12'd621;
            end
            4'b1110: begin
                ROM2 <= 12'd622;
            end
            4'b1111: begin
                ROM2 <= 12'd623;
            end
        endcase
    end
    assign ROM3_Addr = DI[10:5];
    always @* begin
        case (ROM3_Addr)
            6'b0: begin
                ROM3 <= 12'd0;
            end
            6'b1: begin
                ROM3 <= 12'd3204;
            end
            6'b10: begin
                ROM3 <= 12'd640;
            end
            6'b11: begin
                ROM3 <= 12'd3200;
            end
            6'b100: begin
                ROM3 <= 12'd1591;
            end
            6'b101: begin
                ROM3 <= 12'd3127;
            end
            6'b110: begin
                ROM3 <= 12'd1570;
            end
            6'b111: begin
                ROM3 <= 12'd3106;
            end
            6'b1000: begin
                ROM3 <= 12'd1637;
            end
            6'b1001: begin
                ROM3 <= 12'd3173;
            end
            6'b1010: begin
                ROM3 <= 12'd1638;
            end
            6'b1011: begin
                ROM3 <= 12'd3174;
            end
            6'b1100: begin
                ROM3 <= 12'd1639;
            end
            6'b1101: begin
                ROM3 <= 12'd3175;
            end
            6'b1110: begin
                ROM3 <= 12'd1588;
            end
            6'b1111: begin
                ROM3 <= 12'd3124;
            end
            6'b10000: begin
                ROM3 <= 12'd1568;
            end
            6'b10001: begin
                ROM3 <= 12'd3104;
            end
            6'b10010: begin
                ROM3 <= 12'd1600;
            end
            6'b10011: begin
                ROM3 <= 12'd3136;
            end
            6'b10100: begin
                ROM3 <= 12'd1569;
            end
            6'b10101: begin
                ROM3 <= 12'd3105;
            end
            6'b10110: begin
                ROM3 <= 12'd1794;
            end
            6'b10111: begin
                ROM3 <= 12'd3330;
            end
            6'b11000: begin
                ROM3 <= 12'd1682;
            end
            6'b11001: begin
                ROM3 <= 12'd3218;
            end
            6'b11010: begin
                ROM3 <= 12'd1683;
            end
            6'b11011: begin
                ROM3 <= 12'd2451;
            end
            6'b11100: begin
                ROM3 <= 12'd1665;
            end
            6'b11101: begin
                ROM3 <= 12'd3201;
            end
            6'b11110: begin
                ROM3 <= 12'd1793;
            end
            6'b11111: begin
                ROM3 <= 12'd3329;
            end
            6'b100000: begin
                ROM3 <= 12'd3264;
            end
            6'b100001: begin
                ROM3 <= 12'd3265;
            end
            6'b100010: begin
                ROM3 <= 12'd3266;
            end
            6'b100011: begin
                ROM3 <= 12'd3267;
            end
            6'b100100: begin
                ROM3 <= 12'd3268;
            end
            6'b100101: begin
                ROM3 <= 12'd3269;
            end
            6'b100110: begin
                ROM3 <= 12'd3270;
            end
            6'b100111: begin
                ROM3 <= 12'd3271;
            end
            6'b101000: begin
                ROM3 <= 12'd3272;
            end
            6'b101001: begin
                ROM3 <= 12'd3273;
            end
            6'b101010: begin
                ROM3 <= 12'd3274;
            end
            6'b101011: begin
                ROM3 <= 12'd3275;
            end
            6'b101100: begin
                ROM3 <= 12'd3276;
            end
            6'b101101: begin
                ROM3 <= 12'd3277;
            end
            6'b101110: begin
                ROM3 <= 12'd3278;
            end
            6'b101111: begin
                ROM3 <= 12'd3279;
            end
            6'b110000: begin
                ROM3 <= 12'd1472;
            end
            6'b110001: begin
                ROM3 <= 12'd1473;
            end
            6'b110010: begin
                ROM3 <= 12'd1474;
            end
            6'b110011: begin
                ROM3 <= 12'd1475;
            end
            6'b110100: begin
                ROM3 <= 12'd1476;
            end
            6'b110101: begin
                ROM3 <= 12'd1477;
            end
            6'b110110: begin
                ROM3 <= 12'd1478;
            end
            6'b110111: begin
                ROM3 <= 12'd1479;
            end
            6'b111000: begin
                ROM3 <= 12'd1480;
            end
            6'b111001: begin
                ROM3 <= 12'd1481;
            end
            6'b111010: begin
                ROM3 <= 12'd1482;
            end
            6'b111011: begin
                ROM3 <= 12'd1483;
            end
            6'b111100: begin
                ROM3 <= 12'd1484;
            end
            6'b111101: begin
                ROM3 <= 12'd1485;
            end
            6'b111110: begin
                ROM3 <= 12'd1486;
            end
            6'b111111: begin
                ROM3 <= 12'd1487;
            end
        endcase
    end
    assign dErr = (((((~|(DI[11:1]) & DI[0]) | (~|(DI[11:4]) & DI[3])) | (~|(DI[11:5]) & DI[4])) | (((~|(DI[11:7]) & DI[6]) & ~|(DI[5:4])) & |(DI[3:0]))) | (((~|(DI[11:7])) & ~(DI[5])) & DI[4]));
    always @(posedge Clk) begin
        if (Rst) begin
            dIR <= 0;
        end
        else if (CE) begin
            dIR <= (Skip ? 0 : (ROM1_Valid ? ROM1 : 0));
        end
    end
    assign dALU_Op = (ROM1_Valid ? ROM2 : {ROM3[11], (ROM3[10] & ~|(DI[4:0])), ROM3[9:0]});
    always @(posedge Clk) begin
        if (Rst) begin
            ALU_Op <= 0;
        end
        else if (CE) begin
            ALU_Op <= ((Skip | dErr) ? 0 : dALU_Op);
        end
    end
    always @(posedge Clk) begin
        if (Rst) begin
            KI <= 0;
        end
        else if (CE) begin
            KI <= (Skip ? KI : DI[8:0]);
        end
    end
    always @(posedge Clk) begin
        if (Rst) begin
            Err <= 0;
        end
        else if (CE) begin
            Err <= dErr;
        end
    end
endmodule