
module reduction_layer_in_data (
    input logic[4:0] addr,
    input logic[2047:0] d,
    input logic we,
    output reg[2047:0] q,
    input logic clk
);
    reg[2047:0] ram[31:0];
    always @(posedge clk) begin
        if (we) begin
            ram[addr] <= d;
        end
        else begin
            q <= ram[addr];
        end
    end
endmodule