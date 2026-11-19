module rtfSimpleUart_uart_rx0 (
    input logic rst_i,
    input logic clk_i,
    input logic cyc_i,
    input logic stb_i,
    output logic ack_o,
    input logic we_i,
    output logic[7:0] dat_o,
    input logic cs_i,
    input logic baud16x_ce,
    input logic baud8x,
    input logic clear,
    input logic rxd,
    output reg data_present,
    output reg frame_err,
    output reg overrun
);
    reg[7:0] cnt;
    reg[9:0] rx_data;
    reg state;
    reg wf;
    reg[7:0] dat;
    wire logic isX8;
    assign isX8 = baud8x;
    reg modeX8;
    assign ack_o = cs_i;
    assign dat_o = (ack_o ? dat : 8'd0);
    always @(posedge clk_i) begin
        if (wf) begin
            dat <= rx_data[8:1];
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            data_present <= 0;
        end
        else if (wf) begin
            data_present <= 1;
        end
        else if ((ack_o & ~(we_i))) begin
            data_present <= 0;
        end
    end
    reg[4:0] rxdd;
    reg rxdsmp;
    reg rdxstart;
    always @(posedge clk_i) begin
        rxdd <= {rxdd[4:0], rxd};
        begin
            rxdsmp <= rxdd[3];
            rdxstart <= (rxdd[4] & ~(rxdd[3]));
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            state <= 0;
            wf <= 1'b0;
            overrun <= 1'b0;
            frame_err <= 1'b0;
        end
        else begin
            wf <= 1'b0;
            if (clear) begin
                wf <= 1'b0;
                state <= 0;
                overrun <= 1'b0;
                frame_err <= 1'b0;
            end
            else if (baud16x_ce) begin
                case (state)
                    0: begin
                        if (rdxstart) begin
                            state <= 1;
                        end
                    end
                    1: begin
                        if ((cnt == 8'd151)) begin
                            frame_err <= ~(rxdsmp);
                            overrun <= data_present;
                            if (!(data_present)) begin
                                wf <= 1'b1;
                            end
                            state <= 0;
                        end
                        if (((cnt == 8'd7) && rxdsmp)) begin
                            state <= 0;
                        end
                        if ((cnt[3:0] == 4'b111)) begin
                            rx_data <= {rxdsmp, rx_data[9:1]};
                        end
                    end
                endcase
            end
        end
    end
    always @(posedge clk_i) begin
        if (baud16x_ce) begin
            if ((state == 0)) begin
                cnt <= modeX8;
                modeX8 <= isX8;
            end
            else begin
                cnt[7:1] <= (cnt[7:1] + cnt[0]);
                cnt[0] <= (~(cnt[0]) | modeX8);
            end
        end
    end
endmodule
