module divider_dshift (
    input logic i_clk,
    input logic i_rst,
    input logic[31:0] i_dividend,
    input logic[31:0] i_divisor,
    input logic i_start,
    output logic o_ready,
    output reg[31:0] o_quotient,
    output reg[31:0] o_remainder
);
    reg[31:0] PR;
    reg signed[31:0] PR_1;
    reg[31:0] DR;
    reg[5:0] ct;
    reg [4:0] ct_1;
    reg ct_1_en;
    reg ct_1_en_1;
    reg DD_sign;
    reg[5:0] state;
    reg ready;
    assign o_ready = (ready ? i_start : 0);
    reg[30:0] nq;
    reg[30:0] q;
    wire logic [28:0] nqp1;
    wire logic [29:0] qp1;
    assign nqp1 = (nq + 1);
    assign qp1 = (q + 1);
    wire logic[31:0] nDR;
    assign nDR = ~(DR);
    wire logic nsub;
    assign nsub = (PR[31] ^ DR[31]);
    wire logic over_sub;
    assign over_sub = ((DD_sign ^ PR[31]) & (PR[31:0] != 0));
    wire logic addback_nDR;
    wire logic addback_DR;
    assign addback_nDR = (over_sub & ~(nsub));
    assign addback_DR = (over_sub & nsub);
    wire logic[30:0] final_nq;
    wire logic[30:0] final_q;
    assign final_nq = (addback_DR ? nqp1 : nq);
    assign final_q = (addback_nDR ? qp1 : q);
    wire logic[31:0] remainder_addback;
    assign remainder_addback = (addback_DR ? i_divisor : (addback_nDR ? ~(i_divisor) : 0));
    wire logic[31:0] a;
    wire logic[31:0] b;
    wire logic[31:0] sum;
    wire logic carry_in;
    wire logic carry_out;
    reg[31:0] reg_a;
    reg[31:0] reg_b;
    reg reg_carry;
    reg[1:0] state_reg;
    reg [3:0] shifted;
    reg [3:0] shifted_1;
    reg[31:0] sdata;
    wire logic[31:0] sdata_o;
    wire logic [3:0] shifted_o;
    divider_dshift_shifter_0 shifter_0 (
        .i_data(sdata),
        .o_data(sdata_o),
        .o_shifted(shifted_o)
    );
    assign a = (ct_1_en ? {27'd0, shifted_1} : ((state == 8) ? {1'b1, ~(final_nq)} : ((state == 16) ? remainder_addback : (nsub ? DR : nDR))));
    assign b = (ct_1_en ? {26'd0, ct_1} : ((state == 8) ? {1'b0, final_q} : ((state == 16) ? PR_1 : PR)));
    assign carry_in = (ct_1_en ? 0 : ((state == 8) ? 1 : ((state == 16) ? (addback_nDR ? 1 : 0) : (nsub ? 0 : 1))));
    divider_dshift_adder_0 adder_0 (
        .i_a(reg_a),
        .i_b(reg_b),
        .i_c(reg_carry),
        .o_s(sum),
        .o_c(carry_out)
    );
    wire logic[5:0] sum_ct;
    wire logic [0:0] sum_ct_h;
    wire logic carry_ct;
    divider_dshift_adder_1 adder_1 (
        .i_a({26'd0, ct}),
        .i_b((state[5] ? {27'd0, shifted} : ~({27'd0, shifted}))),
        .i_c((state[5] ? 1'b0 : 1'b1)),
        .o_s({sum_ct_h, sum_ct}),
        .o_c(carry_ct)
    );
    always @(posedge i_clk or negedge i_rst) begin
        if (!(i_rst)) begin
            sdata <= 0;
            shifted <= 0;
            shifted_1 <= 0;
            PR <= 0;
            PR_1 <= 0;
            DR <= 0;
            ready <= 0;
            ct <= 0;
            ct_1 <= 0;
            ct_1_en <= 0;
            ct_1_en_1 <= 0;
            state <= 1;
            DD_sign <= 0;
            o_quotient <= 0;
            o_remainder <= 0;
            nq <= 0;
            q <= 0;
            reg_a <= 0;
            reg_b <= 0;
            reg_carry <= 0;
            state_reg <= 0;
        end
        else begin
            if (( !(i_start))) begin
                ready <= 0;
            end
            case (state_reg)
                0: begin
                    case (state)
                        1: begin
                            if ((!(ready) && i_start)) begin
                                sdata <= i_divisor;
                                state <= 32;
                                q <= 0;
                                nq <= 0;
                                shifted <= 0;
                            end
                        end
                        2: begin
                            sdata <= i_dividend;
                            PR_1 <= i_dividend;
                            DD_sign <= i_dividend[31];
                            state <= 4;
                            state_reg <= 1;
                        end
                        4: begin
                            if (ct[5]) begin
                                state <= 8;
                                ct <= 0;
                                state_reg <= 2;
                            end
                            else begin
                                ct_1_en <= 1;
                                shifted_1 <= shifted;
                                nq[ct] <= nsub;
                                q[ct] <= ~(nsub);
                                sdata <= sum;
                                state_reg <= 1;
                            end
                        end
                        8: begin
                            state <= 16;
                            o_quotient <= sum;
                            PR_1 <= (PR_1 >>> ct_1);
                            state_reg <= 2;
                        end
                        16: begin
                            o_remainder <= sum;
                            ct_1 <= 0;
                            state <= 1;
                            ready <= 1;
                        end
                        32: begin
                            sdata <= sdata_o;
                            shifted <= shifted_o;
                            ct <= sum_ct;
                            if ((sdata[31] != sdata[30])) begin
                                state <= 2;
                                DR <= sdata;
                            end
                        end
                    endcase
                end
                1: begin
                    PR <= sdata_o;
                    PR_1 <= sdata;
                    shifted <= shifted_o;
                    state_reg <= 2;
                    reg_a <= a;
                    reg_b <= b;
                    reg_carry <= carry_in;
                    ct_1_en <= 0;
                    ct_1_en_1 <= ct_1_en;
                end
                2: begin
                    if ((state == 4)) begin
                        ct <= sum_ct;
                    end
                    state_reg <= 0;
                    if (ct_1_en_1) begin
                        ct_1 <= sum[5:0];
                    end
                    ct_1_en_1 <= 0;
                    reg_a <= a;
                    reg_b <= b;
                    reg_carry <= carry_in;
                end
            endcase
        end
    end
endmodule