
module median_pixel_network_u1_node_u8 #(
    parameter logic signed[31:0] DATA_WIDTH = 8,
    parameter logic signed[31:0] LOW_MUX = 0,
    parameter logic signed[31:0] HI_MUX = 1
) (
    input logic[7:0] data_a,
    input logic[7:0] data_b,
    output reg[7:0] data_hi,
    output reg[7:0] data_lo
);
    reg sel0;
    always @* begin
        if ((data_a < data_b)) begin
            sel0 = 1'b0;
        end
        else begin
            sel0 = 1'b1;
        end
    end
    always @* begin
        case (sel0)
            1'b0: begin
                begin end begin
                    data_hi = data_b;
                end
            end
            1'b1: begin
                begin end begin
                    data_hi = data_a;
                end
            end
            default: begin
                data_lo = 8'd0;
                data_hi = 8'd0;
            end
        endcase
    end
endmodule