
module mips_16_core_top_IF_stage_inst (
    input logic clk,
    input logic rst,
    input logic instruction_fetch_en,
    input logic[5:0] branch_offset_imm,
    input logic branch_taken,
    output reg[7:0] pc,
    output logic[15:0] instruction
);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            pc <= 8'd0;
        end
        else begin
            if (instruction_fetch_en) begin
                if (branch_taken) begin
                    pc <= (pc + {{2{branch_offset_imm[5]}}, branch_offset_imm[5:0]});
                end
                else begin
                    pc <= (pc + 8'd1);
                end
            end
        end
    end
    mips_16_core_top_IF_stage_inst_imem imem (
        .clk(clk),
        .pc(pc),
        .instruction(instruction)
    );
endmodule