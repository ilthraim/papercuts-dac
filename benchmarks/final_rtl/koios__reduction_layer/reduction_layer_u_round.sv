module reduction_layer_u_round (
    input logic[19:0] i_data,
    output logic[15:0] o_data
);
    wire logic[19:0] w_convergent;
    assign w_convergent = (i_data[19:0] + {16'd0, i_data[4], {3{!(i_data[4])}}});
    assign o_data = w_convergent[19:4];
endmodule
