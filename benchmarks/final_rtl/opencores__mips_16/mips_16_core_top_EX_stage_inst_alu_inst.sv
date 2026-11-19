
module mips_16_core_top_EX_stage_inst_alu_inst (
    input logic[15:0] a,
    input logic[15:0] b,
    input logic[2:0] cmd,
    output reg[15:0] r
);
    always @* begin
        case (cmd)
            3'b0: begin
                r = (a + b);
            end
            3'b1: begin
                r = (a - b);
            end
            3'b10: begin
                r = (a & b);
            end
            3'b11: begin
                r = (a | b);
            end
            3'b100: begin
                r = (a ^ b);
            end
            3'b101: begin
                r = (a << b);
            end
            3'b110: begin
                r = ({{16{a[15]}}, a} >> b);
            end
            3'b111: begin
                r = ({16'd0, a} >> b);
            end
            default: begin
                r = 0;
                $display("ERROR: Unknown alu cmd: %b \n", cmd);
            end
        endcase
    end
endmodule