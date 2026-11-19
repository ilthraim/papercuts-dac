module mod3 (
    input logic[7:0] dat_i,
    output logic[1:0] reminder
);
    wire logic[1:0] dat_1;
    wire logic[1:0] dat_2;
    wire logic[1:0] dat_3;
    wire logic[1:0] dat_4;
    wire logic[1:0] dat_5;
    wire logic[1:0] dat_6;
    mod3_TC0 TC0 (
        .plus_one(dat_i[0]),
        .minus_one(dat_i[1]),
        .dat_o(dat_1)
    );
    mod3_TC1 TC1 (
        .plus_one(dat_i[2]),
        .minus_one(dat_i[3]),
        .dat_o(dat_2)
    );
    mod3_TC2 TC2 (
        .plus_one(dat_i[4]),
        .minus_one(dat_i[5]),
        .dat_o(dat_3)
    );
    mod3_TC3 TC3 (
        .plus_one(dat_i[6]),
        .minus_one(dat_i[7]),
        .dat_o(dat_4)
    );
    mod3_MA0 MA0 (
        .din_a(dat_1),
        .din_b(dat_2),
        .dat_o(dat_5)
    );
    mod3_MA1 MA1 (
        .din_a(dat_3),
        .din_b(dat_4),
        .dat_o(dat_6)
    );
    mod3_MA3 MA3 (
        .din_a(dat_5),
        .din_b(dat_6),
        .dat_o(reminder)
    );
endmodule