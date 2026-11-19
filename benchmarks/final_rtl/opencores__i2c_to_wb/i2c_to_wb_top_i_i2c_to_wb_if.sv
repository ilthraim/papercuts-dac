module i2c_to_wb_top_i_i2c_to_wb_if #(
    parameter logic signed[31:0] DW = 32,
    parameter logic signed[31:0] AW = 8
) (
    input logic i2c_data,
    input logic i2c_ack_done,
    input logic[7:0] i2c_byte_in,
    output reg[7:0] i2c_byte_out,
    output logic i2c_parallel_load,
    input logic tip_wr_ack,
    input logic tip_rd_ack,
    input logic tip_addr_ack,
    input logic[31:0] wb_data_i,
    output logic[31:0] wb_data_o,
    output logic[7:0] wb_addr_o,
    output reg[3:0] wb_sel_o,
    output logic wb_we_o,
    output logic wb_cyc_o,
    output logic wb_stb_o,
    input logic wb_ack_i,
    input logic wb_err_i,
    input logic wb_rty_i,
    input logic wb_clk_i,
    input logic wb_rst_i
);
    wire logic i2c_r_w_bit = i2c_byte_in[0];
    reg[4:0] state;
    reg[4:0] next_state;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            state <= 5'b1;
        end
        else begin
            state <= next_state;
        end
    end
    always @* begin
        case (state)
            5'b1: begin
                if ((tip_addr_ack & i2c_ack_done)) begin
                    if (i2c_r_w_bit) begin
                        next_state = 5'b1000;
                    end
                    else begin
                        next_state = 5'b100;
                    end
                end
                else begin
                    next_state = 5'b1;
                end
            end
            5'b10: begin
                if (wb_ack_i) begin
                    next_state = 5'b100;
                end
                else begin
                    next_state = 5'b10;
                end
            end
            5'b100: begin
                if (tip_addr_ack) begin
                    next_state = 5'b1;
                end
                else if ((tip_wr_ack & i2c_ack_done)) begin
                    next_state = 5'b10;
                end
                else begin
                    next_state = 5'b100;
                end
            end
            5'b1000: begin
                if (wb_ack_i) begin
                    next_state = 5'b10000;
                end
                else begin
                    next_state = 5'b1000;
                end
            end
            5'b10000: begin
                if (tip_addr_ack) begin
                    next_state = 5'b1;
                end
                else if ((tip_rd_ack & i2c_ack_done)) begin
                    if (i2c_data) begin
                        next_state = 5'b1;
                    end
                    else begin
                        next_state = 5'b1000;
                    end
                end
                else begin
                    next_state = 5'b10000;
                end
            end
            default: begin
                next_state = 5'b1;
            end
        endcase
    end
    reg[7:0] i2c_offset_r;
    always @(posedge wb_clk_i) begin
        if (tip_addr_ack) begin
            if (i2c_r_w_bit) begin
                i2c_offset_r <= 8'd0;
            end
            else begin
                i2c_offset_r <= 8'd255;
            end
        end
        else if (i2c_ack_done) begin
            i2c_offset_r <= (i2c_offset_r + 1);
        end
    end
    always @* begin
        case (i2c_offset_r[1:0])
            2'b0: begin
                wb_sel_o = 4'b1;
            end
            2'b1: begin
                wb_sel_o = 4'b10;
            end
            2'b10: begin
                wb_sel_o = 4'b100;
            end
            2'b11: begin
                wb_sel_o = 4'b1000;
            end
        endcase
    end
    always @* begin
        case (wb_sel_o)
            4'b10: begin
                i2c_byte_out = wb_data_i[15:8];
            end
            4'b100: begin
                i2c_byte_out = wb_data_i[23:16];
            end
            4'b1000: begin
                i2c_byte_out = wb_data_i[31:24];
            end
            default: begin
                i2c_byte_out = wb_data_i[7:0];
            end
        endcase
    end
    assign i2c_parallel_load = (state == 5'b1000);
    assign wb_addr_o[7:0] = i2c_offset_r;
    assign wb_data_o = {i2c_byte_in, i2c_byte_in, i2c_byte_in, i2c_byte_in};
    assign wb_cyc_o = ((state == 5'b10) | (state == 5'b1000));
    assign wb_stb_o = ((state == 5'b10) | (state == 5'b1000));
    assign wb_we_o = (state == 5'b10);
endmodule
