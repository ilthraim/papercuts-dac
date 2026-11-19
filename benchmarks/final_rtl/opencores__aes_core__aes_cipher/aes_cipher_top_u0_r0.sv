
module aes_cipher_top_u0_r0 (
    input logic clk,
    input logic kld,
    output reg[31:0] out
);
    reg[3:0] rcnt;
    wire logic[3:0] rcnt_next;
    always @(posedge clk) begin
        if (kld) begin
            out <= 32'd16777216;
        end
        else begin
            out <= frcon(rcnt_next);
        end
    end
    assign rcnt_next = (rcnt + 4'b1);
    always @(posedge clk) begin
        if (kld) begin
            rcnt <= 4'b0;
        end
        else begin
            rcnt <= rcnt_next;
        end
    end
    function logic[31:0] frcon(input logic[3:0] i);
        case (i)  // synopsys parallel_case
            4'b0: begin
                frcon = 32'd16777216;
            end
            4'b1: begin
                frcon = 32'd33554432;
            end
            4'b10: begin
                frcon = 32'd67108864;
            end
            4'b11: begin
                frcon = 32'd134217728;
            end
            4'b100: begin
                frcon = 32'd268435456;
            end
            4'b101: begin
                frcon = 32'd536870912;
            end
            4'b110: begin
                frcon = 32'd1073741824;
            end
            4'b111: begin
                frcon = 32'd2147483648;
            end
            4'b1000: begin
                frcon = 32'd452984832;
            end
            4'b1001: begin
                frcon = 32'd905969664;
            end
            default: begin
                frcon = 32'd0;
            end
        endcase
    endfunction
endmodule