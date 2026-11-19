module mips_16_core_top (
    input logic clk,
    input logic rst,
    output logic[7:0] pc
);
    wire logic pipeline_stall_n;
    wire logic[5:0] branch_offset_imm;
    wire logic branch_taken;
    wire logic[15:0] instruction;
    wire logic[56:0] ID_pipeline_reg_out;
    wire logic[37:0] EX_pipeline_reg_out;
    wire logic[36:0] MEM_pipeline_reg_out;
    wire logic[2:0] reg_read_addr_1;
    wire logic[2:0] reg_read_addr_2;
    wire logic[15:0] reg_read_data_1;
    wire logic[15:0] reg_read_data_2;
    wire logic[2:0] decoding_op_src1;
    wire logic[2:0] decoding_op_src2;
    wire logic[2:0] ex_op_dest;
    wire logic[2:0] mem_op_dest;
    wire logic[2:0] wb_op_dest;
    wire logic reg_write_en;
    wire logic[2:0] reg_write_dest;
    wire logic[15:0] reg_write_data;
    mips_16_core_top_IF_stage_inst IF_stage_inst (
        .clk(clk),
        .rst(rst),
        .instruction_fetch_en(pipeline_stall_n),
        .branch_offset_imm(branch_offset_imm),
        .branch_taken(branch_taken),
        .pc(pc),
        .instruction(instruction)
    );
    mips_16_core_top_ID_stage_inst ID_stage_inst (
        .clk(clk),
        .rst(rst),
        .instruction_decode_en(pipeline_stall_n),
        .pipeline_reg_out(ID_pipeline_reg_out),
        .instruction(instruction),
        .branch_offset_imm(branch_offset_imm),
        .branch_taken(branch_taken),
        .reg_read_addr_1(reg_read_addr_1),
        .reg_read_addr_2(reg_read_addr_2),
        .reg_read_data_1(reg_read_data_1),
        .reg_read_data_2(reg_read_data_2),
        .decoding_op_src1(decoding_op_src1),
        .decoding_op_src2(decoding_op_src2)
    );
    mips_16_core_top_EX_stage_inst EX_stage_inst (
        .clk(clk),
        .rst(rst),
        .pipeline_reg_in(ID_pipeline_reg_out),
        .pipeline_reg_out(EX_pipeline_reg_out),
        .ex_op_dest(ex_op_dest)
    );
    mips_16_core_top_MEM_stage_inst MEM_stage_inst (
        .clk(clk),
        .rst(rst),
        .pipeline_reg_in(EX_pipeline_reg_out),
        .pipeline_reg_out(MEM_pipeline_reg_out),
        .mem_op_dest(mem_op_dest)
    );
    mips_16_core_top_WB_stage_inst WB_stage_inst (
        .pipeline_reg_in(MEM_pipeline_reg_out),
        .reg_write_en(reg_write_en),
        .reg_write_dest(reg_write_dest),
        .reg_write_data(reg_write_data),
        .wb_op_dest(wb_op_dest)
    );
    mips_16_core_top_register_file_inst register_file_inst (
        .clk(clk),
        .rst(rst),
        .reg_write_en(reg_write_en),
        .reg_write_dest(reg_write_dest),
        .reg_write_data(reg_write_data),
        .reg_read_addr_1(reg_read_addr_1),
        .reg_read_data_1(reg_read_data_1),
        .reg_read_addr_2(reg_read_addr_2),
        .reg_read_data_2(reg_read_data_2)
    );
    mips_16_core_top_hazard_detection_unit_inst hazard_detection_unit_inst (
        .decoding_op_src1(decoding_op_src1),
        .decoding_op_src2(decoding_op_src2),
        .ex_op_dest(ex_op_dest),
        .mem_op_dest(mem_op_dest),
        .wb_op_dest(wb_op_dest),
        .pipeline_stall_n(pipeline_stall_n)
    );
endmodule