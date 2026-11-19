
module oc54_cpu_cpu_mac (
    input logic clk,
    input logic ena,
    input logic[39:0] a,
    input logic[39:0] b,
    input logic[15:0] t,
    input logic[15:0] p,
    input logic[15:0] c,
    input logic[15:0] d,
    input logic[1:0] sel_xm,
    input logic[1:0] sel_ym,
    input logic[1:0] sel_ya,
    input logic bp_a,
    input logic bp_b,
    input logic[39:0] bp_ar,
    input logic[39:0] bp_br,
    input logic xm_s,
    input logic ym_s,
    input logic ovm,
    input logic frct,
    input logic smul,
    input logic add_sub,
    output reg[39:0] result
);
    reg[16:0] xm;
    reg[16:0] ym;
    reg[39:0] ya;
    reg[33:0] mult_res;
    wire logic[33:0] imult_res;
    reg[39:0] iresult;
    always @(posedge clk) begin
        if (ena) begin
            case (sel_xm)
                2'b0: begin
                    xm <= {(xm_s ? t[15] : 1'b0), t};
                end
                2'b1: begin
                    xm <= {(xm_s ? d[15] : 1'b0), d};
                end
                2'b10: begin
                    xm <= (bp_a ? bp_ar[32:16] : a[32:16]);
                end
                2'b11: begin
                    xm <= 17'd0;
                end
            endcase
        end
    end
    always @(posedge clk) begin
        if (ena) begin
            case (sel_ym)
                2'b0: begin
                    ym <= {(ym_s ? p[15] : 1'b0), p};
                end
                2'b1: begin
                    ym <= (bp_a ? bp_ar[32:16] : a[32:16]);
                end
                2'b10: begin
                    ym <= {(ym_s ? d[15] : 1'b0), d};
                end
                2'b11: begin
                    ym <= {(ym_s ? c[15] : 1'b0), c};
                end
            endcase
        end
    end
    always @(posedge clk) begin
        if (ena) begin
            casex (sel_ya)
                2'b0: begin
                    ya <= (bp_a ? bp_ar : a);
                end
                2'b1: begin
                    ya <= (bp_b ? bp_br : b);
                end
                2'b1z: begin
                    ya <= 40'h0;
                end
            endcase
        end
    end
    assign imult_res = (xm * ym);
    always @(xm or ym or smul or ovm or frct or imult_res) begin
        if (((((smul && ovm) && frct) && (xm[15:0] == 16'd32768)) && (ym[15:0] == 16'd32768))) begin
            mult_res = 34'h7ffffff;
        end
        else if (frct) begin
            mult_res = {imult_res[32:0], 1'b0};
        end
        else begin
            mult_res = imult_res;
        end
    end
    always @(mult_res or ya or add_sub) begin
        if (add_sub) begin
            iresult = (mult_res + ya);
        end
        else begin
            iresult = (mult_res - ya);
        end
    end
    always @(posedge clk) begin
        if (ena) begin
            result <= iresult;
        end
    end
endmodule