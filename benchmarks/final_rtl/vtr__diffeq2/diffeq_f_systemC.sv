module diffeq_f_systemC (
    input logic[31:0] aport,
    input logic[31:0] dxport,
    output reg[31:0] xport,
    output reg[31:0] yport,
    output reg[31:0] uport,
    input logic clk,
    input logic reset
);
    wire logic [0:0] temp;
    assign temp = (uport * dxport);
    always @(posedge clk) begin
        if ((reset == 1'b1)) begin
            xport <= 0;
            yport <= 0;
            uport <= 0;
        end
        else if ((xport < aport)) begin
            xport <= (xport + dxport);
            yport <= (yport + temp);
            uport <= ((uport - (temp * (5 * xport))) - (dxport * (3 * yport)));
        end
    end
endmodule