
module memset_memtroll__str #(
    parameter logic signed[31:0] ADDR_WIDTH = 5,
    parameter logic signed[31:0] DATA_WIDTH = 8
) (
    input logic clk,
    input logic[4:0] addr,
    input logic[7:0] data,
    input logic we,
    output reg[7:0] out
);
    reg[7:0] Mem[31:0];
    always @(posedge clk) begin
        if (we) begin
            Mem[addr] <= data;
        end
        out <= Mem[addr];
    end
endmodule