module keccak (
    input logic clk,
    input logic reset,
    input logic[31:0] in,
    input logic in_ready,
    input logic is_last,
    input logic[1:0] byte_num,
    output logic buffer_full,
    output logic[511:0] out,
    output reg out_ready
);
    reg state;
    wire logic[575:0] padder_out;
    wire logic[575:0] padder_out_1;
    wire logic padder_out_ready;
    wire logic f_ack;
    wire logic[1599:0] f_out;
    wire logic f_out_ready;
    wire logic[511:0] out1;
    reg[22:0] i;
    assign out1 = f_out[1599:1088];
    always @(posedge clk) begin begin
            i <= {i[21:0], (state & f_ack)};
        end
    end
    always @(posedge clk) begin
        if (reset) begin
            state <= 0;
        end
        else if (is_last) begin
            state <= 1;
        end
    end
    assign out[7:0] = out1[63:56];
    assign out[15:8] = out1[55:48];
    assign out[23:16] = out1[47:40];
    assign out[31:24] = out1[39:32];
    assign out[39:32] = out1[31:24];
    assign out[47:40] = out1[23:16];
    assign out[55:48] = out1[15:8];
    assign out[63:56] = out1[7:0];
    assign out[71:64] = out1[127:120];
    assign out[79:72] = out1[119:112];
    assign out[87:80] = out1[111:104];
    assign out[95:88] = out1[103:96];
    assign out[103:96] = out1[95:88];
    assign out[111:104] = out1[87:80];
    assign out[119:112] = out1[79:72];
    assign out[127:120] = out1[71:64];
    assign out[135:128] = out1[191:184];
    assign out[143:136] = out1[183:176];
    assign out[151:144] = out1[175:168];
    assign out[159:152] = out1[167:160];
    assign out[167:160] = out1[159:152];
    assign out[175:168] = out1[151:144];
    assign out[183:176] = out1[143:136];
    assign out[191:184] = out1[135:128];
    assign out[199:192] = out1[255:248];
    assign out[207:200] = out1[247:240];
    assign out[215:208] = out1[239:232];
    assign out[223:216] = out1[231:224];
    assign out[231:224] = out1[223:216];
    assign out[239:232] = out1[215:208];
    assign out[247:240] = out1[207:200];
    assign out[255:248] = out1[199:192];
    assign out[263:256] = out1[319:312];
    assign out[271:264] = out1[311:304];
    assign out[279:272] = out1[303:296];
    assign out[287:280] = out1[295:288];
    assign out[295:288] = out1[287:280];
    assign out[303:296] = out1[279:272];
    assign out[311:304] = out1[271:264];
    assign out[319:312] = out1[263:256];
    assign out[327:320] = out1[383:376];
    assign out[335:328] = out1[375:368];
    assign out[343:336] = out1[367:360];
    assign out[351:344] = out1[359:352];
    assign out[359:352] = out1[351:344];
    assign out[367:360] = out1[343:336];
    assign out[375:368] = out1[335:328];
    assign out[383:376] = out1[327:320];
    assign out[391:384] = out1[447:440];
    assign out[399:392] = out1[439:432];
    assign out[407:400] = out1[431:424];
    assign out[415:408] = out1[423:416];
    assign out[423:416] = out1[415:408];
    assign out[431:424] = out1[407:400];
    assign out[439:432] = out1[399:392];
    assign out[447:440] = out1[391:384];
    assign out[455:448] = out1[511:504];
    assign out[463:456] = out1[503:496];
    assign out[471:464] = out1[495:488];
    assign out[479:472] = out1[487:480];
    assign out[487:480] = out1[479:472];
    assign out[495:488] = out1[471:464];
    assign out[503:496] = out1[463:456];
    assign out[511:504] = out1[455:448];
    assign padder_out[7:0] = padder_out_1[63:56];
    assign padder_out[15:8] = padder_out_1[55:48];
    assign padder_out[23:16] = padder_out_1[47:40];
    assign padder_out[31:24] = padder_out_1[39:32];
    assign padder_out[39:32] = padder_out_1[31:24];
    assign padder_out[47:40] = padder_out_1[23:16];
    assign padder_out[55:48] = padder_out_1[15:8];
    assign padder_out[63:56] = padder_out_1[7:0];
    assign padder_out[71:64] = padder_out_1[127:120];
    assign padder_out[79:72] = padder_out_1[119:112];
    assign padder_out[87:80] = padder_out_1[111:104];
    assign padder_out[95:88] = padder_out_1[103:96];
    assign padder_out[103:96] = padder_out_1[95:88];
    assign padder_out[111:104] = padder_out_1[87:80];
    assign padder_out[119:112] = padder_out_1[79:72];
    assign padder_out[127:120] = padder_out_1[71:64];
    assign padder_out[135:128] = padder_out_1[191:184];
    assign padder_out[143:136] = padder_out_1[183:176];
    assign padder_out[151:144] = padder_out_1[175:168];
    assign padder_out[159:152] = padder_out_1[167:160];
    assign padder_out[167:160] = padder_out_1[159:152];
    assign padder_out[175:168] = padder_out_1[151:144];
    assign padder_out[183:176] = padder_out_1[143:136];
    assign padder_out[191:184] = padder_out_1[135:128];
    assign padder_out[199:192] = padder_out_1[255:248];
    assign padder_out[207:200] = padder_out_1[247:240];
    assign padder_out[215:208] = padder_out_1[239:232];
    assign padder_out[223:216] = padder_out_1[231:224];
    assign padder_out[231:224] = padder_out_1[223:216];
    assign padder_out[239:232] = padder_out_1[215:208];
    assign padder_out[247:240] = padder_out_1[207:200];
    assign padder_out[255:248] = padder_out_1[199:192];
    assign padder_out[263:256] = padder_out_1[319:312];
    assign padder_out[271:264] = padder_out_1[311:304];
    assign padder_out[279:272] = padder_out_1[303:296];
    assign padder_out[287:280] = padder_out_1[295:288];
    assign padder_out[295:288] = padder_out_1[287:280];
    assign padder_out[303:296] = padder_out_1[279:272];
    assign padder_out[311:304] = padder_out_1[271:264];
    assign padder_out[319:312] = padder_out_1[263:256];
    assign padder_out[327:320] = padder_out_1[383:376];
    assign padder_out[335:328] = padder_out_1[375:368];
    assign padder_out[343:336] = padder_out_1[367:360];
    assign padder_out[351:344] = padder_out_1[359:352];
    assign padder_out[359:352] = padder_out_1[351:344];
    assign padder_out[367:360] = padder_out_1[343:336];
    assign padder_out[375:368] = padder_out_1[335:328];
    assign padder_out[383:376] = padder_out_1[327:320];
    assign padder_out[391:384] = padder_out_1[447:440];
    assign padder_out[399:392] = padder_out_1[439:432];
    assign padder_out[407:400] = padder_out_1[431:424];
    assign padder_out[415:408] = padder_out_1[423:416];
    assign padder_out[423:416] = padder_out_1[415:408];
    assign padder_out[431:424] = padder_out_1[407:400];
    assign padder_out[439:432] = padder_out_1[399:392];
    assign padder_out[447:440] = padder_out_1[391:384];
    assign padder_out[455:448] = padder_out_1[511:504];
    assign padder_out[463:456] = padder_out_1[503:496];
    assign padder_out[471:464] = padder_out_1[495:488];
    assign padder_out[479:472] = padder_out_1[487:480];
    assign padder_out[487:480] = padder_out_1[479:472];
    assign padder_out[495:488] = padder_out_1[471:464];
    assign padder_out[503:496] = padder_out_1[463:456];
    assign padder_out[511:504] = padder_out_1[455:448];
    assign padder_out[519:512] = padder_out_1[575:568];
    assign padder_out[527:520] = padder_out_1[567:560];
    assign padder_out[535:528] = padder_out_1[559:552];
    assign padder_out[543:536] = padder_out_1[551:544];
    assign padder_out[551:544] = padder_out_1[543:536];
    assign padder_out[559:552] = padder_out_1[535:528];
    assign padder_out[567:560] = padder_out_1[527:520];
    assign padder_out[575:568] = padder_out_1[519:512];
    always @(posedge clk) begin
        if (reset) begin
            out_ready <= 0;
        end
        else if (i[22]) begin
            out_ready <= 1;
        end
    end
    keccak_padder_ padder_ (
        .clk(clk),
        .reset(reset),
        .in(in),
        .in_ready(in_ready),
        .is_last(is_last),
        .byte_num(byte_num),
        .buffer_full(buffer_full),
        .out(padder_out_1),
        .out_ready(padder_out_ready),
        .f_ack(f_ack)
    );
    keccak_f_permutation_ f_permutation_ (
        .clk(clk),
        .reset(reset),
        .in(padder_out),
        .in_ready(padder_out_ready),
        .ack(f_ack),
        .out(f_out),
        .out_ready(f_out_ready)
    );
endmodule