module mesi_isc_mesi_isc_breq_fifos_mesi_isc_breq_fifos_cntl (
    input logic clk,
    input logic rst,
    input logic[11:0] mbus_cmd_array_i,
    input logic[3:0] fifo_status_empty_array_i,
    input logic[3:0] fifo_status_full_array_i,
    input logic broad_fifo_status_full_i,
    input logic[127:0] broad_addr_array_i,
    input logic[7:0] broad_type_array_i,
    input logic[19:0] broad_id_array_i,
    output logic[3:0] mbus_ack_array_o,
    output logic[3:0] fifo_wr_array_o,
    output logic[3:0] fifo_rd_array_o,
    output logic broad_fifo_wr_o,
    output logic[31:0] broad_addr_o,
    output logic[1:0] broad_type_o,
    output logic[1:0] broad_cpu_id_o,
    output logic[4:0] broad_id_o,
    output reg[7:0] breq_type_array_o,
    output logic[7:0] breq_cpu_id_array_o,
    output logic[19:0] breq_id_array_o
);
    reg[3:0] mbus_ack_array;
    reg[3:0] fifos_priority;
    wire logic[3:0] fifos_priority_barrel_shiftl_1;
    wire logic[3:0] fifos_priority_barrel_shiftl_2;
    wire logic[3:0] fifos_priority_barrel_shiftl_3;
    wire logic[3:0] fifo_select_oh;
    reg[0:0] breq_id_base;
    wire logic[2:0] mbus_cmd_array_i_3;
    wire logic[2:0] mbus_cmd_array_i_2;
    wire logic[2:0] mbus_cmd_array_i_1;
    wire logic[2:0] mbus_cmd_array_i_0;
    assign mbus_ack_array_o = mbus_ack_array;
    assign fifo_rd_array_o = ({4{~(broad_fifo_status_full_i)}} & fifo_select_oh[3:0]);
    assign broad_fifo_wr_o = |(fifo_rd_array_o[3:0]);
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            fifos_priority <= 1;
        end
        else if (broad_fifo_wr_o) begin
            fifos_priority[3:0] <= fifos_priority_barrel_shiftl_1[3:0];
        end
    end
    assign fifos_priority_barrel_shiftl_3[3:0] = {fifos_priority[0], fifos_priority[3:1]};
    assign fifos_priority_barrel_shiftl_2[3:0] = {fifos_priority[1:0], fifos_priority[3:2]};
    assign fifos_priority_barrel_shiftl_1[3:0] = {fifos_priority[2:0], fifos_priority[3]};
    assign fifo_select_oh[3:0] = (|((~(fifo_status_empty_array_i[3:0]) & fifos_priority[3:0])) ? fifos_priority[3:0] : (|((~(fifo_status_empty_array_i[3:0]) & fifos_priority_barrel_shiftl_1[3:0])) ? fifos_priority_barrel_shiftl_1[3:0] : (|((~(fifo_status_empty_array_i[3:0]) & fifos_priority_barrel_shiftl_2[3:0])) ? fifos_priority_barrel_shiftl_2[3:0] : (|(~(fifo_status_empty_array_i[3:0])) ? fifos_priority_barrel_shiftl_3[3:0] : 4'b0))));
    assign broad_addr_o[31:0] = ((((broad_addr_array_i[127:96] & {32{fifo_select_oh[3]}}) | (broad_addr_array_i[95:64] & {32{fifo_select_oh[2]}})) | (broad_addr_array_i[63:32] & {32{fifo_select_oh[1]}})) | (broad_addr_array_i[31:0] & {32{fifo_select_oh[0]}}));
    assign broad_type_o[1:0] = ((((broad_type_array_i[7:6] & {2{fifo_select_oh[3]}}) | (broad_type_array_i[5:4] & {2{fifo_select_oh[2]}})) | (broad_type_array_i[3:2] & {2{fifo_select_oh[1]}})) | (broad_type_array_i[1:0] & {2{fifo_select_oh[0]}}));
    assign broad_cpu_id_o[1:0] = (({2{fifo_select_oh[3]}} | (2'b10 & {2{fifo_select_oh[2]}})) | (2'b1 & {2{fifo_select_oh[1]}}));
    assign broad_id_o[4:0] = broad_id_array_i[19:15];
    assign fifo_wr_array_o[3:0] = mbus_ack_array[3:0];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            mbus_ack_array[3:0] <= 0;
        end
        else begin
            mbus_ack_array[3] <= ((~(mbus_ack_array[3]) & ((mbus_cmd_array_i_3 == 3'b11) | (mbus_cmd_array_i_3 == 3'b100))) & (fifo_status_full_array_i[3] == 0));
            mbus_ack_array[2] <= ((~(mbus_ack_array[2]) & ((mbus_cmd_array_i_2 == 3'b11) | (mbus_cmd_array_i_2 == 3'b100))) & (fifo_status_full_array_i[2] == 0));
            mbus_ack_array[1] <= ((~(mbus_ack_array[1]) & ((mbus_cmd_array_i_1 == 3'b11) | (mbus_cmd_array_i_1 == 3'b100))) & (fifo_status_full_array_i[1] == 0));
            mbus_ack_array[0] <= ((~(mbus_ack_array[0]) & ((mbus_cmd_array_i_0 == 3'b11) | (mbus_cmd_array_i_0 == 3'b100))) & (fifo_status_full_array_i[0] == 0));
        end
    end
    assign mbus_cmd_array_i_3[2:0] = mbus_cmd_array_i[11:9];
    assign mbus_cmd_array_i_2[2:0] = mbus_cmd_array_i[8:6];
    assign mbus_cmd_array_i_1[2:0] = mbus_cmd_array_i[5:3];
    assign mbus_cmd_array_i_0[2:0] = mbus_cmd_array_i[2:0];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            breq_type_array_o[7:0] = 0;
        end
        else begin
            breq_type_array_o[7:6] = ((mbus_cmd_array_i_3[2:0] == 3'b11) ? 2'b1 : 2'b0);
            breq_type_array_o[5:4] = ((mbus_cmd_array_i_2[2:0] == 3'b11) ? 2'b1 : 2'b0);
            breq_type_array_o[3:2] = ((mbus_cmd_array_i_1[2:0] == 3'b11) ? 2'b1 : 2'b0);
            breq_type_array_o[1:0] = ((mbus_cmd_array_i_0[2:0] == 3'b11) ? 2'b1 : 2'b0);
        end
    end
    assign breq_cpu_id_array_o[7:6] = 3;
    assign breq_cpu_id_array_o[5:4] = 2;
    assign breq_cpu_id_array_o[3:2] = 1;
    assign breq_cpu_id_array_o[1:0] = 0;
    assign breq_id_array_o[19:15] = {{2'b0, breq_id_base[0:0]}, 2'b0};
    assign breq_id_array_o[14:10] = {{2'b0, breq_id_base[0:0]}, 2'b1};
    assign breq_id_array_o[9:5] = {{2'b0, breq_id_base[0:0]}, 2'b10};
    assign breq_id_array_o[4:0] = {{2'b0, breq_id_base[0:0]}, 2'b11};
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            breq_id_base[0:0] <= 0;
        end
        else begin
        end
    end
endmodule
