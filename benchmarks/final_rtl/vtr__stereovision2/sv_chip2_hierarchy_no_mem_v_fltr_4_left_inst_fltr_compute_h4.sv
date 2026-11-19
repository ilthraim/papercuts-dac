
module sv_chip2_hierarchy_no_mem_v_fltr_4_left_inst_fltr_compute_h4 (
    input logic clk,
    input logic[55:0] din,
    output reg[15:0] dout
);
    reg [11:0] q1;
    reg [13:0] q2;
    reg [14:0] q3;
    reg[16:0] q4;
    reg [14:0] q5;
    reg [13:0] q6;
    reg [11:0] q7;
    reg [18:0] d_out_tmp;
    always @(posedge clk) begin
        q1 <= (din[55:48] * 4'b1110);
        q2 <= (din[47:40] * 6'b101011);
        q3 <= (din[39:32] * 7'b1010000);
        q4 <= (din[31:24] * 9'd324);
        q5 <= (din[23:16] * 7'b1010000);
        q6 <= (din[15:8] * 6'b101011);
        q7 <= (din[7:0] * 4'b1110);
        d_out_tmp <= (((((({1'b0, 1'b0, 1'b0, q1} + {1'b0, 1'b0, 1'b0, q2}) + {1'b0, 1'b0, 1'b0, q3}) + {q4[16], q4[16], q4[16], q4}) + {1'b0, 1'b0, 1'b0, q5}) + {1'b0, 1'b0, 1'b0, q6}) + {1'b0, 1'b0, 1'b0, q7});
        dout <= d_out_tmp[18:3];
    end
endmodule