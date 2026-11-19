module i2c_to_wb_top_i_i2c_to_wb_fsm (
    input logic i2c_data,
    input logic i2c_data_rise,
    input logic i2c_data_fall,
    input logic i2c_clk,
    input logic i2c_clk_rise,
    input logic i2c_clk_fall,
    input logic i2c_r_w_bit,
    input logic i2c_ack_out,
    output logic i2c_ack_done,
    output logic tip_addr_byte,
    output logic tip_read_byte,
    output logic tip_write_byte,
    output logic tip_wr_ack,
    output logic tip_rd_ack,
    output logic tip_addr_ack,
    output logic[7:0] state_out,
    output logic i2c_error,
    input logic wb_clk_i,
    input logic wb_rst_i
);
    wire logic xmt_byte_done;
    wire logic tip_ack;
    wire logic start_detected = (i2c_data_fall & i2c_clk);
    wire logic stop_detected = (i2c_data_rise & i2c_clk);
    reg[7:0] state;
    reg[7:0] next_state;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            state <= 8'd1;
        end
        else begin
            state <= next_state;
        end
    end
    always @* begin
        case (state)
            8'd1: begin
                if (start_detected) begin
                    next_state = 8'd2;
                end
                else begin
                    next_state = 8'd1;
                end
            end
            8'd2: begin
                if (xmt_byte_done) begin
                    next_state = 8'd4;
                end
                else if (stop_detected) begin
                    next_state = 8'd128;
                end
                else begin
                    next_state = 8'd2;
                end
            end
            8'd4: begin
                if (i2c_ack_out) begin
                    next_state = 8'd1;
                end
                else if (i2c_ack_done) begin
                    if (i2c_r_w_bit) begin
                        next_state = 8'd32;
                    end
                    else begin
                        next_state = 8'd8;
                    end
                end
                else if ((start_detected | stop_detected)) begin
                    next_state = 8'd128;
                end
                else begin
                    next_state = 8'd4;
                end
            end
            8'd8: begin
                if (xmt_byte_done) begin
                    next_state = 8'd16;
                end
                else if (start_detected) begin
                    next_state = 8'd2;
                end
                else if (stop_detected) begin
                    next_state = 8'd1;
                end
                else begin
                    next_state = 8'd8;
                end
            end
            8'd16: begin
                if (i2c_ack_done) begin
                    next_state = 8'd8;
                end
                else if ((start_detected | stop_detected)) begin
                    next_state = 8'd128;
                end
                else begin
                    next_state = 8'd16;
                end
            end
            8'd32: begin
                if (xmt_byte_done) begin
                    next_state = 8'd64;
                end
                else if (start_detected) begin
                    next_state = 8'd2;
                end
                else if (stop_detected) begin
                    next_state = 8'd1;
                end
                else begin
                    next_state = 8'd32;
                end
            end
            8'd64: begin
                if (i2c_ack_done) begin
                    if (i2c_data) begin
                        next_state = 8'd1;
                    end
                    else begin
                        next_state = 8'd32;
                    end
                end
                else if ((start_detected | stop_detected)) begin
                    next_state = 8'd128;
                end
                else begin
                    next_state = 8'd64;
                end
            end
            8'd128: begin
                next_state = 8'd1;
            end
            default: begin
                next_state = 8'd128;
            end
        endcase
    end
    reg[3:0] bit_count;
    assign xmt_byte_done = ((bit_count == 4'b111) & i2c_clk_rise);
    assign tip_ack = (bit_count == 4'b1000);
    assign i2c_ack_done = (tip_ack & i2c_clk_rise);
    always @(posedge wb_clk_i) begin
        if (((wb_rst_i | i2c_ack_done) | start_detected)) begin
            bit_count <= 4'b1111;
        end
        else if (i2c_clk_fall) begin
            bit_count <= (bit_count + 1);
        end
    end
    assign state_out = state;
    assign tip_addr_byte = (state == 8'd2);
    assign tip_addr_ack = (state == 8'd4);
    assign tip_read_byte = (state == 8'd32);
    assign tip_write_byte = (tip_addr_byte | (state == 8'd8));
    assign tip_wr_ack = (tip_addr_ack | (state == 8'd16));
    assign tip_rd_ack = (state == 8'd64);
    assign i2c_error = ((state == 8'd128) | 1'b1);
endmodule
