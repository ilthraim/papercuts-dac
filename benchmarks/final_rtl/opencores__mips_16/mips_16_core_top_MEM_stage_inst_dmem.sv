module mips_16_core_top_MEM_stage_inst_dmem (
    input logic clk,
    input logic[15:0] mem_access_addr,
    input logic[15:0] mem_write_data,
    input logic mem_write_en,
    output logic[15:0] mem_read_data
);
    reg[15:0] ram[255:0];
    wire logic[7:0] ram_addr = mem_access_addr[7:0];
    always @(posedge clk) begin
        if (mem_write_en) begin
            ram[ram_addr] <= mem_write_data;
        end
    end
    assign mem_read_data = ram[ram_addr];
endmodule
