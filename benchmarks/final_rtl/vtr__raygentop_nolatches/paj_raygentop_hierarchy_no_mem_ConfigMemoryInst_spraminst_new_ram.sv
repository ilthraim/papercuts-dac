
module paj_raygentop_hierarchy_no_mem_ConfigMemoryInst_spraminst_new_ram #(
    parameter logic signed[31:0] ADDR_WIDTH = 8,
    parameter logic signed[31:0] DATA_WIDTH = 21
) (
    input logic clk,
    input logic[7:0] addr,
    input logic[20:0] data,
    input logic we,
    output reg[20:0] out
);
    reg[20:0] Mem[255:0];
    always @(posedge clk) begin
        if (we) begin
            Mem[addr] <= data;
        end
        out <= Mem[addr];
    end
endmodule