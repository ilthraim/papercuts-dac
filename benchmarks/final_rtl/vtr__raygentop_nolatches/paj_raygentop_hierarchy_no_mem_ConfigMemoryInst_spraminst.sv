
module paj_raygentop_hierarchy_no_mem_ConfigMemoryInst_spraminst (
    input logic we,
    output logic[20:0] dataout,
    input logic[20:0] datain,
    input logic clk
);
    reg[7:0] addr;
    always @(posedge clk) begin
        addr[0] <= we;
        addr[1] <= addr[0];
        addr[2] <= addr[1];
        addr[3] <= addr[2];
        addr[4] <= addr[3];
        addr[5] <= addr[4];
        addr[6] <= addr[5];
        addr[7] <= addr[6];
    end
    paj_raygentop_hierarchy_no_mem_ConfigMemoryInst_spraminst_new_ram #(
        .ADDR_WIDTH(8),
        .DATA_WIDTH(21)
    ) new_ram (
        .clk(clk),
        .addr(addr),
        .data(datain),
        .we(we),
        .out(dataout)
    );
endmodule