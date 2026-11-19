
module mesi_isc_mesi_isc_broad (
    input logic clk,
    input logic rst,
    input logic[3:0] cbus_ack_array_i,
    input logic broad_fifo_wr_i,
    input logic[31:0] broad_addr_i,
    input logic[1:0] broad_type_i,
    input logic[1:0] broad_cpu_id_i,
    input logic[4:0] broad_id_i,
    output logic[31:0] cbus_addr_o,
    output logic[11:0] cbus_cmd_array_o,
    output logic fifo_status_full_o
);
    wire logic broad_fifo_rd;
    wire logic fifo_status_empty;
    wire logic fifo_status_full;
    wire logic[31:0] broad_snoop_addr;
    wire logic[1:0] broad_snoop_type;
    wire logic[1:0] broad_snoop_cpu_id;
    wire logic[4:0] broad_snoop_id;
    assign cbus_addr_o[31:0] = broad_snoop_addr[31:0];
    assign fifo_status_full_o = fifo_status_full;
    mesi_isc_mesi_isc_broad_mesi_isc_broad_cntl mesi_isc_broad_cntl (
        .clk(clk),
        .rst(rst),
        .cbus_ack_array_i(cbus_ack_array_i[3:0]),
        .fifo_status_empty_i(fifo_status_empty),
        .fifo_status_full_i(fifo_status_full),
        .broad_snoop_type_i(broad_snoop_type[1:0]),
        .broad_snoop_cpu_id_i(broad_snoop_cpu_id[1:0]),
        .broad_snoop_id_i(broad_snoop_id[4:0]),
        .cbus_cmd_array_o(cbus_cmd_array_o[11:0]),
        .broad_fifo_rd_o(broad_fifo_rd)
    );
    mesi_isc_mesi_isc_broad_broad_fifo broad_fifo (
        .clk(clk),
        .rst(rst),
        .wr_i(broad_fifo_wr_i),
        .rd_i(broad_fifo_rd),
        .data_i({broad_addr_i[31:0], broad_type_i[1:0], broad_cpu_id_i[1:0], broad_id_i[4:0]}),
        .data_o({broad_snoop_addr[31:0], broad_snoop_type[1:0], broad_snoop_cpu_id[1:0], broad_snoop_id[4:0]}),
        .status_empty_o(fifo_status_empty),
        .status_full_o(fifo_status_full)
    );
endmodule