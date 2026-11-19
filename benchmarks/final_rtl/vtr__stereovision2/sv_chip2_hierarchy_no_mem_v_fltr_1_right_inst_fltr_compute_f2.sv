
module sv_chip2_hierarchy_no_mem_v_fltr_1_right_inst_fltr_compute_f2 (
    input logic clk,
    input logic[55:0] din,
    output reg[15:0] dout
);
    reg [9:0] q1;
    reg [13:0] q2;
    reg [15:0] q3;
    reg [15:0] q4;
    reg [15:0] q5;
    reg [13:0] q6;
    reg [9:0] q7;
    reg [18:0] d_out_tmp;
    always @(posedge clk) begin
        q1 <= (din[55:48] * 3'b100);
        q2 <= (din[47:40] * 6'b101010);
        q3 <= (din[39:32] * 8'd163);
        q4 <= (din[31:24] * 8'd255);
        q5 <= (din[23:16] * 8'd163);
        q6 <= (din[15:8] * 6'b101010);
        q7 <= (din[7:0] * 3'b100);
        d_out_tmp <= (((((({1'b0, 1'b0, 1'b0, q1} + {1'b0, 1'b0, 1'b0, q2}) + {1'b0, 1'b0, 1'b0, q3}) + {1'b0, 1'b0, 1'b0, q4}) + {1'b0, 1'b0, 1'b0, q5}) + {1'b0, 1'b0, 1'b0, q6}) + {1'b0, 1'b0, 1'b0, q7});
        dout <= d_out_tmp[18:3];
    end
endmodule