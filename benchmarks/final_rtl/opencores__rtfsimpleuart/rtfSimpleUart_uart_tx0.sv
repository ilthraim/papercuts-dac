module rtfSimpleUart_uart_tx0 (
    input logic rst_i,
    input logic clk_i,
    input logic cyc_i,
    input logic stb_i,
    output logic ack_o,
    input logic we_i,
    input logic[7:0] dat_i,
    input logic cs_i,
    input logic baud16x_ce,
    input logic baud8x,
    input logic cts,
    output logic txd,
    output reg empty,
    output reg txc
);
    reg[9:0] tx_data;
    reg[7:0] fdo;
    reg[7:0] cnt;
    reg rd;
    wire logic isX8;
    assign isX8 = baud8x;
    reg modeX8;
    assign ack_o = cs_i;
    assign txd = tx_data[0];
    always @(posedge clk_i) begin
        if ((ack_o & we_i)) begin
            fdo <= dat_i;
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            empty <= 1;
        end
        else begin
            if ((ack_o & we_i)) begin
                empty <= 0;
            end
            else if (rd) begin
                empty <= 1;
            end
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            cnt <= 8'd159;
            rd <= 0;
            tx_data <= 10'd1023;
            txc <= 1'b1;
            modeX8 <= 1'b0;
        end
        else begin
            rd <= 0;
            if (baud16x_ce) begin
                if ((cnt == 8'd159)) begin
                    modeX8 <= isX8;
                    if ((!(empty) && cts)) begin
                        tx_data <= {1'b1, fdo, 1'b0};
                        rd <= 1;
                        cnt <= modeX8;
                        txc <= 1'b0;
                    end
                    else begin
                        txc <= 1'b1;
                    end
                end
                else begin
                    cnt[7:1] <= (cnt[7:1] + cnt[0]);
                    cnt[0] <= (~(cnt[0]) | modeX8);
                    if ((cnt[3:0] == 4'b1111)) begin
                        tx_data <= {1'b1, tx_data[9:1]};
                    end
                end
            end
        end
    end
endmodule
