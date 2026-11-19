
module divider_dshift_shifter_0 (
    input logic[31:0] i_data,
    output logic[31:0] o_data,
    output logic[4:0] o_shifted
);
    wire logic[31:0] node_0;
    assign node_0 = (i_data[31] ? i_data : ~(i_data));
    wire logic[15:0] onode_1;
    assign onode_1[11] = (node_0[22] & node_0[23]);
    assign onode_1[12] = (node_0[24] & node_0[25]);
    assign onode_1[13] = (node_0[26] & node_0[27]);
    assign onode_1[14] = (node_0[28] & node_0[29]);
    assign onode_1[15] = (node_0[30]);
    wire logic[15:0] onode_2;
    assign onode_2[11] = (onode_1[11] & onode_1[12]);
    assign onode_2[12] = (onode_1[12] & onode_1[13]);
    assign onode_2[13] = (onode_1[13] & onode_1[14]);
    assign onode_2[14] = (onode_1[14] & onode_1[15]);
    assign onode_2[15] = onode_1[15];
    wire logic[15:0] onode_3;
    assign onode_3[11] = (onode_2[11] & onode_2[13]);
    assign onode_3[12] = (onode_2[12] & onode_2[14]);
    assign onode_3[13] = (onode_2[13] & onode_2[15]);
    assign onode_3[14] = onode_2[14];
    assign onode_3[15] = onode_2[15];
    wire logic[15:0] onode_4;
    assign onode_4[11] = (onode_3[11] & onode_3[15]);
    assign onode_4[12] = onode_3[12];
    assign onode_4[13] = onode_3[13];
    assign onode_4[14] = onode_3[14];
    assign onode_4[15] = onode_3[15];
    wire logic[15:0] onode_5;
    assign onode_5[11] = onode_4[11];
    assign onode_5[12] = onode_4[12];
    assign onode_5[13] = onode_4[13];
    assign onode_5[14] = onode_4[14];
    assign onode_5[15] = onode_4[15];
    wire logic[14:0] enode;
    assign enode[14] = (onode_5[15] & node_0[29]);
    assign enode[13] = (onode_5[14] & node_0[27]);
    assign enode[12] = (onode_5[13] & node_0[25]);
    assign enode[11] = (onode_5[12] & node_0[23]);
    wire logic shift_1;
    assign shift_1 = onode_5[15];
    wire logic[1:0] shift_2;
    assign shift_2[0] = onode_5[14];
    assign shift_2[1] = enode[14];
    wire logic[1:0] shift_3;
    assign shift_3[0] = onode_5[13];
    assign shift_3[1] = enode[13];
    wire logic[3:0] shift_4;
    assign shift_4[0] = onode_5[11];
    assign shift_4[1] = enode[11];
    assign shift_4[2] = onode_5[12];
    assign shift_4[3] = enode[12];
    wire logic[31:0] data_1;
    wire logic[31:0] data_2;
    wire logic[31:0] data_3;
    divider_dshift_shifter_0_shift_1b_0 shift_1b_0 (
        .i_shift(shift_1),
        .i_data(i_data),
        .o_data(data_1)
    );
    divider_dshift_shifter_0_shift_3b_0 shift_3b_0 (
        .i_shift({shift_2, 1'b0}),
        .i_data(data_1),
        .o_data(data_2)
    );
    divider_dshift_shifter_0_shift_3b_1 shift_3b_1 (
        .i_shift({shift_3, 1'b0}),
        .i_data(data_2),
        .o_data(data_3)
    );
    divider_dshift_shifter_0_shift_7b_0 shift_7b_0 (
        .i_shift({shift_4, 3'b0}),
        .i_data(data_3),
        .o_data(o_data)
    );
    wire logic [0:0] shifted_1;
    wire logic [1:0] shifted_2;
    wire logic [2:0] shifted_3;
    assign shifted_1 = (shift_1 ? 1 : 0);
    assign shifted_2 = ((shift_2 == 2'b11) ? 3 : ((shift_2 == 2'b10) ? 2 : shifted_1));
    assign shifted_3 = ((shift_3 == 2'b11) ? 5 : ((shift_3 == 2'b10) ? 4 : shifted_2));
    assign o_shifted = ((shift_4 == 4'b1111) ? 9 : ((shift_4 == 4'b1110) ? 8 : ((shift_4 == 4'b1100) ? 7 : ((shift_4 == 4'b1000) ? 6 : shifted_3))));
endmodule