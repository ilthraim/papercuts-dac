
module mips_16_core_top_WB_stage_inst (
    input logic[36:0] pipeline_reg_in,
    output logic reg_write_en,
    output logic[2:0] reg_write_dest,
    output logic[15:0] reg_write_data,
    output logic[2:0] wb_op_dest
);
    wire logic[15:0] ex_alu_result = pipeline_reg_in[36:21];
    wire logic[15:0] mem_read_data = pipeline_reg_in[20:5];
    wire logic write_back_en = pipeline_reg_in[4];
    wire logic[2:0] write_back_dest = pipeline_reg_in[3:1];
    wire logic write_back_result_mux = pipeline_reg_in[0];
    assign reg_write_en = write_back_en;
    assign reg_write_dest = write_back_dest;
    assign reg_write_data = (write_back_result_mux ? mem_read_data : ex_alu_result);
    assign wb_op_dest = pipeline_reg_in[3:1];
endmodule