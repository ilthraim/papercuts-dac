
module sv_chip2_hierarchy_no_mem_v_fltr_1_left_inst_fltr_compute_f1 (
    input logic clk,
    input logic[55:0] din,
    output reg[15:0] dout
);
    reg [12:0] q1;
    reg [14:0] q2;
    reg [12:0] q3;
    reg[16:0] q4;
    reg [12:0] q5;
    reg [14:0] q6;
    reg [12:0] q7;
    reg [18:0] d_out_tmp;
    always @(posedge clk) begin
        q1 <= (din[55:48] * 5'b11101);
        q2 <= (din[47:40] * 7'b1100101);
        q3 <= (din[39:32] * 5'b10001);
        q4 <= (din[31:24] * 9'd277);
        q5 <= (din[23:16] * 5'b10001);
        q6 <= (din[15:8] * 7'b1100101);
        q7 <= (din[7:0] * 5'b11101);
        d_out_tmp <= (((((({1'b0, 1'b0, 1'b0, q1} + {1'b0, 1'b0, 1'b0, q2}) + {1'b0, 1'b0, 1'b0, q3}) + {q4[16], q4[16], q4[16], q4}) + {1'b0, 1'b0, 1'b0, q5}) + {1'b0, 1'b0, 1'b0, q6}) + {1'b0, 1'b0, 1'b0, q7});
        dout <= d_out_tmp[18:3];
    end
endmodule