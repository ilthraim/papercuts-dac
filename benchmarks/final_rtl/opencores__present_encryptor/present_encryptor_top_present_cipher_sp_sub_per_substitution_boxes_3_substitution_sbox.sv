
module present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_3_substitution_sbox (
    output reg[3:0] data_o,
    input logic[3:0] data_i
);
    always @(data_i) begin
        case (data_i)
            4'b0: begin
                data_o = 4'b1100;
            end
            4'b1: begin
                data_o = 4'b101;
            end
            4'b10: begin
                data_o = 4'b110;
            end
            4'b11: begin
                data_o = 4'b1011;
            end
            4'b100: begin
                data_o = 4'b1001;
            end
            4'b101: begin
                data_o = 4'b0;
            end
            4'b110: begin
                data_o = 4'b1010;
            end
            4'b111: begin
                data_o = 4'b1101;
            end
            4'b1000: begin
                data_o = 4'b11;
            end
            4'b1001: begin
                data_o = 4'b1110;
            end
            4'b1010: begin
                data_o = 4'b1111;
            end
            4'b1011: begin
                data_o = 4'b1000;
            end
            4'b1100: begin
                data_o = 4'b100;
            end
            4'b1101: begin
                data_o = 4'b111;
            end
            4'b1110: begin
                data_o = 4'b1;
            end
            4'b1111: begin
                data_o = 4'b10;
            end
        endcase
    end
endmodule