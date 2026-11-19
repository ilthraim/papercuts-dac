
module divider_dshift_shifter_0_shift_7b_0_shift_3b_0 (
    input logic[2:0] i_shift,
    input logic[31:0] i_data,
    output logic[31:0] o_data
);
    wire logic[31:0] data1;
    assign data1 = (i_shift[1] ? {i_data[29:0], 2'b0} : i_data);
    wire logic shift1;
    assign shift1 = ((i_shift[0]) | (i_shift[2] ^ i_shift[1]));
    divider_dshift_shifter_0_shift_7b_0_shift_3b_0_shift_1b_0 shift_1b_0 (
        .i_shift(shift1),
        .i_data(data1),
        .o_data(o_data)
    );
endmodule