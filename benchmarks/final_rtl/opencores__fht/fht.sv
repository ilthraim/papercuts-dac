module fht (
    input logic clk,
    input logic reset,
    input logic[7:0] data_i,
    output reg[7:0] data_o
);
    wire logic[7:0] comp;
    reg[7:0] data_d;
    reg [0:0] a;
    reg [0:0] b;
    reg[7:0] comp_d;
    reg [0:0] temp_d;
    reg[7:0] temp;
    reg[1:0] cnt;
    reg data_valid;
    always @(posedge clk or negedge reset) begin
        if (!(reset)) begin
            data_d <= 32'd0;
            comp_d <= 32'd0;
            temp_d <= 32'd0;
        end
        else begin
            data_d <= data_i;
            comp_d <= comp;
            temp_d <= temp;
        end
    end
    always @(posedge clk or negedge reset) begin
        if (!(reset)) begin
            cnt <= 32'd0;
        end
        else begin
            cnt <= (cnt + 32'd1);
        end
    end
    always @(cnt or data_d or a or b or temp_d) begin
        case (cnt)
            2'b0: begin
                temp = data_d;
                data_valid = 32'd0;
            end
            2'b1: begin
                temp = comp_d;
                data_valid = 32'd0;
            end
            2'b10: begin
                temp = comp_d;
                data_valid = 32'd1;
            end
            default: begin
                temp = temp_d;
                data_valid = 32'd0;
            end
        endcase
    end
    assign comp = {(temp[6] - temp[7]), (temp[4] - temp[5]), (temp[2] - temp[3]), (temp[0] - temp[1]), (temp[6] + temp[7]), (temp[4] + temp[5]), (temp[2] + temp[3]), (temp[0] + temp[1])};
    always @(posedge clk or negedge reset) begin
        if (!(reset)) begin
            data_o <= 32'd0;
        end
        else if (data_valid) begin
            data_o <= temp;
        end
    end
endmodule