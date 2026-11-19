
module top_u_mul (
    input logic[15:0] a,
    input logic[15:0] b,
    output logic[15:0] out,
    input logic reset,
    input logic clk
);
    reg[15:0] a_flopped;
    reg[15:0] b_flopped;
    wire logic[15:0] mul_out_temp;
    reg[15:0] mul_out_temp_reg;
    always @(posedge clk) begin
        if (reset) begin
            a_flopped <= 0;
            b_flopped <= 0;
        end
        else begin
            a_flopped <= a;
            b_flopped <= b;
        end
    end
    top_u_mul_u_FPMult u_FPMult (
        .clk(clk),
        .rst(1'b0),
        .a(a_flopped),
        .b(b_flopped),
        .result(mul_out_temp),
        .flags()
    );
    always @(posedge clk) begin
        if (reset) begin
            mul_out_temp_reg <= 0;
        end
        else begin
            mul_out_temp_reg <= mul_out_temp;
        end
    end
    assign out = mul_out_temp_reg;
endmodule