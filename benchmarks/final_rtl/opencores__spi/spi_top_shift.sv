
module spi_top_shift (
    input logic clk,
    input logic rst,
    input logic[3:0] latch,
    input logic[3:0] byte_sel,
    input logic[6:0] len,
    input logic lsb,
    input logic go,
    input logic pos_edge,
    input logic neg_edge,
    input logic rx_negedge,
    input logic tx_negedge,
    output reg tip,
    output logic last,
    input logic[31:0] p_in,
    output logic[127:0] p_out,
    input logic s_clk,
    input logic s_in,
    output reg s_out
);
    reg[7:0] cnt;
    reg[127:0] data;
    wire logic [6:0] tx_bit_pos;
    wire logic [6:0] rx_bit_pos;
    wire logic rx_clk;
    wire logic tx_clk;
    assign p_out = data;
    assign tx_bit_pos = (lsb ? ({!(|(len)), len} - cnt) : (cnt - 8'd1));
    assign rx_bit_pos = (lsb ? ({!(|(len)), len} - (rx_negedge ? (cnt + 8'd1) : cnt)) : (rx_negedge ? cnt : (cnt - 8'd1)));
    assign last = !(|(cnt));
    assign rx_clk = ((rx_negedge ? neg_edge : pos_edge) && (!(last) || s_clk));
    assign tx_clk = ((tx_negedge ? neg_edge : pos_edge) && !(last));
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            cnt <= 8'd0;
        end
        else begin
            if (tip) begin
                cnt <= (pos_edge ? (cnt - 8'd1) : cnt);
            end
            else begin
                cnt <= (!(|(len)) ? 8'd128 : {1'b0, len});
            end
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            tip <= 1'b0;
        end
        else if ((go && ~(tip))) begin
            tip <= 1'b1;
        end
        else if ((( last) && pos_edge)) begin
            tip <= 1'b0;
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            s_out <= 1'b0;
        end
        else begin
            s_out <= ((tx_clk || !(tip)) ? data[tx_bit_pos[6:0]] : s_out);
        end
    end
    always @(posedge clk or posedge rst) begin
        if (rst) begin
            data <= 128'h0;
        end
        else if ((latch[0] && !(tip))) begin
            if (byte_sel[3]) begin
                data[31:24] <= p_in[31:24];
            end
            if (byte_sel[2]) begin
                data[23:16] <= p_in[23:16];
            end
            if (byte_sel[1]) begin
                data[15:8] <= p_in[15:8];
            end
            if (byte_sel[0]) begin
                data[7:0] <= p_in[7:0];
            end
        end
        else if ((latch[1] && !(tip))) begin
            if (byte_sel[3]) begin
                data[63:56] <= p_in[31:24];
            end
            if (byte_sel[2]) begin
                data[55:48] <= p_in[23:16];
            end
            if (byte_sel[1]) begin
                data[47:40] <= p_in[15:8];
            end
            if (byte_sel[0]) begin
                data[39:32] <= p_in[7:0];
            end
        end
        else if ((latch[2] && !(tip))) begin
            if (byte_sel[3]) begin
                data[95:88] <= p_in[31:24];
            end
            if (byte_sel[2]) begin
                data[87:80] <= p_in[23:16];
            end
            if (byte_sel[1]) begin
                data[79:72] <= p_in[15:8];
            end
            if (byte_sel[0]) begin
                data[71:64] <= p_in[7:0];
            end
        end
        else if ((latch[3] && !(tip))) begin
            if (byte_sel[3]) begin
                data[127:120] <= p_in[31:24];
            end
            if (byte_sel[2]) begin
                data[119:112] <= p_in[23:16];
            end
            if (byte_sel[1]) begin
                data[111:104] <= p_in[15:8];
            end
            if (byte_sel[0]) begin
                data[103:96] <= p_in[7:0];
            end
        end
        else begin
            data[rx_bit_pos[6:0]] <= (rx_clk ? s_in : data[rx_bit_pos[6:0]]);
        end
    end
endmodule