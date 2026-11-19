
module oc54_cpu_cpu_bs (
    input logic clk,
    input logic ena,
    input logic[39:0] a,
    input logic[39:0] b,
    input logic[15:0] cb,
    input logic[15:0] db,
    input logic bp_a,
    input logic bp_b,
    input logic[39:0] bp_ar,
    input logic[39:0] bp_br,
    input logic l_na,
    input logic sxm,
    input logic[1:0] seli,
    input logic[1:0] selo,
    input logic[5:0] t,
    input logic[4:0] asm,
    input logic[4:0] imm,
    output reg[39:0] result,
    output reg co
);
    reg[5:0] shift_cnt;
    reg[39:0] operand;
    always @(selo or t or asm or imm) begin
        case (selo)
            2'b0: begin
                shift_cnt = t;
            end
            2'b1: begin
                shift_cnt = {asm[4], asm};
            end
            2'b10: begin
                shift_cnt = {imm[4], imm};
            end
            2'b11: begin
                shift_cnt = {imm[4:3], imm[3:0]};
            end
        endcase
    end
    always @(seli or bp_a or a or bp_ar or bp_b or b or bp_br or cb or db) begin
        case (seli)
            2'b0: begin
                operand = (bp_b ? bp_br : b);
            end
            2'b1: begin
                operand = (bp_a ? bp_ar : a);
            end
            2'b10: begin
                operand = db;
            end
            2'b11: begin
                operand = {cb, db};
            end
        endcase
    end
    always @(posedge clk) begin
        if (ena) begin
            if (l_na) begin
                if (shift_cnt[5]) begin
                    result[39:32] <= 8'd0;
                    result[31:0] <= (operand[31:0] >> (~(shift_cnt[4:0]) + 1'b1));
                    co <= operand[~(shift_cnt[4:0])];
                end
                else if (~|(shift_cnt[4:0])) begin
                    result <= operand;
                    co <= 1'b0;
                end
                else begin
                    result[39:32] <= 8'd0;
                    result[31:0] <= (operand[31:0] << shift_cnt[4:0]);
                    co <= operand[(5'b11111 - shift_cnt[4:0])];
                end
            end
            else if (shift_cnt[5]) begin
                if (sxm) begin
                    result <= ({{16{operand[39]}}, operand} >> (~(shift_cnt[4:0]) + 1'b1));
                end
                else begin
                    result <= (operand >> (~(shift_cnt[4:0]) + 1'b1));
                end
                co <= operand[~(shift_cnt[4:0])];
            end
            else begin
                result <= (operand << shift_cnt[4:0]);
                co <= operand[(6'b100111 - shift_cnt[4:0])];
            end
        end
    end
endmodule