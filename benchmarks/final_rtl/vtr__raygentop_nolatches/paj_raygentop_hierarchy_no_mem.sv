module paj_raygentop_hierarchy_no_mem (
    output logic rgwant_addr,
    output logic rgwant_data,
    output logic rgread_ready,
    input logic rgaddr_ready,
    input logic rgdata_ready,
    input logic rgwant_read,
    input logic[63:0] rgdatain,
    output logic[63:0] rgdataout,
    input logic[17:0] rgaddrin,
    input logic[31:0] rgCont,
    output logic[31:0] rgStat,
    input logic[31:0] rgCfgData,
    output logic rgwant_CfgData,
    input logic rgCfgData_ready,
    input logic[63:0] tm3_sram_data_in,
    output logic[63:0] tm3_sram_data_out,
    output logic[18:0] tm3_sram_addr,
    output logic[7:0] tm3_sram_we,
    output logic[1:0] tm3_sram_oe,
    output logic tm3_sram_adsp,
    input logic clk,
    output logic[63:0] fbdata,
    output logic fbdatavalid,
    input logic fbnextscanline,
    output logic[1:0] raygroup01,
    output logic raygroupvalid01,
    input logic busy01,
    output logic[1:0] raygroup10,
    output logic raygroupvalid10,
    input logic busy10,
    input logic globalreset,
    output logic[31:0] rgData,
    output logic[3:0] rgAddr,
    output logic[2:0] rgWE,
    output logic rgAddrValid,
    input logic rgDone,
    input logic[31:0] rgResultData,
    input logic rgResultReady,
    input logic[1:0] rgResultSource
);
    wire logic [0:0] statepeek2;
    wire logic as01;
    wire logic ack01;
    wire logic[3:0] addr01;
    wire logic[47:0] dir01;
    wire logic[47:0] dir;
    wire logic[47:0] sramdatal;
    wire logic wantDir;
    wire logic dirReady;
    wire logic dirReadyl;
    wire logic[14:0] address;
    wire logic[30:0] cyclecounter;
    wire logic nas01;
    wire logic nas10;
    wire logic go;
    reg page;
    wire logic [0:0] statepeekct;
    wire logic valid01;
    wire logic valid10;
    wire logic[15:0] id01a;
    wire logic[15:0] id01b;
    wire logic[15:0] id01c;
    wire logic[15:0] id10a;
    wire logic[15:0] id10b;
    wire logic[15:0] id10c;
    wire logic hit01a;
    wire logic hit01b;
    wire logic hit01c;
    wire logic hit10a;
    wire logic hit10b;
    wire logic hit10c;
    wire logic [6:0] u01a;
    wire logic [6:0] u01b;
    wire logic [6:0] u01c;
    wire logic [6:0] v01a;
    wire logic [6:0] v01b;
    wire logic [6:0] v01c;
    wire logic [6:0] u10a;
    wire logic [6:0] u10b;
    wire logic [6:0] u10c;
    wire logic [6:0] v10a;
    wire logic [6:0] v10b;
    wire logic [6:0] v10c;
    wire logic wantwriteback;
    wire logic writebackack;
    wire logic [62:0] writebackdata;
    wire logic[17:0] writebackaddr;
    wire logic[17:0] nextaddr01;
    wire logic[63:0] shadedata;
    wire logic[15:0] triID;
    wire logic wantshadedata;
    wire logic shadedataready;
    wire logic[27:0] origx;
    wire logic[27:0] origy;
    wire logic[27:0] origz;
    wire logic[15:0] m11;
    wire logic[15:0] m12;
    wire logic[15:0] m13;
    wire logic[15:0] m21;
    wire logic[15:0] m22;
    wire logic[15:0] m23;
    wire logic[15:0] m31;
    wire logic[15:0] m32;
    wire logic[15:0] m33;
    wire logic[20:0] bkcolour;
    wire logic[20:0] texinfo;
    wire logic [0:0] texaddr;
    wire logic[63:0] texel;
    wire logic[17:0] texeladdr;
    wire logic wanttexel;
    wire logic texelready;
    wire logic fbpage;
    wire logic wantcfg;
    wire logic debugglobalreset;
    assign rgwant_CfgData = wantcfg;
    paj_raygentop_hierarchy_no_mem_onlyeonecycleinst onlyeonecycleinst (
        .trigger(rgCont[0]),
        .output_xhdl0(go),
        .globalreset(globalreset),
        .clk(clk)
    );
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            page <= 1'b1;
        end
        else begin
            page <= ~(page);
        end
    end
    assign fbpage = ~(page);
    paj_raygentop_hierarchy_no_mem_matmultinst matmultinst (
        .Ax(sramdatal[47:32]),
        .Ay(sramdatal[31:16]),
        .Az(sramdatal[15:0]),
        .m11(m11),
        .m12(m12),
        .m13(m13),
        .m21(m21),
        .m22(m22),
        .m23(m23),
        .m31(m31),
        .m32(m32),
        .m33(m33),
        .Cx(dir[47:32]),
        .Cy(dir[31:16]),
        .Cz(dir[15:0]),
        .clk(clk)
    );
    paj_raygentop_hierarchy_no_mem_dir01delay dir01delay (
        .datain(dirReady),
        .dataout(dirReadyl),
        .clk(clk)
    );
    paj_raygentop_hierarchy_no_mem_ConfigMemoryInst ConfigMemoryInst (
        .CfgAddr(rgCfgData[31:28]),
        .CfgData(rgCfgData[27:0]),
        .CfgData_Ready(rgCfgData_ready),
        .want_CfgData(wantcfg),
        .origx(origx),
        .origy(origy),
        .origz(origz),
        .m11(m11),
        .m12(m12),
        .m13(m13),
        .m21(m21),
        .m22(m22),
        .m23(m23),
        .m31(m31),
        .m32(m32),
        .m33(m33),
        .bkcolour(bkcolour),
        .texinfo(texinfo),
        .globalreset(globalreset),
        .clk(clk)
    );
    paj_raygentop_hierarchy_no_mem_sramcont sramcont (
        .want_addr(rgwant_addr),
        .addr_ready(rgaddr_ready),
        .addrin(rgaddrin),
        .want_data(rgwant_data),
        .data_ready(rgdata_ready),
        .datain(rgdatain),
        .want_read(rgwant_read),
        .read_ready(rgread_ready),
        .dataout(rgdataout),
        .dirReady(dirReady),
        .wantDir(wantDir),
        .sramdatal(sramdatal),
        .addr(address),
        .wantwriteback(wantwriteback),
        .writebackack(writebackack),
        .writebackdata({1'b0, writebackdata}),
        .writebackaddr(writebackaddr),
        .fbdata(fbdata),
        .fbnextscanline(fbnextscanline),
        .fbdatavalid(fbdatavalid),
        .fbpage(fbpage),
        .shadedata(shadedata),
        .triID(triID),
        .wantshadedata(wantshadedata),
        .shadedataready(shadedataready),
        .texeladdr(texeladdr),
        .texel(texel),
        .wanttexel(wanttexel),
        .texelready(texelready),
        .tm3_sram_data_in(tm3_sram_data_in),
        .tm3_sram_data_out(tm3_sram_data_out),
        .tm3_sram_addr(tm3_sram_addr),
        .tm3_sram_we(tm3_sram_we),
        .tm3_sram_oe(tm3_sram_oe),
        .tm3_sram_adsp(tm3_sram_adsp),
        .globalreset(globalreset),
        .clk(clk)
    );
    paj_raygentop_hierarchy_no_mem_raysendinst raysendinst (
        .as(as01),
        .ack(ack01),
        .addr(addr01),
        .dir(dir01),
        .origx(origx),
        .origy(origy),
        .origz(origz),
        .rgData(rgData),
        .rgAddr(rgAddr),
        .rgWE(rgWE),
        .rgAddrValid(rgAddrValid),
        .rgDone(rgDone),
        .globalreset(globalreset),
        .clk(clk),
        .statepeek(statepeek2)
    );
    paj_raygentop_hierarchy_no_mem_raygencontinst raygencontinst (
        .go(go),
        .initcount(rgCont[15:1]),
        .busyout(rgStat[31]),
        .cycles(cyclecounter),
        .nextaddr(nextaddr01),
        .nas0(nas01),
        .nas1(nas10),
        .page(page),
        .dirReady(dirReadyl),
        .wantDir(wantDir),
        .dirIn(dir),
        .addrIn(address),
        .as(as01),
        .addr(addr01),
        .ack(ack01),
        .dir(dir01),
        .raygroup0(raygroup01),
        .raygroupvalid0(raygroupvalid01),
        .busy0(busy01),
        .raygroup1(raygroup10),
        .raygroupvalid1(raygroupvalid10),
        .busy1(busy10),
        .globalreset(globalreset),
        .clk(clk),
        .statepeek(statepeekct)
    );
    paj_raygentop_hierarchy_no_mem_resultrecieveinst resultrecieveinst (
        .valid01(valid01),
        .valid10(valid10),
        .id01a(id01a),
        .id01b(id01b),
        .id01c(id01c),
        .id10a(id10a),
        .id10b(id10b),
        .id10c(id10c),
        .hit01a(hit01a),
        .hit01b(hit01b),
        .hit01c(hit01c),
        .hit10a(hit10a),
        .hit10b(hit10b),
        .hit10c(hit10c),
        .u01a(u01a),
        .u01b(u01b),
        .u01c(u01c),
        .v01a(v01a),
        .v01b(v01b),
        .v01c(v01c),
        .u10a(u10a),
        .u10b(u10b),
        .u10c(u10c),
        .v10a(v10a),
        .v10b(v10b),
        .v10c(v10c),
        .rgResultData(rgResultData),
        .rgResultReady(rgResultReady),
        .rgResultSource(rgResultSource),
        .globalreset(globalreset),
        .clk(clk)
    );
    assign debugglobalreset = (globalreset | go);
    paj_raygentop_hierarchy_no_mem_resultwriteinst resultwriteinst (
        .valid01(valid01),
        .valid10(valid10),
        .id01a(id01a),
        .id01b(id01b),
        .id01c(id01c),
        .id10a(id10a),
        .id10b(id10b),
        .id10c(id10c),
        .hit01a(hit01a),
        .hit01b(hit01b),
        .hit01c(hit01c),
        .hit10a(hit10a),
        .hit10b(hit10b),
        .hit10c(hit10c),
        .u01a({1'b0, u01a}),
        .u01b({1'b0, u01b}),
        .u01c({1'b0, u01c}),
        .v01a({1'b0, v01a}),
        .v01b({1'b0, v01b}),
        .v01c({1'b0, v01c}),
        .u10a({1'b0, u10a}),
        .u10b({1'b0, u10b}),
        .u10c({1'b0, u10c}),
        .v10a({1'b0, v10a}),
        .v10b({1'b0, v10b}),
        .v10c({1'b0, v10c}),
        .addr(nextaddr01),
        .as01(nas01),
        .as10(nas10),
        .bkcolour(bkcolour),
        .shadedata(shadedata),
        .triID(triID),
        .wantshadedata(wantshadedata),
        .shadedataready(shadedataready),
        .texinfo(texinfo),
        .texaddr(texaddr),
        .texeladdr(texeladdr),
        .texel(texel),
        .wanttexel(wanttexel),
        .texelready(texelready),
        .dataout(writebackdata),
        .addrout(writebackaddr),
        .write(wantwriteback),
        .ack(writebackack),
        .globalreset(debugglobalreset),
        .clk(clk)
    );
    assign rgStat[30:0] = cyclecounter;
endmodule