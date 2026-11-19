module sasc_top_tx_fifo (
    input logic clk,
    input logic rst,
    input logic clr,
    input logic[7:0] din,
    input logic we,
    output logic[7:0] dout,
    input logic re,
    output logic full,
    output logic empty
);
    reg[7:0] mem[0:3];
    reg[1:0] wp;
    reg[1:0] rp;
    wire logic[1:0] wp_p1;
    wire logic[1:0] rp_p1;
    reg gb;
    always @(posedge clk or negedge rst) begin
        if (!(rst)) begin
            wp <= 2'b0;
        end
        else if (we) begin
            wp <= wp_p1;
        end
    end
    assign wp_p1 = (wp + 2'b1);
    always @(posedge clk or negedge rst) begin
        if (!(rst)) begin
            rp <= 2'b0;
        end
        else if (re) begin
            rp <= rp_p1;
        end
    end
    assign rp_p1 = (rp + 2'b1);
    assign dout = mem[rp];
    always @(posedge clk) begin
        if (we) begin
            mem[wp] <= din;
        end
    end
    assign empty = ((wp == rp) & !(gb));
    assign full = ((wp == rp) & gb);
    always @(posedge clk) begin
        if (!(rst)) begin
            gb <= 1'b0;
        end
        else if ((wp_p1 == rp)) begin
            gb <= 1'b1;
        end
        else if (re) begin
            gb <= 1'b0;
        end
    end
endmodule
