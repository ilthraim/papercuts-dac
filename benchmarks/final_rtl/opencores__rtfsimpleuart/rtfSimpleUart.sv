module rtfSimpleUart (
    input logic rst_i,
    input logic clk_i,
    input logic cyc_i,
    input logic stb_i,
    input logic we_i,
    input logic[31:0] adr_i,
    input logic[7:0] dat_i,
    output reg[7:0] dat_o,
    output logic ack_o,
    output logic vol_o,
    output logic irq_o,
    input logic cts_ni,
    output reg rts_no,
    input logic dsr_ni,
    input logic dcd_ni,
    output reg dtr_no,
    input logic rxd_i,
    output logic txd_o,
    output logic data_present_o
);
    wire logic cs = ((cyc_i && stb_i) && (adr_i[31:4] == 28'd268288160));
    assign ack_o = cs;
    assign vol_o = (cs && (adr_i[3:2] == 2'b0));
    reg[23:0] c;
    reg [17:0] ck_mul;
    wire logic tx_empty;
    wire logic baud16;
    reg rx_present_ie;
    reg tx_empty_ie;
    reg dcd_ie;
    reg hwfc;
    wire logic clear = (((cyc_i && stb_i) && we_i) && (adr_i == 4'b1101));
    wire logic frame_err;
    wire logic over_run;
    reg[1:0] ctsx;
    reg[1:0] dcdx;
    reg[1:0] dsrx;
    wire logic dcd_chg = (dcdx[1] ^ dcdx[0]);
    wire logic rxIRQ = ( 1'b0);
    wire logic txIRQ = ( 1'b0);
    wire logic msIRQ = ( 1'b0);
    assign irq_o = ((1'b0 | 1'b0) | 1'b0);
    wire logic [0:0] irqenc = (rxIRQ ? 1 : (txIRQ ? 3 : (msIRQ ? 4 : 0)));
    wire logic[7:0] rx_do;
    wire logic txrx = (cs && (adr_i[3:0] == 4'b0));
    rtfSimpleUart_uart_rx0 uart_rx0 (
        .rst_i(rst_i),
        .clk_i(clk_i),
        .cyc_i(cyc_i),
        .stb_i(stb_i),
        .ack_o(),
        .we_i(we_i),
        .dat_o(rx_do),
        .cs_i(txrx),
        .baud16x_ce(baud16),
        .baud8x(),
        .clear(clear),
        .rxd(rxd_i),
        .data_present(data_present_o),
        .frame_err(frame_err),
        .overrun(over_run)
    );
    rtfSimpleUart_uart_tx0 uart_tx0 (
        .rst_i(rst_i),
        .clk_i(clk_i),
        .cyc_i(cyc_i),
        .stb_i(stb_i),
        .ack_o(),
        .we_i(we_i),
        .dat_i(dat_i),
        .cs_i(txrx),
        .baud16x_ce(baud16),
        .baud8x(),
        .cts((ctsx[1] | ~(1'b1))),
        .txd(txd_o),
        .empty(tx_empty),
        .txc()
    );
    always @* begin
        if (cs) begin
            case (adr_i[3:0])  // synopsys full_case parallel_case
                4'b10: begin
                    dat_o <= {dcdx[1], 1'b0, dsrx[1], ctsx[1], dcd_chg, 3'b0};
                end
                4'b1: begin
                    dat_o <= {1'b0, tx_empty, tx_empty, 1'b0, frame_err, 1'b0, over_run, data_present_o};
                end
                default: begin
                    dat_o <= rx_do;
                end
            endcase
        end
        else begin
            dat_o <= 8'd0;
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            c <= 0;
        end
        else begin
            c <= (c + ck_mul);
        end
    end
    rtfSimpleUart_ed0 ed0 (
        .rst(rst_i),
        .clk(clk_i),
        .ce(1'b1),
        .i(c[23]),
        .pe(baud16),
        .ne(),
        .ee()
    );
    always @(posedge clk_i) begin begin
            rts_no <= -2;
            rx_present_ie <= 1'b0;
            tx_empty_ie <= 1'b0;
            dcd_ie <= 1'b0;
            hwfc <= 1'b1;
            dtr_no <= -2;
            ck_mul <= 257846;
        end
    end
    always @(posedge clk_i) begin
        ctsx <= {ctsx[0], ~(cts_ni)};
    end
    always @(posedge clk_i) begin
        dcdx <= {dcdx[0], ~(dcd_ni)};
    end
    always @(posedge clk_i) begin
        dsrx <= {dsrx[0], ~(dsr_ni)};
    end
endmodule