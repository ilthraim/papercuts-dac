module cr_div (
    input logic rst,
    input logic clk,
    input logic[31:0] addr,
    input logic start,
    input logic[31:0] a,
    input logic[31:0] b,
    output reg[31:0] q,
    output reg[31:0] r,
    output logic done
);
    reg[2:0] state;
    reg[31:0] bcache[0:63];
    reg[31:0] recip_cache[0:63];
    wire logic[63:0] prod = (recip_cache[addr[7:2]] * a);
    reg[5:0] cnt;
    wire logic cnt_done = (cnt == 8'd0);
    assign done = (state == 3'b100);
    wire logic b0 = (b <= r);
    wire logic[30:0] r1 = (b0 ? (r - b) : r);
    always @(posedge clk) begin
        if (rst) begin
            state <= 3'b1;
        end
        else begin
            begin
                cnt <= (cnt - 8'd1);
            end
            case (state)
                3'b1: begin
                    if (start) begin
                        q <= 32'd0;
                        r <= 32'd1;
                        if ((b == 1)) begin
                            q <= a;
                            r <= 0;
                            state <= 3'b100;
                        end
                        else if ((b == bcache[addr[7:2]])) begin
                            q <= prod[63:32];
                            state <= 3'b100;
                        end
                        else begin
                            state <= 3'b10;
                        end
                        cnt <= 8'd33;
                    end
                end
                3'b10: begin
                    if (!(cnt_done)) begin
                        q <= {q[30:0], b0};
                        r <= {r1, q[31]};
                    end
                    else begin
                        bcache[addr[7:2]] <= b;
                        recip_cache[addr[7:2]] <= q;
                        state <= 3'b11;
                    end
                end
                3'b11: begin
                    q <= prod[63:32];
                    state <= 3'b100;
                end
                3'b100: begin
                    $display("==========================");
                    $display("a=%d,b=%d", a, b);
                    $display("q=%d,r=%d", q, (a - (b * q)));
                    $display("rc[%h]=%d", addr[7:2], recip_cache[addr[7:2]]);
                    $display("==========================");
                    r <= (a - (b * q));
                    state <= 3'b1;
                end
            endcase
        end
    end
endmodule
