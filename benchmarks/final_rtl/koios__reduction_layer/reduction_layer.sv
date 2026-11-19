module reduction_layer (
    input logic clk,
    input logic resetn,
    input logic start,
    input logic[4:0] start_addr,
    input logic[4:0] end_addr,
    input logic[1:0] reduction_type,
    input logic bram_in_we,
    input logic[15:0] bram_in_wdata_ext,
    input logic[4:0] bram_in_addr_ext,
    output logic[15:0] reduced_out,
    output reg done
);
    reg[4:0] bram_in_addr;
    wire logic[4:0] bram_in_addr_muxed;
    wire logic[2047:0] bram_in_wdata;
    wire logic[2047:0] bram_in_rdata;
    wire logic[19:0] reduced_out_unrounded;
    wire logic[15:0] reduced_out_add;
    assign bram_in_addr_muxed = (bram_in_we ? bram_in_addr_ext : bram_in_addr);
    assign bram_in_wdata = {128{bram_in_wdata_ext}};
    reduction_layer_in_data in_data (
        .addr(bram_in_addr_muxed),
        .d(bram_in_wdata),
        .we(bram_in_we),
        .q(bram_in_rdata),
        .clk(clk)
    );
    reg[3:0] state;
    reg [2:0] count;
    reg reset_reduction_unit;
    always @(posedge clk) begin
        if ((resetn == 1'b0)) begin
            state <= 4'b0;
            count <= 0;
            done <= 0;
            reset_reduction_unit <= 1;
        end
        else begin
            case (state)
                4'b0: begin
                    if ((start == 1'b1)) begin
                        state <= 4'b1;
                    end
                    done <= 0;
                    reset_reduction_unit <= 1;
                end
                4'b1: begin
                    state <= 4'b10;
                    bram_in_addr <= start_addr;
                    reset_reduction_unit <= 1;
                end
                4'b10: begin
                    reset_reduction_unit <= 0;
                    if ((bram_in_addr == end_addr)) begin
                        state <= 4'b1110;
                    end
                    else begin
                        bram_in_addr <= (bram_in_addr + 1'b1);
                    end
                end
                4'b1110: begin
                    if ((count == 5)) begin
                        state <= 4'b0;
                        count <= 0;
                        done <= 1;
                        reset_reduction_unit <= 1;
                    end
                    else begin
                        count <= (count + 1'b1);
                    end
                end
            endcase
        end
    end
    reduction_layer_ucu ucu (
        .clk(clk),
        .reset(reset_reduction_unit),
        .inp0(bram_in_rdata[15:0]),
        .inp1(bram_in_rdata[31:16]),
        .inp2(bram_in_rdata[47:32]),
        .inp3(bram_in_rdata[63:48]),
        .inp4(bram_in_rdata[79:64]),
        .inp5(bram_in_rdata[95:80]),
        .inp6(bram_in_rdata[111:96]),
        .inp7(bram_in_rdata[127:112]),
        .inp8(bram_in_rdata[143:128]),
        .inp9(bram_in_rdata[159:144]),
        .inp10(bram_in_rdata[175:160]),
        .inp11(bram_in_rdata[191:176]),
        .inp12(bram_in_rdata[207:192]),
        .inp13(bram_in_rdata[223:208]),
        .inp14(bram_in_rdata[239:224]),
        .inp15(bram_in_rdata[255:240]),
        .inp16(bram_in_rdata[271:256]),
        .inp17(bram_in_rdata[287:272]),
        .inp18(bram_in_rdata[303:288]),
        .inp19(bram_in_rdata[319:304]),
        .inp20(bram_in_rdata[335:320]),
        .inp21(bram_in_rdata[351:336]),
        .inp22(bram_in_rdata[367:352]),
        .inp23(bram_in_rdata[383:368]),
        .inp24(bram_in_rdata[399:384]),
        .inp25(bram_in_rdata[415:400]),
        .inp26(bram_in_rdata[431:416]),
        .inp27(bram_in_rdata[447:432]),
        .inp28(bram_in_rdata[463:448]),
        .inp29(bram_in_rdata[479:464]),
        .inp30(bram_in_rdata[495:480]),
        .inp31(bram_in_rdata[511:496]),
        .inp32(bram_in_rdata[527:512]),
        .inp33(bram_in_rdata[543:528]),
        .inp34(bram_in_rdata[559:544]),
        .inp35(bram_in_rdata[575:560]),
        .inp36(bram_in_rdata[591:576]),
        .inp37(bram_in_rdata[607:592]),
        .inp38(bram_in_rdata[623:608]),
        .inp39(bram_in_rdata[639:624]),
        .inp40(bram_in_rdata[655:640]),
        .inp41(bram_in_rdata[671:656]),
        .inp42(bram_in_rdata[687:672]),
        .inp43(bram_in_rdata[703:688]),
        .inp44(bram_in_rdata[719:704]),
        .inp45(bram_in_rdata[735:720]),
        .inp46(bram_in_rdata[751:736]),
        .inp47(bram_in_rdata[767:752]),
        .inp48(bram_in_rdata[783:768]),
        .inp49(bram_in_rdata[799:784]),
        .inp50(bram_in_rdata[815:800]),
        .inp51(bram_in_rdata[831:816]),
        .inp52(bram_in_rdata[847:832]),
        .inp53(bram_in_rdata[863:848]),
        .inp54(bram_in_rdata[879:864]),
        .inp55(bram_in_rdata[895:880]),
        .inp56(bram_in_rdata[911:896]),
        .inp57(bram_in_rdata[927:912]),
        .inp58(bram_in_rdata[943:928]),
        .inp59(bram_in_rdata[959:944]),
        .inp60(bram_in_rdata[975:960]),
        .inp61(bram_in_rdata[991:976]),
        .inp62(bram_in_rdata[1007:992]),
        .inp63(bram_in_rdata[1023:1008]),
        .inp64(bram_in_rdata[1039:1024]),
        .inp65(bram_in_rdata[1055:1040]),
        .inp66(bram_in_rdata[1071:1056]),
        .inp67(bram_in_rdata[1087:1072]),
        .inp68(bram_in_rdata[1103:1088]),
        .inp69(bram_in_rdata[1119:1104]),
        .inp70(bram_in_rdata[1135:1120]),
        .inp71(bram_in_rdata[1151:1136]),
        .inp72(bram_in_rdata[1167:1152]),
        .inp73(bram_in_rdata[1183:1168]),
        .inp74(bram_in_rdata[1199:1184]),
        .inp75(bram_in_rdata[1215:1200]),
        .inp76(bram_in_rdata[1231:1216]),
        .inp77(bram_in_rdata[1247:1232]),
        .inp78(bram_in_rdata[1263:1248]),
        .inp79(bram_in_rdata[1279:1264]),
        .inp80(bram_in_rdata[1295:1280]),
        .inp81(bram_in_rdata[1311:1296]),
        .inp82(bram_in_rdata[1327:1312]),
        .inp83(bram_in_rdata[1343:1328]),
        .inp84(bram_in_rdata[1359:1344]),
        .inp85(bram_in_rdata[1375:1360]),
        .inp86(bram_in_rdata[1391:1376]),
        .inp87(bram_in_rdata[1407:1392]),
        .inp88(bram_in_rdata[1423:1408]),
        .inp89(bram_in_rdata[1439:1424]),
        .inp90(bram_in_rdata[1455:1440]),
        .inp91(bram_in_rdata[1471:1456]),
        .inp92(bram_in_rdata[1487:1472]),
        .inp93(bram_in_rdata[1503:1488]),
        .inp94(bram_in_rdata[1519:1504]),
        .inp95(bram_in_rdata[1535:1520]),
        .inp96(bram_in_rdata[1551:1536]),
        .inp97(bram_in_rdata[1567:1552]),
        .inp98(bram_in_rdata[1583:1568]),
        .inp99(bram_in_rdata[1599:1584]),
        .inp100(bram_in_rdata[1615:1600]),
        .inp101(bram_in_rdata[1631:1616]),
        .inp102(bram_in_rdata[1647:1632]),
        .inp103(bram_in_rdata[1663:1648]),
        .inp104(bram_in_rdata[1679:1664]),
        .inp105(bram_in_rdata[1695:1680]),
        .inp106(bram_in_rdata[1711:1696]),
        .inp107(bram_in_rdata[1727:1712]),
        .inp108(bram_in_rdata[1743:1728]),
        .inp109(bram_in_rdata[1759:1744]),
        .inp110(bram_in_rdata[1775:1760]),
        .inp111(bram_in_rdata[1791:1776]),
        .inp112(bram_in_rdata[1807:1792]),
        .inp113(bram_in_rdata[1823:1808]),
        .inp114(bram_in_rdata[1839:1824]),
        .inp115(bram_in_rdata[1855:1840]),
        .inp116(bram_in_rdata[1871:1856]),
        .inp117(bram_in_rdata[1887:1872]),
        .inp118(bram_in_rdata[1903:1888]),
        .inp119(bram_in_rdata[1919:1904]),
        .inp120(bram_in_rdata[1935:1920]),
        .inp121(bram_in_rdata[1951:1936]),
        .inp122(bram_in_rdata[1967:1952]),
        .inp123(bram_in_rdata[1983:1968]),
        .inp124(bram_in_rdata[1999:1984]),
        .inp125(bram_in_rdata[2015:2000]),
        .inp126(bram_in_rdata[2031:2016]),
        .inp127(bram_in_rdata[2047:2032]),
        .mode(reduction_type),
        .outp(reduced_out_unrounded)
    );
    reduction_layer_u_round u_round (
        .i_data(reduced_out_unrounded),
        .o_data(reduced_out_add)
    );
    assign reduced_out = ((reduction_type == 2'b0) ? reduced_out_add : reduced_out_unrounded[15:0]);
endmodule