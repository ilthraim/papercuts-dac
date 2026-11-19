module dct_syn (
    input logic clk,
    input logic ena,
    input logic rst,
    input logic dstrb,
    input logic[7:0] din,
    output logic[11:0] dout,
    output logic den
);
    dct_syn_dut dut (
        .clk(clk),
        .ena(1'b1),
        .rst(rst),
        .dstrb(dstrb),
        .din(din),
        .dout(dout),
        .douten(den)
    );
endmodule