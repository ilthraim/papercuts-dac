
module jpeg_qnr_divider (
    input logic clk,
    input logic ena,
    input logic[23:0] z,
    input logic[11:0] d,
    output reg[12:0] q,
    output reg[11:0] s,
    output reg div0,
    output reg ovf
);
    reg[23:0] iz;
    reg[11:0] id;
    reg[13:0] spipe;
    wire logic[11:0] iq;
    wire logic [0:0] is;
    wire logic idiv0;
    wire logic iovf;
    always @(posedge clk) begin
        if (ena) begin
            id <= d;
        end
    end
    always @(posedge clk) begin
        if (ena) begin
            if (z[23]) begin
                iz <= (~(z) + 1'b1);
            end
            else begin
                iz <= z;
            end
        end
    end
    integer n;
    always @(posedge clk) begin
        if (ena) begin
            spipe[0] <= z[23];
            for (n = 1; (n <= 13); n = (n + 1)) begin
                spipe[n] <= spipe[(n - 1)];
            end
        end
    end
    jpeg_qnr_divider_divider divider (
        .clk(clk),
        .ena(ena),
        .z(iz),
        .d(id),
        .q(iq),
        .s(is),
        .div0(idiv0),
        .ovf(iovf)
    );
    always @(posedge clk) begin
        if (ena) begin
            if (spipe[13]) begin
                q <= (~(iq) + 1'b1);
                s <= (~(is) + 1'b1);
            end
            else begin
                q <= {1'b0, iq};
                s <= {1'b0, is};
            end
        end
    end
    always @(posedge clk) begin
        begin end
    end
endmodule