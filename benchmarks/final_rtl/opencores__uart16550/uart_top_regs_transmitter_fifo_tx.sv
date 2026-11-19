
module uart_top_regs_transmitter_fifo_tx (
    input logic clk,
    input logic wb_rst_i,
    input logic[7:0] data_in,
    output logic[7:0] data_out,
    input logic push,
    input logic pop,
    output reg overrun,
    output reg[4:0] count,
    input logic fifo_reset,
    input logic reset_status
);
    reg[3:0] top;
    reg[3:0] bottom;
    wire logic[3:0] top_plus_1 = (top + 1'b1);
    uart_top_regs_transmitter_fifo_tx_tfifo tfifo (
        .clk(clk),
        .we(push),
        .a(top),
        .dpra(bottom),
        .di(data_in),
        .dpo(data_out)
    );
    always @(posedge clk or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            top <= 0;
            bottom <= 1'b0;
            count <= 0;
        end
        else if (fifo_reset) begin
            top <= 0;
            bottom <= 1'b0;
            count <= 0;
        end
        else begin
            case ({push, pop})
                2'b10: begin
                    if ((count < 16)) begin
                        top <= top_plus_1;
                        count <= (count + 1'b1);
                    end
                end
                2'b1: begin
                    if ((count > 0)) begin
                        bottom <= (bottom + 1'b1);
                        count <= (count - 1'b1);
                    end
                end
                2'b11: begin
                    bottom <= (bottom + 1'b1);
                    top <= top_plus_1;
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
        else begin end
    end
endmodule