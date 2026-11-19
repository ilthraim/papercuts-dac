module uart (
    input logic clk,
    input logic rst,
    input logic rx,
    output logic tx,
    input logic transmit,
    input logic[7:0] tx_byte,
    output logic received,
    output logic[7:0] rx_byte,
    output logic is_receiving,
    output logic is_transmitting,
    output logic recv_error
);
    reg[10:0] rx_clk_divider = 1302;
    reg[10:0] tx_clk_divider = 1302;
    reg[2:0] recv_state = 0;
    reg[5:0] rx_countdown;
    reg [2:0] rx_bits_remaining;
    reg[7:0] rx_data;
    reg tx_out = 1'b1;
    reg[1:0] tx_state = 0;
    reg[5:0] tx_countdown;
    reg[3:0] tx_bits_remaining;
    reg[7:0] tx_data;
    assign received = (recv_state == 6);
    assign recv_error = (recv_state == 5);
    assign is_receiving = (recv_state != 0);
    assign rx_byte = rx_data;
    assign tx = tx_out;
    assign is_transmitting = (tx_state != 0);
    always @(posedge clk) begin
        if (rst) begin
            recv_state = 0;
            tx_state = 0;
        end
        rx_clk_divider = (rx_clk_divider - 1);
        if (!(rx_clk_divider)) begin
            rx_clk_divider = 1302;
            rx_countdown = (rx_countdown - 1);
        end
        tx_clk_divider = (tx_clk_divider - 1);
        if (!(tx_clk_divider)) begin
            tx_clk_divider = 1302;
            tx_countdown = (tx_countdown - 1);
        end
        case (recv_state)
            0: begin
                if (!(rx)) begin
                    rx_clk_divider = 1302;
                    rx_countdown = 2;
                    recv_state = 1;
                end
            end
            1: begin
                if (!(rx_countdown)) begin
                    if (!(rx)) begin
                        rx_countdown = 4;
                        rx_bits_remaining = 8;
                        recv_state = 2;
                    end
                    else begin
                        recv_state = 5;
                    end
                end
            end
            2: begin
                if (!(rx_countdown)) begin
                    rx_data = {rx, rx_data[7:1]};
                    rx_countdown = 4;
                    rx_bits_remaining = (rx_bits_remaining - 1);
                    recv_state = (rx_bits_remaining ? 2 : 3);
                end
            end
            3: begin
                if (!(rx_countdown)) begin
                    recv_state = (rx ? 6 : 5);
                end
            end
            4: begin
                recv_state = (rx_countdown ? 4 : 0);
            end
            5: begin
                rx_countdown = 8;
                recv_state = 4;
            end
            6: begin
                recv_state = 0;
            end
        endcase
        case (tx_state)
            0: begin
                if (transmit) begin
                    tx_data = tx_byte;
                    tx_clk_divider = 1302;
                    tx_countdown = 4;
                    tx_out = 0;
                    tx_bits_remaining = 8;
                    tx_state = 1;
                end
            end
            1: begin
                if (!(tx_countdown)) begin
                    if (tx_bits_remaining) begin
                        tx_bits_remaining = (tx_bits_remaining - 1);
                        tx_out = tx_data[0];
                        tx_data = {1'b0, tx_data[7:1]};
                        tx_countdown = 4;
                        tx_state = 1;
                    end
                    else begin
                        tx_out = 1;
                        tx_countdown = 8;
                        tx_state = 2;
                    end
                end
            end
            2: begin
                tx_state = (tx_countdown ? 2 : 0);
            end
        endcase
    end
endmodule