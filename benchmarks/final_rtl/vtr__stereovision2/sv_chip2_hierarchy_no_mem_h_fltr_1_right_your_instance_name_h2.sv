
module sv_chip2_hierarchy_no_mem_h_fltr_1_right_your_instance_name_h2 (
    input logic clk,
    input logic new_data_rdy,
    output reg output_data_ready,
    input logic[15:0] din,
    output reg[27:0] dout
);
    reg[15:0] n_delay_reg1;
    reg[15:0] n_delay_reg2;
    reg[15:0] n_delay_reg3;
    reg[15:0] n_delay_reg4;
    reg[15:0] n_delay_reg5;
    reg[15:0] n_delay_reg6;
    always @(posedge clk) begin
        if ((new_data_rdy == 1'b1)) begin
            n_delay_reg1 <= din;
            n_delay_reg2 <= n_delay_reg1;
            n_delay_reg3 <= n_delay_reg2;
            n_delay_reg4 <= n_delay_reg3;
            n_delay_reg5 <= n_delay_reg4;
            n_delay_reg6 <= n_delay_reg5;
            output_data_ready <= 1'b1;
            dout <= (((((((din * 4) + (n_delay_reg1 * 42)) + (n_delay_reg2 * 163)) + (n_delay_reg3 * 255)) + (n_delay_reg4 * 163)) + (n_delay_reg5 * 42)) + (n_delay_reg6 * 4));
        end
        else begin
            output_data_ready <= 1'b0;
        end
    end
endmodule