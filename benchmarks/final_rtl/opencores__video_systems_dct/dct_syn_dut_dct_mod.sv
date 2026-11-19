
module dct_syn_dut_dct_mod (
    input logic clk,
    input logic ena,
    input logic rst,
    input logic dstrb,
    input logic[8:1] din,
    output logic[12:1] dout_00,
    output logic[12:1] dout_01,
    output logic[12:1] dout_02,
    output logic[12:1] dout_03,
    output logic[12:1] dout_04,
    output logic[12:1] dout_05,
    output logic[12:1] dout_06,
    output logic[12:1] dout_07,
    output logic[12:1] dout_10,
    output logic[12:1] dout_11,
    output logic[12:1] dout_12,
    output logic[12:1] dout_13,
    output logic[12:1] dout_14,
    output logic[12:1] dout_15,
    output logic[12:1] dout_16,
    output logic[12:1] dout_17,
    output logic[12:1] dout_20,
    output logic[12:1] dout_21,
    output logic[12:1] dout_22,
    output logic[12:1] dout_23,
    output logic[12:1] dout_24,
    output logic[12:1] dout_25,
    output logic[12:1] dout_26,
    output logic[12:1] dout_27,
    output logic[12:1] dout_30,
    output logic[12:1] dout_31,
    output logic[12:1] dout_32,
    output logic[12:1] dout_33,
    output logic[12:1] dout_34,
    output logic[12:1] dout_35,
    output logic[12:1] dout_36,
    output logic[12:1] dout_37,
    output logic[12:1] dout_40,
    output logic[12:1] dout_41,
    output logic[12:1] dout_42,
    output logic[12:1] dout_43,
    output logic[12:1] dout_44,
    output logic[12:1] dout_45,
    output logic[12:1] dout_46,
    output logic[12:1] dout_47,
    output logic[12:1] dout_50,
    output logic[12:1] dout_51,
    output logic[12:1] dout_52,
    output logic[12:1] dout_53,
    output logic[12:1] dout_54,
    output logic[12:1] dout_55,
    output logic[12:1] dout_56,
    output logic[12:1] dout_57,
    output logic[12:1] dout_60,
    output logic[12:1] dout_61,
    output logic[12:1] dout_62,
    output logic[12:1] dout_63,
    output logic[12:1] dout_64,
    output logic[12:1] dout_65,
    output logic[12:1] dout_66,
    output logic[12:1] dout_67,
    output logic[12:1] dout_70,
    output logic[12:1] dout_71,
    output logic[12:1] dout_72,
    output logic[12:1] dout_73,
    output logic[12:1] dout_74,
    output logic[12:1] dout_75,
    output logic[12:1] dout_76,
    output logic[12:1] dout_77,
    output reg douten
);
    reg go;
    reg dgo;
    reg ddgo;
    reg ddcnt;
    reg dddcnt;
    reg[8:1] ddin;
    reg[5:0] sample_cnt;
    wire logic dcnt = &(sample_cnt);
    always @(posedge clk or negedge rst) begin
        if (~(rst)) begin
            sample_cnt <= 6'b0;
        end
        else begin
            if (dstrb) begin
                sample_cnt <= 6'b0;
            end
            else if (~(dcnt)) begin
                sample_cnt <= (sample_cnt + 6'b1);
            end
        end
    end
    always @(posedge clk or negedge rst) begin
        if (~(rst)) begin
            go <= 1'b0;
            dgo <= 1'b0;
            ddgo <= 1'b0;
            ddin <= 0;
            douten <= 1'b0;
            ddcnt <= 1'b1;
            dddcnt <= 1'b1;
        end
        else begin
            go <= dstrb;
            dgo <= go;
            ddgo <= dgo;
            ddin <= din;
            ddcnt <= dcnt;
            dddcnt <= ddcnt;
            douten <= (ddcnt & ~(dddcnt));
        end
    end
    dct_syn_dut_dct_mod_dct_block_0 dct_block_0 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_00),
        .dout1(dout_01),
        .dout2(dout_02),
        .dout3(dout_03),
        .dout4(dout_04),
        .dout5(dout_05),
        .dout6(dout_06),
        .dout7(dout_07)
    );
    dct_syn_dut_dct_mod_dct_block_1 dct_block_1 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_10),
        .dout1(dout_11),
        .dout2(dout_12),
        .dout3(dout_13),
        .dout4(dout_14),
        .dout5(dout_15),
        .dout6(dout_16),
        .dout7(dout_17)
    );
    dct_syn_dut_dct_mod_dct_block_2 dct_block_2 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_20),
        .dout1(dout_21),
        .dout2(dout_22),
        .dout3(dout_23),
        .dout4(dout_24),
        .dout5(dout_25),
        .dout6(dout_26),
        .dout7(dout_27)
    );
    dct_syn_dut_dct_mod_dct_block_3 dct_block_3 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_30),
        .dout1(dout_31),
        .dout2(dout_32),
        .dout3(dout_33),
        .dout4(dout_34),
        .dout5(dout_35),
        .dout6(dout_36),
        .dout7(dout_37)
    );
    dct_syn_dut_dct_mod_dct_block_4 dct_block_4 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_40),
        .dout1(dout_41),
        .dout2(dout_42),
        .dout3(dout_43),
        .dout4(dout_44),
        .dout5(dout_45),
        .dout6(dout_46),
        .dout7(dout_47)
    );
    dct_syn_dut_dct_mod_dct_block_5 dct_block_5 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_50),
        .dout1(dout_51),
        .dout2(dout_52),
        .dout3(dout_53),
        .dout4(dout_54),
        .dout5(dout_55),
        .dout6(dout_56),
        .dout7(dout_57)
    );
    dct_syn_dut_dct_mod_dct_block_6 dct_block_6 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_60),
        .dout1(dout_61),
        .dout2(dout_62),
        .dout3(dout_63),
        .dout4(dout_64),
        .dout5(dout_65),
        .dout6(dout_66),
        .dout7(dout_67)
    );
    dct_syn_dut_dct_mod_dct_block_7 dct_block_7 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(sample_cnt[2:0]),
        .y(sample_cnt[5:3]),
        .ddin(ddin),
        .dout0(dout_70),
        .dout1(dout_71),
        .dout2(dout_72),
        .dout3(dout_73),
        .dout4(dout_74),
        .dout5(dout_75),
        .dout6(dout_76),
        .dout7(dout_77)
    );
endmodule