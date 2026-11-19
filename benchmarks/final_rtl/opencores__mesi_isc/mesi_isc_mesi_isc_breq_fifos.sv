
module mesi_isc_mesi_isc_breq_fifos (
    input logic clk,
    input logic rst,
    input logic[11:0] mbus_cmd_array_i,
    input logic[127:0] mbus_addr_array_i,
    input logic broad_fifo_status_full_i,
    output logic[3:0] mbus_ack_array_o,
    output logic broad_fifo_wr_o,
    output logic[31:0] broad_addr_o,
    output logic[1:0] broad_type_o,
    output logic[1:0] broad_cpu_id_o,
    output logic[4:0] broad_id_o
);
    wire logic[3:0] fifo_status_empty_array;
    wire logic[3:0] fifo_status_full_array;
    wire logic[127:0] broad_addr_array;
    wire logic[7:0] broad_type_array;
    wire logic[19:0] broad_id_array;
    wire logic[3:0] fifo_wr_array;
    wire logic[3:0] fifo_rd_array;
    wire logic [6:0] breq_type_array;
    wire logic [0:0] breq_cpu_id_array;
    wire logic [0:0] breq_id_array;
    wire logic[7:0] broad_cpu_id_array;
    mesi_isc_mesi_isc_breq_fifos_mesi_isc_breq_fifos_cntl mesi_isc_breq_fifos_cntl (
        .clk(clk),
        .rst(rst),
        .mbus_cmd_array_i(mbus_cmd_array_i[11:0]),
        .fifo_status_empty_array_i(fifo_status_empty_array[3:0]),
        .fifo_status_full_array_i(fifo_status_full_array[3:0]),
        .broad_fifo_status_full_i(broad_fifo_status_full_i),
        .broad_addr_array_i(broad_addr_array[127:0]),
        .broad_type_array_i(broad_type_array[7:0]),
        .broad_id_array_i(broad_id_array[19:0]),
        .mbus_ack_array_o(mbus_ack_array_o[3:0]),
        .fifo_wr_array_o(fifo_wr_array[3:0]),
        .fifo_rd_array_o(fifo_rd_array[3:0]),
        .broad_fifo_wr_o(broad_fifo_wr_o),
        .broad_addr_o(broad_addr_o[31:0]),
        .broad_type_o(broad_type_o[1:0]),
        .broad_cpu_id_o(broad_cpu_id_o[1:0]),
        .broad_id_o(broad_id_o[4:0]),
        .breq_type_array_o(breq_type_array[6:0]),
        .breq_cpu_id_array_o(breq_cpu_id_array[0:0]),
        .breq_id_array_o(breq_id_array[0:0])
    );
    mesi_isc_mesi_isc_breq_fifos_fifo_3 fifo_3 (
        .clk(clk),
        .rst(rst),
        .wr_i(fifo_wr_array[3]),
        .rd_i(fifo_rd_array[3]),
        .data_i({mbus_addr_array_i[127:96], {1'b0, breq_type_array[6:6]}, 2'b0, 5'b0}),
        .data_o({broad_addr_array[127:96], broad_type_array[7:6], broad_cpu_id_array[7:6], broad_id_array[19:15]}),
        .status_empty_o(fifo_status_empty_array[3]),
        .status_full_o(fifo_status_full_array[3])
    );
    mesi_isc_mesi_isc_breq_fifos_fifo_2 fifo_2 (
        .clk(clk),
        .rst(rst),
        .wr_i(fifo_wr_array[2]),
        .rd_i(fifo_rd_array[2]),
        .data_i({mbus_addr_array_i[95:64], breq_type_array[5:4], 2'b0, 5'b0}),
        .data_o({broad_addr_array[95:64], broad_type_array[5:4], broad_cpu_id_array[5:4], broad_id_array[14:10]}),
        .status_empty_o(fifo_status_empty_array[2]),
        .status_full_o(fifo_status_full_array[2])
    );
    mesi_isc_mesi_isc_breq_fifos_fifo_1 fifo_1 (
        .clk(clk),
        .rst(rst),
        .wr_i(fifo_wr_array[1]),
        .rd_i(fifo_rd_array[1]),
        .data_i({mbus_addr_array_i[63:32], breq_type_array[3:2], 2'b0, 5'b0}),
        .data_o({broad_addr_array[63:32], broad_type_array[3:2], broad_cpu_id_array[3:2], broad_id_array[9:5]}),
        .status_empty_o(fifo_status_empty_array[1]),
        .status_full_o(fifo_status_full_array[1])
    );
    mesi_isc_mesi_isc_breq_fifos_fifo_0 fifo_0 (
        .clk(clk),
        .rst(rst),
        .wr_i(fifo_wr_array[0]),
        .rd_i(fifo_rd_array[0]),
        .data_i({mbus_addr_array_i[31:0], breq_type_array[1:0], {1'b0, breq_cpu_id_array[0:0]}, {4'b0, breq_id_array[0:0]}}),
        .data_o({broad_addr_array[31:0], broad_type_array[1:0], broad_cpu_id_array[1:0], broad_id_array[4:0]}),
        .status_empty_o(fifo_status_empty_array[0]),
        .status_full_o(fifo_status_full_array[0])
    );
endmodule