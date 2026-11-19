module usb_phy (
    input logic clk,
    input logic rst,
    input logic phy_tx_mode_i,
    output reg usb_rst_o,
    input logic usb_rst_i,
    output logic tx_dp_o,
    output logic tx_dn_o,
    output logic tx_oen_o,
    input logic rx_rcv_i,
    input logic rx_dp_i,
    input logic rx_dn_i,
    input logic[7:0] utmi_data_i,
    input logic utmi_txvalid_i,
    output logic utmi_txready_o,
    output logic[7:0] utmi_data_o,
    output logic utmi_rxvalid_o,
    output logic utmi_rxactive_o,
    output logic utmi_rxerror_o,
    output logic[1:0] utmi_linestate_o
);
    reg[4:0] rst_cnt;
    wire logic fs_ce;
    wire logic tx_dp_int;
    wire logic tx_dn_int;
    wire logic tx_oen_int;
    usb_phy_i_tx_phy i_tx_phy (
        .clk(clk),
        .rst(rst),
        .fs_ce(fs_ce),
        .phy_mode(phy_tx_mode_i),
        .txdp(tx_dp_int),
        .txdn(tx_dn_int),
        .txoe(tx_oen_int),
        .DataOut_i(utmi_data_i),
        .TxValid_i(utmi_txvalid_i),
        .TxReady_o(utmi_txready_o)
    );
    usb_phy_i_rx_phy i_rx_phy (
        .clk(clk),
        .rst(rst),
        .fs_ce(fs_ce),
        .rxd(rx_rcv_i),
        .rxdp(rx_dp_i),
        .rxdn(rx_dn_i),
        .RxValid_o(utmi_rxvalid_o),
        .RxActive_o(utmi_rxactive_o),
        .RxError_o(utmi_rxerror_o),
        .DataIn_o(utmi_data_o),
        .RxEn_i(tx_oen_o),
        .LineState(utmi_linestate_o)
    );
    always @(posedge clk) begin
        if (!(rst)) begin
            rst_cnt <= 5'b0;
        end
        else if ((utmi_linestate_o != 2'b0)) begin
            rst_cnt <= 5'b0;
        end
        else if ((!(usb_rst_o) && fs_ce)) begin
            rst_cnt <= (rst_cnt + 5'b1);
        end
    end
    always @(posedge clk) begin
        usb_rst_o <= (rst_cnt == 5'b11111);
    end
    assign tx_dp_o = (usb_rst_i ? 1'b0 : tx_dp_int);
    assign tx_dn_o = (usb_rst_i ? 1'b1 : tx_dn_int);
    assign tx_oen_o = (usb_rst_i ? 1'b0 : tx_oen_int);
endmodule