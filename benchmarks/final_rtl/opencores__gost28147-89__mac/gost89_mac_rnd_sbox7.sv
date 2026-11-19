
module gost89_mac_rnd_sbox7 (
    input logic[63:0] sbox,
    input logic[3:0] in,
    output reg[3:0] out
);
    always @(in or sbox) begin
        case (in)
            4'b0: begin
                out <= sbox[63:60];
            end
            4'b1: begin
                out <= sbox[59:56];
            end
            4'b10: begin
                out <= sbox[55:52];
            end
            4'b11: begin
                out <= sbox[51:48];
            end
            4'b100: begin
                out <= sbox[47:44];
            end
            4'b101: begin
                out <= sbox[43:40];
            end
            4'b110: begin
                out <= sbox[39:36];
            end
            4'b111: begin
                out <= sbox[35:32];
            end
            4'b1000: begin
                out <= sbox[31:28];
            end
            4'b1001: begin
                out <= sbox[27:24];
            end
            4'b1010: begin
                out <= sbox[23:20];
            end
            4'b1011: begin
                out <= sbox[19:16];
            end
            4'b1100: begin
                out <= sbox[15:12];
            end
            4'b1101: begin
                out <= sbox[11:8];
            end
            4'b1110: begin
                out <= sbox[7:4];
            end
            4'b1111: begin
                out <= sbox[3:0];
            end
        endcase
    end
endmodule