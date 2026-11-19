module top (
    input logic enable,
    input logic[31:0] degrees,
    output reg[63:0] data1,
    input logic rst,
    input logic[2:0] actv,
    input logic clk
);
    reg[31:0] degrees_tmp1;
    reg[31:0] degrees_tmp2;
    reg[1:0] quad;
    reg sin_enable;
    reg cos_enable;
    reg tan_enable;
    reg csc_enable;
    reg sec_enable;
    reg cot_enable;
    wire logic[63:0] data_sin;
    wire logic[63:0] data_cos;
    wire logic[63:0] data_tan;
    wire logic[63:0] data_csc;
    wire logic[63:0] data_sec;
    wire logic[63:0] data_cot;
    wire logic [8:0] divider_out;
    top_a1 a1 (
        .quad(quad),
        .enable(sin_enable),
        .degrees(degrees_tmp2),
        .data(data_sin),
        .rst(rst),
        .clk(clk)
    );
    top_a2 a2 (
        .quad(quad),
        .enable(cos_enable),
        .degrees(degrees_tmp2),
        .data(data_cos),
        .rst(rst),
        .clk(clk)
    );
    top_a3 a3 (
        .quad(quad),
        .enable(tan_enable),
        .degrees(degrees_tmp2),
        .data(data_tan),
        .rst(rst),
        .clk(clk)
    );
    top_a4 a4 (
        .quad(quad),
        .enable(csc_enable),
        .degrees(degrees_tmp2),
        .data(data_csc),
        .rst(rst),
        .clk(clk)
    );
    top_a5 a5 (
        .quad(quad),
        .enable(sec_enable),
        .degrees(degrees_tmp2),
        .data(data_sec),
        .rst(rst),
        .clk(clk)
    );
    top_a6 a6 (
        .quad(quad),
        .enable(cot_enable),
        .degrees(degrees_tmp2),
        .data(data_cot),
        .rst(rst),
        .clk(clk)
    );
    top_a7 a7 (
        .clk(clk),
        .inp(degrees),
        .rst(rst),
        .out(divider_out)
    );
    always @(posedge clk) begin
        if (rst) begin
            sin_enable <= 0;
            cos_enable <= 0;
            tan_enable <= 0;
            csc_enable <= 0;
            sec_enable <= 0;
            cot_enable <= 0;
        end
        else begin
            sin_enable <= ((actv == 3'b0) ? enable : 1'b0);
            cos_enable <= ((actv == 3'b1) ? enable : 1'b0);
            tan_enable <= ((actv == 3'b10) ? enable : 1'b0);
            csc_enable <= ((actv == 3'b11) ? enable : 1'b0);
            sec_enable <= ((actv == 3'b100) ? enable : 1'b0);
            cot_enable <= ((actv == 3'b101) ? enable : 1'b0);
        end
    end
    always @(posedge clk) begin
        if ((degrees > 32'd360)) begin
            if ((divider_out > 32'd270)) begin
                quad <= 2'b11;
                degrees_tmp2 <= (divider_out - 32'd270);
            end
            else if (((divider_out > 32'd180))) begin
                quad <= 2'b10;
                degrees_tmp2 <= (divider_out - 32'd180);
            end
            else if (((divider_out > 32'd90))) begin
                degrees_tmp2 <= (32'd180 - divider_out);
                quad <= 2'b1;
            end
            else begin
                degrees_tmp2 <= divider_out;
                quad <= 2'b0;
            end
        end
        else if (((degrees > 32'd180))) begin
            degrees_tmp1 <= (degrees - 32'd180);
            begin
                if ((degrees_tmp1 > 32'd90)) begin
                    quad <= 2'b11;
                    degrees_tmp2 <= (32'd180 - degrees_tmp1);
                end
                else begin
                    quad <= 2'b10;
                    degrees_tmp2 <= degrees_tmp1;
                end
            end
        end
        else if (((degrees > 32'd90))) begin
            quad <= 2'b1;
            degrees_tmp2 <= (32'd180 - degrees);
        end
        else begin
            quad <= 2'b0;
            degrees_tmp2 <= degrees;
        end
    end
    always @(posedge clk) begin
        case (actv)
            3'b0: begin
                data1 <= data_sin;
            end
            3'b1: begin
                data1 <= data_cos;
            end
            3'b10: begin
                data1 <= data_tan;
            end
            3'b11: begin
                data1 <= data_csc;
            end
            3'b100: begin
                data1 <= data_sec;
            end
            3'b101: begin
                data1 <= data_cot;
            end
            default: begin
                data1 <= 0;
            end
        endcase
    end
endmodule