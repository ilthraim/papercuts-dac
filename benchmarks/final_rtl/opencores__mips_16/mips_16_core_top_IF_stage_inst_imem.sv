module mips_16_core_top_IF_stage_inst_imem (
    input logic clk,
    input logic[7:0] pc,
    output logic[15:0] instruction
);
    reg[15:0] rom[255:0];
    wire logic[7:0] rom_addr = pc[7:0];
    assign instruction = rom[rom_addr];
endmodule
