
module PID_multiplier_16x16bit_pipelined_booth_array_0 (
    input logic[15:0] multiplier,
    output logic[7:0] zero,
    output logic[7:0] double,
    output logic[7:0] negation
);
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_0 booth_radix4_0 (
        .codes({multiplier[1:0], 1'b0}),
        .zero(zero[0]),
        .double(double[0]),
        .negation(negation[0])
    );
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_1 booth_radix4_1 (
        .codes(multiplier[3:1]),
        .zero(zero[1]),
        .double(double[1]),
        .negation(negation[1])
    );
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_2 booth_radix4_2 (
        .codes(multiplier[5:3]),
        .zero(zero[2]),
        .double(double[2]),
        .negation(negation[2])
    );
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_3 booth_radix4_3 (
        .codes(multiplier[7:5]),
        .zero(zero[3]),
        .double(double[3]),
        .negation(negation[3])
    );
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_4 booth_radix4_4 (
        .codes(multiplier[9:7]),
        .zero(zero[4]),
        .double(double[4]),
        .negation(negation[4])
    );
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_5 booth_radix4_5 (
        .codes(multiplier[11:9]),
        .zero(zero[5]),
        .double(double[5]),
        .negation(negation[5])
    );
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_6 booth_radix4_6 (
        .codes(multiplier[13:11]),
        .zero(zero[6]),
        .double(double[6]),
        .negation(negation[6])
    );
    PID_multiplier_16x16bit_pipelined_booth_array_0_booth_radix4_7 booth_radix4_7 (
        .codes(multiplier[15:13]),
        .zero(zero[7]),
        .double(double[7]),
        .negation(negation[7])
    );
endmodule