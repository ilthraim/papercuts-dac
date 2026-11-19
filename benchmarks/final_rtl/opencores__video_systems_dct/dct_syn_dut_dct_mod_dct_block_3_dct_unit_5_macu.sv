module dct_syn_dut_dct_mod_dct_block_3_dct_unit_5_macu (
    input logic clk,
    input logic ena,
    input logic dclr,
    input logic[7:0] din,
    input logic[12:0] coef,
    output reg[23:0] result
);
    wire logic[20:0] idin;
    wire logic[20:0] icoef;
    reg[20:0] mult_res;
    wire logic[23:0] ext_mult_res;
    assign icoef = {{8{coef[12]}}, coef};
    assign idin = {{13{din[7]}}, din};
    always @(posedge clk) begin
        mult_res <= (icoef * idin);
    end
    assign ext_mult_res = {{3{mult_res[20]}}, mult_res};
    always @(posedge clk) begin
        if (dclr) begin
            result <= ext_mult_res;
        end
        else begin
            result <= (ext_mult_res + result);
        end
    end
endmodule
