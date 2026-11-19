
module keccak_f_permutation_ (
    input logic clk,
    input logic reset,
    input logic[575:0] in,
    input logic in_ready,
    output logic ack,
    output reg[1599:0] out,
    output reg out_ready
);
    reg[10:0] i;
    wire logic[1599:0] round_in;
    wire logic[1599:0] round_out;
    wire logic[63:0] rc1;
    wire logic[63:0] rc2;
    wire logic update;
    wire logic accept;
    reg calc;
    assign accept = (in_ready & ~(calc));
    always @(posedge clk) begin begin
            i <= {i[9:0], accept};
        end
    end
    always @(posedge clk) begin
        if (reset) begin
            calc <= 0;
        end
        else begin
            calc <= ((calc & ~(i[10])) | accept);
        end
    end
    assign update = (calc | accept);
    assign ack = accept;
    always @(posedge clk) begin begin end
    end
    assign round_in = (accept ? {(in ^ out[1599:1024]), out[1023:0]} : out);
    keccak_f_permutation__rconst_ rconst_ (
        .i({i, accept}),
        .rc1(rc1),
        .rc2(rc2)
    );
    keccak_f_permutation__round_ round_ (
        .in(round_in),
        .round_const_1(rc1),
        .round_const_2(rc2),
        .out(round_out)
    );
    always @(posedge clk) begin
        if (reset) begin
            out <= 0;
        end
        else if (update) begin
            out <= round_out;
        end
    end
endmodule