
module i2c_master_top_byte_controller (
    input logic clk,
    input logic rst,
    input logic nReset,
    input logic ena,
    input logic[15:0] clk_cnt,
    input logic start,
    input logic stop,
    input logic read,
    input logic write,
    input logic ack_in,
    input logic[7:0] din,
    output reg cmd_ack,
    output reg ack_out,
    output logic[7:0] dout,
    output logic i2c_busy,
    output logic i2c_al,
    input logic scl_i,
    output logic scl_o,
    output logic scl_oen,
    input logic sda_i,
    output logic sda_o,
    output logic sda_oen
);
    reg[3:0] core_cmd;
    reg core_txd;
    wire logic core_ack;
    wire logic core_rxd;
    reg[7:0] sr;
    reg shift;
    reg ld;
    wire logic go;
    reg[2:0] dcnt;
    wire logic cnt_done;
    i2c_master_top_byte_controller_bit_controller bit_controller (
        .clk(clk),
        .rst(rst),
        .nReset(nReset),
        .clk_cnt(clk_cnt),
        .ena(ena),
        .cmd(core_cmd),
        .cmd_ack(core_ack),
        .busy(i2c_busy),
        .al(i2c_al),
        .din(core_txd),
        .dout(core_rxd),
        .scl_i(scl_i),
        .scl_o(scl_o),
        .scl_oen(scl_oen),
        .sda_i(sda_i),
        .sda_o(sda_o),
        .sda_oen(sda_oen)
    );
    assign go = (((read | write) | stop) & ~(cmd_ack));
    assign dout = sr;
    always @(posedge clk or negedge nReset) begin
        if (!(nReset)) begin
            sr <= 8'd0;
        end
        else if (ld) begin
            sr <= din;
        end
        else if (shift) begin
            sr <= {sr[6:0], core_rxd};
        end
    end
    always @(posedge clk or negedge nReset) begin
        if (!(nReset)) begin
            dcnt <= 3'b0;
        end
        else if (ld) begin
            dcnt <= 3'b111;
        end
        else if (shift) begin
            dcnt <= (dcnt - 3'b1);
        end
    end
    assign cnt_done = ~(|(dcnt));
    reg[4:0] c_state;
    always @(posedge clk or negedge nReset) begin
        if (!(nReset)) begin
            core_cmd <= 4'b0;
            core_txd <= 1'b0;
            shift <= 1'b0;
            ld <= 1'b0;
            cmd_ack <= 1'b0;
            c_state <= 5'b0;
            ack_out <= 1'b0;
        end
        else if (( i2c_al)) begin
            core_cmd <= 4'b0;
            core_txd <= 1'b0;
            shift <= 1'b0;
            ld <= 1'b0;
            cmd_ack <= 1'b0;
            c_state <= 5'b0;
            ack_out <= 1'b0;
        end
        else begin
            core_txd <= sr[7];
            shift <= 1'b0;
            ld <= 1'b0;
            cmd_ack <= 1'b0;
            case (c_state)  // synopsys full_case parallel_case
                5'b0: begin
                    if (go) begin
                        if (start) begin
                            c_state <= 5'b1;
                            core_cmd <= 4'b1;
                        end
                        else if (read) begin
                            c_state <= 5'b10;
                            core_cmd <= 4'b1000;
                        end
                        else if (write) begin
                            c_state <= 5'b100;
                            core_cmd <= 4'b100;
                        end
                        else begin
                            c_state <= 5'b10000;
                            core_cmd <= 4'b10;
                        end
                        ld <= 1'b1;
                    end
                end
                5'b1: begin
                    if (core_ack) begin
                        if (read) begin
                            c_state <= 5'b10;
                            core_cmd <= 4'b1000;
                        end
                        else begin
                            c_state <= 5'b100;
                            core_cmd <= 4'b100;
                        end
                        ld <= 1'b1;
                    end
                end
                5'b100: begin
                    if (core_ack) begin
                        if (cnt_done) begin
                            c_state <= 5'b1000;
                            core_cmd <= 4'b1000;
                        end
                        else begin
                            c_state <= 5'b100;
                            core_cmd <= 4'b100;
                            shift <= 1'b1;
                        end
                    end
                end
                5'b10: begin
                    if (core_ack) begin
                        if (cnt_done) begin
                            c_state <= 5'b1000;
                            core_cmd <= 4'b100;
                        end
                        else begin
                            c_state <= 5'b10;
                            core_cmd <= 4'b1000;
                        end
                        shift <= 1'b1;
                        core_txd <= ack_in;
                    end
                end
                5'b1000: begin
                    if (core_ack) begin
                        if (stop) begin
                            c_state <= 5'b10000;
                            core_cmd <= 4'b10;
                        end
                        else begin
                            c_state <= 5'b0;
                            core_cmd <= 4'b0;
                            cmd_ack <= 1'b1;
                        end
                        ack_out <= core_rxd;
                        core_txd <= 1'b1;
                    end
                    else begin
                        core_txd <= ack_in;
                    end
                end
                5'b10000: begin
                    if (core_ack) begin
                        c_state <= 5'b0;
                        core_cmd <= 4'b0;
                        cmd_ack <= 1'b1;
                    end
                end
            endcase
        end
    end
endmodule