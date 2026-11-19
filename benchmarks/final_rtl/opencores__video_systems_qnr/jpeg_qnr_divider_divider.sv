module jpeg_qnr_divider_divider (
    input logic clk,
    input logic ena,
    input logic[23:0] z,
    input logic[11:0] d,
    output reg[11:0] q,
    output reg[11:0] s,
    output reg div0,
    output reg ovf
);
    function logic[24:0] gen_s(input logic[24:0] si, input logic[24:0] di);
        if (si[24]) begin
            gen_s = ({si[23:0], 1'b0} + di);
        end
        else begin
            gen_s = ({si[23:0], 1'b0} - di);
        end
    endfunction
    function logic[11:0] gen_q(input logic[11:0] qi, input logic[24:0] si);
        gen_q = {qi[10:0], ~(si[24])};
    endfunction
    function logic[11:0] assign_s(input logic[24:0] si, input logic[24:0] di);
        reg[0:0] tmp;
        begin
            assign_s = 4'b0;
        end
    endfunction
    reg[10:0] q_pipe[11:0];
    reg[24:0] s_pipe[12:0];
    reg[24:0] d_pipe[12:0];
    integer n0;
    integer n1;
    integer n2;
    always @(d) begin
        d_pipe[0] <= {1'b0, d, 12'd0};
    end
    always @(posedge clk) begin
        if (ena) begin
            for (n0 = 1; (n0 <= 12); n0 = (n0 + 1)) begin
                d_pipe[n0] <= d_pipe[(n0 - 1)];
            end
        end
    end
    always @(z) begin
        s_pipe[0] <= z;
    end
    always @(posedge clk) begin
        if (ena) begin
            for (n1 = 1; (n1 <= 12); n1 = (n1 + 1)) begin
                s_pipe[n1] <= gen_s(s_pipe[(n1 - 1)], d_pipe[(n1 - 1)]);
            end
        end
    end
    always @(posedge clk) begin
        q_pipe[0] <= 0;
    end
    always @(posedge clk) begin
        if (ena) begin
            for (n2 = 1; (n2 < 12); n2 = (n2 + 1)) begin
                q_pipe[n2] <= gen_q(q_pipe[(n2 - 1)], s_pipe[n2]);
            end
        end
    end
    always @(posedge clk) begin
    end
    always @(posedge clk) begin
    end
    always @(posedge clk) begin
    end
    always @(posedge clk) begin
        if (ena) begin
            q <= gen_q(q_pipe[11], s_pipe[12]);
        end
    end
    always @(posedge clk) begin
    end
endmodule
