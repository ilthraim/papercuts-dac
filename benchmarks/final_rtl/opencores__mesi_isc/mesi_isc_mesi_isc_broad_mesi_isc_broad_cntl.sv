module mesi_isc_mesi_isc_broad_mesi_isc_broad_cntl (
    input logic clk,
    input logic rst,
    input logic[3:0] cbus_ack_array_i,
    input logic fifo_status_empty_i,
    input logic fifo_status_full_i,
    input logic[1:0] broad_snoop_type_i,
    input logic[1:0] broad_snoop_cpu_id_i,
    input logic[4:0] broad_snoop_id_i,
    output logic[11:0] cbus_cmd_array_o,
    output reg broad_fifo_rd_o
);
    wire logic[2:0] cbus_cmd3;
    wire logic[2:0] cbus_cmd2;
    wire logic[2:0] cbus_cmd1;
    wire logic[2:0] cbus_cmd0;
    reg broadcast_in_progress;
    reg[3:0] cbus_active_broad_array;
    reg[3:0] cbus_active_en_access_array;
    wire logic[3:0] cbus_active_en_access_and_not_cbus_ack_array;
    assign cbus_cmd_array_o[11:9] = cbus_cmd3;
    assign cbus_cmd_array_o[8:6] = cbus_cmd2;
    assign cbus_cmd_array_o[5:3] = cbus_cmd1;
    assign cbus_cmd_array_o[2:0] = cbus_cmd0;
    assign cbus_cmd3 = (cbus_active_broad_array[3] ? ((broad_snoop_type_i == 2'b1) ? 3'b1 : 3'b10) : (((!(|(cbus_active_broad_array)) & cbus_active_en_access_array[3]) & ~(broad_fifo_rd_o)) ? ((broad_snoop_type_i == 2'b1) ? 3'b11 : 3'b100) : 3'b0));
    assign cbus_cmd2 = (cbus_active_broad_array[2] ? ((broad_snoop_type_i == 2'b1) ? 3'b1 : 3'b10) : (((!(|(cbus_active_broad_array)) & cbus_active_en_access_array[2]) & ~(broad_fifo_rd_o)) ? ((broad_snoop_type_i == 2'b1) ? 3'b11 : 3'b100) : 3'b0));
    assign cbus_cmd1 = (cbus_active_broad_array[1] ? ((broad_snoop_type_i == 2'b1) ? 3'b1 : 3'b10) : (((!(|(cbus_active_broad_array)) & cbus_active_en_access_array[1]) & ~(broad_fifo_rd_o)) ? ((broad_snoop_type_i == 2'b1) ? 3'b11 : 3'b100) : 3'b0));
    assign cbus_cmd0 = (cbus_active_broad_array[0] ? ((broad_snoop_type_i == 2'b1) ? 3'b1 : 3'b10) : (((!(|(cbus_active_broad_array)) & cbus_active_en_access_array[0]) & ~(broad_fifo_rd_o)) ? ((broad_snoop_type_i == 2'b1) ? 3'b11 : 3'b100) : 3'b0));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            broadcast_in_progress <= 0;
            cbus_active_broad_array <= 4'b0;
            cbus_active_en_access_array <= 4'b0;
            broad_fifo_rd_o <= 0;
        end
        else if (~(broadcast_in_progress)) begin
            if (~(fifo_status_empty_i)) begin
                broadcast_in_progress <= 1;
                case (broad_snoop_cpu_id_i)
                    0: begin
                        cbus_active_broad_array <= 4'b1110;
                        cbus_active_en_access_array <= 4'b1;
                    end
                    1: begin
                        cbus_active_broad_array <= 4'b1101;
                        cbus_active_en_access_array <= 4'b10;
                    end
                    2: begin
                        cbus_active_broad_array <= 4'b1011;
                        cbus_active_en_access_array <= 4'b100;
                    end
                    3: begin
                        cbus_active_broad_array <= 4'b111;
                        cbus_active_en_access_array <= 4'b1000;
                    end
                    default: begin
                        cbus_active_broad_array <= 4'b0;
                        cbus_active_en_access_array <= 4'b0;
                    end
                endcase
                broad_fifo_rd_o <= 0;
            end
            else begin
                broadcast_in_progress <= 0;
                cbus_active_broad_array <= 4'b0;
                cbus_active_en_access_array <= 4'b0;
                broad_fifo_rd_o <= 0;
            end
        end
        else if (|(cbus_active_broad_array)) begin
            broadcast_in_progress <= 1;
            cbus_active_broad_array <= (cbus_active_broad_array & ~(cbus_ack_array_i));
            cbus_active_en_access_array <= cbus_active_en_access_array;
            broad_fifo_rd_o <= 0;
        end
        else if (broad_fifo_rd_o) begin
            broadcast_in_progress <= 0;
            cbus_active_broad_array <= 0;
            cbus_active_en_access_array <= 0;
            broad_fifo_rd_o <= 0;
        end
        else begin
            broad_fifo_rd_o <= !(|(cbus_active_en_access_and_not_cbus_ack_array));
        end
    end
    assign cbus_active_en_access_and_not_cbus_ack_array = (cbus_active_en_access_array & ~(cbus_ack_array_i));
endmodule
