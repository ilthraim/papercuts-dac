
module divider_dshift_shifter_0_shift_7b_0 (
    input logic[6:0] i_shift,
    input logic[31:0] i_data,
    output logic[31:0] o_data
);
    wire logic[31:0] data1;
    assign data1 = (i_shift[3] ? {i_data[27:0], 4'b0} : i_data);
    wire logic[2:0] shift1;
    assign shift1 = ( (i_shift[6:4] ^ {3{i_shift[3]}}));
    divider_dshift_shifter_0_shift_7b_0_shift_3b_0 shift_3b_0 (
        .i_shift(shift1),
        .i_data(data1),
        .o_data(o_data)
    );
endmodule