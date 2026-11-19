
module sv_chip2_hierarchy_no_mem_v_fltr_1_right_fifo1 (
    input logic clk,
    input logic wen,
    input logic[7:0] din,
    output reg[7:0] dout
);
    reg[7:0] buff1;
    reg[7:0] buff2;
    always @(posedge clk) begin
        if ((wen == 1'b1)) begin
            buff1 <= din;
            buff2 <= buff1;
            dout <= buff2;
        end
    end
endmodule