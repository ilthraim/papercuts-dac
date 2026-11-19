
module mips_16_core_top_MEM_stage_inst (
    input logic clk,
    input logic rst,
    input logic[37:0] pipeline_reg_in,
    output reg[36:0] pipeline_reg_out,
    output logic[2:0] mem_op_dest
);
    wire logic[15:0] ex_alu_result = pipeline_reg_in[37:22];
    wire logic mem_write_en = pipeline_reg_in[21];
    wire logic[15:0] mem_write_data = pipeline_reg_in[20:5];
    wire logic[15:0] mem_read_data;
    mips_16_core_top_MEM_stage_inst_dmem dmem (
        .clk(clk),
        .mem_access_addr(ex_alu_result),
        .mem_write_data(mem_write_data),
        .mem_write_en(mem_write_en),
        .mem_read_data(mem_read_data)
    );
    always @(posedge clk) begin begin
            pipeline_reg_out[36:21] <= ex_alu_result;
            pipeline_reg_out[20:5] <= mem_read_data;
            pipeline_reg_out[4:0] <= pipeline_reg_in[4:0];
        end
    end
    assign mem_op_dest = pipeline_reg_in[3:1];
endmodule