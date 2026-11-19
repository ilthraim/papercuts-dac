
module mips_16_core_top_hazard_detection_unit_inst (
    input logic[2:0] decoding_op_src1,
    input logic[2:0] decoding_op_src2,
    input logic[2:0] ex_op_dest,
    input logic[2:0] mem_op_dest,
    input logic[2:0] wb_op_dest,
    output reg pipeline_stall_n
);
    always @* begin
        pipeline_stall_n = 1;
        if (((decoding_op_src1 != 0) && (((decoding_op_src1 == ex_op_dest) || (decoding_op_src1 == mem_op_dest)) || (decoding_op_src1 == wb_op_dest)))) begin
            pipeline_stall_n = 0;
        end
        if (((decoding_op_src2 != 0) && (((decoding_op_src2 == ex_op_dest) || (decoding_op_src2 == mem_op_dest)) || (decoding_op_src2 == wb_op_dest)))) begin
            pipeline_stall_n = 0;
        end
    end
endmodule