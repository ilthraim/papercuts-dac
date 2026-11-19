
module mips_16_core_top_ID_stage_inst (
    input logic clk,
    input logic rst,
    input logic instruction_decode_en,
    output reg[56:0] pipeline_reg_out,
    input logic[15:0] instruction,
    output logic[5:0] branch_offset_imm,
    output reg branch_taken,
    output logic[2:0] reg_read_addr_1,
    output logic[2:0] reg_read_addr_2,
    input logic[15:0] reg_read_data_1,
    input logic[15:0] reg_read_data_2,
    output logic[2:0] decoding_op_src1,
    output logic[2:0] decoding_op_src2
);
    reg[15:0] instruction_reg;
    wire logic[3:0] ir_op_code;
    wire logic[2:0] ir_dest;
    wire logic[2:0] ir_src1;
    wire logic[2:0] ir_src2;
    wire logic[5:0] ir_imm;
    reg write_back_en;
    wire logic[2:0] write_back_dest;
    reg write_back_result_mux;
    wire logic mem_write_en;
    wire logic[15:0] mem_write_data;
    reg[2:0] ex_alu_cmd;
    wire logic[15:0] ex_alu_src1;
    wire logic[15:0] ex_alu_src2;
    reg alu_src2_mux;
    wire logic decoding_op_is_branch;
    wire logic decoding_op_is_store;
    wire logic[3:0] ir_op_code_with_bubble;
    wire logic[2:0] ir_dest_with_bubble;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            instruction_reg <= 0;
        end
        else begin
            if (instruction_decode_en) begin
                instruction_reg <= instruction;
            end
        end
    end
    assign ir_op_code = instruction_reg[15:12];
    assign ir_dest = instruction_reg[11:9];
    assign ir_src1 = instruction_reg[8:6];
    assign ir_src2 = (decoding_op_is_store ? instruction_reg[11:9] : instruction_reg[5:3]);
    assign ir_imm = instruction_reg[5:0];
    assign ir_op_code_with_bubble = (instruction_decode_en ? ir_op_code : 0);
    assign ir_dest_with_bubble = (instruction_decode_en ? ir_dest : 0);
    always @* begin begin
            case (ir_op_code_with_bubble)
                4'b0: begin
                    write_back_en = 0;
                    write_back_result_mux = 1'bx;
                    ex_alu_cmd = 3'bxxx;
                    alu_src2_mux = 1'bx;
                end
                4'b1: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b0;
                    alu_src2_mux = 0;
                end
                4'b10: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b1;
                    alu_src2_mux = 0;
                end
                4'b11: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b10;
                    alu_src2_mux = 0;
                end
                4'b100: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b11;
                    alu_src2_mux = 0;
                end
                4'b101: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b100;
                    alu_src2_mux = 1'bx;
                end
                4'b110: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b101;
                    alu_src2_mux = 0;
                end
                4'b111: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b110;
                    alu_src2_mux = 0;
                end
                4'b1000: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b111;
                    alu_src2_mux = 0;
                end
                4'b1001: begin
                    write_back_en = 1;
                    write_back_result_mux = 0;
                    ex_alu_cmd = 3'b0;
                    alu_src2_mux = 1;
                end
                4'b1010: begin
                    write_back_en = 1;
                    write_back_result_mux = 1;
                    ex_alu_cmd = 3'b0;
                    alu_src2_mux = 1;
                end
                4'b1011: begin
                    write_back_en = 0;
                    write_back_result_mux = 1'bx;
                    ex_alu_cmd = 3'b0;
                    alu_src2_mux = 1;
                end
                4'b1100: begin
                    write_back_en = 0;
                    write_back_result_mux = 1'bx;
                    ex_alu_cmd = 3'bxxx;
                    alu_src2_mux = 1;
                end
                default: begin
                    write_back_en = 0;
                    write_back_result_mux = 1'bx;
                    ex_alu_cmd = 3'bxxx;
                    alu_src2_mux = 1'bx;
                    $display("ERROR: Unknown Instruction: %b", ir_op_code_with_bubble);
                end
            endcase
        end
    end
    assign decoding_op_is_branch = ((ir_op_code == 4'b1100) ? 1 : 0);
    assign decoding_op_is_store = ((ir_op_code == 4'b1011) ? 1 : 0);
    assign mem_write_data = reg_read_data_2;
    assign mem_write_en = decoding_op_is_store;
    assign write_back_dest = ir_dest_with_bubble;
    assign ex_alu_src1 = reg_read_data_1;
    assign ex_alu_src2 = (alu_src2_mux ? {{10{ir_imm[5]}}, ir_imm} : reg_read_data_2);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pipeline_reg_out[56:0] <= 0;
        end
        else begin
            pipeline_reg_out[56:0] <= {ex_alu_cmd[2:0], ex_alu_src1[15:0], ex_alu_src2[15:0], mem_write_en, mem_write_data[15:0], write_back_en, write_back_dest[2:0], write_back_result_mux};
        end
    end
    assign reg_read_addr_1 = ir_src1;
    assign reg_read_addr_2 = ir_src2;
    always @* begin
        if (decoding_op_is_branch) begin
            case (ir_dest_with_bubble)
                3'b0: begin
                    if ((reg_read_data_1 == 0)) begin
                        branch_taken = 1;
                    end
                    else begin
                        branch_taken = 0;
                    end
                end
                default: begin
                    branch_taken = 0;
                    $display("ERROR: Unknown branch condition %b, in branch instruction %b \n", ir_dest_with_bubble, ir_op_code_with_bubble);
                end
            endcase
        end
        else begin
            branch_taken = 0;
        end
    end
    assign branch_offset_imm = ir_imm;
    assign decoding_op_src1 = ir_src1;
    assign decoding_op_src2 = (((((ir_op_code == 4'b0) || (ir_op_code == 4'b1001)) || (ir_op_code == 4'b1010)) || (ir_op_code == 4'b1100)) ? 3'b0 : ir_src2);
endmodule