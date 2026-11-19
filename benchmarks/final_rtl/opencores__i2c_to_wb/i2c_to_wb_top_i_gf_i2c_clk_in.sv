module i2c_to_wb_top_i_gf_i2c_clk_in #(
    parameter logic signed[31:0] SIZE = 3
) (
    input logic in,
    output reg out,
    output logic rise,
    output logic fall,
    input logic clk,
    input logic rst
);
    reg in_reg;
    always @(posedge clk) begin
        in_reg <= in;
    end
    reg[2:0] buffer;
    always @(posedge clk) begin
        buffer <= {buffer[1:0], in_reg};
    end
    wire logic all_hi = &({in_reg, buffer});
    wire logic all_lo = ~|({in_reg, buffer});
    wire logic out_en = (all_hi | all_lo);
    always @(posedge clk) begin
        if (out_en) begin
            out <= buffer[2];
        end
    end
    assign fall = (all_lo & out);
    assign rise = (all_hi & ~(out));
endmodule
