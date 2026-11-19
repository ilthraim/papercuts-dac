
module oc54_cpu_cpu_alu (
    input logic clk,
    input logic ena,
    input logic[6:0] inst,
    input logic[1:0] seli,
    input logic doublet,
    input logic[39:0] a,
    input logic[39:0] b,
    input logic[39:0] s,
    input logic[15:0] t,
    input logic[15:0] cb,
    input logic bp_a,
    input logic bp_b,
    input logic[39:0] bp_ar,
    input logic[39:0] bp_br,
    input logic c16,
    input logic sxm,
    input logic ci,
    input logic tci,
    output reg co,
    output reg tco,
    output reg[39:0] result
);
    reg[39:0] iresult;
    reg itco;
    reg ico;
    reg[39:0] x;
    wire logic[39:0] y;
    reg dc16;
    reg dci;
    reg dtci;
    reg[6:0] dinst;
    always @(posedge clk) begin
        if (ena) begin
            case (seli)
                2'b0: begin
                    if (doublet) begin
                        x <= {8'd0, t, t};
                    end
                    else begin
                        x <= {{24{(sxm ? t[15] : 1'b0)}}, t};
                    end
                end
                2'b1: begin
                    x <= (bp_a ? bp_ar : a);
                end
                2'b10: begin
                    x <= (bp_b ? bp_br : b);
                end
                2'b11: begin
                    x <= {{24{(sxm ? cb[15] : 1'b0)}}, cb};
                end
            endcase
        end
    end
    assign y = s;
    always @(posedge clk) begin
        if (ena) begin
            dc16 <= c16;
            dci <= ci;
            dtci <= tci;
            dinst <= inst;
        end
    end
    always @(dinst or x or y or dc16 or dtci or dci) begin
        ico = dci;
        itco = dtci;
        iresult = x;
        case (dinst)
            7'b0: begin
                if (x[39]) begin
                    iresult = (~(x) + 1'b1);
                end
                else begin
                    iresult = x;
                end
                ico = ~|(iresult);
            end
            7'b10: begin
                iresult = ((x + y) + dci);
                ico = iresult[32];
            end
            7'b100: begin
                ico = (x > y);
                iresult = ((x > y) ? x : y);
            end
            7'b1: begin
                iresult = (~(x) + 1'b1);
                ico = ~|(iresult);
            end
            7'b11: begin
                iresult = ((x - y) - ~(dci));
                ico = iresult[32];
            end
            7'b101: begin
                iresult = (x - y);
                ico = iresult[32];
                if ((iresult > 0)) begin
                    iresult = ({x[38:0], 1'b0} + 1'b1);
                end
                else begin
                    iresult = {x[38:0], 1'b0};
                end
            end
            7'b1000: begin
                if (dc16) begin
                    iresult[39:16] = (x[31:16] + y[31:16]);
                    iresult[15:0] = (x[15:0] + y[15:0]);
                end
                else begin
                    {ico, iresult} = (x + y);
                end
            end
            7'b1100: begin
                if (dc16) begin
                    iresult[39:16] = (x[31:16] - y[31:16]);
                    iresult[15:0] = (x[15:0] - y[15:0]);
                end
                else begin
                    iresult = (x - y);
                    ico = iresult[32];
                end
            end
            7'b1101: begin
                if (dc16) begin
                    iresult[39:16] = (y[31:16] - x[31:16]);
                    iresult[15:0] = (y[15:0] - x[15:0]);
                end
                else begin
                    iresult = (y - x);
                    ico = iresult[32];
                end
            end
            7'b1110: begin
                if (dc16) begin
                    iresult[39:16] = (y[31:16] - x[31:16]);
                    iresult[15:0] = (y[15:0] + x[15:0]);
                end
                else begin
                    iresult = (y - x);
                    ico = iresult[32];
                end
            end
            7'b1001: begin
                if (dc16) begin
                    iresult[39:16] = (y[31:16] + x[31:16]);
                    iresult[15:0] = (y[15:0] - x[15:0]);
                end
                else begin
                    iresult = (x + y);
                    ico = iresult[32];
                end
            end
            7'b10000: begin
                iresult = ~(x);
            end
            7'b10001: begin
                iresult = (x & y);
            end
            7'b10010: begin
                iresult = (x | y);
            end
            7'b10011: begin
                iresult = (x ^ y);
            end
            7'b10100: begin
                iresult[39:32] = 8'd0;
                iresult[31:0] = {x[30:0], dci};
                ico = x[31];
            end
            7'b10101: begin
                iresult[39:32] = 8'd0;
                iresult[31:0] = {x[30:0], dtci};
                ico = x[31];
            end
            7'b10110: begin
                iresult[39:32] = 8'd0;
                iresult[31:0] = {dci, x[31:1]};
                ico = x[0];
            end
            7'b10111: begin
                if ((x[31] & x[30])) begin
                    iresult = {x[38:0], 1'b0};
                    itco = 1'b0;
                end
                else begin
                    iresult = x;
                    itco = 1'b1;
                end
            end
            7'b100000: begin
                itco = ~|((x[15:0] & y[15:0]));
            end
            7'b100001: begin
                itco = y[~(x[3:0])];
            end
            7'b100100: begin
                itco = ~|((x ^ y));
            end
            7'b100101: begin
                itco = (x < y);
            end
            7'b100110: begin
                itco = (x > y);
            end
            7'b100111: begin
                itco = |((x ^ y));
            end
            default: begin
                ico = dci;
                itco = dtci;
                iresult = x;
            end
        endcase
    end
    always @(posedge clk) begin
        if (ena) begin
            result <= iresult;
        end
    end
    always @(posedge clk) begin
        if (ena) begin
            tco <= itco;
            co <= ico;
        end
    end
endmodule