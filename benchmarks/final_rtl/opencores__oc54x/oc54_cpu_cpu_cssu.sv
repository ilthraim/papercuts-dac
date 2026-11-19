module oc54_cpu_cpu_cssu (
    input logic clk,
    input logic ena,
    input logic sel_acc,
    input logic is_cssu,
    input logic[39:0] a,
    input logic[39:0] b,
    input logic[39:0] s,
    output reg tco,
    output reg[15:0] trn,
    output reg[15:0] result
);
    wire logic[31:0] acc;
    wire logic acc_cmp;
    assign acc = (sel_acc ? b[31:0] : a[31:0]);
    assign acc_cmp = (acc[31:16] > acc[15:0]);
    always @(posedge clk) begin
        if (ena) begin
            if (is_cssu) begin
                if (acc_cmp) begin
                    result <= acc[31:16];
                end
                else begin
                    result <= acc[15:0];
                end
            end
            else begin
                result <= s[15:0];
            end
            if (is_cssu) begin
                trn <= {trn[14:0], ~(acc_cmp)};
            end
            tco <= ~(acc_cmp);
        end
    end
endmodule
