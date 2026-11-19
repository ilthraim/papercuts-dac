module ps2_top_i_ps2_translation_table (
    input logic reset_i,
    input logic clock_i,
    input logic translate_i,
    input logic[7:0] code_i,
    output logic[7:0] code_o,
    input logic[7:0] address_i,
    input logic[7:0] data_i,
    input logic we_i,
    input logic re_i,
    output logic[7:0] data_o,
    input logic rx_data_ready_i,
    output logic rx_translated_data_ready_o,
    input logic rx_read_i,
    output logic rx_read_o,
    input logic rx_released_i
);
    wire logic[7:0] translation_table_address = code_i;
    reg rx_translated_data_ready;
    always @(posedge clock_i or posedge reset_i) begin
        if (reset_i) begin
            rx_translated_data_ready <= 1'b0;
        end
        else if ((rx_read_i || !(translate_i))) begin
            rx_translated_data_ready <= 1'b0;
        end
        else begin
            rx_translated_data_ready <= rx_data_ready_i;
        end
    end
    reg[255:0] ps2_32byte_constant;
    reg[7:0] ram_out;
    always @(translation_table_address) begin
        case (translation_table_address[7:5])
            3'b0: begin
                ps2_32byte_constant = 256'h5b03111e1f2c71665a02101d702a386559290f3e40424464583c3b3d3f4143ff;
            end
            3'b1: begin
                ps2_32byte_constant = 256'h5f0908162432726a5e071522233031695d061314212f39685c040512202d2e67;
            end
            3'b10: begin
                ps2_32byte_constant = 256'h76632b751b1c363a6e620d1a7428736d610c19272635346c600a0b181725336b;
            end
            3'b11: begin
                ps2_32byte_constant = 256'h544649374a514e574501484d4c5053526f7f7e474b7d4f7c7b0e7a7978775655;
            end
            3'b100: begin
                ps2_32byte_constant = 256'h9f9e9d9c9b9a999897969594939291908f8e8d8c8b8a89888786855441828180;
            end
            3'b101: begin
                ps2_32byte_constant = 256'hbfbebdbcbbbab9b8b7b6b5b4b3b2b1b0afaeadacabaaa9a8a7a6a5a4a3a2a1a0;
            end
            3'b110: begin
                ps2_32byte_constant = 256'hdfdedddcdbdad9d8d7d6d5d4d3d2d1d0cfcecdcccbcac9c8c7c6c5c4c3c2c1c0;
            end
            3'b111: begin
                ps2_32byte_constant = 256'hfffefdfcfbfaf9f8f7f6f5f4f3f2f1f0efeeedecebeae9e8e7e6e5e4e3e2e1e0;
            end
        endcase
    end
    always @(posedge clock_i or posedge reset_i) begin
        if (reset_i) begin
            ram_out <= 8'd0;
        end
        else begin
            reg[7:0] bit_num;
            integer i;
            bit_num = (translation_table_address[4:0] << 3);
            for (i = 0; (i < 8); i = (i + 1)) begin
                ram_out[(bit_num % 8)] <= ps2_32byte_constant[bit_num];
                bit_num = (bit_num + 1'b1);
            end
        end
    end
    assign data_o = ram_out;
    assign code_o = (translate_i ? {(rx_released_i | ram_out[7]), ram_out[6:0]} : code_i);
    assign rx_translated_data_ready_o = (translate_i ? rx_translated_data_ready : rx_data_ready_i);
    assign rx_read_o = rx_read_i;
endmodule
