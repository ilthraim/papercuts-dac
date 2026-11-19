
module uart_top_regs_receiver (
    input logic clk,
    input logic wb_rst_i,
    input logic[7:0] lcr,
    input logic rf_pop,
    input logic srx_pad_i,
    input logic enable,
    output reg[9:0] counter_t,
    output logic[4:0] rf_count,
    output logic[10:0] rf_data_out,
    output logic rf_error_bit,
    output logic rf_overrun,
    input logic rx_reset,
    input logic lsr_mask,
    output reg[3:0] rstate,
    output logic rf_push_pulse
);
    reg[3:0] rcounter16;
    reg[2:0] rbit_counter;
    reg[7:0] rshift;
    reg rparity;
    reg rparity_error;
    reg rframing_error;
    reg rparity_xor;
    reg[7:0] counter_b;
    reg rf_push_q;
    reg[10:0] rf_data_in;
    reg rf_push;
    wire logic break_error = (counter_b == 0);
    uart_top_regs_receiver_fifo_rx fifo_rx (
        .clk(clk),
        .wb_rst_i(wb_rst_i),
        .data_in(rf_data_in),
        .data_out(rf_data_out),
        .push(rf_push_pulse),
        .pop(rf_pop),
        .overrun(rf_overrun),
        .count(rf_count),
        .error_bit(rf_error_bit),
        .fifo_reset(rx_reset),
        .reset_status(lsr_mask)
    );
    wire logic rcounter16_eq_7 = (rcounter16 == 4'b111);
    wire logic rcounter16_eq_0 = (rcounter16 == 4'b0);
    wire logic[3:0] rcounter16_minus_1 = (rcounter16 - 1'b1);
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rstate <= 4'b0;
            rcounter16 <= 0;
            rbit_counter <= 0;
            rparity_xor <= 1'b0;
            rframing_error <= 1'b0;
            rparity_error <= 1'b0;
            rparity <= 1'b0;
            rshift <= 0;
            rf_push <= 1'b0;
            rf_data_in <= 0;
        end
        else if (enable) begin
            case (rstate)
                4'b0: begin
                    rf_push <= 1'b0;
                    rf_data_in <= 0;
                    rcounter16 <= 4'b1110;
                    if (((srx_pad_i == 1'b0) & ~(break_error))) begin
                        rstate <= 4'b1;
                    end
                end
                4'b1: begin
                    rf_push <= 1'b0;
                    if (rcounter16_eq_7) begin
                        if ((srx_pad_i == 1'b1)) begin
                            rstate <= 4'b0;
                        end
                        else begin
                            rstate <= 4'b110;
                        end
                    end
                    rcounter16 <= rcounter16_minus_1;
                end
                4'b110: begin
                    case (lcr[1:0])
                        2'b0: begin
                            rbit_counter <= 3'b100;
                        end
                        2'b1: begin
                            rbit_counter <= 3'b101;
                        end
                        2'b10: begin
                            rbit_counter <= 3'b110;
                        end
                        2'b11: begin
                            rbit_counter <= 3'b111;
                        end
                    endcase
                    if (rcounter16_eq_0) begin
                        rstate <= 4'b10;
                        rcounter16 <= 4'b1110;
                        rshift <= 0;
                    end
                    else begin
                        rstate <= 4'b110;
                    end
                    rcounter16 <= rcounter16_minus_1;
                end
                4'b10: begin
                    if (rcounter16_eq_0) begin
                        rstate <= 4'b111;
                    end
                    if (rcounter16_eq_7) begin
                        case (lcr[1:0])
                            2'b0: begin
                                rshift[4:0] <= {srx_pad_i, rshift[4:1]};
                            end
                            2'b1: begin
                                rshift[5:0] <= {srx_pad_i, rshift[5:1]};
                            end
                            2'b10: begin
                                rshift[6:0] <= {srx_pad_i, rshift[6:1]};
                            end
                            2'b11: begin
                                rshift[7:0] <= {srx_pad_i, rshift[7:1]};
                            end
                        endcase
                    end
                    rcounter16 <= rcounter16_minus_1;
                end
                4'b111: begin
                    if ((rbit_counter == 3'b0)) begin
                        if (lcr[3]) begin
                            rstate <= 4'b11;
                        end
                        else begin
                            rstate <= 4'b100;
                            rparity_error <= 1'b0;
                        end
                    end
                    else begin
                        rstate <= 4'b10;
                        rbit_counter <= (rbit_counter - 1'b1);
                    end
                    rcounter16 <= 4'b1110;
                end
                4'b11: begin
                    if (rcounter16_eq_7) begin
                        rparity <= srx_pad_i;
                        rstate <= 4'b1000;
                    end
                    rcounter16 <= rcounter16_minus_1;
                end
                4'b1000: begin
                    rcounter16 <= rcounter16_minus_1;
                    rparity_xor <= ^({rshift, rparity});
                    rstate <= 4'b101;
                end
                4'b101: begin
                    case ({lcr[4], lcr[5]})
                        2'b0: begin
                            rparity_error <= (rparity_xor == 0);
                        end
                        2'b1: begin
                            rparity_error <= ~(rparity);
                        end
                        2'b10: begin
                            rparity_error <= (rparity_xor == 1);
                        end
                        2'b11: begin
                            rparity_error <= rparity;
                        end
                    endcase
                    rcounter16 <= rcounter16_minus_1;
                    rstate <= 4'b1001;
                end
                4'b1001: begin
                    if (rcounter16_eq_0) begin
                        rstate <= 4'b100;
                        rcounter16 <= 4'b1110;
                    end
                    else begin
                        rcounter16 <= rcounter16_minus_1;
                    end
                end
                4'b100: begin
                    if (rcounter16_eq_7) begin
                        rframing_error <= !(srx_pad_i);
                        rstate <= 4'b1010;
                    end
                    rcounter16 <= rcounter16_minus_1;
                end
                4'b1010: begin
                    if ((srx_pad_i | break_error)) begin
                        if (break_error) begin
                            rf_data_in <= 11'd4;
                        end
                        else begin
                            rf_data_in <= {rshift, 1'b0, rparity_error, rframing_error};
                        end
                        rf_push <= 1'b1;
                        rstate <= 4'b0;
                    end
                    else if (~(rframing_error)) begin
                        rf_data_in <= {rshift, 1'b0, rparity_error, rframing_error};
                        rf_push <= 1'b1;
                        rcounter16 <= 4'b1110;
                        rstate <= 4'b1;
                    end
                end
                default: begin
                    rstate <= 4'b0;
                end
            endcase
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            rf_push_q <= 0;
        end
        else begin
            rf_push_q <= rf_push;
        end
    end
    assign rf_push_pulse = (rf_push & ~(rf_push_q));
    reg[9:0] toc_value;
    always @(lcr) begin
        case (lcr[3:0])
            4'b0: begin
                toc_value = 447;
            end
            4'b100: begin
                toc_value = 479;
            end
            4'b1, 4'b1000: begin
                toc_value = 511;
            end
            4'b1100: begin
                toc_value = 543;
            end
            4'b10, 4'b101, 4'b1001: begin
                toc_value = 575;
            end
            4'b11, 4'b110, 4'b1010, 4'b1101: begin
                toc_value = 639;
            end
            4'b111, 4'b1011, 4'b1110: begin
                toc_value = 703;
            end
            4'b1111: begin
                toc_value = 767;
            end
        endcase
    end
    wire logic[7:0] brc_value;
    assign brc_value = toc_value[9:2];
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            counter_b <= 8'd159;
        end
        else if (srx_pad_i) begin
            counter_b <= brc_value;
        end
        else if ((enable & (counter_b != 8'd0))) begin
            counter_b <= (counter_b - 1);
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            counter_t <= 10'd639;
        end
        else if (((rf_push_pulse || rf_pop))) begin
            counter_t <= toc_value;
        end
        else if ((enable && (counter_t != 10'd0))) begin
            counter_t <= (counter_t - 1);
        end
    end
endmodule