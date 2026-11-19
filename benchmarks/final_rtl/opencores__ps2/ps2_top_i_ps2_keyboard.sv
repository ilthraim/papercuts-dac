
module ps2_top_i_ps2_keyboard (
    input logic clk,
    input logic reset,
    output logic ps2_clk_en_o_,
    output logic ps2_data_en_o_,
    input logic ps2_clk_i,
    input logic ps2_data_i,
    output reg rx_released,
    output reg[7:0] rx_scan_code,
    output reg rx_data_ready,
    input logic rx_read,
    input logic[7:0] tx_data,
    input logic tx_write,
    output logic tx_write_ack_o,
    output reg tx_error_no_keyboard_ack,
    input logic translate,
    input logic[15:0] divide_reg_i
);
    wire logic timer_60usec_done;
    wire logic timer_5usec_done;
    wire logic released;
    wire logic rx_output_event;
    wire logic rx_output_strobe;
    wire logic tx_parity_bit;
    wire logic rx_shifting_done;
    wire logic tx_shifting_done;
    reg[10:0] q;
    reg[3:0] m1_state;
    reg[3:0] m1_next_state;
    reg m2_state;
    reg m2_next_state;
    reg[3:0] bit_count;
    reg enable_timer_60usec;
    reg enable_timer_5usec;
    reg[3:0] timer_60usec_count;
    reg[15:0] timer_5usec_count;
    reg hold_released;
    reg ps2_clk_s;
    reg ps2_data_s;
    reg ps2_clk_hi_z;
    reg ps2_data_hi_z;
    reg ps2_clk_ms;
    reg ps2_data_ms;
    reg[15:0] timer_5usec;
    reg timer_done;
    assign ps2_clk_en_o_ = ps2_clk_hi_z;
    assign ps2_data_en_o_ = ps2_data_hi_z;
    always @(posedge clk) begin
        ps2_clk_ms <= ps2_clk_i;
        ps2_data_ms <= ps2_data_i;
        ps2_clk_s <= ps2_clk_ms;
        ps2_data_s <= ps2_data_ms;
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            m1_state <= 1;
        end
        else begin
            m1_state <= m1_next_state;
        end
    end
    always @(m1_state or q or tx_shifting_done or tx_write or ps2_clk_s or ps2_data_s or timer_60usec_done or timer_5usec_done) begin
        ps2_clk_hi_z <= 1;
        ps2_data_hi_z <= 1;
        tx_error_no_keyboard_ack <= 1'b0;
        enable_timer_60usec <= 0;
        enable_timer_5usec <= 0;
        case (m1_state)
            1: begin
                enable_timer_60usec <= 1;
                if (tx_write) begin
                    m1_next_state <= 12;
                end
                else if (~(ps2_clk_s)) begin
                    m1_next_state <= 13;
                end
                else begin
                    m1_next_state <= 1;
                end
            end
            13: begin
                enable_timer_60usec <= 0;
                m1_next_state <= 0;
            end
            0: begin
                enable_timer_60usec <= 1;
                if (tx_write) begin
                    m1_next_state <= 12;
                end
                else if (ps2_clk_s) begin
                    m1_next_state <= 14;
                end
                else begin
                    m1_next_state <= 0;
                end
            end
            12: begin
                enable_timer_60usec <= 0;
                m1_next_state <= 3;
            end
            3: begin
                enable_timer_60usec <= 1;
                ps2_clk_hi_z <= 0;
                if (timer_60usec_done) begin
                    m1_next_state <= 10;
                end
                else begin
                    m1_next_state <= 3;
                end
            end
            10: begin
                enable_timer_5usec <= 1;
                ps2_data_hi_z <= 0;
                if ((~(ps2_clk_s) && timer_5usec_done)) begin
                    m1_next_state <= 5;
                end
                else begin
                    m1_next_state <= 10;
                end
            end
            2: begin
                enable_timer_5usec <= 1;
                ps2_data_hi_z <= q[0];
                if ((ps2_clk_s && timer_5usec_done)) begin
                    m1_next_state <= 9;
                end
                else begin
                    m1_next_state <= 2;
                end
            end
            9: begin
                ps2_data_hi_z <= q[0];
                m1_next_state <= 4;
            end
            4: begin
                ps2_data_hi_z <= q[0];
                if (tx_shifting_done) begin
                    m1_next_state <= 6;
                end
                else if (~(ps2_clk_s)) begin
                    m1_next_state <= 5;
                end
                else begin
                    m1_next_state <= 4;
                end
            end
            5: begin
                ps2_data_hi_z <= q[0];
                if (ps2_clk_s) begin
                    m1_next_state <= 2;
                end
                else begin
                    m1_next_state <= 5;
                end
            end
            6: begin
                if ((~(ps2_clk_s))) begin
                    m1_next_state <= 8;
                end
                else if ((~(ps2_clk_s))) begin
                    m1_next_state <= 7;
                end
                else begin
                    m1_next_state <= 6;
                end
            end
            7: begin
                if ((ps2_clk_s && ps2_data_s)) begin
                    m1_next_state <= 1;
                end
                else begin
                    m1_next_state <= 7;
                end
            end
            8: begin
                tx_error_no_keyboard_ack <= 1;
                if ((ps2_clk_s && ps2_data_s)) begin
                    m1_next_state <= 1;
                end
                else begin
                    m1_next_state <= 8;
                end
            end
            default: begin
                m1_next_state <= 1;
            end
        endcase
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            m2_state <= 0;
        end
        else begin
            m2_state <= m2_next_state;
        end
    end
    always @(m2_state or rx_output_strobe or rx_read) begin
        case (m2_state)
            0: begin
                rx_data_ready <= 1'b0;
                if (rx_output_strobe) begin
                    m2_next_state <= 1;
                end
                else begin
                    m2_next_state <= 0;
                end
            end
            1: begin
                rx_data_ready <= 1'b1;
                if (rx_read) begin
                    m2_next_state <= 0;
                end
                else begin
                    m2_next_state <= 1;
                end
            end
            default: begin
                m2_next_state <= 0;
            end
        endcase
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            bit_count <= 0;
        end
        else if ((rx_shifting_done || (m1_state == 6))) begin
            bit_count <= 0;
        end
        else if (((timer_60usec_done && (m1_state == 1)) && ps2_clk_s)) begin
            bit_count <= 0;
        end
        else if (((m1_state == 13) || (m1_state == 9))) begin
            bit_count <= (bit_count + 1);
        end
    end
    assign rx_shifting_done = (bit_count == 11);
    assign tx_shifting_done = (bit_count == 32'd10);
    assign tx_write_ack_o = ((tx_write && (m1_state == 1)) || (tx_write && (m1_state == 0)));
    assign tx_parity_bit = ~^(tx_data);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            q <= 0;
        end
        else if (tx_write_ack_o) begin
            q <= {1'b1, tx_parity_bit, tx_data, 1'b0};
        end
        else if (((m1_state == 13) || (m1_state == 9))) begin
            q <= {ps2_data_s, q[10:1]};
        end
    end
    always @(posedge clk) begin
        if (~(enable_timer_60usec)) begin
            timer_60usec_count <= 0;
        end
        else if ((timer_done)) begin
            timer_60usec_count <= (timer_60usec_count + 1);
        end
    end
    assign timer_60usec_done = (timer_60usec_count == 12);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            timer_5usec <= 1;
        end
        else if (!(enable_timer_60usec)) begin
            timer_5usec <= 1;
        end
        else if ((timer_5usec == divide_reg_i)) begin
            timer_5usec <= 1;
            timer_done <= 1;
        end
        else begin
            timer_5usec <= (timer_5usec + 1);
            timer_done <= 0;
        end
    end
    always @(posedge clk) begin
        if (~(enable_timer_5usec)) begin
            timer_5usec_count <= 0;
        end
        else if (~(timer_5usec_done)) begin
            timer_5usec_count <= (timer_5usec_count + 1);
        end
    end
    assign timer_5usec_done = (timer_5usec_count == (divide_reg_i - 1));
    assign released = (((q[8:1] == 16'd240)) && translate);
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            hold_released <= 0;
        end
        else if (rx_output_event) begin
            hold_released <= 0;
        end
        else begin
            if ((rx_shifting_done)) begin
                hold_released <= 1;
            end
        end
    end
    always @(posedge clk or posedge reset) begin
        if (reset) begin
            rx_released <= 0;
            rx_scan_code <= 0;
        end
        else if (rx_output_strobe) begin
            rx_released <= hold_released;
            rx_scan_code <= q[8:1];
        end
    end
    assign rx_output_event = (rx_shifting_done && ~(released));
    assign rx_output_strobe = (rx_shifting_done && ~(released));
endmodule