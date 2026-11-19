module keccak_padder__p0 (
    input logic[63:0] in,
    input logic[2:0] byte_num,
    output reg[63:0] out
);
    always @* begin
        case (byte_num)
            0: begin
                out = 64'h100000000000000;
            end
            1: begin
                out = {in[63:56], 56'h1000000000000};
            end
            2: begin
                out = {in[63:48], 48'h10000000000};
            end
            3: begin
                out = {in[63:40], 40'h100000000};
            end
            4: begin
                out = {in[63:32], 32'd16777216};
            end
            5: begin
                out = {in[63:24], 24'd65536};
            end
            6: begin
                out = {in[63:16], 16'd256};
            end
            7: begin
                out = {in[63:8], 8'd1};
            end
        endcase
    end
endmodule
