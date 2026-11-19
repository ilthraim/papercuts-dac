
module mips_16_core_top_EX_stage_inst (
    input logic clk,
    input logic rst,
    input logic[56:0] pipeline_reg_in,
    output reg[37:0] pipeline_reg_out,
    output logic[2:0] ex_op_dest
);
    wire logic[2:0] alu_cmd = pipeline_reg_in[56:54];
    wire logic[15:0] alu_src1 = pipeline_reg_in[53:38];
    wire logic[15:0] alu_src2 = pipeline_reg_in[37:22];
    wire logic[15:0] ex_alu_result;
    mips_16_core_top_EX_stage_inst_alu_inst alu_inst (
        .a(alu_src1),
        .b(alu_src2),
        .cmd(alu_cmd),
        .r(ex_alu_result)
    );
    always @(posedge clk) begin begin
            pipeline_reg_out[37:22] <= ex_alu_result;
            pipeline_reg_out[21:0] <= pipeline_reg_in[21:0];
        end
    end
    assign ex_op_dest = pipeline_reg_in[3:1];
endmodule