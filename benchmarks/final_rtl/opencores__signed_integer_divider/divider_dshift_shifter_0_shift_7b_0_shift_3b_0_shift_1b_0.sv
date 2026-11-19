
module divider_dshift_shifter_0_shift_7b_0_shift_3b_0_shift_1b_0 (
    input logic i_shift,
    input logic[31:0] i_data,
    output logic[31:0] o_data
);
    assign o_data = (i_shift ? {i_data[30:0], 1'b0} : i_data);
endmodule