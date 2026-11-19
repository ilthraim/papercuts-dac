module jpeg_qnr (
    input logic clk,
    input logic ena,
    input logic rst,
    input logic dstrb,
    input logic[11:0] din,
    input logic[7:0] qnt_val,
    output reg[5:0] qnt_cnt,
    output logic[10:0] dout,
    output logic douten
);
    wire logic[23:0] iz;
    wire logic [7:0] id;
    wire logic[12:0] iq;
    reg [11:0] rq;
    reg[15:0] dep;
    always @(posedge clk or negedge rst) begin
        if (~(rst)) begin
            qnt_cnt <= 6'b0;
        end
        else if (dstrb) begin
            qnt_cnt <= 6'b0;
        end
        else if (ena) begin
            qnt_cnt <= (qnt_cnt + 6'b1);
        end
    end
    assign id = {4'b0, qnt_val};
    assign iz = {{12{din[11]}}, din};
    jpeg_qnr_divider divider (
        .clk(clk),
        .ena(ena),
        .z(iz),
        .d({4'b0, id}),
        .q(iq),
        .s(),
        .div0(),
        .ovf()
    );
    always @(posedge clk) begin
        if (ena) begin
            if (iq[0]) begin
                if (iq[12]) begin
                    rq <= (iq - 1'b1);
                end
                else begin
                    rq <= (iq + 1'b1);
                end
            end
            else begin
                rq <= iq;
            end
        end
    end
    assign dout = rq[11:1];
    integer n;
    always @(posedge clk or negedge rst) begin
        if (!(rst)) begin
            dep <= 0;
        end
        else if (ena) begin
            dep[0] <= dstrb;
            for (n = 1; (n <= 15); n = (n + 1)) begin
                dep[n] <= dep[(n - 1)];
            end
        end
    end
    assign douten = dep[15];
endmodule