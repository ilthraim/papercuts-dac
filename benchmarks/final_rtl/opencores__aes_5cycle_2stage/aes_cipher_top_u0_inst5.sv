
module aes_cipher_top_u0_inst5 (
    input logic clk,
    input logic kld,
    output reg[7:0] out,
    output reg[7:0] out2
);
    reg[3:0] rcnt_reg;
    wire logic[3:0] rcnt_next;
    assign rcnt_next = (kld ? 0 : (rcnt_reg + 2));
    always @* begin
        out = ( frcon((rcnt_next - 1)));
        out2 = ( frcon(rcnt_next));
    end
    always @(posedge clk) begin
        rcnt_reg <= rcnt_next;
    end
    function logic[7:0] frcon(input logic[3:0] i);
        case (i)  // synopsys parallel_case
            4'b0: begin
                frcon = 8'd1;
            end
            4'b1: begin
                frcon = 8'd2;
            end
            4'b10: begin
                frcon = 8'd4;
            end
            4'b11: begin
                frcon = 8'd8;
            end
            4'b100: begin
                frcon = 8'd16;
            end
            4'b101: begin
                frcon = 8'd32;
            end
            4'b110: begin
                frcon = 8'd64;
            end
            4'b111: begin
                frcon = 8'd128;
            end
            4'b1000: begin
                frcon = 8'd27;
            end
            4'b1001: begin
                frcon = 8'd54;
            end
            default: begin
                frcon = 8'd0;
            end
        endcase
    endfunction
endmodule