module oc54_cpu_cpu_acc_a (
    input logic clk,
    input logic ena,
    input logic[1:0] seli,
    input logic we,
    input logic[39:0] a,
    input logic[39:0] b,
    input logic[39:0] alu,
    input logic[39:0] mac,
    input logic ovm,
    input logic rnd,
    output reg zf,
    output reg ovf,
    output reg[39:0] result,
    output logic[39:0] bp_result
);
    reg[39:0] sel_r;
    reg[39:0] iresult;
    wire logic iovf;
    always @(seli or a or b or alu or mac or rnd) begin
        case (seli)
            2'b0: begin
                sel_r = a;
            end
            2'b1: begin
                sel_r = b;
            end
            2'b10: begin
                sel_r = alu;
            end
            2'b11: begin
                sel_r = (rnd ? ((mac + 16'd32768) & 40'hffffff0000) : mac);
            end
        endcase
    end
    assign iovf = !((&(sel_r[39:32]) | &(~(sel_r[39:32]))));
    always @(iovf or ovm or sel_r) begin
        if ((ovm & iovf)) begin
            if (sel_r[39]) begin
                iresult <= 40'hff80000000;
            end
            else begin
                iresult <= 40'h7fffffff;
            end
        end
        else begin
            iresult <= sel_r;
        end
    end
    assign bp_result = iresult;
    always @(posedge clk) begin
        if (ena) begin
            result <= iresult;
        end
    end
    always @(posedge clk) begin
        if (ena) begin
            ovf <= iovf;
            zf <= ~|(iresult);
        end
    end
endmodule
