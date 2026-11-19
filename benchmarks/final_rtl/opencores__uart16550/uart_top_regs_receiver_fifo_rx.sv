
module uart_top_regs_receiver_fifo_rx (
    input logic clk,
    input logic wb_rst_i,
    input logic[10:0] data_in,
    output logic[10:0] data_out,
    input logic push,
    input logic pop,
    output reg overrun,
    output reg[4:0] count,
    output logic error_bit,
    input logic fifo_reset,
    input logic reset_status
);
    wire logic[7:0] data8_out;
    reg[2:0] fifo[15:0];
    reg[3:0] top;
    reg[3:0] bottom;
    wire logic[3:0] top_plus_1 = (top + 1'b1);
    uart_top_regs_receiver_fifo_rx_rfifo rfifo (
        .clk(clk),
        .we(push),
        .a(top),
        .dpra(bottom),
        .di(data_in[10:3]),
        .dpo(data8_out)
    );
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            top <= 0;
            bottom <= 1'b0;
            count <= 0;
            fifo[0] <= 0;
            fifo[1] <= 0;
            fifo[2] <= 0;
            fifo[3] <= 0;
            fifo[4] <= 0;
            fifo[5] <= 0;
            fifo[6] <= 0;
            fifo[7] <= 0;
            fifo[8] <= 0;
            fifo[9] <= 0;
            fifo[10] <= 0;
            fifo[11] <= 0;
            fifo[12] <= 0;
            fifo[13] <= 0;
            fifo[14] <= 0;
            fifo[15] <= 0;
        end
        else if (fifo_reset) begin
            top <= 0;
            bottom <= 1'b0;
            count <= 0;
            fifo[0] <= 0;
            fifo[1] <= 0;
            fifo[2] <= 0;
            fifo[3] <= 0;
            fifo[4] <= 0;
            fifo[5] <= 0;
            fifo[6] <= 0;
            fifo[7] <= 0;
            fifo[8] <= 0;
            fifo[9] <= 0;
            fifo[10] <= 0;
            fifo[11] <= 0;
            fifo[12] <= 0;
            fifo[13] <= 0;
            fifo[14] <= 0;
            fifo[15] <= 0;
        end
        else begin
            case ({push, pop})
                2'b10: begin
                    if ((count < 16)) begin
                        top <= top_plus_1;
                        fifo[top] <= data_in[2:0];
                        count <= (count + 1'b1);
                    end
                end
                2'b1: begin
                    if ((count > 0)) begin
                        fifo[bottom] <= 0;
                        bottom <= (bottom + 1'b1);
                        count <= (count - 1'b1);
                    end
                end
                2'b11: begin
                    bottom <= (bottom + 1'b1);
                    top <= top_plus_1;
                    fifo[top] <= data_in[2:0];
                end
                default: begin
                    ;
                end
            endcase
        end
    end
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            overrun <= 1'b0;
        end
        else if ((fifo_reset | reset_status)) begin
            overrun <= 1'b0;
        end
        else if (((push & ~(pop)) & (count == 16))) begin
            overrun <= 1'b1;
        end
    end
    assign data_out = {data8_out, fifo[bottom]};
    wire logic[2:0] word0 = fifo[0];
    wire logic[2:0] word1 = fifo[1];
    wire logic[2:0] word2 = fifo[2];
    wire logic[2:0] word3 = fifo[3];
    wire logic[2:0] word4 = fifo[4];
    wire logic[2:0] word5 = fifo[5];
    wire logic[2:0] word6 = fifo[6];
    wire logic[2:0] word7 = fifo[7];
    wire logic[2:0] word8 = fifo[8];
    wire logic[2:0] word9 = fifo[9];
    wire logic[2:0] word10 = fifo[10];
    wire logic[2:0] word11 = fifo[11];
    wire logic[2:0] word12 = fifo[12];
    wire logic[2:0] word13 = fifo[13];
    wire logic[2:0] word14 = fifo[14];
    wire logic[2:0] word15 = fifo[15];
    assign error_bit = |((((((((((((((((word0[2:0] | word1[2:0]) | word2[2:0]) | word3[2:0]) | word4[2:0]) | word5[2:0]) | word6[2:0]) | word7[2:0]) | word8[2:0]) | word9[2:0]) | word10[2:0]) | word11[2:0]) | word12[2:0]) | word13[2:0]) | word14[2:0]) | word15[2:0]));
endmodule