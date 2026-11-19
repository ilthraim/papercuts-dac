
module top_uut_0 #(
    parameter logic signed[31:0] Q = 23,
    parameter logic signed[31:0] N = 32
) (
    input logic[31:0] a,
    input logic[31:0] b,
    output logic[31:0] c
);
    reg[31:0] res;
    assign c = res;
    always @(a or b) begin
        if (((a[31] == 1) && (b[31] == 1))) begin
            res[31] = 1;
            res[30:0] = (a[30:0] + b[30:0]);
        end
        else if (((a[31] == 0) && (b[31] == 0))) begin
            res[31] = 0;
            res[30:0] = (a[30:0] + b[30:0]);
        end
        else if (((a[31] == 0))) begin
            if ((a[30:0] > b[30:0])) begin
                res[31] = 1;
            end
            else begin
                res[31] = 0;
            end
            res[30:0] = (a[30:0] - b[30:0]);
        end
        else begin
            if ((a[30:0] < b[30:0])) begin
                res[31] = 1;
            end
            else begin
                res[31] = 0;
            end
            res[30:0] = (b[30:0] - a[30:0]);
        end
    end
endmodule