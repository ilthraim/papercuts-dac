
module sv_chip2_hierarchy_no_mem_v_fltr_4_right_inst_fltr_compute_h3 (
    input logic clk,
    input logic[55:0] din,
    output reg[15:0] dout
);
    reg [12:0] q1;
    reg [14:0] q2;
    reg [15:0] q3;
    reg [0:0] q4;
    reg [15:0] q5;
    reg [14:0] q6;
    reg [12:0] q7;
    reg [18:0] d_out_tmp;
    always @(posedge clk) begin
        q1 <= (din[55:48] * 5'b10111);
        q2 <= (din[47:40] * 7'b1001000);
        q3 <= (din[39:32] * 8'd147);
        q4 <= (din[31:24] * 16'd0);
        q5 <= (din[23:16] * 8'd147);
        q6 <= (din[15:8] * 7'b1001000);
        q7 <= (din[7:0] * 5'b10111);
        d_out_tmp <= (((((({1'b0, 1'b0, 1'b0, q1} + {1'b0, 1'b0, 1'b0, q2}) + {1'b0, 1'b0, 1'b0, q3}) + {1'b0, 1'b0, 1'b0, q4}) + {1'b0, 1'b0, 1'b0, q5}) + {1'b0, 1'b0, 1'b0, q6}) + {1'b0, 1'b0, 1'b0, q7});
        dout <= d_out_tmp[18:3];
    end
endmodule