module dct_syn_dut_zigzag_mod (
    input logic clk,
    input logic ena,
    input logic dstrb,
    input logic[11:0] din_00,
    input logic[11:0] din_01,
    input logic[11:0] din_02,
    input logic[11:0] din_03,
    input logic[11:0] din_04,
    input logic[11:0] din_05,
    input logic[11:0] din_06,
    input logic[11:0] din_07,
    input logic[11:0] din_10,
    input logic[11:0] din_11,
    input logic[11:0] din_12,
    input logic[11:0] din_13,
    input logic[11:0] din_14,
    input logic[11:0] din_15,
    input logic[11:0] din_16,
    input logic[11:0] din_17,
    input logic[11:0] din_20,
    input logic[11:0] din_21,
    input logic[11:0] din_22,
    input logic[11:0] din_23,
    input logic[11:0] din_24,
    input logic[11:0] din_25,
    input logic[11:0] din_26,
    input logic[11:0] din_27,
    input logic[11:0] din_30,
    input logic[11:0] din_31,
    input logic[11:0] din_32,
    input logic[11:0] din_33,
    input logic[11:0] din_34,
    input logic[11:0] din_35,
    input logic[11:0] din_36,
    input logic[11:0] din_37,
    input logic[11:0] din_40,
    input logic[11:0] din_41,
    input logic[11:0] din_42,
    input logic[11:0] din_43,
    input logic[11:0] din_44,
    input logic[11:0] din_45,
    input logic[11:0] din_46,
    input logic[11:0] din_47,
    input logic[11:0] din_50,
    input logic[11:0] din_51,
    input logic[11:0] din_52,
    input logic[11:0] din_53,
    input logic[11:0] din_54,
    input logic[11:0] din_55,
    input logic[11:0] din_56,
    input logic[11:0] din_57,
    input logic[11:0] din_60,
    input logic[11:0] din_61,
    input logic[11:0] din_62,
    input logic[11:0] din_63,
    input logic[11:0] din_64,
    input logic[11:0] din_65,
    input logic[11:0] din_66,
    input logic[11:0] din_67,
    input logic[11:0] din_70,
    input logic[11:0] din_71,
    input logic[11:0] din_72,
    input logic[11:0] din_73,
    input logic[11:0] din_74,
    input logic[11:0] din_75,
    input logic[11:0] din_76,
    input logic[11:0] din_77,
    output logic[11:0] dout,
    output logic douten
);
    reg ld_zigzag;
    reg[11:0] sresult[63:0];
    always @(posedge clk) begin
        ld_zigzag <= dstrb;
    end
    assign douten = ld_zigzag;
    integer n;
    always @(posedge clk) begin
        if (ld_zigzag) begin
            sresult[63] <= din_00;
            sresult[62] <= din_01;
            sresult[61] <= din_10;
            sresult[60] <= din_20;
            sresult[59] <= din_11;
            sresult[58] <= din_02;
            sresult[57] <= din_03;
            sresult[56] <= din_12;
            sresult[55] <= din_21;
            sresult[54] <= din_30;
            sresult[53] <= din_40;
            sresult[52] <= din_31;
            sresult[51] <= din_22;
            sresult[50] <= din_13;
            sresult[49] <= din_04;
            sresult[48] <= din_05;
            sresult[47] <= din_14;
            sresult[46] <= din_23;
            sresult[45] <= din_32;
            sresult[44] <= din_41;
            sresult[43] <= din_50;
            sresult[42] <= din_60;
            sresult[41] <= din_51;
            sresult[40] <= din_42;
            sresult[39] <= din_33;
            sresult[38] <= din_24;
            sresult[37] <= din_15;
            sresult[36] <= din_06;
            sresult[35] <= din_07;
            sresult[34] <= din_16;
            sresult[33] <= din_25;
            sresult[32] <= din_34;
            sresult[31] <= din_43;
            sresult[30] <= din_52;
            sresult[29] <= din_61;
            sresult[28] <= din_70;
            sresult[27] <= din_71;
            sresult[26] <= din_62;
            sresult[25] <= din_53;
            sresult[24] <= din_44;
            sresult[23] <= din_35;
            sresult[22] <= din_26;
            sresult[21] <= din_17;
            sresult[20] <= din_27;
            sresult[19] <= din_36;
            sresult[18] <= din_45;
            sresult[17] <= din_54;
            sresult[16] <= din_63;
            sresult[15] <= din_72;
            sresult[14] <= din_73;
            sresult[13] <= din_64;
            sresult[12] <= din_55;
            sresult[11] <= din_46;
            sresult[10] <= din_37;
            sresult[9] <= din_47;
            sresult[8] <= din_56;
            sresult[7] <= din_65;
            sresult[6] <= din_74;
            sresult[5] <= din_75;
            sresult[4] <= din_66;
            sresult[3] <= din_57;
            sresult[2] <= din_67;
            sresult[1] <= din_76;
            sresult[0] <= din_77;
        end
        else begin
            for (n = 1; (n <= 63); n = (n + 1)) begin
                sresult[n] <= sresult[(n - 1)];
            end
        end
    end
    assign dout = sresult[63];
endmodule
