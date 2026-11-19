
module sv_chip2_hierarchy_no_mem_port_bus_2to1_inst (
    input logic clk,
    input logic[18:0] vidin_addr_reg,
    input logic svid_comp_switch,
    input logic vidin_new_data_scld_1_2to3_left,
    input logic[15:0] vidin_data_reg_scld_1_2to3_left_rp,
    input logic[15:0] vidin_data_reg_scld_1_2to3_left_ip,
    input logic[15:0] vidin_data_reg_scld_1_2to3_left_rn,
    input logic[15:0] vidin_data_reg_scld_1_2to3_left_in,
    input logic[15:0] vidin_data_reg_scld_2_2to3_left_rp,
    input logic[15:0] vidin_data_reg_scld_2_2to3_left_ip,
    input logic[15:0] vidin_data_reg_scld_2_2to3_left_rn,
    input logic[15:0] vidin_data_reg_scld_2_2to3_left_in,
    input logic[15:0] vidin_data_reg_scld_4_2to3_left_rp,
    input logic[15:0] vidin_data_reg_scld_4_2to3_left_ip,
    input logic[15:0] vidin_data_reg_scld_4_2to3_left_rn,
    input logic[15:0] vidin_data_reg_scld_4_2to3_left_in,
    input logic[15:0] vidin_data_reg_scld_1_2to3_right_rp,
    input logic[15:0] vidin_data_reg_scld_1_2to3_right_ip,
    input logic[15:0] vidin_data_reg_scld_1_2to3_right_rn,
    input logic[15:0] vidin_data_reg_scld_1_2to3_right_in,
    input logic[15:0] vidin_data_reg_scld_2_2to3_right_rp,
    input logic[15:0] vidin_data_reg_scld_2_2to3_right_ip,
    input logic[15:0] vidin_data_reg_scld_2_2to3_right_rn,
    input logic[15:0] vidin_data_reg_scld_2_2to3_right_in,
    input logic[15:0] vidin_data_reg_scld_4_2to3_right_rp,
    input logic[15:0] vidin_data_reg_scld_4_2to3_right_ip,
    input logic[15:0] vidin_data_reg_scld_4_2to3_right_rn,
    input logic[15:0] vidin_data_reg_scld_4_2to3_right_in,
    output reg[15:0] bus_word_3,
    output reg[15:0] bus_word_4,
    output reg[15:0] bus_word_5,
    output reg[15:0] bus_word_6,
    output reg[2:0] counter_out
);
    reg[15:0] bus_word_3_tmp;
    reg[15:0] bus_word_4_tmp;
    reg[15:0] bus_word_5_tmp;
    reg[15:0] bus_word_6_tmp;
    reg[18:0] vidin_addr_reg_tmp;
    reg svid_comp_switch_tmp;
    reg[3:0] counter;
    reg[2:0] counter_out_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_left_rp_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_left_rp_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_left_rp_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_right_rp_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_right_rp_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_right_rp_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_left_ip_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_left_ip_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_left_ip_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_right_ip_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_right_ip_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_right_ip_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_left_rn_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_left_rn_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_left_rn_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_right_rn_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_right_rn_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_right_rn_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_left_in_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_left_in_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_left_in_tmp;
    reg[15:0] vidin_data_reg_scld_1_2to3_right_in_tmp;
    reg[15:0] vidin_data_reg_scld_2_2to3_right_in_tmp;
    reg[15:0] vidin_data_reg_scld_4_2to3_right_in_tmp;
    always @(posedge clk) begin
        if ((vidin_new_data_scld_1_2to3_left == 1'b1)) begin
            counter <= 4'b1;
        end
        else begin
            case (counter)
                4'b1: begin
                    counter <= 4'b10;
                end
                4'b10: begin
                    counter <= 4'b11;
                end
                4'b11: begin
                    counter <= 4'b100;
                end
                4'b100: begin
                    counter <= 4'b101;
                end
                4'b101: begin
                    counter <= 4'b110;
                end
                4'b110: begin
                    counter <= 4'b111;
                end
                default: begin
                    counter <= 4'b1000;
                end
            endcase
        end
    end
    always @(posedge clk) begin
        case (counter[2:0])
            3'b0: begin
                counter_out_tmp <= 3'b0;
                bus_word_3_tmp <= 16'd0;
                bus_word_4_tmp <= 16'd0;
                bus_word_5_tmp <= 16'd0;
                bus_word_6_tmp <= 16'd0;
            end
            3'b1: begin
                counter_out_tmp <= 3'b1;
                bus_word_3_tmp <= vidin_addr_reg_tmp[15:0];
                bus_word_4_tmp <= {vidin_addr_reg_tmp[18:16], svid_comp_switch_tmp, 12'd0};
                bus_word_5_tmp <= 16'd0;
                bus_word_6_tmp <= 16'd0;
            end
            3'b10: begin
                counter_out_tmp <= 3'b10;
                bus_word_3_tmp <= vidin_data_reg_scld_1_2to3_left_rp_tmp;
                bus_word_4_tmp <= vidin_data_reg_scld_1_2to3_left_ip_tmp;
                bus_word_5_tmp <= vidin_data_reg_scld_1_2to3_left_rn_tmp;
                bus_word_6_tmp <= vidin_data_reg_scld_1_2to3_left_in_tmp;
            end
            3'b11: begin
                counter_out_tmp <= 3'b11;
                bus_word_3_tmp <= vidin_data_reg_scld_1_2to3_right_rp_tmp;
                bus_word_4_tmp <= vidin_data_reg_scld_1_2to3_right_ip_tmp;
                bus_word_5_tmp <= vidin_data_reg_scld_1_2to3_right_rn_tmp;
                bus_word_6_tmp <= vidin_data_reg_scld_1_2to3_right_in_tmp;
            end
            3'b100: begin
                counter_out_tmp <= 3'b100;
                bus_word_3_tmp <= vidin_data_reg_scld_2_2to3_left_rp_tmp;
                bus_word_4_tmp <= vidin_data_reg_scld_2_2to3_left_ip_tmp;
                bus_word_5_tmp <= vidin_data_reg_scld_2_2to3_left_rn_tmp;
                bus_word_6_tmp <= vidin_data_reg_scld_2_2to3_left_in_tmp;
            end
            3'b101: begin
                counter_out_tmp <= 3'b101;
                bus_word_3_tmp <= vidin_data_reg_scld_2_2to3_right_rp_tmp;
                bus_word_4_tmp <= vidin_data_reg_scld_2_2to3_right_ip_tmp;
                bus_word_5_tmp <= vidin_data_reg_scld_2_2to3_right_rn_tmp;
                bus_word_6_tmp <= vidin_data_reg_scld_2_2to3_right_in_tmp;
            end
            3'b110: begin
                counter_out_tmp <= 3'b110;
                bus_word_3_tmp <= vidin_data_reg_scld_4_2to3_left_rp_tmp;
                bus_word_4_tmp <= vidin_data_reg_scld_4_2to3_left_ip_tmp;
                bus_word_5_tmp <= vidin_data_reg_scld_4_2to3_left_rn_tmp;
                bus_word_6_tmp <= vidin_data_reg_scld_4_2to3_left_in_tmp;
            end
            3'b111: begin
                counter_out_tmp <= 3'b111;
                bus_word_3_tmp <= vidin_data_reg_scld_4_2to3_right_rp_tmp;
                bus_word_4_tmp <= vidin_data_reg_scld_4_2to3_right_ip_tmp;
                bus_word_5_tmp <= vidin_data_reg_scld_4_2to3_right_rn_tmp;
                bus_word_6_tmp <= vidin_data_reg_scld_4_2to3_right_in_tmp;
            end
        endcase
    end
    always @(posedge clk) begin
        counter_out <= counter_out_tmp;
        bus_word_3 <= bus_word_3_tmp;
        bus_word_4 <= bus_word_4_tmp;
        bus_word_5 <= bus_word_5_tmp;
        bus_word_6 <= bus_word_6_tmp;
        if ((vidin_new_data_scld_1_2to3_left == 1'b1)) begin
            vidin_addr_reg_tmp <= vidin_addr_reg;
            svid_comp_switch_tmp <= svid_comp_switch;
            vidin_data_reg_scld_1_2to3_left_rp_tmp <= vidin_data_reg_scld_1_2to3_left_rp;
            vidin_data_reg_scld_2_2to3_left_rp_tmp <= vidin_data_reg_scld_2_2to3_left_rp;
            vidin_data_reg_scld_4_2to3_left_rp_tmp <= vidin_data_reg_scld_4_2to3_left_rp;
            vidin_data_reg_scld_1_2to3_right_rp_tmp <= vidin_data_reg_scld_1_2to3_right_rp;
            vidin_data_reg_scld_2_2to3_right_rp_tmp <= vidin_data_reg_scld_2_2to3_right_rp;
            vidin_data_reg_scld_4_2to3_right_rp_tmp <= vidin_data_reg_scld_4_2to3_right_rp;
            vidin_data_reg_scld_1_2to3_left_ip_tmp <= vidin_data_reg_scld_1_2to3_left_ip;
            vidin_data_reg_scld_2_2to3_left_ip_tmp <= vidin_data_reg_scld_2_2to3_left_ip;
            vidin_data_reg_scld_4_2to3_left_ip_tmp <= vidin_data_reg_scld_4_2to3_left_ip;
            vidin_data_reg_scld_1_2to3_right_ip_tmp <= vidin_data_reg_scld_1_2to3_right_ip;
            vidin_data_reg_scld_2_2to3_right_ip_tmp <= vidin_data_reg_scld_2_2to3_right_ip;
            vidin_data_reg_scld_4_2to3_right_ip_tmp <= vidin_data_reg_scld_4_2to3_right_ip;
            vidin_data_reg_scld_1_2to3_left_rn_tmp <= vidin_data_reg_scld_1_2to3_left_rn;
            vidin_data_reg_scld_2_2to3_left_rn_tmp <= vidin_data_reg_scld_2_2to3_left_rn;
            vidin_data_reg_scld_4_2to3_left_rn_tmp <= vidin_data_reg_scld_4_2to3_left_rn;
            vidin_data_reg_scld_1_2to3_right_rn_tmp <= vidin_data_reg_scld_1_2to3_right_rn;
            vidin_data_reg_scld_2_2to3_right_rn_tmp <= vidin_data_reg_scld_2_2to3_right_rn;
            vidin_data_reg_scld_4_2to3_right_rn_tmp <= vidin_data_reg_scld_4_2to3_right_rn;
            vidin_data_reg_scld_1_2to3_left_in_tmp <= vidin_data_reg_scld_1_2to3_left_in;
            vidin_data_reg_scld_2_2to3_left_in_tmp <= vidin_data_reg_scld_2_2to3_left_in;
            vidin_data_reg_scld_4_2to3_left_in_tmp <= vidin_data_reg_scld_4_2to3_left_in;
            vidin_data_reg_scld_1_2to3_right_in_tmp <= vidin_data_reg_scld_1_2to3_right_in;
            vidin_data_reg_scld_2_2to3_right_in_tmp <= vidin_data_reg_scld_2_2to3_right_in;
            vidin_data_reg_scld_4_2to3_right_in_tmp <= vidin_data_reg_scld_4_2to3_right_in;
        end
    end
endmodule