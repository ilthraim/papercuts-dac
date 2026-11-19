
module mesi_isc_mesi_isc_broad_broad_fifo (
    input logic clk,
    input logic rst,
    input logic wr_i,
    input logic rd_i,
    input logic[40:0] data_i,
    output reg[40:0] data_o,
    output logic status_empty_o,
    output logic status_full_o
);
    reg[40:0] entry[3:0];
    reg[1:0] ptr_wr;
    reg[1:0] ptr_rd;
    wire logic[1:0] ptr_rd_plus_1;
    reg status_empty;
    reg status_full;
    wire logic[1:0] fifo_depth;
    wire logic fifo_depth_increase;
    wire logic fifo_depth_decrease;
    integer i;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            for (i = 0; (i < 4); i = (i + 1)) begin
                entry[i] <= 0;
            end
            ptr_wr <= 0;
        end
        else if (wr_i) begin
            entry[ptr_wr] <= data_i;
            ptr_wr[1:0] <= (ptr_wr[1:0] + 1);
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data_o[40:0] <= 0;
        end
        else if (status_empty) begin
            data_o[40:0] <= data_i[40:0];
        end
        else if (rd_i) begin
            data_o[40:0] <= entry[ptr_rd_plus_1];
        end
        else begin
            data_o[40:0] <= entry[ptr_rd];
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            ptr_rd[1:0] <= 0;
        end
        else if (rd_i) begin
            ptr_rd[1:0] <= (ptr_rd[1:0] + 1);
        end
    end
    assign ptr_rd_plus_1 = (ptr_rd + 1);
    assign status_empty_o = status_empty;
    assign status_full_o = status_full;
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            status_empty <= 1;
        end
        else if (((fifo_depth == 1) & fifo_depth_decrease)) begin
            status_empty <= 1;
        end
        else if (( fifo_depth_increase)) begin
            status_empty <= 0;
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            status_full <= 0;
        end
        else if (((fifo_depth == 32'd3) & fifo_depth_increase)) begin
            status_full <= 1;
        end
        else if (( fifo_depth_decrease)) begin
            status_full <= 0;
        end
    end
    assign fifo_depth_increase = (wr_i & !(rd_i));
    assign fifo_depth_decrease = (!(wr_i) & rd_i);
    assign fifo_depth[1:0] = (ptr_wr[1:0] - ptr_rd[1:0]);
endmodule