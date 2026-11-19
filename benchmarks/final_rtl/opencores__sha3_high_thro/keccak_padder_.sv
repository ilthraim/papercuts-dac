
module keccak_padder_ (
    input logic clk,
    input logic reset,
    input logic[63:0] in,
    input logic in_ready,
    input logic is_last,
    input logic[2:0] byte_num,
    output logic buffer_full,
    output reg[575:0] out,
    output logic out_ready,
    input logic f_ack
);
    reg state;
    reg done;
    reg[8:0] i;
    wire logic[63:0] v0;
    reg[63:0] v1;
    wire logic accept;
    wire logic update;
    assign buffer_full = i[8];
    assign out_ready = buffer_full;
    assign accept = (( in_ready) & ~(buffer_full));
    assign update = ((accept | (state & ~(buffer_full))) & ~(done));
    always @(posedge clk) begin
        if (reset) begin
            out <= 0;
        end
        else if (update) begin
            out <= {out[511:0], v1};
        end
    end
    always @(posedge clk) begin
        if (reset) begin
            i <= 0;
        end
        else if ((f_ack | update)) begin
            i <= ({i[7:0], 1'b1} & {9{~(f_ack)}});
        end
    end
    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
        end
        else if (is_last) begin
            state <= 1;
        end
    end
    always @(posedge clk) begin
        if (reset) begin
            done <= 0;
        end
        else if ((state & out_ready)) begin
            done <= 1;
        end
    end
    keccak_padder__p0 p0 (
        .in(in),
        .byte_num(byte_num),
        .out(v0)
    );
    always @* begin
        if (state) begin
            v1 = 0;
            v1[7] = ( i[7]);
        end
        else if ((is_last == 0)) begin
            v1 = in;
        end
        else begin
            v1 = v0;
            v1[7] = ( i[7]);
        end
    end
endmodule