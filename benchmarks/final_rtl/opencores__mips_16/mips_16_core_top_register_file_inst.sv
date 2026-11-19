
module mips_16_core_top_register_file_inst (
    input logic clk,
    input logic rst,
    input logic reg_write_en,
    input logic[2:0] reg_write_dest,
    input logic[15:0] reg_write_data,
    input logic[2:0] reg_read_addr_1,
    output logic[15:0] reg_read_data_1,
    input logic[2:0] reg_read_addr_2,
    output logic[15:0] reg_read_data_2
);
    reg[15:0] reg_array[7:0];
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            reg_array[0] <= 15'd0;
            reg_array[1] <= 15'd0;
            reg_array[2] <= 15'd0;
            reg_array[3] <= 15'd0;
            reg_array[4] <= 15'd0;
            reg_array[5] <= 15'd0;
            reg_array[6] <= 15'd0;
            reg_array[7] <= 15'd0;
        end
        else begin
            if (reg_write_en) begin
                reg_array[reg_write_dest] <= reg_write_data;
            end
        end
    end
    assign reg_read_data_1 = ((reg_read_addr_1 == 0) ? 15'd0 : reg_array[reg_read_addr_1]);
    assign reg_read_data_2 = ((reg_read_addr_2 == 0) ? 15'd0 : reg_array[reg_read_addr_2]);
endmodule