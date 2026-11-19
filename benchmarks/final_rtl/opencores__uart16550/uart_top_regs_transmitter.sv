
module uart_top_regs_transmitter (
    input logic clk,
    input logic wb_rst_i,
    input logic[7:0] lcr,
    input logic tf_push,
    input logic[7:0] wb_dat_i,
    input logic enable,
    output logic stx_pad_o,
    output reg[2:0] tstate,
    output logic[4:0] tf_count,
    input logic tx_reset,
    input logic lsr_mask
);
    reg[4:0] counter;
    reg[2:0] bit_counter;
    reg[6:0] shift_out;
    reg stx_o_tmp;
    reg parity_xor;
    reg tf_pop;
    reg bit_out;
    wire logic[7:0] tf_data_in;
    wire logic[7:0] tf_data_out;
    wire logic tf_overrun;
    assign tf_data_in = wb_dat_i;
    uart_top_regs_transmitter_fifo_tx fifo_tx (
        .clk(clk),
        .wb_rst_i(wb_rst_i),
        .data_in(tf_data_in),
        .data_out(tf_data_out),
        .push(tf_push),
        .pop(tf_pop),
        .overrun(tf_overrun),
        .count(tf_count),
        .fifo_reset(tx_reset),
        .reset_status(lsr_mask)
    );
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            tstate <= 3'b0;
            stx_o_tmp <= 1'b1;
            counter <= 5'b0;
            shift_out <= 7'b0;
            bit_out <= 1'b0;
            parity_xor <= 1'b0;
            tf_pop <= 1'b0;
            bit_counter <= 3'b0;
        end
        else if (enable) begin
            case (tstate)
                3'b0: begin
                    if (~|(tf_count)) begin
                        tstate <= 3'b0;
                        stx_o_tmp <= 1'b1;
                    end
                    else begin
                        tf_pop <= 1'b0;
                        stx_o_tmp <= 1'b1;
                        tstate <= 3'b101;
                    end
                end
                3'b101: begin
                    tf_pop <= 1'b1;
                    case (lcr[1:0])
                        2'b0: begin
                            bit_counter <= 3'b100;
                            parity_xor <= ^(tf_data_out[4:0]);
                        end
                        2'b1: begin
                            bit_counter <= 3'b101;
                            parity_xor <= ^(tf_data_out[5:0]);
                        end
                        2'b10: begin
                            bit_counter <= 3'b110;
                            parity_xor <= ^(tf_data_out[6:0]);
                        end
                        2'b11: begin
                            bit_counter <= 3'b111;
                            parity_xor <= ^(tf_data_out[7:0]);
                        end
                    endcase
                    {shift_out[6:0], bit_out} <= tf_data_out;
                    tstate <= 3'b1;
                end
                3'b1: begin
                    tf_pop <= 1'b0;
                    if (~|(counter)) begin
                        counter <= 5'b1111;
                    end
                    else if ((counter == 5'b1)) begin
                        counter <= 0;
                        tstate <= 3'b10;
                    end
                    else begin
                        counter <= (counter - 1'b1);
                    end
                    stx_o_tmp <= 1'b0;
                end
                3'b10: begin
                    if (~|(counter)) begin
                        counter <= 5'b1111;
                    end
                    else if ((counter == 5'b1)) begin
                        if ((bit_counter > 3'b0)) begin
                            bit_counter <= (bit_counter - 1'b1);
                            {shift_out[5:0], bit_out} <= {shift_out[6:1], shift_out[0]};
                            tstate <= 3'b10;
                        end
                        else if (~(lcr[3])) begin
                            tstate <= 3'b100;
                        end
                        else begin
                            case ({lcr[4], lcr[5]})
                                2'b0: begin
                                    bit_out <= ~(parity_xor);
                                end
                                2'b1: begin
                                    bit_out <= 1'b1;
                                end
                                2'b10: begin
                                    bit_out <= parity_xor;
                                end
                                2'b11: begin
                                    bit_out <= 1'b0;
                                end
                            endcase
                            tstate <= 3'b11;
                        end
                        counter <= 0;
                    end
                    else begin
                        counter <= (counter - 1'b1);
                    end
                    stx_o_tmp <= bit_out;
                end
                3'b11: begin
                    if (~|(counter)) begin
                        counter <= 5'b1111;
                    end
                    else if ((counter == 5'b1)) begin
                        counter <= 4'b0;
                        tstate <= 3'b100;
                    end
                    else begin
                        counter <= (counter - 1'b1);
                    end
                    stx_o_tmp <= bit_out;
                end
                3'b100: begin
                    if (~|(counter)) begin
                        casex ({lcr[2], lcr[1:0]})
                            3'b0xx: begin
                                counter <= 5'b1101;
                            end
                            3'b100: begin
                                counter <= 5'b10101;
                            end
                            default: begin
                                counter <= 5'b11101;
                            end
                        endcase
                    end
                    else if ((counter == 5'b1)) begin
                        counter <= 0;
                        tstate <= 3'b0;
                    end
                    else begin
                        counter <= (counter - 1'b1);
                    end
                    stx_o_tmp <= 1'b1;
                end
                default: begin
                    tstate <= 3'b0;
                end
            endcase
        end
        else begin
            tf_pop <= 1'b0;
        end
    end
    assign stx_pad_o = (lcr[6] ? 1'b0 : stx_o_tmp);
endmodule