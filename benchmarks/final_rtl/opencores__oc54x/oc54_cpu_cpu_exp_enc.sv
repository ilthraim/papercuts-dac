
module oc54_cpu_cpu_exp_enc (
    input logic clk,
    input logic ena,
    input logic sel_acc,
    input logic[39:0] a,
    input logic[39:0] b,
    input logic[39:0] bp_ar,
    input logic[39:0] bp_br,
    input logic bp_a,
    input logic bp_b,
    output reg[5:0] result
);
    reg[39:0] acc;
    always @(posedge clk) begin
        if (ena) begin
            if (sel_acc) begin
                acc = (bp_b ? bp_br : b);
            end
            else begin
                acc = (bp_a ? bp_ar : a);
            end
        end
    end
    always @(posedge clk) begin
        if (ena) begin
            casex (acc)
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111000;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111001;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111010;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111011;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111100;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111101;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111110;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111111;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b0;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b10;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b11;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b100;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b101;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b110;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1000;
                end
                40'b1zzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1001;
                end
                40'b1zzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1010;
                end
                40'b1zzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1011;
                end
                40'b1zzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1100;
                end
                40'b1zzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1101;
                end
                40'b1zzzzzzzzzzzzzzzz: begin
                    result <= 6'b1110;
                end
                40'b1zzzzzzzzzzzzzzz: begin
                    result <= 6'b1111;
                end
                40'b1zzzzzzzzzzzzzz: begin
                    result <= 6'b10000;
                end
                40'b1zzzzzzzzzzzzz: begin
                    result <= 6'b10001;
                end
                40'b1zzzzzzzzzzzz: begin
                    result <= 6'b10010;
                end
                40'b1zzzzzzzzzzz: begin
                    result <= 6'b10011;
                end
                40'b1zzzzzzzzzz: begin
                    result <= 6'b10100;
                end
                40'b1zzzzzzzzz: begin
                    result <= 6'b10101;
                end
                40'b1zzzzzzzz: begin
                    result <= 6'b10110;
                end
                40'b1zzzzzzz: begin
                    result <= 6'b10111;
                end
                40'b1zzzzzz: begin
                    result <= 6'b11000;
                end
                40'b1zzzzz: begin
                    result <= 6'b11001;
                end
                40'b1zzzz: begin
                    result <= 6'b11010;
                end
                40'b1zzz: begin
                    result <= 6'b11011;
                end
                40'b1zz: begin
                    result <= 6'b11100;
                end
                40'b1z: begin
                    result <= 6'b11101;
                end
                40'h1: begin
                    result <= 6'b11110;
                end
                40'h0: begin
                    result <= 6'b11111;
                end
                40'b10zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111000;
                end
                40'b110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111001;
                end
                40'b1110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111010;
                end
                40'b11110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111011;
                end
                40'b111110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111100;
                end
                40'b1111110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111101;
                end
                40'b11111110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111110;
                end
                40'b111111110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111111;
                end
                40'b1111111110zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b0;
                end
                40'b11111111110zzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1;
                end
                40'b111111111110zzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b10;
                end
                40'b1111111111110zzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b11;
                end
                40'b11111111111110zzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b100;
                end
                40'b111111111111110zzzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b101;
                end
                40'b1111111111111110zzzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b110;
                end
                40'b11111111111111110zzzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b111;
                end
                40'b111111111111111110zzzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1000;
                end
                40'b1111111111111111110zzzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1001;
                end
                40'b11111111111111111110zzzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1010;
                end
                40'b111111111111111111110zzzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1011;
                end
                40'b1111111111111111111110zzzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1100;
                end
                40'b11111111111111111111110zzzzzzzzzzzzzzzzz: begin
                    result <= 6'b1101;
                end
                40'b111111111111111111111110zzzzzzzzzzzzzzzz: begin
                    result <= 6'b1110;
                end
                40'b1111111111111111111111110zzzzzzzzzzzzzzz: begin
                    result <= 6'b1111;
                end
                40'b11111111111111111111111110zzzzzzzzzzzzzz: begin
                    result <= 6'b10000;
                end
                40'b111111111111111111111111110zzzzzzzzzzzzz: begin
                    result <= 6'b10001;
                end
                40'b1111111111111111111111111110zzzzzzzzzzzz: begin
                    result <= 6'b10010;
                end
                40'b11111111111111111111111111110zzzzzzzzzzz: begin
                    result <= 6'b10011;
                end
                40'b111111111111111111111111111110zzzzzzzzzz: begin
                    result <= 6'b10100;
                end
                40'b1111111111111111111111111111110zzzzzzzzz: begin
                    result <= 6'b10101;
                end
                40'b11111111111111111111111111111110zzzzzzzz: begin
                    result <= 6'b10110;
                end
                40'b111111111111111111111111111111110zzzzzzz: begin
                    result <= 6'b10111;
                end
                40'b1111111111111111111111111111111110zzzzzz: begin
                    result <= 6'b11000;
                end
                40'b11111111111111111111111111111111110zzzzz: begin
                    result <= 6'b11001;
                end
                40'b111111111111111111111111111111111110zzzz: begin
                    result <= 6'b11010;
                end
                40'b1111111111111111111111111111111111110zzz: begin
                    result <= 6'b11011;
                end
                40'b11111111111111111111111111111111111110zz: begin
                    result <= 6'b11100;
                end
                40'b111111111111111111111111111111111111110z: begin
                    result <= 6'b11101;
                end
                40'hfffffffffe: begin
                    result <= 6'b11110;
                end
                40'hffffffffff: begin
                    result <= 6'b11111;
                end
            endcase
        end
    end
endmodule