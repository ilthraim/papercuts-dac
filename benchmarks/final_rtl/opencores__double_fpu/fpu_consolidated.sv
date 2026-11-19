module fpu (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic[1:0] rmode,
    input logic[2:0] fpu_op,
    input logic[63:0] opa,
    input logic[63:0] opb,
    output reg[63:0] out,
    output reg ready,
    output reg underflow,
    output reg overflow,
    output reg inexact,
    output reg exception,
    output reg invalid
);
    reg[63:0] opa_reg;
    reg[63:0] opb_reg;
    reg[2:0] fpu_op_reg;
    reg[1:0] rmode_reg;
    reg enable_reg;
    reg enable_reg_1;
    reg enable_reg_2;
    reg enable_reg_3;
    reg op_enable;
    reg[6:0] count_cycles;
    reg[6:0] count_ready;
    wire logic count_busy = (count_ready <= count_cycles);
    reg ready_0;
    reg ready_1;
    wire logic underflow_0;
    wire logic overflow_0;
    wire logic inexact_0;
    wire logic exception_0;
    wire logic invalid_0;
    wire logic add_enable_0 = ((fpu_op_reg == 3'b0) & !((opa_reg[63] ^ opb_reg[63])));
    wire logic add_enable_1 = ((fpu_op_reg == 3'b1) & (opa_reg[63] ^ opb_reg[63]));
    reg add_enable;
    wire logic sub_enable_0 = ((fpu_op_reg == 3'b0) & (opa_reg[63] ^ opb_reg[63]));
    wire logic sub_enable_1 = ((fpu_op_reg == 3'b1) & !((opa_reg[63] ^ opb_reg[63])));
    reg sub_enable;
    reg mul_enable;
    reg div_enable;
    wire logic [54:0] sum_out;
    wire logic [54:0] diff_out;
    reg [54:0] addsub_out;
    wire logic [54:0] mul_out;
    wire logic [54:0] div_out;
    reg [54:0] mantissa_round;
    wire logic[10:0] exp_add_out;
    wire logic[10:0] exp_sub_out;
    wire logic[11:0] exp_mul_out;
    wire logic[11:0] exp_div_out;
    reg[11:0] exponent_round;
    reg [10:0] exp_addsub;
    wire logic[11:0] exponent_post_round;
    wire logic add_sign;
    wire logic sub_sign;
    wire logic mul_sign;
    wire logic div_sign;
    reg addsub_sign;
    reg sign_round;
    wire logic[63:0] out_round;
    wire logic[63:0] out_except;
    fpu_u1 u1 (
        .clk(clk),
        .rst(rst),
        .enable(add_enable),
        .opa(opa_reg),
        .opb(opb_reg),
        .sign(add_sign),
        .sum_2(sum_out),
        .exponent_2(exp_add_out)
    );
    fpu_u2 u2 (
        .clk(clk),
        .rst(rst),
        .enable(sub_enable),
        .opa(opa_reg),
        .opb(opb_reg),
        .fpu_op(fpu_op_reg),
        .sign(sub_sign),
        .diff_2(diff_out),
        .exponent_2(exp_sub_out)
    );
    fpu_u3 u3 (
        .clk(clk),
        .rst(rst),
        .enable(mul_enable),
        .opa(opa_reg),
        .opb(opb_reg),
        .sign(mul_sign),
        .product_7(mul_out),
        .exponent_5(exp_mul_out)
    );
    fpu_u4 u4 (
        .clk(clk),
        .rst(rst),
        .enable(div_enable),
        .opa(opa_reg),
        .opb(opb_reg),
        .sign(div_sign),
        .mantissa_7(div_out),
        .exponent_out(exp_div_out)
    );
    fpu_u5 u5 (
        .clk(clk),
        .rst(rst),
        .enable(op_enable),
        .round_mode(rmode_reg),
        .sign_term(sign_round),
        .mantissa_term({1'b0, mantissa_round}),
        .exponent_term(exponent_round),
        .round_out(out_round),
        .exponent_final(exponent_post_round)
    );
    wire logic except_enable;
    fpu_u6 u6 (
        .clk(clk),
        .rst(rst),
        .enable(op_enable),
        .rmode(rmode_reg),
        .opa(opa_reg),
        .opb(opb_reg),
        .in_except(out_round),
        .exponent_in(exponent_post_round),
        .mantissa_in(mantissa_round[1:0]),
        .fpu_op(fpu_op_reg),
        .out(out_except),
        .ex_enable(except_enable),
        .underflow(underflow_0),
        .overflow(overflow_0),
        .inexact(inexact_0),
        .exception(exception_0),
        .invalid(invalid_0)
    );
    always @(posedge clk) begin
        case (fpu_op_reg)
            3'b0: begin
                mantissa_round <= addsub_out;
            end
            3'b1: begin
                mantissa_round <= addsub_out;
            end
            3'b10: begin
                mantissa_round <= mul_out;
            end
            3'b11: begin
                mantissa_round <= div_out;
            end
            default: begin
                mantissa_round <= 0;
            end
        endcase
    end
    always @(posedge clk) begin
        case (fpu_op_reg)
            3'b0: begin
                exponent_round <= exp_addsub;
            end
            3'b1: begin
                exponent_round <= exp_addsub;
            end
            3'b10: begin
                exponent_round <= exp_mul_out;
            end
            3'b11: begin
                exponent_round <= exp_div_out;
            end
            default: begin
                exponent_round <= 0;
            end
        endcase
    end
    always @(posedge clk) begin
        case (fpu_op_reg)
            3'b0: begin
                sign_round <= addsub_sign;
            end
            3'b1: begin
                sign_round <= addsub_sign;
            end
            3'b10: begin
                sign_round <= mul_sign;
            end
            3'b11: begin
                sign_round <= div_sign;
            end
            default: begin
                sign_round <= 0;
            end
        endcase
    end
    always @(posedge clk) begin
        case (fpu_op_reg)
            3'b0: begin
                count_cycles <= 20;
            end
            3'b1: begin
                count_cycles <= 21;
            end
            3'b10: begin
                count_cycles <= 24;
            end
            3'b11: begin
                count_cycles <= 71;
            end
            default: begin
                count_cycles <= 0;
            end
        endcase
    end
    always @(posedge clk) begin begin
            add_enable <= ((add_enable_0 | add_enable_1) & op_enable);
            sub_enable <= ((sub_enable_0 | sub_enable_1));
            mul_enable <= ((fpu_op_reg == 3'b10));
            div_enable <= (((fpu_op_reg == 3'b11)) & enable_reg_3);
            addsub_out <= (add_enable ? sum_out : diff_out);
            addsub_sign <= (add_enable ? add_sign : sub_sign);
            exp_addsub <= (add_enable ? {1'b0, exp_add_out} : {1'b0, exp_sub_out});
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            count_ready <= 0;
        end
        else if (enable_reg_1) begin
            count_ready <= 0;
        end
        else if (count_busy) begin
            count_ready <= (count_ready + 1);
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            enable_reg <= 0;
            enable_reg_1 <= 0;
            enable_reg_2 <= 0;
            enable_reg_3 <= 0;
        end
        else begin
            enable_reg <= enable;
            enable_reg_1 <= (enable & !(enable_reg));
            enable_reg_2 <= enable_reg_1;
            enable_reg_3 <= (enable_reg_1 | enable_reg_2);
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            opa_reg <= 0;
            opb_reg <= 0;
            fpu_op_reg <= 0;
            rmode_reg <= 0;
            op_enable <= 0;
        end
        else if (enable_reg_1) begin
            opa_reg <= opa;
            opb_reg <= opb;
            fpu_op_reg <= fpu_op;
            rmode_reg <= rmode;
            op_enable <= 1;
        end
    end
    always @(posedge clk) begin if (enable_reg_1) begin
            ready_0 <= 0;
            ready_1 <= 0;
            ready <= 0;
        end
        else begin
            ready_0 <= !(count_busy);
            ready_1 <= ready_0;
            ready <= ready_1;
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            underflow <= 0;
            overflow <= 0;
            inexact <= 0;
            exception <= 0;
            invalid <= 0;
            out <= 0;
        end
        else if (ready_1) begin
            underflow <= underflow_0;
            overflow <= overflow_0;
            inexact <= inexact_0;
            exception <= exception_0;
            invalid <= invalid_0;
            out <= (except_enable ? out_except : out_round);
        end
    end
endmodule
module fpu_u1 (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic[63:0] opa,
    input logic[63:0] opb,
    output reg sign,
    output reg[55:0] sum_2,
    output reg[10:0] exponent_2
);
    reg[10:0] exponent_a;
    reg[10:0] exponent_b;
    reg[51:0] mantissa_a;
    reg[51:0] mantissa_b;
    reg expa_gt_expb;
    reg[10:0] exponent_small;
    reg[10:0] exponent_large;
    reg[51:0] mantissa_small;
    reg[51:0] mantissa_large;
    reg small_is_denorm;
    reg large_is_denorm;
    reg large_norm_small_denorm;
    reg[10:0] exponent_diff;
    reg[54:0] large_add;
    reg[54:0] small_add;
    reg[54:0] small_shift;
    wire logic small_shift_nonzero = |({1'b0, small_shift[54:0]});
    wire logic small_is_nonzero = ((exponent_small > 0) | |(mantissa_small[51:0]));
    wire logic small_fraction_enable = (small_is_nonzero & !(small_shift_nonzero));
    wire logic[0:0] small_shift_2 = 56'h1;
    reg[54:0] small_shift_3;
    reg[55:0] sum;
    wire logic sum_overflow = sum[55];
    reg[10:0] exponent;
    wire logic sum_leading_one = sum_2[54];
    reg denorm_to_norm;
    always @(posedge clk) begin
        if (rst) begin
            sign <= 0;
            exponent_a <= 0;
            exponent_b <= 0;
            mantissa_a <= 0;
            mantissa_b <= 0;
            expa_gt_expb <= 0;
            exponent_small <= 0;
            exponent_large <= 0;
            mantissa_small <= 0;
            mantissa_large <= 0;
            small_is_denorm <= 0;
            large_is_denorm <= 0;
            large_norm_small_denorm <= 0;
            exponent_diff <= 0;
            large_add <= 0;
            small_add <= 0;
            small_shift <= 0;
            small_shift_3 <= 0;
            sum <= 0;
            sum_2 <= 0;
            exponent <= 0;
            denorm_to_norm <= 0;
            exponent_2 <= 0;
        end
        else if (enable) begin
            sign <= opa[63];
            exponent_a <= opa[62:52];
            exponent_b <= opb[62:52];
            mantissa_a <= opa[51:0];
            mantissa_b <= opb[51:0];
            expa_gt_expb <= (exponent_a > exponent_b);
            exponent_small <= (expa_gt_expb ? exponent_b : exponent_a);
            exponent_large <= (expa_gt_expb ? exponent_a : exponent_b);
            mantissa_small <= (expa_gt_expb ? mantissa_b : mantissa_a);
            mantissa_large <= (expa_gt_expb ? mantissa_a : mantissa_b);
            small_is_denorm <= !((exponent_small > 0));
            large_is_denorm <= !((exponent_large > 0));
            large_norm_small_denorm <= (small_is_denorm && !(large_is_denorm));
            exponent_diff <= ((exponent_large - exponent_small) - large_norm_small_denorm);
            large_add <= {1'b0, !(large_is_denorm), mantissa_large, 2'b0};
            small_add <= {1'b0, !(small_is_denorm), mantissa_small, 2'b0};
            small_shift <= (small_add >> exponent_diff);
            small_shift_3 <= (small_fraction_enable ? small_shift_2 : small_shift);
            sum <= (large_add + small_shift_3);
            sum_2 <= (sum_overflow ? (sum >> 1) : sum);
            exponent <= (sum_overflow ? (exponent_large + 1) : exponent_large);
            denorm_to_norm <= (sum_leading_one & large_is_denorm);
            exponent_2 <= (denorm_to_norm ? (exponent + 1) : exponent);
        end
    end
endmodule


module fpu_u2 (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic[63:0] opa,
    input logic[63:0] opb,
    input logic[2:0] fpu_op,
    output reg sign,
    output reg[55:0] diff_2,
    output reg[10:0] exponent_2
);
    reg [5:0] diff_shift;
    reg [5:0] diff_shift_2;
    reg[10:0] exponent_a;
    reg[10:0] exponent_b;
    reg[51:0] mantissa_a;
    reg[51:0] mantissa_b;
    reg expa_gt_expb;
    reg expa_et_expb;
    reg mana_gtet_manb;
    reg a_gtet_b;
    reg[10:0] exponent_small;
    reg[10:0] exponent_large;
    reg[51:0] mantissa_small;
    reg[51:0] mantissa_large;
    reg small_is_denorm;
    reg large_is_denorm;
    reg large_norm_small_denorm;
    reg small_is_nonzero;
    reg[10:0] exponent_diff;
    reg[54:0] minuend;
    reg[54:0] subtrahend;
    reg[54:0] subtra_shift;
    wire logic subtra_shift_nonzero = |(subtra_shift[54:0]);
    wire logic subtra_fraction_enable = (small_is_nonzero & !(subtra_shift_nonzero));
    wire logic [0:0] subtra_shift_2 = 55'h1;
    reg[54:0] subtra_shift_3;
    reg[54:0] diff;
    reg diffshift_gt_exponent;
    reg diffshift_et_55;
    reg[54:0] diff_1;
    reg[10:0] exponent;
    wire logic in_norm_out_denorm = ((exponent_large > 0) & (exponent == 0));
    always @(posedge clk) begin
        if (rst) begin
            exponent_a <= 0;
            exponent_b <= 0;
            mantissa_a <= 0;
            mantissa_b <= 0;
            expa_gt_expb <= 0;
            expa_et_expb <= 0;
            mana_gtet_manb <= 0;
            a_gtet_b <= 0;
            sign <= 0;
            exponent_small <= 0;
            exponent_large <= 0;
            mantissa_small <= 0;
            mantissa_large <= 0;
            small_is_denorm <= 0;
            large_is_denorm <= 0;
            large_norm_small_denorm <= 0;
            small_is_nonzero <= 0;
            exponent_diff <= 0;
            minuend <= 0;
            subtrahend <= 0;
            subtra_shift <= 0;
            subtra_shift_3 <= 0;
            diff_shift_2 <= 0;
            diff <= 0;
            diffshift_gt_exponent <= 0;
            diffshift_et_55 <= 0;
            diff_1 <= 0;
            exponent <= 0;
            exponent_2 <= 0;
            diff_2 <= 0;
        end
        else if (enable) begin
            exponent_a <= opa[62:52];
            exponent_b <= opb[62:52];
            mantissa_a <= opa[51:0];
            mantissa_b <= opb[51:0];
            expa_gt_expb <= (exponent_a > exponent_b);
            expa_et_expb <= (exponent_a == exponent_b);
            mana_gtet_manb <= (mantissa_a >= mantissa_b);
            a_gtet_b <= (expa_gt_expb | (expa_et_expb & mana_gtet_manb));
            sign <= (a_gtet_b ? opa[63] : (!(opb[63]) ^ (fpu_op == 3'b0)));
            exponent_small <= (a_gtet_b ? exponent_b : exponent_a);
            exponent_large <= (a_gtet_b ? exponent_a : exponent_b);
            mantissa_small <= (a_gtet_b ? mantissa_b : mantissa_a);
            mantissa_large <= (a_gtet_b ? mantissa_a : mantissa_b);
            small_is_denorm <= !((exponent_small > 0));
            large_is_denorm <= !((exponent_large > 0));
            large_norm_small_denorm <= ((small_is_denorm == 1) && (large_is_denorm == 0));
            small_is_nonzero <= ((exponent_small > 0) | |(mantissa_small[51:0]));
            exponent_diff <= ((exponent_large - exponent_small) - large_norm_small_denorm);
            minuend <= {!(large_is_denorm), mantissa_large, 2'b0};
            subtrahend <= {!(small_is_denorm), mantissa_small, 2'b0};
            subtra_shift <= (subtrahend >> exponent_diff);
            subtra_shift_3 <= (subtra_fraction_enable ? subtra_shift_2 : subtra_shift);
            diff_shift_2 <= diff_shift;
            diff <= (minuend - subtra_shift_3);
            diffshift_gt_exponent <= (diff_shift_2 > exponent_large);
            diffshift_et_55 <= (diff_shift_2 == 55);
            diff_1 <= (diffshift_gt_exponent ? (diff << exponent_large) : (diff << diff_shift_2));
            exponent <= (diffshift_gt_exponent ? 0 : (exponent_large - diff_shift_2));
            exponent_2 <= (diffshift_et_55 ? 0 : exponent);
            diff_2 <= (in_norm_out_denorm ? {1'b0, (diff_1 >> 1)} : {1'b0, diff_1});
        end
    end
    always @(diff) begin
        casex (diff)
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 0;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 1;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 2;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 3;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 4;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 5;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 6;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 7;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 8;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 9;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 10;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 11;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 12;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 13;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 14;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 15;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 16;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 17;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 18;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 19;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 20;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 21;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 22;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 23;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 24;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 25;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 26;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 27;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 28;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 29;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 30;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 31;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 32;
            end
            55'b1zzzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 33;
            end
            55'b1zzzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 34;
            end
            55'b1zzzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 35;
            end
            55'b1zzzzzzzzzzzzzzzzzz: begin
                diff_shift <= 36;
            end
            55'b1zzzzzzzzzzzzzzzzz: begin
                diff_shift <= 37;
            end
            55'b1zzzzzzzzzzzzzzzz: begin
                diff_shift <= 38;
            end
            55'b1zzzzzzzzzzzzzzz: begin
                diff_shift <= 39;
            end
            55'b1zzzzzzzzzzzzzz: begin
                diff_shift <= 40;
            end
            55'b1zzzzzzzzzzzzz: begin
                diff_shift <= 41;
            end
            55'b1zzzzzzzzzzzz: begin
                diff_shift <= 42;
            end
            55'b1zzzzzzzzzzz: begin
                diff_shift <= 43;
            end
            55'b1zzzzzzzzzz: begin
                diff_shift <= 44;
            end
            55'b1zzzzzzzzz: begin
                diff_shift <= 45;
            end
            55'b1zzzzzzzz: begin
                diff_shift <= 46;
            end
            55'b1zzzzzzz: begin
                diff_shift <= 47;
            end
            55'b1zzzzzz: begin
                diff_shift <= 48;
            end
            55'b1zzzzz: begin
                diff_shift <= 49;
            end
            55'b1zzzz: begin
                diff_shift <= 50;
            end
            55'b1zzz: begin
                diff_shift <= 51;
            end
            55'b1zz: begin
                diff_shift <= 52;
            end
            55'b1z: begin
                diff_shift <= 53;
            end
            55'h1: begin
                diff_shift <= 54;
            end
            55'h0: begin
                diff_shift <= 55;
            end
        endcase
    end
endmodule

module fpu_u3 (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic[63:0] opa,
    input logic[63:0] opb,
    output reg sign,
    output logic[55:0] product_7,
    output reg[11:0] exponent_5
);
    reg[5:0] product_shift;
    reg[5:0] product_shift_2;
    reg[51:0] mantissa_a;
    reg[51:0] mantissa_b;
    reg[10:0] exponent_a;
    reg[10:0] exponent_b;
    reg a_is_norm;
    reg b_is_norm;
    reg a_is_zero;
    reg b_is_zero;
    reg in_zero;
    reg[11:0] exponent_terms;
    reg exponent_gt_expoffset;
    reg[11:0] exponent_under;
    reg[11:0] exponent_1;
    wire logic [0:0] exponent = 0;
    reg[11:0] exponent_2;
    reg exponent_gt_prodshift;
    reg[11:0] exponent_3;
    reg[11:0] exponent_4;
    reg exponent_et_zero;
    reg[52:0] mul_a;
    reg[52:0] mul_b;
    reg[40:0] product_a;
    reg[40:0] product_b;
    reg[40:0] product_c;
    reg[25:0] product_d;
    reg[33:0] product_e;
    reg[33:0] product_f;
    reg[35:0] product_g;
    reg[28:0] product_h;
    reg[28:0] product_i;
    reg[30:0] product_j;
    reg [40:0] sum_0;
    reg [34:0] sum_1;
    reg[41:0] sum_2;
    reg [34:0] sum_3;
    reg [35:0] sum_4;
    reg [26:0] sum_5;
    reg[29:0] sum_6;
    reg[36:0] sum_7;
    reg[30:0] sum_8;
    reg[105:0] product;
    reg[105:0] product_1;
    reg[105:0] product_2;
    reg[105:0] product_3;
    reg[105:0] product_4;
    reg[105:0] product_5;
    reg[105:0] product_6;
    reg product_lsb;
    assign product_7 = {1'b0, product_6[105:52], product_lsb};
    always @(posedge clk) begin
        if (rst) begin
            sign <= 0;
            mantissa_a <= 0;
            mantissa_b <= 0;
            exponent_a <= 0;
            exponent_b <= 0;
            a_is_norm <= 0;
            b_is_norm <= 0;
            a_is_zero <= 0;
            b_is_zero <= 0;
            in_zero <= 0;
            exponent_terms <= 0;
            exponent_gt_expoffset <= 0;
            exponent_under <= 0;
            exponent_1 <= 0;
            exponent_2 <= 0;
            exponent_gt_prodshift <= 0;
            exponent_3 <= 0;
            exponent_4 <= 0;
            exponent_et_zero <= 0;
            mul_a <= 0;
            mul_b <= 0;
            product_a <= 0;
            product_b <= 0;
            product_c <= 0;
            product_d <= 0;
            product_e <= 0;
            product_f <= 0;
            product_g <= 0;
            product_h <= 0;
            product_i <= 0;
            product_j <= 0;
            sum_0 <= 0;
            sum_1 <= 0;
            sum_2 <= 0;
            sum_3 <= 0;
            sum_4 <= 0;
            sum_5 <= 0;
            sum_6 <= 0;
            sum_7 <= 0;
            sum_8 <= 0;
            product <= 0;
            product_1 <= 0;
            product_2 <= 0;
            product_3 <= 0;
            product_4 <= 0;
            product_5 <= 0;
            product_6 <= 0;
            product_lsb <= 0;
            exponent_5 <= 0;
            product_shift_2 <= 0;
        end
        else if (enable) begin
            sign <= (opa[63] ^ opb[63]);
            mantissa_a <= opa[51:0];
            mantissa_b <= opb[51:0];
            exponent_a <= opa[62:52];
            exponent_b <= opb[62:52];
            a_is_norm <= |(exponent_a);
            b_is_norm <= |(exponent_b);
            a_is_zero <= !(|(opa[62:0]));
            b_is_zero <= !(|(opb[62:0]));
            in_zero <= (a_is_zero | b_is_zero);
            exponent_terms <= (((exponent_a + exponent_b) + !(a_is_norm)) + !(b_is_norm));
            exponent_gt_expoffset <= (exponent_terms > 1021);
            exponent_under <= (1022 - exponent_terms);
            exponent_1 <= (exponent_terms - 1022);
            exponent_2 <= (exponent_gt_expoffset ? exponent_1 : exponent);
            exponent_gt_prodshift <= (exponent_2 > product_shift_2);
            exponent_3 <= (exponent_2 - product_shift);
            exponent_4 <= (exponent_gt_prodshift ? exponent_3 : exponent);
            exponent_et_zero <= (exponent_4 == 0);
            mul_a <= {a_is_norm, mantissa_a};
            mul_b <= {b_is_norm, mantissa_b};
            product_a <= (mul_a[23:0] * mul_b[16:0]);
            product_b <= (mul_a[23:0] * mul_b[33:17]);
            product_c <= (mul_a[23:0] * mul_b[50:34]);
            product_d <= (mul_a[23:0] * mul_b[52:51]);
            product_e <= (mul_a[40:24] * mul_b[16:0]);
            product_f <= (mul_a[40:24] * mul_b[33:17]);
            product_g <= (mul_a[40:24] * mul_b[52:34]);
            product_h <= (mul_a[52:41] * mul_b[16:0]);
            product_i <= (mul_a[52:41] * mul_b[33:17]);
            product_j <= (mul_a[52:41] * mul_b[52:34]);
            sum_0 <= (product_a[40:17] + product_b);
            sum_1 <= ({1'b0, sum_0[40:7]} + product_e);
            sum_2 <= ({1'b0, sum_1[34:10]} + product_c);
            sum_3 <= (sum_2[41:7] + product_h);
            sum_4 <= (sum_3 + product_f);
            sum_5 <= ({1'b0, sum_4[35:10]} + product_d);
            sum_6 <= ({1'b0, sum_5[26:7]} + product_i);
            sum_7 <= (sum_6 + product_g);
            sum_8 <= (sum_7[36:17] + product_j);
            product <= {sum_8, sum_7[16:0], sum_5[6:0], sum_4[9:0], sum_2[6:0], sum_1[9:0], sum_0[6:0], product_a[16:0]};
            product_1 <= (product >> exponent_under);
            product_2 <= (exponent_gt_expoffset ? product : product_1);
            product_3 <= (product_2 << product_shift_2);
            product_4 <= (product_2 << exponent_2);
            product_5 <= (exponent_gt_prodshift ? product_3 : product_4);
            product_6 <= (exponent_et_zero ? (product_5 >> 1) : product_5);
            product_lsb <= |(product_6[51:0]);
            exponent_5 <= (in_zero ? 12'd0 : exponent_4);
            product_shift_2 <= product_shift;
        end
    end
    always @(product) begin
        casex (product)
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 0;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 1;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 2;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 3;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 4;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 5;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 6;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 7;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 8;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 9;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 10;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 11;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 12;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 13;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 14;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 15;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 16;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 17;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 18;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 19;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 20;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 21;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 22;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 23;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 24;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 25;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 26;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 27;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 28;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 29;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 30;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 31;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 32;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 33;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 34;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 35;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 36;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 37;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 38;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 39;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 40;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 41;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 42;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 43;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 44;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 45;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 46;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 47;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 48;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 49;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 50;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 51;
            end
            106'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 52;
            end
            106'b0zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                product_shift <= 53;
            end
        endcase
    end
endmodule

module fpu_u4 (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic[63:0] opa,
    input logic[63:0] opb,
    output logic sign,
    output logic[55:0] mantissa_7,
    output reg[11:0] exponent_out
);
    reg[53:0] dividend_reg;
    reg [52:0] divisor_reg;
    reg enable_reg;
    reg enable_reg_2;
    reg enable_reg_a;
    reg enable_reg_b;
    reg enable_reg_c;
    reg enable_reg_d;
    reg enable_reg_e;
    reg[5:0] dividend_shift;
    reg[5:0] dividend_shift_2;
    reg[5:0] divisor_shift;
    reg[5:0] divisor_shift_2;
    reg[5:0] count_out;
    assign sign = (opa[63] ^ opb[63]);
    reg[51:0] mantissa_a;
    reg[51:0] mantissa_b;
    wire logic[10:0] expon_a = opa[62:52];
    wire logic[10:0] expon_b = opb[62:52];
    wire logic a_is_norm = |(expon_a);
    wire logic b_is_norm = |(expon_b);
    wire logic a_is_zero = !(|(opa[62:0]));
    wire logic [10:0] exponent_a = {1'b0, expon_a};
    wire logic [10:0] exponent_b = {1'b0, expon_b};
    reg[51:0] dividend_a;
    reg[51:0] dividend_a_shifted;
    wire logic[52:0] dividend_denorm = {dividend_a_shifted, 1'b0};
    wire logic [52:0] dividend_1 = (a_is_norm ? {2'b1, dividend_a} : {1'b0, dividend_denorm});
    reg[51:0] divisor_b;
    reg[51:0] divisor_b_shifted;
    wire logic[52:0] divisor_denorm = {divisor_b_shifted, 1'b0};
    wire logic [52:0] divisor_1 = (b_is_norm ? {2'b1, divisor_b} : {1'b0, divisor_denorm});
    wire logic[5:0] count_index = count_out;
    wire logic count_nonzero = !((count_index == 0));
    reg[53:0] quotient;
    reg[53:0] quotient_out;
    reg [52:0] remainder;
    reg [52:0] remainder_out;
    reg remainder_msb;
    reg count_nonzero_reg;
    reg count_nonzero_reg_2;
    reg[11:0] expon_term;
    reg expon_uf_1;
    reg[11:0] expon_uf_term_1;
    reg[11:0] expon_final_1;
    reg[11:0] expon_final_2;
    reg [5:0] expon_shift_a;
    reg [5:0] expon_shift_b;
    reg expon_uf_2;
    reg[11:0] expon_uf_term_2;
    reg[11:0] expon_uf_term_3;
    reg expon_uf_gt_maxshift;
    reg[11:0] expon_uf_term_4;
    reg[11:0] expon_final_3;
    reg[11:0] expon_final_4;
    wire logic quotient_msb = quotient_out[53];
    reg expon_final_4_et0;
    reg expon_final_4_term;
    reg[11:0] expon_final_5;
    reg[51:0] mantissa_1;
    wire logic[51:0] mantissa_2 = quotient_out[52:1];
    wire logic[51:0] mantissa_3 = quotient_out[51:0];
    wire logic[51:0] mantissa_4 = (quotient_msb ? mantissa_2 : mantissa_3);
    wire logic[51:0] mantissa_5 = ((expon_final_4 == 1) ? mantissa_2 : mantissa_4);
    wire logic[51:0] mantissa_6 = (expon_final_4_et0 ? mantissa_1 : mantissa_5);
    wire logic[107:0] remainder_a = {quotient_out[53:0], remainder_msb, remainder_out[52:0]};
    reg[6:0] remainder_shift_term;
    reg[107:0] remainder_b;
    wire logic[55:0] remainder_1 = remainder_b[107:52];
    wire logic[55:0] remainder_2 = {quotient_out[0], remainder_msb, remainder_out[52:0], 1'b0};
    wire logic[55:0] remainder_3 = {remainder_msb, remainder_out[52:0], 2'b0};
    wire logic[55:0] remainder_4 = (quotient_msb ? remainder_2 : remainder_3);
    wire logic[55:0] remainder_5 = ((expon_final_4 == 1) ? remainder_2 : remainder_4);
    wire logic[55:0] remainder_6 = (expon_final_4_et0 ? remainder_1 : remainder_5);
    wire logic m_norm = |(expon_final_5);
    wire logic rem_lsb = |(remainder_6[54:0]);
    assign mantissa_7 = {1'b0, m_norm, mantissa_6, remainder_6[55], rem_lsb};
    always @(posedge clk) begin begin
            exponent_out <= (a_is_zero ? 12'd0 : expon_final_5);
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            count_out <= 0;
        end
        else if (enable_reg) begin
            count_out <= 53;
        end
        else if (count_nonzero) begin
            count_out <= (count_out - 1);
        end
    end
    always @(posedge clk) begin begin
            quotient_out <= quotient;
            remainder_out <= remainder;
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            quotient <= 0;
        end
        else if (count_nonzero_reg) begin
            quotient[count_index] <= !((divisor_reg > dividend_reg));
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            remainder <= 0;
            remainder_msb <= 0;
        end
        else if ((!(count_nonzero_reg) & count_nonzero_reg_2)) begin
            remainder <= dividend_reg;
            remainder_msb <= ((divisor_reg > dividend_reg) ? 0 : 1);
        end
    end
    always @(posedge clk) begin if (enable_reg_e) begin
            dividend_reg <= dividend_1;
            divisor_reg <= divisor_1;
        end
        else if (count_nonzero_reg) begin
            dividend_reg <= ((divisor_reg > dividend_reg) ? (dividend_reg << 1) : ((dividend_reg - divisor_reg) << 1));
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            expon_term <= 0;
            expon_uf_1 <= 0;
            expon_uf_term_1 <= 0;
            expon_final_1 <= 0;
            expon_final_2 <= 0;
            expon_shift_a <= 0;
            expon_shift_b <= 0;
            expon_uf_2 <= 0;
            expon_uf_term_2 <= 0;
            expon_uf_term_3 <= 0;
            expon_uf_gt_maxshift <= 0;
            expon_uf_term_4 <= 0;
            expon_final_3 <= 0;
            expon_final_4 <= 0;
            expon_final_4_et0 <= 0;
            expon_final_4_term <= 0;
            expon_final_5 <= 0;
            mantissa_a <= 0;
            mantissa_b <= 0;
            dividend_a <= 0;
            divisor_b <= 0;
            dividend_shift_2 <= 0;
            divisor_shift_2 <= 0;
            remainder_shift_term <= 0;
            remainder_b <= 0;
            dividend_a_shifted <= 0;
            divisor_b_shifted <= 0;
            mantissa_1 <= 0;
        end
        else if (enable_reg_2) begin
            expon_term <= (exponent_a + 1023);
            expon_uf_1 <= (exponent_b > expon_term);
            expon_uf_term_1 <= (expon_uf_1 ? (exponent_b - expon_term) : 0);
            expon_final_1 <= (expon_term - exponent_b);
            expon_final_2 <= (expon_uf_1 ? 0 : expon_final_1);
            expon_shift_a <= (a_is_norm ? 0 : dividend_shift_2);
            expon_shift_b <= (b_is_norm ? 0 : divisor_shift_2);
            expon_uf_2 <= (expon_shift_a > expon_final_2);
            expon_uf_term_2 <= (expon_uf_2 ? (expon_shift_a - expon_final_2) : 0);
            expon_uf_term_3 <= (expon_uf_term_2 + expon_uf_term_1);
            expon_uf_gt_maxshift <= (expon_uf_term_3 > 51);
            expon_uf_term_4 <= (expon_uf_gt_maxshift ? 52 : expon_uf_term_3);
            expon_final_3 <= (expon_uf_2 ? 0 : (expon_final_2 - expon_shift_a));
            expon_final_4 <= (expon_final_3 + expon_shift_b);
            expon_final_4_et0 <= (expon_final_4 == 0);
            expon_final_4_term <= (expon_final_4_et0 ? 0 : 1);
            expon_final_5 <= (quotient_msb ? expon_final_4 : (expon_final_4 - expon_final_4_term));
            mantissa_a <= opa[51:0];
            mantissa_b <= opb[51:0];
            dividend_a <= mantissa_a;
            divisor_b <= mantissa_b;
            dividend_shift_2 <= dividend_shift;
            divisor_shift_2 <= divisor_shift;
            remainder_shift_term <= (52 - expon_uf_term_4);
            remainder_b <= (remainder_a << remainder_shift_term);
            dividend_a_shifted <= (dividend_a << dividend_shift_2);
            divisor_b_shifted <= (divisor_b << divisor_shift_2);
            mantissa_1 <= (quotient_out[53:2] >> expon_uf_term_4);
        end
    end
    always @(posedge clk) begin begin
            count_nonzero_reg <= count_nonzero;
            count_nonzero_reg_2 <= count_nonzero_reg;
            enable_reg <= enable_reg_e;
            enable_reg_a <= enable;
            enable_reg_b <= enable_reg_a;
            enable_reg_c <= enable_reg_b;
            enable_reg_d <= enable_reg_c;
            enable_reg_e <= enable_reg_d;
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            enable_reg_2 <= 0;
        end
        else if (enable) begin
            enable_reg_2 <= 1;
        end
    end
    always @(dividend_a) begin
        casex (dividend_a)
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 0;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 1;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 2;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 3;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 4;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 5;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 6;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 7;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 8;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 9;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 10;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 11;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 12;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 13;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 14;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 15;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 16;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 17;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 18;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 19;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 20;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 21;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 22;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 23;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 24;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 25;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 26;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 27;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 28;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 29;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 30;
            end
            52'b1zzzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 31;
            end
            52'b1zzzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 32;
            end
            52'b1zzzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 33;
            end
            52'b1zzzzzzzzzzzzzzzzz: begin
                dividend_shift <= 34;
            end
            52'b1zzzzzzzzzzzzzzzz: begin
                dividend_shift <= 35;
            end
            52'b1zzzzzzzzzzzzzzz: begin
                dividend_shift <= 36;
            end
            52'b1zzzzzzzzzzzzzz: begin
                dividend_shift <= 37;
            end
            52'b1zzzzzzzzzzzzz: begin
                dividend_shift <= 38;
            end
            52'b1zzzzzzzzzzzz: begin
                dividend_shift <= 39;
            end
            52'b1zzzzzzzzzzz: begin
                dividend_shift <= 40;
            end
            52'b1zzzzzzzzzz: begin
                dividend_shift <= 41;
            end
            52'b1zzzzzzzzz: begin
                dividend_shift <= 42;
            end
            52'b1zzzzzzzz: begin
                dividend_shift <= 43;
            end
            52'b1zzzzzzz: begin
                dividend_shift <= 44;
            end
            52'b1zzzzzz: begin
                dividend_shift <= 45;
            end
            52'b1zzzzz: begin
                dividend_shift <= 46;
            end
            52'b1zzzz: begin
                dividend_shift <= 47;
            end
            52'b1zzz: begin
                dividend_shift <= 48;
            end
            52'b1zz: begin
                dividend_shift <= 49;
            end
            52'b1z: begin
                dividend_shift <= 50;
            end
            52'h1: begin
                dividend_shift <= 51;
            end
            52'h0: begin
                dividend_shift <= 52;
            end
        endcase
    end
    always @(divisor_b) begin
        casex (divisor_b)
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 0;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 1;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 2;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 3;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 4;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 5;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 6;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 7;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 8;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 9;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 10;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 11;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 12;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 13;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 14;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 15;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 16;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 17;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 18;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 19;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 20;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 21;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 22;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 23;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 24;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 25;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 26;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 27;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 28;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 29;
            end
            52'b1zzzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 30;
            end
            52'b1zzzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 31;
            end
            52'b1zzzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 32;
            end
            52'b1zzzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 33;
            end
            52'b1zzzzzzzzzzzzzzzzz: begin
                divisor_shift <= 34;
            end
            52'b1zzzzzzzzzzzzzzzz: begin
                divisor_shift <= 35;
            end
            52'b1zzzzzzzzzzzzzzz: begin
                divisor_shift <= 36;
            end
            52'b1zzzzzzzzzzzzzz: begin
                divisor_shift <= 37;
            end
            52'b1zzzzzzzzzzzzz: begin
                divisor_shift <= 38;
            end
            52'b1zzzzzzzzzzzz: begin
                divisor_shift <= 39;
            end
            52'b1zzzzzzzzzzz: begin
                divisor_shift <= 40;
            end
            52'b1zzzzzzzzzz: begin
                divisor_shift <= 41;
            end
            52'b1zzzzzzzzz: begin
                divisor_shift <= 42;
            end
            52'b1zzzzzzzz: begin
                divisor_shift <= 43;
            end
            52'b1zzzzzzz: begin
                divisor_shift <= 44;
            end
            52'b1zzzzzz: begin
                divisor_shift <= 45;
            end
            52'b1zzzzz: begin
                divisor_shift <= 46;
            end
            52'b1zzzz: begin
                divisor_shift <= 47;
            end
            52'b1zzz: begin
                divisor_shift <= 48;
            end
            52'b1zz: begin
                divisor_shift <= 49;
            end
            52'b1z: begin
                divisor_shift <= 50;
            end
            52'h1: begin
                divisor_shift <= 51;
            end
            52'h0: begin
                divisor_shift <= 52;
            end
        endcase
    end
endmodule
module fpu_u5 (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic[1:0] round_mode,
    input logic sign_term,
    input logic[55:0] mantissa_term,
    input logic[11:0] exponent_term,
    output reg[63:0] round_out,
    output reg[11:0] exponent_final
);
    wire logic[2:0] rounding_amount = 56'h4;
    wire logic round_nearest = (round_mode == 2'b0);
    wire logic round_to_pos_inf = (round_mode == 2'b10);
    wire logic round_to_neg_inf = (round_mode == 2'b11);
    wire logic round_nearest_trigger = (round_nearest & mantissa_term[1]);
    wire logic round_to_pos_inf_trigger = (!(sign_term) & |(mantissa_term[1:0]));
    wire logic round_to_neg_inf_trigger = (sign_term & |(mantissa_term[1:0]));
    wire logic round_trigger = ((round_nearest_trigger | (round_to_pos_inf & round_to_pos_inf_trigger)) | (round_to_neg_inf & round_to_neg_inf_trigger));
    reg[55:0] sum_round;
    wire logic sum_round_overflow = sum_round[55];
    reg[53:0] sum_round_2;
    reg[11:0] exponent_round;
    reg[53:0] sum_final;
    always @(posedge clk) begin
        sum_round <= (rounding_amount + mantissa_term);
        sum_round_2 <= sum_round;
        exponent_round <= (sum_round_overflow ? (exponent_term + 1) : exponent_term);
        sum_final <= (round_trigger ? sum_round_2 : mantissa_term);
        exponent_final <= (round_trigger ? exponent_round : exponent_term);
        round_out <= {sign_term, exponent_final[10:0], sum_final[53:2]};
    end
endmodule

module fpu_u6 (
    input logic clk,
    input logic rst,
    input logic enable,
    input logic[1:0] rmode,
    input logic[63:0] opa,
    input logic[63:0] opb,
    input logic[63:0] in_except,
    input logic[11:0] exponent_in,
    input logic[1:0] mantissa_in,
    input logic[2:0] fpu_op,
    output reg[63:0] out,
    output reg ex_enable,
    output reg underflow,
    output reg overflow,
    output reg inexact,
    output reg exception,
    output reg invalid
);
    reg in_et_zero;
    reg opa_et_zero;
    reg opb_et_zero;
    reg add;
    reg subtract;
    reg multiply;
    reg divide;
    reg opa_QNaN;
    reg opb_QNaN;
    reg opa_SNaN;
    reg opb_SNaN;
    reg opa_pos_inf;
    reg opb_pos_inf;
    reg opa_neg_inf;
    reg opb_neg_inf;
    reg opa_inf;
    reg opb_inf;
    reg NaN_input;
    reg SNaN_input;
    reg a_NaN;
    reg div_by_0;
    reg div_0_by_0;
    reg div_inf_by_inf;
    reg div_by_inf;
    reg mul_0_by_inf;
    reg mul_inf;
    reg div_inf;
    reg add_inf;
    reg sub_inf;
    reg addsub_inf_invalid;
    reg addsub_inf;
    reg out_inf_trigger;
    reg out_pos_inf;
    reg out_neg_inf;
    reg round_to_zero;
    reg round_to_pos_inf;
    reg round_to_neg_inf;
    reg inf_round_down_trigger;
    reg mul_uf;
    reg div_uf;
    reg underflow_trigger;
    reg invalid_trigger;
    reg overflow_trigger;
    reg inexact_trigger;
    reg except_trigger;
    reg enable_trigger;
    reg NaN_out_trigger;
    reg SNaN_trigger;
    wire logic[10:0] exp_2047 = 11'd2047;
    wire logic[10:0] exp_2046 = 11'd2046;
    reg[62:0] NaN_output_0;
    reg[62:0] NaN_output;
    wire logic[51:0] mantissa_max = 52'hfffffffffffff;
    reg[62:0] inf_round_down;
    reg[62:0] out_inf;
    reg[63:0] out_0;
    reg[63:0] out_1;
    reg[63:0] out_2;
    always @(posedge clk) begin
        if (rst) begin
            in_et_zero <= 0;
            opa_et_zero <= 0;
            opb_et_zero <= 0;
            add <= 0;
            subtract <= 0;
            multiply <= 0;
            divide <= 0;
            opa_QNaN <= 0;
            opb_QNaN <= 0;
            opa_SNaN <= 0;
            opb_SNaN <= 0;
            opa_pos_inf <= 0;
            opb_pos_inf <= 0;
            opa_neg_inf <= 0;
            opb_neg_inf <= 0;
            opa_inf <= 0;
            opb_inf <= 0;
            NaN_input <= 0;
            SNaN_input <= 0;
            a_NaN <= 0;
            div_by_0 <= 0;
            div_0_by_0 <= 0;
            div_inf_by_inf <= 0;
            div_by_inf <= 0;
            mul_0_by_inf <= 0;
            mul_inf <= 0;
            div_inf <= 0;
            add_inf <= 0;
            sub_inf <= 0;
            addsub_inf_invalid <= 0;
            addsub_inf <= 0;
            out_inf_trigger <= 0;
            out_pos_inf <= 0;
            out_neg_inf <= 0;
            round_to_zero <= 0;
            round_to_pos_inf <= 0;
            round_to_neg_inf <= 0;
            inf_round_down_trigger <= 0;
            mul_uf <= 0;
            div_uf <= 0;
            underflow_trigger <= 0;
            invalid_trigger <= 0;
            overflow_trigger <= 0;
            inexact_trigger <= 0;
            except_trigger <= 0;
            enable_trigger <= 0;
            NaN_out_trigger <= 0;
            SNaN_trigger <= 0;
            NaN_output_0 <= 0;
            NaN_output <= 0;
            inf_round_down <= 0;
            out_inf <= 0;
            out_0 <= 0;
            out_1 <= 0;
            out_2 <= 0;
        end
        else begin
            in_et_zero <= !(|(in_except[62:0]));
            opa_et_zero <= !(|(opa[62:0]));
            opb_et_zero <= !(|(opb[62:0]));
            add <= (fpu_op == 3'b0);
            subtract <= (fpu_op == 3'b1);
            multiply <= (fpu_op == 3'b10);
            divide <= (fpu_op == 3'b11);
            opa_QNaN <= ((opa[62:52] == 2047) & opa[51]);
            opb_QNaN <= ((opb[62:52] == 2047) & |(opb[51:0]));
            opa_SNaN <= (((opa[62:52] == 2047) & |(opa[51:0])) & !(opa[51]));
            opb_SNaN <= (((opb[62:52] == 2047) & |(opb[51:0])) & !(opb[51]));
            opa_pos_inf <= ((!(opa[63]) & (opa[62:52] == 2047)) & !(|(opa[51:0])));
            opb_pos_inf <= ((!(opb[63]) & (opb[62:52] == 2047)) & !(|(opb[51:0])));
            opa_neg_inf <= ((opa[63] & (opa[62:52] == 2047)) & !(|(opa[51:0])));
            opb_neg_inf <= ((opb[63] & (opb[62:52] == 2047)) & !(|(opb[51:0])));
            opa_inf <= ((opa[62:52] == 2047) & !(|(opa[51:0])));
            opb_inf <= ((opb[62:52] == 2047) & !(|(opb[51:0])));
            NaN_input <= (((opa_QNaN | opb_QNaN) | opa_SNaN) | opb_SNaN);
            SNaN_input <= (opa_SNaN | opb_SNaN);
            a_NaN <= (opa_QNaN | opa_SNaN);
            div_by_0 <= ((divide & opb_et_zero) & !(opa_et_zero));
            div_0_by_0 <= ((divide & opb_et_zero) & opa_et_zero);
            div_inf_by_inf <= ((divide & opa_inf) & opb_inf);
            div_by_inf <= ((divide & !(opa_inf)) & opb_inf);
            mul_0_by_inf <= (multiply & ((opa_inf & opb_et_zero) | (opa_et_zero & opb_inf)));
            mul_inf <= ((multiply & (opa_inf | opb_inf)) & !(mul_0_by_inf));
            div_inf <= ((divide & opa_inf) & !(opb_inf));
            add_inf <= (add & (opa_inf | opb_inf));
            sub_inf <= (subtract & (opa_inf | opb_inf));
            addsub_inf_invalid <= (((((add & opa_pos_inf) & opb_neg_inf) | ((add & opa_neg_inf) & opb_pos_inf)) | ((subtract & opa_pos_inf) & opb_pos_inf)) | ((subtract & opa_neg_inf) & opb_neg_inf));
            addsub_inf <= ((add_inf | sub_inf) & !(addsub_inf_invalid));
            out_inf_trigger <= ((((addsub_inf | mul_inf) | div_inf) | div_by_0) | (exponent_in > 2046));
            out_pos_inf <= (out_inf_trigger & !(in_except[63]));
            out_neg_inf <= (out_inf_trigger & in_except[63]);
            round_to_zero <= (rmode == 2'b1);
            round_to_pos_inf <= (rmode == 2'b10);
            round_to_neg_inf <= (rmode == 2'b11);
            inf_round_down_trigger <= (((out_pos_inf & round_to_neg_inf) | (out_neg_inf & round_to_pos_inf)) | (out_inf_trigger & round_to_zero));
            mul_uf <= (((multiply & !(opa_et_zero)) & !(opb_et_zero)) & in_et_zero);
            div_uf <= ((divide & !(opa_et_zero)) & in_et_zero);
            underflow_trigger <= ((div_by_inf | mul_uf) | div_uf);
            invalid_trigger <= ((((SNaN_input | addsub_inf_invalid) | mul_0_by_inf) | div_0_by_0) | div_inf_by_inf);
            overflow_trigger <= (out_inf_trigger & !(NaN_input));
            inexact_trigger <= (((|(mantissa_in[1:0]) | out_inf_trigger) | underflow_trigger) & !(NaN_input));
            except_trigger <= ((invalid_trigger | underflow_trigger) | inexact_trigger);
            enable_trigger <= ((except_trigger | out_inf_trigger) | NaN_input);
            NaN_out_trigger <= (NaN_input | invalid_trigger);
            SNaN_trigger <= (invalid_trigger & !(SNaN_input));
            NaN_output_0 <= (a_NaN ? {exp_2047, 1'b1, opa[50:0]} : {exp_2047, 1'b1, opb[50:0]});
            NaN_output <= (SNaN_trigger ? {exp_2047, 2'b1, opa[49:0]} : NaN_output_0);
            inf_round_down <= {exp_2046, mantissa_max};
            out_inf <= (inf_round_down_trigger ? inf_round_down : {exp_2047, 52'h0});
            out_0 <= (underflow_trigger ? {in_except[63], 63'h0} : in_except);
            out_1 <= (out_inf_trigger ? {in_except[63], out_inf} : out_0);
            out_2 <= (NaN_out_trigger ? {in_except[63], NaN_output} : out_1);
        end
    end
    always @(posedge clk) begin
        if (rst) begin
            ex_enable <= 0;
            underflow <= 0;
            overflow <= 0;
            inexact <= 0;
            exception <= 0;
            invalid <= 0;
            out <= 0;
        end
        else begin
            ex_enable <= enable_trigger;
            underflow <= underflow_trigger;
            overflow <= overflow_trigger;
            inexact <= inexact_trigger;
            exception <= except_trigger;
            invalid <= invalid_trigger;
            out <= out_2;
        end
    end
endmodule
