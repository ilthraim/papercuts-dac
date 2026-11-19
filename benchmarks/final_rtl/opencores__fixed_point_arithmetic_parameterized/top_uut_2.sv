
module top_uut_2 #(
    parameter logic signed[31:0] Q = 15,
    parameter logic signed[31:0] N = 32
) (
    input logic[31:0] dividend,
    input logic[31:0] divisor,
    input logic start,
    input logic clk,
    output logic[31:0] quotient_out,
    output logic complete
);
    reg[31:0] quotient;
    reg[31:0] dividend_copy;
    reg[61:0] divider_copy;
    reg[5:0] bit_sig;
    reg done;
    initial begin
        done = 1;
    end
    assign quotient_out = quotient;
    assign complete = done;
    always @(posedge clk) begin
        if ((done && start)) begin
            done <= 1'b0;
            bit_sig <= 45;
            quotient <= 0;
            dividend_copy <= {1'b0, dividend[30:0]};
            divider_copy[61] <= 0;
            divider_copy[60:30] <= divisor[30:0];
            divider_copy[29:0] <= 0;
            if ((((dividend[31] == 1) && (divisor[31] == 0)) || ((dividend[31] == 0) && (divisor[31] == 1)))) begin
                quotient[31] <= 1;
            end
            else begin
                quotient[31] <= 0;
            end
        end
        else if (!(done)) begin
            if ((dividend_copy >= divider_copy)) begin
                dividend_copy <= (dividend_copy - divider_copy);
                quotient[bit_sig] <= 1'b1;
            end
            divider_copy <= (divider_copy >> 1);
            if ((bit_sig == 0)) begin
                done <= 1'b1;
            end
            bit_sig <= (bit_sig - 1);
        end
    end
endmodule