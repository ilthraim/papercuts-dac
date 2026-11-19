
module reduction_layer_ucu (
    input logic clk,
    input logic reset,
    input logic[15:0] inp0,
    input logic[15:0] inp1,
    input logic[15:0] inp2,
    input logic[15:0] inp3,
    input logic[15:0] inp4,
    input logic[15:0] inp5,
    input logic[15:0] inp6,
    input logic[15:0] inp7,
    input logic[15:0] inp8,
    input logic[15:0] inp9,
    input logic[15:0] inp10,
    input logic[15:0] inp11,
    input logic[15:0] inp12,
    input logic[15:0] inp13,
    input logic[15:0] inp14,
    input logic[15:0] inp15,
    input logic[15:0] inp16,
    input logic[15:0] inp17,
    input logic[15:0] inp18,
    input logic[15:0] inp19,
    input logic[15:0] inp20,
    input logic[15:0] inp21,
    input logic[15:0] inp22,
    input logic[15:0] inp23,
    input logic[15:0] inp24,
    input logic[15:0] inp25,
    input logic[15:0] inp26,
    input logic[15:0] inp27,
    input logic[15:0] inp28,
    input logic[15:0] inp29,
    input logic[15:0] inp30,
    input logic[15:0] inp31,
    input logic[15:0] inp32,
    input logic[15:0] inp33,
    input logic[15:0] inp34,
    input logic[15:0] inp35,
    input logic[15:0] inp36,
    input logic[15:0] inp37,
    input logic[15:0] inp38,
    input logic[15:0] inp39,
    input logic[15:0] inp40,
    input logic[15:0] inp41,
    input logic[15:0] inp42,
    input logic[15:0] inp43,
    input logic[15:0] inp44,
    input logic[15:0] inp45,
    input logic[15:0] inp46,
    input logic[15:0] inp47,
    input logic[15:0] inp48,
    input logic[15:0] inp49,
    input logic[15:0] inp50,
    input logic[15:0] inp51,
    input logic[15:0] inp52,
    input logic[15:0] inp53,
    input logic[15:0] inp54,
    input logic[15:0] inp55,
    input logic[15:0] inp56,
    input logic[15:0] inp57,
    input logic[15:0] inp58,
    input logic[15:0] inp59,
    input logic[15:0] inp60,
    input logic[15:0] inp61,
    input logic[15:0] inp62,
    input logic[15:0] inp63,
    input logic[15:0] inp64,
    input logic[15:0] inp65,
    input logic[15:0] inp66,
    input logic[15:0] inp67,
    input logic[15:0] inp68,
    input logic[15:0] inp69,
    input logic[15:0] inp70,
    input logic[15:0] inp71,
    input logic[15:0] inp72,
    input logic[15:0] inp73,
    input logic[15:0] inp74,
    input logic[15:0] inp75,
    input logic[15:0] inp76,
    input logic[15:0] inp77,
    input logic[15:0] inp78,
    input logic[15:0] inp79,
    input logic[15:0] inp80,
    input logic[15:0] inp81,
    input logic[15:0] inp82,
    input logic[15:0] inp83,
    input logic[15:0] inp84,
    input logic[15:0] inp85,
    input logic[15:0] inp86,
    input logic[15:0] inp87,
    input logic[15:0] inp88,
    input logic[15:0] inp89,
    input logic[15:0] inp90,
    input logic[15:0] inp91,
    input logic[15:0] inp92,
    input logic[15:0] inp93,
    input logic[15:0] inp94,
    input logic[15:0] inp95,
    input logic[15:0] inp96,
    input logic[15:0] inp97,
    input logic[15:0] inp98,
    input logic[15:0] inp99,
    input logic[15:0] inp100,
    input logic[15:0] inp101,
    input logic[15:0] inp102,
    input logic[15:0] inp103,
    input logic[15:0] inp104,
    input logic[15:0] inp105,
    input logic[15:0] inp106,
    input logic[15:0] inp107,
    input logic[15:0] inp108,
    input logic[15:0] inp109,
    input logic[15:0] inp110,
    input logic[15:0] inp111,
    input logic[15:0] inp112,
    input logic[15:0] inp113,
    input logic[15:0] inp114,
    input logic[15:0] inp115,
    input logic[15:0] inp116,
    input logic[15:0] inp117,
    input logic[15:0] inp118,
    input logic[15:0] inp119,
    input logic[15:0] inp120,
    input logic[15:0] inp121,
    input logic[15:0] inp122,
    input logic[15:0] inp123,
    input logic[15:0] inp124,
    input logic[15:0] inp125,
    input logic[15:0] inp126,
    input logic[15:0] inp127,
    input logic[1:0] mode,
    output reg[19:0] outp
);
    wire logic [16:0] compute0_out_stage7;
    reg [16:0] compute0_out_stage7_reg;
    wire logic [16:0] compute1_out_stage7;
    reg [16:0] compute1_out_stage7_reg;
    wire logic [16:0] compute2_out_stage7;
    reg [16:0] compute2_out_stage7_reg;
    wire logic [16:0] compute3_out_stage7;
    reg [16:0] compute3_out_stage7_reg;
    wire logic [16:0] compute4_out_stage7;
    reg [16:0] compute4_out_stage7_reg;
    wire logic [16:0] compute5_out_stage7;
    reg [16:0] compute5_out_stage7_reg;
    wire logic [16:0] compute6_out_stage7;
    reg [16:0] compute6_out_stage7_reg;
    wire logic [16:0] compute7_out_stage7;
    reg [16:0] compute7_out_stage7_reg;
    wire logic [16:0] compute8_out_stage7;
    reg [16:0] compute8_out_stage7_reg;
    wire logic [16:0] compute9_out_stage7;
    reg [16:0] compute9_out_stage7_reg;
    wire logic [16:0] compute10_out_stage7;
    reg [16:0] compute10_out_stage7_reg;
    wire logic [16:0] compute11_out_stage7;
    reg [16:0] compute11_out_stage7_reg;
    wire logic [16:0] compute12_out_stage7;
    reg [16:0] compute12_out_stage7_reg;
    wire logic [16:0] compute13_out_stage7;
    reg [16:0] compute13_out_stage7_reg;
    wire logic [16:0] compute14_out_stage7;
    reg [16:0] compute14_out_stage7_reg;
    wire logic [16:0] compute15_out_stage7;
    reg [16:0] compute15_out_stage7_reg;
    wire logic [16:0] compute16_out_stage7;
    reg [16:0] compute16_out_stage7_reg;
    wire logic [16:0] compute17_out_stage7;
    reg [16:0] compute17_out_stage7_reg;
    wire logic [16:0] compute18_out_stage7;
    reg [16:0] compute18_out_stage7_reg;
    wire logic [16:0] compute19_out_stage7;
    reg [16:0] compute19_out_stage7_reg;
    wire logic [16:0] compute20_out_stage7;
    reg [16:0] compute20_out_stage7_reg;
    wire logic [16:0] compute21_out_stage7;
    reg [16:0] compute21_out_stage7_reg;
    wire logic [16:0] compute22_out_stage7;
    reg [16:0] compute22_out_stage7_reg;
    wire logic [16:0] compute23_out_stage7;
    reg [16:0] compute23_out_stage7_reg;
    wire logic [16:0] compute24_out_stage7;
    reg [16:0] compute24_out_stage7_reg;
    wire logic [16:0] compute25_out_stage7;
    reg [16:0] compute25_out_stage7_reg;
    wire logic [16:0] compute26_out_stage7;
    reg [16:0] compute26_out_stage7_reg;
    wire logic [16:0] compute27_out_stage7;
    reg [16:0] compute27_out_stage7_reg;
    wire logic [16:0] compute28_out_stage7;
    reg [16:0] compute28_out_stage7_reg;
    wire logic [16:0] compute29_out_stage7;
    reg [16:0] compute29_out_stage7_reg;
    wire logic [16:0] compute30_out_stage7;
    reg [16:0] compute30_out_stage7_reg;
    wire logic [16:0] compute31_out_stage7;
    reg [16:0] compute31_out_stage7_reg;
    wire logic [16:0] compute32_out_stage7;
    reg [16:0] compute32_out_stage7_reg;
    wire logic [16:0] compute33_out_stage7;
    reg [16:0] compute33_out_stage7_reg;
    wire logic [16:0] compute34_out_stage7;
    reg [16:0] compute34_out_stage7_reg;
    wire logic [16:0] compute35_out_stage7;
    reg [16:0] compute35_out_stage7_reg;
    wire logic [16:0] compute36_out_stage7;
    reg [16:0] compute36_out_stage7_reg;
    wire logic [16:0] compute37_out_stage7;
    reg [16:0] compute37_out_stage7_reg;
    wire logic [16:0] compute38_out_stage7;
    reg [16:0] compute38_out_stage7_reg;
    wire logic [16:0] compute39_out_stage7;
    reg [16:0] compute39_out_stage7_reg;
    wire logic [16:0] compute40_out_stage7;
    reg [16:0] compute40_out_stage7_reg;
    wire logic [16:0] compute41_out_stage7;
    reg [16:0] compute41_out_stage7_reg;
    wire logic [16:0] compute42_out_stage7;
    reg [16:0] compute42_out_stage7_reg;
    wire logic [16:0] compute43_out_stage7;
    reg [16:0] compute43_out_stage7_reg;
    wire logic [16:0] compute44_out_stage7;
    reg [16:0] compute44_out_stage7_reg;
    wire logic [16:0] compute45_out_stage7;
    reg [16:0] compute45_out_stage7_reg;
    wire logic [16:0] compute46_out_stage7;
    reg [16:0] compute46_out_stage7_reg;
    wire logic [16:0] compute47_out_stage7;
    reg [16:0] compute47_out_stage7_reg;
    wire logic [16:0] compute48_out_stage7;
    reg [16:0] compute48_out_stage7_reg;
    wire logic [16:0] compute49_out_stage7;
    reg [16:0] compute49_out_stage7_reg;
    wire logic [16:0] compute50_out_stage7;
    reg [16:0] compute50_out_stage7_reg;
    wire logic [16:0] compute51_out_stage7;
    reg [16:0] compute51_out_stage7_reg;
    wire logic [16:0] compute52_out_stage7;
    reg [16:0] compute52_out_stage7_reg;
    wire logic [16:0] compute53_out_stage7;
    reg [16:0] compute53_out_stage7_reg;
    wire logic [16:0] compute54_out_stage7;
    reg [16:0] compute54_out_stage7_reg;
    wire logic [16:0] compute55_out_stage7;
    reg [16:0] compute55_out_stage7_reg;
    wire logic [16:0] compute56_out_stage7;
    reg [16:0] compute56_out_stage7_reg;
    wire logic [16:0] compute57_out_stage7;
    reg [16:0] compute57_out_stage7_reg;
    wire logic [16:0] compute58_out_stage7;
    reg [16:0] compute58_out_stage7_reg;
    wire logic [16:0] compute59_out_stage7;
    reg [16:0] compute59_out_stage7_reg;
    wire logic [16:0] compute60_out_stage7;
    reg [16:0] compute60_out_stage7_reg;
    wire logic [16:0] compute61_out_stage7;
    reg [16:0] compute61_out_stage7_reg;
    wire logic [16:0] compute62_out_stage7;
    reg [16:0] compute62_out_stage7_reg;
    wire logic [16:0] compute63_out_stage7;
    reg [16:0] compute63_out_stage7_reg;
    wire logic [17:0] compute0_out_stage6;
    reg [17:0] compute0_out_stage6_reg;
    wire logic [17:0] compute1_out_stage6;
    reg [17:0] compute1_out_stage6_reg;
    wire logic [17:0] compute2_out_stage6;
    reg [17:0] compute2_out_stage6_reg;
    wire logic [17:0] compute3_out_stage6;
    reg [17:0] compute3_out_stage6_reg;
    wire logic [17:0] compute4_out_stage6;
    reg [17:0] compute4_out_stage6_reg;
    wire logic [17:0] compute5_out_stage6;
    reg [17:0] compute5_out_stage6_reg;
    wire logic [17:0] compute6_out_stage6;
    reg [17:0] compute6_out_stage6_reg;
    wire logic [17:0] compute7_out_stage6;
    reg [17:0] compute7_out_stage6_reg;
    wire logic [17:0] compute8_out_stage6;
    reg [17:0] compute8_out_stage6_reg;
    wire logic [17:0] compute9_out_stage6;
    reg [17:0] compute9_out_stage6_reg;
    wire logic [17:0] compute10_out_stage6;
    reg [17:0] compute10_out_stage6_reg;
    wire logic [17:0] compute11_out_stage6;
    reg [17:0] compute11_out_stage6_reg;
    wire logic [17:0] compute12_out_stage6;
    reg [17:0] compute12_out_stage6_reg;
    wire logic [17:0] compute13_out_stage6;
    reg [17:0] compute13_out_stage6_reg;
    wire logic [17:0] compute14_out_stage6;
    reg [17:0] compute14_out_stage6_reg;
    wire logic [17:0] compute15_out_stage6;
    reg [17:0] compute15_out_stage6_reg;
    wire logic [17:0] compute16_out_stage6;
    reg [17:0] compute16_out_stage6_reg;
    wire logic [17:0] compute17_out_stage6;
    reg [17:0] compute17_out_stage6_reg;
    wire logic [17:0] compute18_out_stage6;
    reg [17:0] compute18_out_stage6_reg;
    wire logic [17:0] compute19_out_stage6;
    reg [17:0] compute19_out_stage6_reg;
    wire logic [17:0] compute20_out_stage6;
    reg [17:0] compute20_out_stage6_reg;
    wire logic [17:0] compute21_out_stage6;
    reg [17:0] compute21_out_stage6_reg;
    wire logic [17:0] compute22_out_stage6;
    reg [17:0] compute22_out_stage6_reg;
    wire logic [17:0] compute23_out_stage6;
    reg [17:0] compute23_out_stage6_reg;
    wire logic [17:0] compute24_out_stage6;
    reg [17:0] compute24_out_stage6_reg;
    wire logic [17:0] compute25_out_stage6;
    reg [17:0] compute25_out_stage6_reg;
    wire logic [17:0] compute26_out_stage6;
    reg [17:0] compute26_out_stage6_reg;
    wire logic [17:0] compute27_out_stage6;
    reg [17:0] compute27_out_stage6_reg;
    wire logic [17:0] compute28_out_stage6;
    reg [17:0] compute28_out_stage6_reg;
    wire logic [17:0] compute29_out_stage6;
    reg [17:0] compute29_out_stage6_reg;
    wire logic [17:0] compute30_out_stage6;
    reg [17:0] compute30_out_stage6_reg;
    wire logic [17:0] compute31_out_stage6;
    reg [17:0] compute31_out_stage6_reg;
    wire logic [18:0] compute0_out_stage5;
    reg [18:0] compute0_out_stage5_reg;
    wire logic [18:0] compute1_out_stage5;
    reg [18:0] compute1_out_stage5_reg;
    wire logic [18:0] compute2_out_stage5;
    reg [18:0] compute2_out_stage5_reg;
    wire logic [18:0] compute3_out_stage5;
    reg [18:0] compute3_out_stage5_reg;
    wire logic [18:0] compute4_out_stage5;
    reg [18:0] compute4_out_stage5_reg;
    wire logic [18:0] compute5_out_stage5;
    reg [18:0] compute5_out_stage5_reg;
    wire logic [18:0] compute6_out_stage5;
    reg [18:0] compute6_out_stage5_reg;
    wire logic [18:0] compute7_out_stage5;
    reg [18:0] compute7_out_stage5_reg;
    wire logic [18:0] compute8_out_stage5;
    reg [18:0] compute8_out_stage5_reg;
    wire logic [18:0] compute9_out_stage5;
    reg [18:0] compute9_out_stage5_reg;
    wire logic [18:0] compute10_out_stage5;
    reg [18:0] compute10_out_stage5_reg;
    wire logic [18:0] compute11_out_stage5;
    reg [18:0] compute11_out_stage5_reg;
    wire logic [18:0] compute12_out_stage5;
    reg [18:0] compute12_out_stage5_reg;
    wire logic [18:0] compute13_out_stage5;
    reg [18:0] compute13_out_stage5_reg;
    wire logic [18:0] compute14_out_stage5;
    reg [18:0] compute14_out_stage5_reg;
    wire logic [18:0] compute15_out_stage5;
    reg [18:0] compute15_out_stage5_reg;
    wire logic[19:0] compute0_out_stage4;
    reg[19:0] compute0_out_stage4_reg;
    wire logic[19:0] compute1_out_stage4;
    reg[19:0] compute1_out_stage4_reg;
    wire logic[19:0] compute2_out_stage4;
    reg[19:0] compute2_out_stage4_reg;
    wire logic[19:0] compute3_out_stage4;
    reg[19:0] compute3_out_stage4_reg;
    wire logic[19:0] compute4_out_stage4;
    reg[19:0] compute4_out_stage4_reg;
    wire logic[19:0] compute5_out_stage4;
    reg[19:0] compute5_out_stage4_reg;
    wire logic[19:0] compute6_out_stage4;
    reg[19:0] compute6_out_stage4_reg;
    wire logic[19:0] compute7_out_stage4;
    reg[19:0] compute7_out_stage4_reg;
    wire logic[19:0] compute0_out_stage3;
    reg[19:0] compute0_out_stage3_reg;
    wire logic[19:0] compute1_out_stage3;
    reg[19:0] compute1_out_stage3_reg;
    wire logic[19:0] compute2_out_stage3;
    reg[19:0] compute2_out_stage3_reg;
    wire logic[19:0] compute3_out_stage3;
    reg[19:0] compute3_out_stage3_reg;
    wire logic[19:0] compute0_out_stage2;
    reg[19:0] compute0_out_stage2_reg;
    wire logic[19:0] compute1_out_stage2;
    reg[19:0] compute1_out_stage2_reg;
    wire logic[19:0] compute0_out_stage1;
    reg[19:0] compute0_out_stage1_reg;
    wire logic[19:0] compute0_out_stage0;
    always @(posedge clk) begin
        if (reset) begin
            outp <= 0;
            compute0_out_stage7_reg <= 0;
            compute1_out_stage7_reg <= 0;
            compute2_out_stage7_reg <= 0;
            compute3_out_stage7_reg <= 0;
            compute4_out_stage7_reg <= 0;
            compute5_out_stage7_reg <= 0;
            compute6_out_stage7_reg <= 0;
            compute7_out_stage7_reg <= 0;
            compute8_out_stage7_reg <= 0;
            compute9_out_stage7_reg <= 0;
            compute10_out_stage7_reg <= 0;
            compute11_out_stage7_reg <= 0;
            compute12_out_stage7_reg <= 0;
            compute13_out_stage7_reg <= 0;
            compute14_out_stage7_reg <= 0;
            compute15_out_stage7_reg <= 0;
            compute16_out_stage7_reg <= 0;
            compute17_out_stage7_reg <= 0;
            compute18_out_stage7_reg <= 0;
            compute19_out_stage7_reg <= 0;
            compute20_out_stage7_reg <= 0;
            compute21_out_stage7_reg <= 0;
            compute22_out_stage7_reg <= 0;
            compute23_out_stage7_reg <= 0;
            compute24_out_stage7_reg <= 0;
            compute25_out_stage7_reg <= 0;
            compute26_out_stage7_reg <= 0;
            compute27_out_stage7_reg <= 0;
            compute28_out_stage7_reg <= 0;
            compute29_out_stage7_reg <= 0;
            compute30_out_stage7_reg <= 0;
            compute31_out_stage7_reg <= 0;
            compute32_out_stage7_reg <= 0;
            compute33_out_stage7_reg <= 0;
            compute34_out_stage7_reg <= 0;
            compute35_out_stage7_reg <= 0;
            compute36_out_stage7_reg <= 0;
            compute37_out_stage7_reg <= 0;
            compute38_out_stage7_reg <= 0;
            compute39_out_stage7_reg <= 0;
            compute40_out_stage7_reg <= 0;
            compute41_out_stage7_reg <= 0;
            compute42_out_stage7_reg <= 0;
            compute43_out_stage7_reg <= 0;
            compute44_out_stage7_reg <= 0;
            compute45_out_stage7_reg <= 0;
            compute46_out_stage7_reg <= 0;
            compute47_out_stage7_reg <= 0;
            compute48_out_stage7_reg <= 0;
            compute49_out_stage7_reg <= 0;
            compute50_out_stage7_reg <= 0;
            compute51_out_stage7_reg <= 0;
            compute52_out_stage7_reg <= 0;
            compute53_out_stage7_reg <= 0;
            compute54_out_stage7_reg <= 0;
            compute55_out_stage7_reg <= 0;
            compute56_out_stage7_reg <= 0;
            compute57_out_stage7_reg <= 0;
            compute58_out_stage7_reg <= 0;
            compute59_out_stage7_reg <= 0;
            compute60_out_stage7_reg <= 0;
            compute61_out_stage7_reg <= 0;
            compute62_out_stage7_reg <= 0;
            compute63_out_stage7_reg <= 0;
            compute0_out_stage6_reg <= 0;
            compute1_out_stage6_reg <= 0;
            compute2_out_stage6_reg <= 0;
            compute3_out_stage6_reg <= 0;
            compute4_out_stage6_reg <= 0;
            compute5_out_stage6_reg <= 0;
            compute6_out_stage6_reg <= 0;
            compute7_out_stage6_reg <= 0;
            compute8_out_stage6_reg <= 0;
            compute9_out_stage6_reg <= 0;
            compute10_out_stage6_reg <= 0;
            compute11_out_stage6_reg <= 0;
            compute12_out_stage6_reg <= 0;
            compute13_out_stage6_reg <= 0;
            compute14_out_stage6_reg <= 0;
            compute15_out_stage6_reg <= 0;
            compute16_out_stage6_reg <= 0;
            compute17_out_stage6_reg <= 0;
            compute18_out_stage6_reg <= 0;
            compute19_out_stage6_reg <= 0;
            compute20_out_stage6_reg <= 0;
            compute21_out_stage6_reg <= 0;
            compute22_out_stage6_reg <= 0;
            compute23_out_stage6_reg <= 0;
            compute24_out_stage6_reg <= 0;
            compute25_out_stage6_reg <= 0;
            compute26_out_stage6_reg <= 0;
            compute27_out_stage6_reg <= 0;
            compute28_out_stage6_reg <= 0;
            compute29_out_stage6_reg <= 0;
            compute30_out_stage6_reg <= 0;
            compute31_out_stage6_reg <= 0;
            compute0_out_stage5_reg <= 0;
            compute1_out_stage5_reg <= 0;
            compute2_out_stage5_reg <= 0;
            compute3_out_stage5_reg <= 0;
            compute4_out_stage5_reg <= 0;
            compute5_out_stage5_reg <= 0;
            compute6_out_stage5_reg <= 0;
            compute7_out_stage5_reg <= 0;
            compute8_out_stage5_reg <= 0;
            compute9_out_stage5_reg <= 0;
            compute10_out_stage5_reg <= 0;
            compute11_out_stage5_reg <= 0;
            compute12_out_stage5_reg <= 0;
            compute13_out_stage5_reg <= 0;
            compute14_out_stage5_reg <= 0;
            compute15_out_stage5_reg <= 0;
            compute0_out_stage4_reg <= 0;
            compute1_out_stage4_reg <= 0;
            compute2_out_stage4_reg <= 0;
            compute3_out_stage4_reg <= 0;
            compute4_out_stage4_reg <= 0;
            compute5_out_stage4_reg <= 0;
            compute6_out_stage4_reg <= 0;
            compute7_out_stage4_reg <= 0;
            compute0_out_stage3_reg <= 0;
            compute1_out_stage3_reg <= 0;
            compute2_out_stage3_reg <= 0;
            compute3_out_stage3_reg <= 0;
            compute0_out_stage2_reg <= 0;
            compute1_out_stage2_reg <= 0;
            compute0_out_stage1_reg <= 0;
        end
        else begin
            compute0_out_stage7_reg <= compute0_out_stage7;
            compute1_out_stage7_reg <= compute1_out_stage7;
            compute2_out_stage7_reg <= compute2_out_stage7;
            compute3_out_stage7_reg <= compute3_out_stage7;
            compute4_out_stage7_reg <= compute4_out_stage7;
            compute5_out_stage7_reg <= compute5_out_stage7;
            compute6_out_stage7_reg <= compute6_out_stage7;
            compute7_out_stage7_reg <= compute7_out_stage7;
            compute8_out_stage7_reg <= compute8_out_stage7;
            compute9_out_stage7_reg <= compute9_out_stage7;
            compute10_out_stage7_reg <= compute10_out_stage7;
            compute11_out_stage7_reg <= compute11_out_stage7;
            compute12_out_stage7_reg <= compute12_out_stage7;
            compute13_out_stage7_reg <= compute13_out_stage7;
            compute14_out_stage7_reg <= compute14_out_stage7;
            compute15_out_stage7_reg <= compute15_out_stage7;
            compute16_out_stage7_reg <= compute16_out_stage7;
            compute17_out_stage7_reg <= compute17_out_stage7;
            compute18_out_stage7_reg <= compute18_out_stage7;
            compute19_out_stage7_reg <= compute19_out_stage7;
            compute20_out_stage7_reg <= compute20_out_stage7;
            compute21_out_stage7_reg <= compute21_out_stage7;
            compute22_out_stage7_reg <= compute22_out_stage7;
            compute23_out_stage7_reg <= compute23_out_stage7;
            compute24_out_stage7_reg <= compute24_out_stage7;
            compute25_out_stage7_reg <= compute25_out_stage7;
            compute26_out_stage7_reg <= compute26_out_stage7;
            compute27_out_stage7_reg <= compute27_out_stage7;
            compute28_out_stage7_reg <= compute28_out_stage7;
            compute29_out_stage7_reg <= compute29_out_stage7;
            compute30_out_stage7_reg <= compute30_out_stage7;
            compute31_out_stage7_reg <= compute31_out_stage7;
            compute32_out_stage7_reg <= compute32_out_stage7;
            compute33_out_stage7_reg <= compute33_out_stage7;
            compute34_out_stage7_reg <= compute34_out_stage7;
            compute35_out_stage7_reg <= compute35_out_stage7;
            compute36_out_stage7_reg <= compute36_out_stage7;
            compute37_out_stage7_reg <= compute37_out_stage7;
            compute38_out_stage7_reg <= compute38_out_stage7;
            compute39_out_stage7_reg <= compute39_out_stage7;
            compute40_out_stage7_reg <= compute40_out_stage7;
            compute41_out_stage7_reg <= compute41_out_stage7;
            compute42_out_stage7_reg <= compute42_out_stage7;
            compute43_out_stage7_reg <= compute43_out_stage7;
            compute44_out_stage7_reg <= compute44_out_stage7;
            compute45_out_stage7_reg <= compute45_out_stage7;
            compute46_out_stage7_reg <= compute46_out_stage7;
            compute47_out_stage7_reg <= compute47_out_stage7;
            compute48_out_stage7_reg <= compute48_out_stage7;
            compute49_out_stage7_reg <= compute49_out_stage7;
            compute50_out_stage7_reg <= compute50_out_stage7;
            compute51_out_stage7_reg <= compute51_out_stage7;
            compute52_out_stage7_reg <= compute52_out_stage7;
            compute53_out_stage7_reg <= compute53_out_stage7;
            compute54_out_stage7_reg <= compute54_out_stage7;
            compute55_out_stage7_reg <= compute55_out_stage7;
            compute56_out_stage7_reg <= compute56_out_stage7;
            compute57_out_stage7_reg <= compute57_out_stage7;
            compute58_out_stage7_reg <= compute58_out_stage7;
            compute59_out_stage7_reg <= compute59_out_stage7;
            compute60_out_stage7_reg <= compute60_out_stage7;
            compute61_out_stage7_reg <= compute61_out_stage7;
            compute62_out_stage7_reg <= compute62_out_stage7;
            compute63_out_stage7_reg <= compute63_out_stage7;
            compute0_out_stage6_reg <= compute0_out_stage6;
            compute1_out_stage6_reg <= compute1_out_stage6;
            compute2_out_stage6_reg <= compute2_out_stage6;
            compute3_out_stage6_reg <= compute3_out_stage6;
            compute4_out_stage6_reg <= compute4_out_stage6;
            compute5_out_stage6_reg <= compute5_out_stage6;
            compute6_out_stage6_reg <= compute6_out_stage6;
            compute7_out_stage6_reg <= compute7_out_stage6;
            compute8_out_stage6_reg <= compute8_out_stage6;
            compute9_out_stage6_reg <= compute9_out_stage6;
            compute10_out_stage6_reg <= compute10_out_stage6;
            compute11_out_stage6_reg <= compute11_out_stage6;
            compute12_out_stage6_reg <= compute12_out_stage6;
            compute13_out_stage6_reg <= compute13_out_stage6;
            compute14_out_stage6_reg <= compute14_out_stage6;
            compute15_out_stage6_reg <= compute15_out_stage6;
            compute16_out_stage6_reg <= compute16_out_stage6;
            compute17_out_stage6_reg <= compute17_out_stage6;
            compute18_out_stage6_reg <= compute18_out_stage6;
            compute19_out_stage6_reg <= compute19_out_stage6;
            compute20_out_stage6_reg <= compute20_out_stage6;
            compute21_out_stage6_reg <= compute21_out_stage6;
            compute22_out_stage6_reg <= compute22_out_stage6;
            compute23_out_stage6_reg <= compute23_out_stage6;
            compute24_out_stage6_reg <= compute24_out_stage6;
            compute25_out_stage6_reg <= compute25_out_stage6;
            compute26_out_stage6_reg <= compute26_out_stage6;
            compute27_out_stage6_reg <= compute27_out_stage6;
            compute28_out_stage6_reg <= compute28_out_stage6;
            compute29_out_stage6_reg <= compute29_out_stage6;
            compute30_out_stage6_reg <= compute30_out_stage6;
            compute31_out_stage6_reg <= compute31_out_stage6;
            compute0_out_stage5_reg <= compute0_out_stage5;
            compute1_out_stage5_reg <= compute1_out_stage5;
            compute2_out_stage5_reg <= compute2_out_stage5;
            compute3_out_stage5_reg <= compute3_out_stage5;
            compute4_out_stage5_reg <= compute4_out_stage5;
            compute5_out_stage5_reg <= compute5_out_stage5;
            compute6_out_stage5_reg <= compute6_out_stage5;
            compute7_out_stage5_reg <= compute7_out_stage5;
            compute8_out_stage5_reg <= compute8_out_stage5;
            compute9_out_stage5_reg <= compute9_out_stage5;
            compute10_out_stage5_reg <= compute10_out_stage5;
            compute11_out_stage5_reg <= compute11_out_stage5;
            compute12_out_stage5_reg <= compute12_out_stage5;
            compute13_out_stage5_reg <= compute13_out_stage5;
            compute14_out_stage5_reg <= compute14_out_stage5;
            compute15_out_stage5_reg <= compute15_out_stage5;
            compute0_out_stage4_reg <= compute0_out_stage4;
            compute1_out_stage4_reg <= compute1_out_stage4;
            compute2_out_stage4_reg <= compute2_out_stage4;
            compute3_out_stage4_reg <= compute3_out_stage4;
            compute4_out_stage4_reg <= compute4_out_stage4;
            compute5_out_stage4_reg <= compute5_out_stage4;
            compute6_out_stage4_reg <= compute6_out_stage4;
            compute7_out_stage4_reg <= compute7_out_stage4;
            compute0_out_stage3_reg <= compute0_out_stage3;
            compute1_out_stage3_reg <= compute1_out_stage3;
            compute2_out_stage3_reg <= compute2_out_stage3;
            compute3_out_stage3_reg <= compute3_out_stage3;
            compute0_out_stage2_reg <= compute0_out_stage2;
            compute1_out_stage2_reg <= compute1_out_stage2;
            compute0_out_stage1_reg <= compute0_out_stage1;
            outp <= compute0_out_stage0;
        end
    end
    reduction_layer_ucu_compute0_stage7 compute0_stage7 (
        .A(inp0),
        .B(inp1),
        .OUT(compute0_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute1_stage7 compute1_stage7 (
        .A(inp2),
        .B(inp3),
        .OUT(compute1_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute2_stage7 compute2_stage7 (
        .A(inp4),
        .B(inp5),
        .OUT(compute2_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute3_stage7 compute3_stage7 (
        .A(inp6),
        .B(inp7),
        .OUT(compute3_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute4_stage7 compute4_stage7 (
        .A(inp8),
        .B(inp9),
        .OUT(compute4_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute5_stage7 compute5_stage7 (
        .A(inp10),
        .B(inp11),
        .OUT(compute5_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute6_stage7 compute6_stage7 (
        .A(inp12),
        .B(inp13),
        .OUT(compute6_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute7_stage7 compute7_stage7 (
        .A(inp14),
        .B(inp15),
        .OUT(compute7_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute8_stage7 compute8_stage7 (
        .A(inp16),
        .B(inp17),
        .OUT(compute8_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute9_stage7 compute9_stage7 (
        .A(inp18),
        .B(inp19),
        .OUT(compute9_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute10_stage7 compute10_stage7 (
        .A(inp20),
        .B(inp21),
        .OUT(compute10_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute11_stage7 compute11_stage7 (
        .A(inp22),
        .B(inp23),
        .OUT(compute11_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute12_stage7 compute12_stage7 (
        .A(inp24),
        .B(inp25),
        .OUT(compute12_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute13_stage7 compute13_stage7 (
        .A(inp26),
        .B(inp27),
        .OUT(compute13_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute14_stage7 compute14_stage7 (
        .A(inp28),
        .B(inp29),
        .OUT(compute14_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute15_stage7 compute15_stage7 (
        .A(inp30),
        .B(inp31),
        .OUT(compute15_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute16_stage7 compute16_stage7 (
        .A(inp32),
        .B(inp33),
        .OUT(compute16_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute17_stage7 compute17_stage7 (
        .A(inp34),
        .B(inp35),
        .OUT(compute17_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute18_stage7 compute18_stage7 (
        .A(inp36),
        .B(inp37),
        .OUT(compute18_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute19_stage7 compute19_stage7 (
        .A(inp38),
        .B(inp39),
        .OUT(compute19_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute20_stage7 compute20_stage7 (
        .A(inp40),
        .B(inp41),
        .OUT(compute20_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute21_stage7 compute21_stage7 (
        .A(inp42),
        .B(inp43),
        .OUT(compute21_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute22_stage7 compute22_stage7 (
        .A(inp44),
        .B(inp45),
        .OUT(compute22_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute23_stage7 compute23_stage7 (
        .A(inp46),
        .B(inp47),
        .OUT(compute23_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute24_stage7 compute24_stage7 (
        .A(inp48),
        .B(inp49),
        .OUT(compute24_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute25_stage7 compute25_stage7 (
        .A(inp50),
        .B(inp51),
        .OUT(compute25_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute26_stage7 compute26_stage7 (
        .A(inp52),
        .B(inp53),
        .OUT(compute26_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute27_stage7 compute27_stage7 (
        .A(inp54),
        .B(inp55),
        .OUT(compute27_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute28_stage7 compute28_stage7 (
        .A(inp56),
        .B(inp57),
        .OUT(compute28_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute29_stage7 compute29_stage7 (
        .A(inp58),
        .B(inp59),
        .OUT(compute29_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute30_stage7 compute30_stage7 (
        .A(inp60),
        .B(inp61),
        .OUT(compute30_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute31_stage7 compute31_stage7 (
        .A(inp62),
        .B(inp63),
        .OUT(compute31_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute32_stage7 compute32_stage7 (
        .A(inp64),
        .B(inp65),
        .OUT(compute32_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute33_stage7 compute33_stage7 (
        .A(inp66),
        .B(inp67),
        .OUT(compute33_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute34_stage7 compute34_stage7 (
        .A(inp68),
        .B(inp69),
        .OUT(compute34_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute35_stage7 compute35_stage7 (
        .A(inp70),
        .B(inp71),
        .OUT(compute35_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute36_stage7 compute36_stage7 (
        .A(inp72),
        .B(inp73),
        .OUT(compute36_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute37_stage7 compute37_stage7 (
        .A(inp74),
        .B(inp75),
        .OUT(compute37_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute38_stage7 compute38_stage7 (
        .A(inp76),
        .B(inp77),
        .OUT(compute38_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute39_stage7 compute39_stage7 (
        .A(inp78),
        .B(inp79),
        .OUT(compute39_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute40_stage7 compute40_stage7 (
        .A(inp80),
        .B(inp81),
        .OUT(compute40_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute41_stage7 compute41_stage7 (
        .A(inp82),
        .B(inp83),
        .OUT(compute41_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute42_stage7 compute42_stage7 (
        .A(inp84),
        .B(inp85),
        .OUT(compute42_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute43_stage7 compute43_stage7 (
        .A(inp86),
        .B(inp87),
        .OUT(compute43_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute44_stage7 compute44_stage7 (
        .A(inp88),
        .B(inp89),
        .OUT(compute44_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute45_stage7 compute45_stage7 (
        .A(inp90),
        .B(inp91),
        .OUT(compute45_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute46_stage7 compute46_stage7 (
        .A(inp92),
        .B(inp93),
        .OUT(compute46_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute47_stage7 compute47_stage7 (
        .A(inp94),
        .B(inp95),
        .OUT(compute47_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute48_stage7 compute48_stage7 (
        .A(inp96),
        .B(inp97),
        .OUT(compute48_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute49_stage7 compute49_stage7 (
        .A(inp98),
        .B(inp99),
        .OUT(compute49_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute50_stage7 compute50_stage7 (
        .A(inp100),
        .B(inp101),
        .OUT(compute50_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute51_stage7 compute51_stage7 (
        .A(inp102),
        .B(inp103),
        .OUT(compute51_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute52_stage7 compute52_stage7 (
        .A(inp104),
        .B(inp105),
        .OUT(compute52_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute53_stage7 compute53_stage7 (
        .A(inp106),
        .B(inp107),
        .OUT(compute53_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute54_stage7 compute54_stage7 (
        .A(inp108),
        .B(inp109),
        .OUT(compute54_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute55_stage7 compute55_stage7 (
        .A(inp110),
        .B(inp111),
        .OUT(compute55_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute56_stage7 compute56_stage7 (
        .A(inp112),
        .B(inp113),
        .OUT(compute56_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute57_stage7 compute57_stage7 (
        .A(inp114),
        .B(inp115),
        .OUT(compute57_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute58_stage7 compute58_stage7 (
        .A(inp116),
        .B(inp117),
        .OUT(compute58_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute59_stage7 compute59_stage7 (
        .A(inp118),
        .B(inp119),
        .OUT(compute59_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute60_stage7 compute60_stage7 (
        .A(inp120),
        .B(inp121),
        .OUT(compute60_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute61_stage7 compute61_stage7 (
        .A(inp122),
        .B(inp123),
        .OUT(compute61_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute62_stage7 compute62_stage7 (
        .A(inp124),
        .B(inp125),
        .OUT(compute62_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute63_stage7 compute63_stage7 (
        .A(inp126),
        .B(inp127),
        .OUT(compute63_out_stage7),
        .MODE(mode)
    );
    reduction_layer_ucu_compute0_stage6 compute0_stage6 (
        .A({3'b0, compute0_out_stage7_reg}),
        .B({3'b0, compute1_out_stage7_reg}),
        .OUT(compute0_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute1_stage6 compute1_stage6 (
        .A({3'b0, compute2_out_stage7_reg}),
        .B({3'b0, compute3_out_stage7_reg}),
        .OUT(compute1_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute2_stage6 compute2_stage6 (
        .A({3'b0, compute4_out_stage7_reg}),
        .B({3'b0, compute5_out_stage7_reg}),
        .OUT(compute2_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute3_stage6 compute3_stage6 (
        .A({3'b0, compute6_out_stage7_reg}),
        .B({3'b0, compute7_out_stage7_reg}),
        .OUT(compute3_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute4_stage6 compute4_stage6 (
        .A({3'b0, compute8_out_stage7_reg}),
        .B({3'b0, compute9_out_stage7_reg}),
        .OUT(compute4_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute5_stage6 compute5_stage6 (
        .A({3'b0, compute10_out_stage7_reg}),
        .B({3'b0, compute11_out_stage7_reg}),
        .OUT(compute5_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute6_stage6 compute6_stage6 (
        .A({3'b0, compute12_out_stage7_reg}),
        .B({3'b0, compute13_out_stage7_reg}),
        .OUT(compute6_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute7_stage6 compute7_stage6 (
        .A({3'b0, compute14_out_stage7_reg}),
        .B({3'b0, compute15_out_stage7_reg}),
        .OUT(compute7_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute8_stage6 compute8_stage6 (
        .A({3'b0, compute16_out_stage7_reg}),
        .B({3'b0, compute17_out_stage7_reg}),
        .OUT(compute8_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute9_stage6 compute9_stage6 (
        .A({3'b0, compute18_out_stage7_reg}),
        .B({3'b0, compute19_out_stage7_reg}),
        .OUT(compute9_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute10_stage6 compute10_stage6 (
        .A({3'b0, compute20_out_stage7_reg}),
        .B({3'b0, compute21_out_stage7_reg}),
        .OUT(compute10_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute11_stage6 compute11_stage6 (
        .A({3'b0, compute22_out_stage7_reg}),
        .B({3'b0, compute23_out_stage7_reg}),
        .OUT(compute11_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute12_stage6 compute12_stage6 (
        .A({3'b0, compute24_out_stage7_reg}),
        .B({3'b0, compute25_out_stage7_reg}),
        .OUT(compute12_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute13_stage6 compute13_stage6 (
        .A({3'b0, compute26_out_stage7_reg}),
        .B({3'b0, compute27_out_stage7_reg}),
        .OUT(compute13_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute14_stage6 compute14_stage6 (
        .A({3'b0, compute28_out_stage7_reg}),
        .B({3'b0, compute29_out_stage7_reg}),
        .OUT(compute14_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute15_stage6 compute15_stage6 (
        .A({3'b0, compute30_out_stage7_reg}),
        .B({3'b0, compute31_out_stage7_reg}),
        .OUT(compute15_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute16_stage6 compute16_stage6 (
        .A({3'b0, compute32_out_stage7_reg}),
        .B({3'b0, compute33_out_stage7_reg}),
        .OUT(compute16_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute17_stage6 compute17_stage6 (
        .A({3'b0, compute34_out_stage7_reg}),
        .B({3'b0, compute35_out_stage7_reg}),
        .OUT(compute17_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute18_stage6 compute18_stage6 (
        .A({3'b0, compute36_out_stage7_reg}),
        .B({3'b0, compute37_out_stage7_reg}),
        .OUT(compute18_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute19_stage6 compute19_stage6 (
        .A({3'b0, compute38_out_stage7_reg}),
        .B({3'b0, compute39_out_stage7_reg}),
        .OUT(compute19_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute20_stage6 compute20_stage6 (
        .A({3'b0, compute40_out_stage7_reg}),
        .B({3'b0, compute41_out_stage7_reg}),
        .OUT(compute20_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute21_stage6 compute21_stage6 (
        .A({3'b0, compute42_out_stage7_reg}),
        .B({3'b0, compute43_out_stage7_reg}),
        .OUT(compute21_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute22_stage6 compute22_stage6 (
        .A({3'b0, compute44_out_stage7_reg}),
        .B({3'b0, compute45_out_stage7_reg}),
        .OUT(compute22_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute23_stage6 compute23_stage6 (
        .A({3'b0, compute46_out_stage7_reg}),
        .B({3'b0, compute47_out_stage7_reg}),
        .OUT(compute23_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute24_stage6 compute24_stage6 (
        .A({3'b0, compute48_out_stage7_reg}),
        .B({3'b0, compute49_out_stage7_reg}),
        .OUT(compute24_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute25_stage6 compute25_stage6 (
        .A({3'b0, compute50_out_stage7_reg}),
        .B({3'b0, compute51_out_stage7_reg}),
        .OUT(compute25_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute26_stage6 compute26_stage6 (
        .A({3'b0, compute52_out_stage7_reg}),
        .B({3'b0, compute53_out_stage7_reg}),
        .OUT(compute26_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute27_stage6 compute27_stage6 (
        .A({3'b0, compute54_out_stage7_reg}),
        .B({3'b0, compute55_out_stage7_reg}),
        .OUT(compute27_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute28_stage6 compute28_stage6 (
        .A({3'b0, compute56_out_stage7_reg}),
        .B({3'b0, compute57_out_stage7_reg}),
        .OUT(compute28_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute29_stage6 compute29_stage6 (
        .A({3'b0, compute58_out_stage7_reg}),
        .B({3'b0, compute59_out_stage7_reg}),
        .OUT(compute29_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute30_stage6 compute30_stage6 (
        .A({3'b0, compute60_out_stage7_reg}),
        .B({3'b0, compute61_out_stage7_reg}),
        .OUT(compute30_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute31_stage6 compute31_stage6 (
        .A({3'b0, compute62_out_stage7_reg}),
        .B({3'b0, compute63_out_stage7_reg}),
        .OUT(compute31_out_stage6),
        .MODE(mode)
    );
    reduction_layer_ucu_compute0_stage5 compute0_stage5 (
        .A({2'b0, compute0_out_stage6_reg}),
        .B({2'b0, compute1_out_stage6_reg}),
        .OUT(compute0_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute1_stage5 compute1_stage5 (
        .A({2'b0, compute2_out_stage6_reg}),
        .B({2'b0, compute3_out_stage6_reg}),
        .OUT(compute1_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute2_stage5 compute2_stage5 (
        .A({2'b0, compute4_out_stage6_reg}),
        .B({2'b0, compute5_out_stage6_reg}),
        .OUT(compute2_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute3_stage5 compute3_stage5 (
        .A({2'b0, compute6_out_stage6_reg}),
        .B({2'b0, compute7_out_stage6_reg}),
        .OUT(compute3_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute4_stage5 compute4_stage5 (
        .A({2'b0, compute8_out_stage6_reg}),
        .B({2'b0, compute9_out_stage6_reg}),
        .OUT(compute4_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute5_stage5 compute5_stage5 (
        .A({2'b0, compute10_out_stage6_reg}),
        .B({2'b0, compute11_out_stage6_reg}),
        .OUT(compute5_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute6_stage5 compute6_stage5 (
        .A({2'b0, compute12_out_stage6_reg}),
        .B({2'b0, compute13_out_stage6_reg}),
        .OUT(compute6_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute7_stage5 compute7_stage5 (
        .A({2'b0, compute14_out_stage6_reg}),
        .B({2'b0, compute15_out_stage6_reg}),
        .OUT(compute7_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute8_stage5 compute8_stage5 (
        .A({2'b0, compute16_out_stage6_reg}),
        .B({2'b0, compute17_out_stage6_reg}),
        .OUT(compute8_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute9_stage5 compute9_stage5 (
        .A({2'b0, compute18_out_stage6_reg}),
        .B({2'b0, compute19_out_stage6_reg}),
        .OUT(compute9_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute10_stage5 compute10_stage5 (
        .A({2'b0, compute20_out_stage6_reg}),
        .B({2'b0, compute21_out_stage6_reg}),
        .OUT(compute10_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute11_stage5 compute11_stage5 (
        .A({2'b0, compute22_out_stage6_reg}),
        .B({2'b0, compute23_out_stage6_reg}),
        .OUT(compute11_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute12_stage5 compute12_stage5 (
        .A({2'b0, compute24_out_stage6_reg}),
        .B({2'b0, compute25_out_stage6_reg}),
        .OUT(compute12_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute13_stage5 compute13_stage5 (
        .A({2'b0, compute26_out_stage6_reg}),
        .B({2'b0, compute27_out_stage6_reg}),
        .OUT(compute13_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute14_stage5 compute14_stage5 (
        .A({2'b0, compute28_out_stage6_reg}),
        .B({2'b0, compute29_out_stage6_reg}),
        .OUT(compute14_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute15_stage5 compute15_stage5 (
        .A({2'b0, compute30_out_stage6_reg}),
        .B({2'b0, compute31_out_stage6_reg}),
        .OUT(compute15_out_stage5),
        .MODE(mode)
    );
    reduction_layer_ucu_compute0_stage4 compute0_stage4 (
        .A({1'b0, compute0_out_stage5_reg}),
        .B({1'b0, compute1_out_stage5_reg}),
        .OUT(compute0_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute1_stage4 compute1_stage4 (
        .A({1'b0, compute2_out_stage5_reg}),
        .B({1'b0, compute3_out_stage5_reg}),
        .OUT(compute1_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute2_stage4 compute2_stage4 (
        .A({1'b0, compute4_out_stage5_reg}),
        .B({1'b0, compute5_out_stage5_reg}),
        .OUT(compute2_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute3_stage4 compute3_stage4 (
        .A({1'b0, compute6_out_stage5_reg}),
        .B({1'b0, compute7_out_stage5_reg}),
        .OUT(compute3_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute4_stage4 compute4_stage4 (
        .A({1'b0, compute8_out_stage5_reg}),
        .B({1'b0, compute9_out_stage5_reg}),
        .OUT(compute4_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute5_stage4 compute5_stage4 (
        .A({1'b0, compute10_out_stage5_reg}),
        .B({1'b0, compute11_out_stage5_reg}),
        .OUT(compute5_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute6_stage4 compute6_stage4 (
        .A({1'b0, compute12_out_stage5_reg}),
        .B({1'b0, compute13_out_stage5_reg}),
        .OUT(compute6_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute7_stage4 compute7_stage4 (
        .A({1'b0, compute14_out_stage5_reg}),
        .B({1'b0, compute15_out_stage5_reg}),
        .OUT(compute7_out_stage4),
        .MODE(mode)
    );
    reduction_layer_ucu_compute0_stage3 compute0_stage3 (
        .A(compute0_out_stage4_reg),
        .B(compute1_out_stage4_reg),
        .OUT(compute0_out_stage3),
        .MODE(mode)
    );
    reduction_layer_ucu_compute1_stage3 compute1_stage3 (
        .A(compute2_out_stage4_reg),
        .B(compute3_out_stage4_reg),
        .OUT(compute1_out_stage3),
        .MODE(mode)
    );
    reduction_layer_ucu_compute2_stage3 compute2_stage3 (
        .A(compute4_out_stage4_reg),
        .B(compute5_out_stage4_reg),
        .OUT(compute2_out_stage3),
        .MODE(mode)
    );
    reduction_layer_ucu_compute3_stage3 compute3_stage3 (
        .A(compute6_out_stage4_reg),
        .B(compute7_out_stage4_reg),
        .OUT(compute3_out_stage3),
        .MODE(mode)
    );
    reduction_layer_ucu_compute0_stage2 compute0_stage2 (
        .A(compute0_out_stage3_reg),
        .B(compute1_out_stage3_reg),
        .OUT(compute0_out_stage2),
        .MODE(mode)
    );
    reduction_layer_ucu_compute1_stage2 compute1_stage2 (
        .A(compute2_out_stage3_reg),
        .B(compute3_out_stage3_reg),
        .OUT(compute1_out_stage2),
        .MODE(mode)
    );
    reduction_layer_ucu_compute0_stage1 compute0_stage1 (
        .A(compute0_out_stage2_reg),
        .B(compute1_out_stage2_reg),
        .OUT(compute0_out_stage1),
        .MODE(mode)
    );
    reduction_layer_ucu_compute0_stage0 compute0_stage0 (
        .A(outp),
        .B(compute0_out_stage1_reg),
        .OUT(compute0_out_stage0),
        .MODE(mode)
    );
endmodule