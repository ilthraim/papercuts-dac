
module uart_top_regs_receiver_fifo_rx_rfifo (
    input logic clk,
    input logic we,
    input logic[3:0] a,
    input logic[3:0] dpra,
    input logic[7:0] di,
    output logic[7:0] dpo
);
    reg[7:0] ram[15:0];
    always @(posedge clk) begin
        if (we) begin
            ram[a] <= di;
        end
    end
    assign dpo = ram[dpra];
endmodule