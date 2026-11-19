
module median_window_contol #(
    parameter logic signed[31:0] LUT_ADDR_WIDTH = 10,
    parameter logic signed[31:0] IMG_WIDTH = 320,
    parameter logic signed[31:0] IMG_HEIGHT = 320
) (
    input logic clk,
    input logic rst_n,
    output reg[9:0] raddr_a,
    output reg[9:0] raddr_b,
    output reg[9:0] raddr_c,
    output reg[9:0] waddr,
    output reg[1:0] window_line_counter,
    output reg[9:0] window_column_counter,
    output reg[9:0] memory_shift
);
    reg valid;
    always @(posedge clk or negedge rst_n) begin
        if (~(rst_n)) begin
            waddr <= 10'd0;
        end
        else if (valid) begin
            waddr <= (waddr + 1'b1);
        end
    end
    always @(posedge clk or negedge rst_n) begin
        if (~(rst_n)) begin
            window_column_counter <= 10'd0;
            window_line_counter = 2'b0;
            raddr_a <= 10'd0;
            raddr_b <= 10'd0;
            raddr_c <= 10'd0;
        end
        else begin
            if ((window_column_counter != 32'd79)) begin
                window_column_counter <= (window_column_counter + 1'b1);
                valid <= 1'b1;
                raddr_a <= (raddr_a + 1'b1);
                raddr_b <= (raddr_b + 1'b1);
                raddr_c <= (raddr_c + 1'b1);
            end
            else begin
                window_column_counter <= 10'd0;
                case (window_line_counter)
                    2'b0: begin
                        raddr_a <= (raddr_a + 1'b1);
                        raddr_b <= (raddr_b - window_column_counter);
                        raddr_c <= (raddr_c - window_column_counter);
                        window_line_counter = (window_line_counter + 1'b1);
                    end
                    2'b1: begin
                        raddr_b <= (raddr_b + 1'b1);
                        raddr_a <= (raddr_a - window_column_counter);
                        raddr_c <= (raddr_c - window_column_counter);
                        window_line_counter = (window_line_counter + 1'b1);
                    end
                    2'b10: begin
                        raddr_b <= (raddr_b - window_column_counter);
                        raddr_a <= (raddr_a - window_column_counter);
                        raddr_c <= (raddr_c + 1'b1);
                        window_line_counter = 2'b0;
                    end
                    default: begin
                        raddr_a <= 10'd0;
                        raddr_b <= 10'd0;
                        raddr_c <= 10'd0;
                    end
                endcase
            end
        end
    end
endmodule