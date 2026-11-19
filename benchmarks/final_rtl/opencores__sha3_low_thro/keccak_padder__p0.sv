module keccak_padder__p0 (
    input logic[31:0] in,
    input logic[1:0] byte_num,
    output reg[31:0] out
);
    always @* begin
        case (byte_num)
            0: begin
                out = 32'd16777216;
            end
            1: begin
                out = {in[31:24], 24'd65536};
            end
            2: begin
                out = {in[31:16], 16'd256};
            end
            3: begin
                out = {in[31:8], 8'd1};
            end
        endcase
    end
endmodule
