module mesi_isc (
    input logic clk,
    input logic rst,
    input logic[2:0] mbus_cmd3_i,
    input logic[2:0] mbus_cmd2_i,
    input logic[2:0] mbus_cmd1_i,
    input logic[2:0] mbus_cmd0_i,
    input logic[31:0] mbus_addr3_i,
    input logic[31:0] mbus_addr2_i,
    input logic[31:0] mbus_addr1_i,
    input logic[31:0] mbus_addr0_i,
    input logic cbus_ack3_i,
    input logic cbus_ack2_i,
    input logic cbus_ack1_i,
    input logic cbus_ack0_i,
    output logic[31:0] cbus_addr_o,
    output logic[2:0] cbus_cmd3_o,
    output logic[2:0] cbus_cmd2_o,
    output logic[2:0] cbus_cmd1_o,
    output logic[2:0] cbus_cmd0_o,
    output logic mbus_ack3_o,
    output logic mbus_ack2_o,
    output logic mbus_ack1_o,
    output logic mbus_ack0_o
);
    wire logic broad_fifo_wr;
    wire logic[31:0] broad_addr;
    wire logic [0:0] broad_id;
    wire logic [0:0] broad_type;
    wire logic[1:0] broad_cpu_id;
    wire logic broad_fifo_status_full;
    mesi_isc_mesi_isc_broad mesi_isc_broad (
        .clk(clk),
        .rst(rst),
        .cbus_ack_array_i({cbus_ack3_i, cbus_ack2_i, cbus_ack1_i, cbus_ack0_i}),
        .broad_fifo_wr_i(broad_fifo_wr),
        .broad_addr_i(broad_addr[31:0]),
        .broad_type_i({1'b0, broad_type[0:0]}),
        .broad_cpu_id_i(broad_cpu_id[1:0]),
        .broad_id_i({4'b0, broad_id[0:0]}),
        .cbus_addr_o(cbus_addr_o[31:0]),
        .cbus_cmd_array_o({cbus_cmd3_o[2:0], cbus_cmd2_o[2:0], cbus_cmd1_o[2:0], cbus_cmd0_o[2:0]}),
        .fifo_status_full_o(broad_fifo_status_full)
    );
    mesi_isc_mesi_isc_breq_fifos mesi_isc_breq_fifos (
        .clk(clk),
        .rst(rst),
        .mbus_cmd_array_i({mbus_cmd3_i[2:0], mbus_cmd2_i[2:0], mbus_cmd1_i[2:0], mbus_cmd0_i[2:0]}),
        .mbus_addr_array_i({mbus_addr3_i[31:0], mbus_addr2_i[31:0], mbus_addr1_i[31:0], mbus_addr0_i[31:0]}),
        .broad_fifo_status_full_i(broad_fifo_status_full),
        .mbus_ack_array_o({mbus_ack3_o, mbus_ack2_o, mbus_ack1_o, mbus_ack0_o}),
        .broad_fifo_wr_o(broad_fifo_wr),
        .broad_addr_o(broad_addr[31:0]),
        .broad_type_o(broad_type[0:0]),
        .broad_cpu_id_o(broad_cpu_id[1:0]),
        .broad_id_o(broad_id[0:0])
    );
endmodule