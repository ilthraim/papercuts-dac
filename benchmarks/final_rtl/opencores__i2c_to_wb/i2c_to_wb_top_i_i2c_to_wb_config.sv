module i2c_to_wb_top_i_i2c_to_wb_config (
    input logic[7:0] i2c_byte_in,
    input logic tip_addr_ack,
    output logic i2c_ack_out,
    input logic wb_clk_i,
    input logic wb_rst_i
);
    reg i2c_addr_ack_out_r;
    always @* begin
        casez (i2c_byte_in)
            8'b1111000z: begin
                i2c_addr_ack_out_r = 1'b0;
            end
            default: begin
                i2c_addr_ack_out_r = 1'b1;
            end
        endcase
    end
    assign i2c_ack_out = (tip_addr_ack ? i2c_addr_ack_out_r : 1'b0);
endmodule
