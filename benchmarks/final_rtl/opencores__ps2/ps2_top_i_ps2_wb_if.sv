module ps2_top_i_ps2_wb_if (
    input logic wb_clk_i,
    input logic wb_rst_i,
    input logic wb_cyc_i,
    input logic wb_stb_i,
    input logic wb_we_i,
    input logic[3:0] wb_sel_i,
    input logic[3:0] wb_adr_i,
    input logic[31:0] wb_dat_i,
    output reg[31:0] wb_dat_o,
    output reg wb_ack_o,
    output reg wb_int_o,
    input logic tx_kbd_write_ack_i,
    output logic[7:0] tx_kbd_data_o,
    output logic tx_kbd_write_o,
    input logic[7:0] rx_scancode_i,
    input logic rx_kbd_data_ready_i,
    output logic rx_kbd_read_o,
    output reg translate_o,
    input logic ps2_kbd_clk_i,
    output logic[15:0] divide_reg_o,
    output reg inhibit_kbd_if_o
);
    reg[7:0] input_buffer;
    reg[7:0] output_buffer;
    reg[15:0] divide_reg;
    assign divide_reg_o = divide_reg;
    reg[15:0] wb_dat_i_sampled;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_dat_i_sampled <= 0;
        end
        else begin
            wb_dat_i_sampled <= wb_dat_i[31:16];
        end
    end
    wire logic interrupt2 = 1'b0;
    wire logic enable2 = 1'b1;
    assign tx_kbd_data_o = output_buffer;
    reg input_buffer_full;
    reg output_buffer_full;
    assign tx_kbd_write_o = output_buffer_full;
    wire logic system_flag;
    wire logic kbd_inhibit = ps2_kbd_clk_i;
    wire logic[7:0] status_byte = {1'b0, 1'b0, 1'b0, kbd_inhibit, 1'b0, system_flag, (output_buffer_full || 1'b0), input_buffer_full};
    reg read_input_buffer_reg;
    wire logic read_input_buffer = ((((((wb_cyc_i && wb_stb_i) && wb_sel_i[3]) && !(wb_ack_o)) && !(read_input_buffer_reg)) && !(wb_we_i)) && (wb_adr_i[3:0] == 4'b0));
    reg write_output_buffer_reg;
    wire logic write_output_buffer = ((((((wb_cyc_i && wb_stb_i) && wb_sel_i[3]) && !(wb_ack_o)) && !(write_output_buffer_reg)) && wb_we_i) && (wb_adr_i[3:0] == 4'b0));
    reg read_status_register_reg;
    wire logic read_status_register = ((((((wb_cyc_i && wb_stb_i) && wb_sel_i[3]) && !(wb_ack_o)) && !(read_status_register_reg)) && !(wb_we_i)) && (wb_adr_i[3:0] == 4'b100));
    reg send_command_reg;
    wire logic send_command = ((((((wb_cyc_i && wb_stb_i) && wb_sel_i[3]) && !(wb_ack_o)) && !(send_command_reg)) && wb_we_i) && (wb_adr_i[3:0] == 4'b100));
    reg write_divide_reg0;
    wire logic write_divide0 = ((((((wb_cyc_i && wb_stb_i) && wb_sel_i[2]) && !(wb_ack_o)) && !(write_divide_reg0)) && wb_we_i) && (wb_adr_i[3:0] == 4'b1000));
    wire logic read_divide = ((((wb_cyc_i && wb_stb_i) && (wb_sel_i[2] || wb_sel_i[3])) && !(wb_we_i)) && (wb_adr_i[3:0] == 4'b1000));
    reg write_divide_reg1;
    wire logic write_divide1 = ((((((wb_cyc_i && wb_stb_i) && wb_sel_i[3]) && !(wb_ack_o)) && !(write_divide_reg1)) && wb_we_i) && (wb_adr_i[3:0] == 4'b1000));
    reg enable1;
    reg system;
    reg interrupt1;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            inhibit_kbd_if_o <= 1'b0;
        end
        else if (((ps2_kbd_clk_i && rx_kbd_data_ready_i) && !(enable1))) begin
            inhibit_kbd_if_o <= 1'b1;
        end
        else if ((!(rx_kbd_data_ready_i) || enable1)) begin
            inhibit_kbd_if_o <= 1'b0;
        end
    end
    assign system_flag = system;
    wire logic[6:0] command_byte = {1'b0, translate_o, enable2, enable1, 1'b0, system, interrupt2, interrupt1};
    reg[7:0] current_command;
    reg[7:0] current_command_output;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            send_command_reg <= 1'b0;
            read_input_buffer_reg <= 1'b0;
            write_output_buffer_reg <= 1'b0;
            read_status_register_reg <= 1'b0;
            write_divide_reg0 <= 1'b0;
            write_divide_reg1 <= 1'b0;
        end
        else begin
            send_command_reg <= send_command;
            read_input_buffer_reg <= read_input_buffer;
            write_output_buffer_reg <= write_output_buffer;
            read_status_register_reg <= read_status_register;
            write_divide_reg0 <= write_divide0;
            write_divide_reg1 <= write_divide1;
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            current_command <= 8'd0;
        end
        else if (send_command_reg) begin
            current_command <= wb_dat_i_sampled[15:8];
        end
    end
    reg current_command_valid;
    reg current_command_returns_value;
    reg current_command_gets_parameter;
    reg current_command_gets_null_terminated_string;
    reg write_output_buffer_reg_previous;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            write_output_buffer_reg_previous <= 1'b0;
        end
        else begin
            write_output_buffer_reg_previous <= write_output_buffer_reg;
        end
    end
    wire logic invalidate_current_command = (current_command_valid && (((((current_command_returns_value && read_input_buffer_reg) && input_buffer_full) || (current_command_gets_parameter && write_output_buffer_reg_previous)) || ((current_command_gets_null_terminated_string && write_output_buffer_reg_previous) && (output_buffer == 8'd0))) || ((!(current_command_returns_value) && !(current_command_gets_parameter)) && !(current_command_gets_null_terminated_string))));
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            current_command_valid <= 1'b0;
        end
        else if (invalidate_current_command) begin
            current_command_valid <= 1'b0;
        end
        else if (send_command_reg) begin
            current_command_valid <= 1'b1;
        end
    end
    reg write_command_byte;
    reg current_command_output_valid;
    always @(current_command or command_byte or write_output_buffer_reg_previous or current_command_valid or output_buffer) begin
        current_command_returns_value = 1'b0;
        current_command_gets_parameter = 1'b0;
        current_command_gets_null_terminated_string = 1'b0;
        current_command_output = 8'd0;
        write_command_byte = 1'b0;
        current_command_output_valid = 1'b0;
        case (current_command)
            8'd32: begin
                current_command_returns_value = 1'b1;
                current_command_output = command_byte;
                current_command_output_valid = 1'b1;
            end
            8'd96: begin
                current_command_gets_parameter = 1'b1;
                write_command_byte = (write_output_buffer_reg_previous && current_command_valid);
            end
            8'd161: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd0;
                current_command_output_valid = 1'b1;
            end
            8'd164: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd241;
                current_command_output_valid = 1'b1;
            end
            8'd165: begin
                current_command_gets_null_terminated_string = 1'b1;
            end
            8'd166: begin
            end
            8'd167: begin
            end
            8'd168: begin
            end
            8'd169: begin
                current_command_returns_value = 1'b1;
                current_command_output_valid = 1'b1;
                current_command_output = 8'd2;
            end
            8'd170: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd85;
                current_command_output_valid = 1'b1;
            end
            8'd171: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd0;
                current_command_output_valid = 1'b1;
            end
            8'd173: begin
            end
            8'd174: begin
            end
            8'd175: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd0;
                current_command_output_valid = 1'b1;
            end
            8'd192: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd255;
                current_command_output_valid = 1'b1;
            end
            8'd193: begin
            end
            8'd194: begin
            end
            8'd208: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd1;
                current_command_output_valid = 1'b1;
            end
            8'd209: begin
                current_command_gets_parameter = 1'b1;
            end
            8'd210: begin
                current_command_returns_value = 1'b1;
                current_command_gets_parameter = 1'b1;
                current_command_output = output_buffer;
                current_command_output_valid = write_output_buffer_reg_previous;
            end
            8'd211: begin
                current_command_gets_parameter = 1'b1;
            end
            8'd212: begin
                current_command_gets_parameter = 1'b1;
            end
            8'd224: begin
                current_command_returns_value = 1'b1;
                current_command_output = 8'd255;
                current_command_output_valid = 1'b1;
            end
        endcase
    end
    reg cyc_i_previous;
    reg stb_i_previous;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            cyc_i_previous <= 1'b0;
            stb_i_previous <= 1'b0;
        end
        else if (wb_ack_o) begin
            cyc_i_previous <= 1'b0;
            stb_i_previous <= 1'b0;
        end
        else begin
            cyc_i_previous <= wb_cyc_i;
            stb_i_previous <= wb_stb_i;
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_ack_o <= 1'b0;
        end
        else if (wb_ack_o) begin
            wb_ack_o <= 1'b0;
        end
        else begin
            wb_ack_o <= (cyc_i_previous && stb_i_previous);
        end
    end
    wire logic wb_read = ((read_input_buffer_reg || read_status_register_reg) || read_divide);
    wire logic[15:0] output_data = (read_status_register_reg ? {2{status_byte}} : (read_divide ? divide_reg : {2{input_buffer}}));
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_dat_o <= 32'd0;
        end
        else if (wb_read) begin
            wb_dat_o <= {2{output_data}};
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            output_buffer_full <= 1'b0;
        end
        else if (enable1) begin
            output_buffer_full <= 1'b0;
        end
        else begin
            output_buffer_full <= (write_output_buffer_reg && (!(current_command_valid) || (!(current_command_gets_parameter) && !(current_command_gets_null_terminated_string))));
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            output_buffer <= 8'd0;
        end
        else begin
            output_buffer <= wb_dat_i_sampled[15:8];
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            divide_reg <= 8'd0;
        end
        else begin
            if (write_divide_reg0) begin
                divide_reg[7:0] <= wb_dat_i_sampled[7:0];
            end
            if (write_divide_reg1) begin
                divide_reg[15:8] <= wb_dat_i_sampled[15:8];
            end
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            translate_o <= 1'b0;
            system <= 1'b0;
            interrupt1 <= 1'b0;
        end
        else if (write_command_byte) begin
            translate_o <= output_buffer[6];
            system <= output_buffer[2];
            interrupt1 <= output_buffer[0];
        end
    end
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            enable1 <= 1'b1;
        end
        else if ((current_command_valid && (current_command == 8'd174))) begin
            enable1 <= 1'b0;
        end
        else if ((current_command_valid && (current_command == 8'd173))) begin
            enable1 <= 1'b1;
        end
        else if (write_command_byte) begin
            enable1 <= output_buffer[4];
        end
    end
    wire logic write_input_buffer_from_command = (current_command_valid && current_command_output_valid);
    wire logic write_input_buffer_from_kbd = (((!(input_buffer_full) && rx_kbd_data_ready_i) && !(enable1)) && !(current_command_valid));
    wire logic load_input_buffer_value = (write_input_buffer_from_command || write_input_buffer_from_kbd);
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            input_buffer_full <= 1'b0;
        end
        else if (read_input_buffer_reg) begin
            input_buffer_full <= 1'b0;
        end
        else if (load_input_buffer_value) begin
            input_buffer_full <= 1'b1;
        end
    end
    reg input_buffer_filled_from_command;
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            input_buffer_filled_from_command <= 1'b0;
        end
        else if (read_input_buffer_reg) begin
            input_buffer_filled_from_command <= 1'b0;
        end
        else if (write_input_buffer_from_command) begin
            input_buffer_filled_from_command <= 1'b1;
        end
    end
    wire logic[7:0] value_to_load_in_input_buffer = (write_input_buffer_from_command ? current_command_output : rx_scancode_i);
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            input_buffer <= 8'd0;
        end
        else if (load_input_buffer_value) begin
            input_buffer <= value_to_load_in_input_buffer;
        end
    end
    assign rx_kbd_read_o = (rx_kbd_data_ready_i && (enable1 || ((read_input_buffer_reg && input_buffer_full) && !(input_buffer_filled_from_command))));
    always @(posedge wb_clk_i or posedge wb_rst_i) begin
        if (wb_rst_i) begin
            wb_int_o <= 1'b0;
        end
        else if (((read_input_buffer_reg || enable1) || !(interrupt1))) begin
            wb_int_o <= 1'b0;
        end
        else begin
            wb_int_o <= input_buffer_full;
        end
    end
endmodule
