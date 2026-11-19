module USFFT64_2B (
    input logic CLK,
    input logic RST,
    input logic ED,
    input logic START,
    input logic[3:0] SHIFT,
    input logic[15:0] DR,
    input logic[15:0] DI,
    output logic RDY,
    output logic OVF1,
    output logic OVF2,
    output logic[5:0] ADDR,
    output logic[18:0] DOR,
    output logic[18:0] DOI
);
    wire logic[15:0] dr1;
    wire logic[15:0] di1;
    wire logic[17:0] dr3;
    wire logic[17:0] di3;
    wire logic[17:0] dr4;
    wire logic[17:0] di4;
    wire logic[17:0] dr5;
    wire logic[17:0] di5;
    wire logic[18:0] dr2;
    wire logic[18:0] di2;
    wire logic[20:0] dr6;
    wire logic[20:0] di6;
    wire logic[18:0] dr7;
    wire logic[18:0] di7;
    wire logic[18:0] dr8;
    wire logic[18:0] di8;
    wire logic rdy1;
    wire logic rdy2;
    wire logic rdy3;
    wire logic rdy4;
    wire logic rdy5;
    wire logic rdy6;
    wire logic rdy7;
    wire logic rdy8;
    reg[5:0] addri;
    USFFT64_2B_U_BUF1 U_BUF1 (
        .CLK(CLK),
        .RST(RST),
        .ED(ED),
        .START(START),
        .DR(DR),
        .DI(DI),
        .RDY(rdy1),
        .DOR(dr1),
        .DOI(di1)
    );
    USFFT64_2B_U_FFT1 U_FFT1 (
        .DOR(dr2),
        .DII(di1),
        .RST(RST),
        .ED(ED),
        .CLK(CLK),
        .DOI(di2),
        .START(rdy1),
        .DIR(dr1),
        .RDY(rdy2)
    );
    wire logic[1:0] shiftl = SHIFT[1:0];
    USFFT64_2B_U_NORM1 U_NORM1 (
        .CLK(CLK),
        .ED(ED),
        .START(rdy2),
        .DR(dr2),
        .DI(di2),
        .SHIFT(shiftl),
        .OVF(OVF1),
        .RDY(rdy3),
        .DOR(dr3),
        .DOI(di3)
    );
    USFFT64_2B_U_MPU U_MPU (
        .CLK(CLK),
        .RST(RST),
        .ED(ED),
        .START(rdy3),
        .DR(dr3),
        .DI(di3),
        .DOR(dr4),
        .DOI(di4),
        .RDY(rdy4)
    );
    USFFT64_2B_U_BUF2 U_BUF2 (
        .CLK(CLK),
        .RST(RST),
        .ED(ED),
        .START(rdy4),
        .DR(dr4),
        .DI(di4),
        .RDY(rdy5),
        .DOR(dr5),
        .DOI(di5)
    );
    USFFT64_2B_U_FFT2 U_FFT2 (
        .DOR(dr6),
        .DII(di5),
        .RST(RST),
        .ED(ED),
        .CLK(CLK),
        .DOI(di6),
        .START(rdy5),
        .DIR(dr5),
        .RDY(rdy6)
    );
    wire logic[1:0] shifth = SHIFT[3:2];
    USFFT64_2B_U_NORM2 U_NORM2 (
        .CLK(CLK),
        .ED(ED),
        .START(rdy6),
        .DR(dr6),
        .DI(di6),
        .SHIFT(shifth),
        .OVF(OVF2),
        .RDY(rdy7),
        .DOR(dr7),
        .DOI(di7)
    );
    USFFT64_2B_Ubuf3 Ubuf3 (
        .CLK(CLK),
        .RST(RST),
        .ED(ED),
        .START(rdy7),
        .DR(dr7),
        .DI(di7),
        .RDY(rdy8),
        .DOR(dr8),
        .DOI(di8)
    );
    always @(posedge CLK) begin
        if (RST) begin
            addri <= 6'b0;
        end
        else if ((rdy8 == 1)) begin
            addri <= 6'b0;
        end
        else if (ED) begin
            addri <= (addri + 1);
        end
    end
    assign ADDR = addri;
    assign DOR = dr8;
    assign DOI = di8;
    assign RDY = rdy8;
endmodule

module USFFT64_2B_U_BUF1 (
    input logic CLK,
    input logic RST,
    input logic ED,
    input logic START,
    input logic[15:0] DR,
    input logic[15:0] DI,
    output reg RDY,
    output logic[15:0] DOR,
    output logic[15:0] DOI
);
    wire logic odd;
    wire logic we;
    wire logic[5:0] addrw;
    wire logic[5:0] addrr;
    reg[6:0] addr;
    reg [6:0] ct2;
    always @(posedge CLK) begin
        if (RST) begin
            addr <= 6'b0;
            ct2 <= 7'b1000001;
            RDY <= 1'b0;
        end
        else if (START) begin
            addr <= 6'b0;
            ct2 <= 6'b0;
            RDY <= 1'b0;
        end
        else if (ED) begin
            RDY <= 1'b0;
            addr <= (addr + 1);
            if ((ct2 != 65)) begin
                ct2 <= (ct2 + 1);
            end
            if ((ct2 == 64)) begin
                RDY <= 1'b1;
            end
        end
    end
    assign addrw = addr[5:0];
    assign odd = addr[6];
    assign addrr = {addr[2:0], addr[5:3]};
    assign we = ED;
    USFFT64_2B_U_BUF1_URAM URAM (
        .CLK(CLK),
        .ED(ED),
        .WE(1'b1),
        .ODD(odd),
        .ADDRW(addrw),
        .ADDRR(addrr),
        .DR(DR),
        .DI(DI),
        .DOR(DOR),
        .DOI(DOI)
    );
endmodule
module USFFT64_2B_U_BUF1_URAM (
    input logic CLK,
    input logic ED,
    input logic WE,
    input logic ODD,
    input logic[5:0] ADDRW,
    input logic[5:0] ADDRR,
    input logic[15:0] DR,
    input logic[15:0] DI,
    output logic[15:0] DOR,
    output logic[15:0] DOI
);
    wire logic[6:0] addrr2 = {ODD, ADDRR};
    wire logic[6:0] addrw2 = {~(ODD), ADDRW};
    wire logic[31:0] di = {DR, DI};
    wire logic[31:0] doi;
    reg[31:0] ram[127:0];
    reg[6:0] read_addra;
    always @(posedge CLK) begin
        if (ED) begin
            begin
                ram[addrw2] <= di;
            end
            read_addra <= addrr2;
        end
    end
    assign doi = ram[read_addra];
    assign DOR = doi[31:16];
    assign DOI = doi[15:0];
endmodule


module USFFT64_2B_U_FFT1 (
    output logic[18:0] DOR,
    input logic[15:0] DII,
    input logic RST,
    input logic ED,
    input logic CLK,
    output logic[18:0] DOI,
    input logic START,
    input logic[15:0] DIR,
    output reg RDY
);
    reg[2:0] ct;
    reg[3:0] ctd;
    always @(posedge CLK) begin
        if (RST) begin
            ct <= 0;
            ctd <= 15;
            RDY <= 0;
        end
        else if (START) begin
            ct <= 0;
            ctd <= 0;
            RDY <= 0;
        end
        else if (ED) begin
            RDY <= 0;
            ct <= (ct + 1);
            if ((ctd != 4'b1111)) begin
                ctd <= (ctd + 1);
            end
            if ((ctd == 12)) begin
                RDY <= 1;
            end
        end
    end
    reg signed[15:0] dr;
    reg signed[15:0] d1r;
    reg signed[15:0] d2r;
    reg signed[15:0] d3r;
    reg signed[15:0] d4r;
    reg signed[15:0] di;
    reg signed[15:0] d1i;
    reg signed[15:0] d2i;
    reg signed[15:0] d3i;
    reg signed[15:0] d4i;
    always @(posedge CLK) begin
        if (ED) begin
            dr <= DIR;
            d1r <= dr;
            d2r <= d1r;
            d3r <= d2r;
            d4r <= d3r;
            di <= DII;
            d1i <= di;
            d2i <= d1i;
            d3i <= d2i;
            d4i <= d3i;
        end
    end
    reg signed[16:0] s1r;
    reg signed[16:0] s2r;
    reg signed[16:0] s1d1r;
    reg signed[16:0] s1d2r;
    reg signed[16:0] s1d3r;
    reg signed[16:0] s2d1r;
    reg signed[16:0] s2d2r;
    reg signed[16:0] s2d3r;
    reg signed[16:0] s1i;
    reg signed[16:0] s2i;
    reg signed[16:0] s1d1i;
    reg signed[16:0] s1d2i;
    reg signed[16:0] s1d3i;
    reg signed[16:0] s2d1i;
    reg signed[16:0] s2d2i;
    reg signed[16:0] s2d3i;
    always @(posedge CLK) begin
        if ((ED && ((((ct == 5) || (ct == 6)) || (ct == 7)) || (ct == 0)))) begin
            s1r <= (d4r + dr);
            s1i <= (d4i + di);
            s2r <= (d4r - dr);
            s2i <= (d4i - di);
        end
        if (ED) begin
            s1d1r <= s1r;
            s1d2r <= s1d1r;
            s1d1i <= s1i;
            s1d2i <= s1d1i;
            if (((ct == 0) || (ct == 1))) begin
                s1d3r <= s1d2r;
                s1d3i <= s1d2i;
            end
            if ((((ct == 6) || (ct == 7)) || (ct == 0))) begin
                s2d1r <= s2r;
                s2d2r <= s2d1r;
                s2d1i <= s2i;
                s2d2i <= s2d1i;
            end
            if ((ct == 0)) begin
                s2d3r <= s2d2r;
                s2d3i <= s2d2i;
            end
        end
    end
    reg signed[17:0] s3r;
    reg signed[17:0] s4r;
    reg signed[17:0] s3d1r;
    reg signed[17:0] s3d2r;
    reg signed[17:0] s3d3r;
    reg signed[17:0] s3i;
    reg signed[17:0] s4i;
    reg signed[17:0] s3d1i;
    reg signed[17:0] s3d2i;
    reg signed[17:0] s3d3i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                0: begin
                    s3r <= (s1d2r + s1r);
                    s3i <= (s1d2i + s1i);
                end
                1: begin
                    s3r <= (s1d3r - s1d1r);
                    s3i <= (s1d3i - s1d1i);
                end
                2: begin
                    s3r <= (s1d3r + s1r);
                    s3i <= (s1d3i + s1i);
                end
                3: begin
                    s3r <= (s1d3r - s1r);
                    s3i <= (s1d3i - s1i);
                end
            endcase
        end
        if (ED) begin
            if ((((ct == 1) || (ct == 2)) || (ct == 3))) begin
                s3d1r <= s3r;
                s3d1i <= s3i;
            end
            if (((ct == 2) || (ct == 3))) begin
                s3d2r <= s3d1r;
                s3d3r <= s3d2r;
                s3d2i <= s3d1i;
                s3d3i <= s3d2i;
            end
        end
    end
    always @(posedge CLK) begin
        if (ED) begin
            if ((ct == 1)) begin
                s4r <= (s2d2r + s2r);
                s4i <= (s2d2i + s2i);
            end
            else begin
                s4r <= (s2d2r - s2r);
                s4i <= (s2d2i - s2i);
            end
        end
    end
    wire logic em;
    assign em = ((((ct == 2) || (ct == 3)) || (ct == 4)) && ED);
    wire logic signed[17:0] m4m7r;
    wire logic signed[17:0] m4m7i;
    USFFT64_2B_U_FFT1_UMR UMR (
        .CLK(CLK),
        .DO(m4m7r),
        .DI(s4r),
        .EI(em)
    );
    USFFT64_2B_U_FFT1_UMI UMI (
        .CLK(CLK),
        .DO(m4m7i),
        .DI(s4i),
        .EI(em)
    );
    reg signed[17:0] sjr;
    reg signed[17:0] sji;
    reg signed [16:0] m6r;
    reg signed[17:0] m6i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                3: begin
                    sjr <= s2d1i;
                    sji <= (0 - s2d1r);
                end
                4: begin
                    sjr <= m4m7i;
                    sji <= (0 - m4m7r);
                end
                6: begin
                    sjr <= s3i;
                    sji <= (0 - s3r);
                end
            endcase
            if ((ct == 4)) begin
                m6r <= sjr;
                m6i <= sji;
            end
        end
    end
    reg signed[18:0] s5r;
    reg signed[18:0] s5d1r;
    reg signed[18:0] s5d2r;
    reg signed[18:0] q1r;
    reg signed[18:0] s5i;
    reg signed[18:0] s5d1i;
    reg signed[18:0] s5d2i;
    reg signed[18:0] q1i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                5: begin
                    q1r <= (s2d3r + m4m7r);
                    q1i <= (s2d3i + m4m7i);
                    s5r <= (m6r + sjr);
                    s5i <= (m6i + sji);
                end
                6: begin
                    s5r <= (m6r - sjr);
                    s5i <= (m6i - sji);
                    s5d1r <= s5r;
                    s5d1i <= s5i;
                end
                7: begin
                    s5r <= (s2d3r - m4m7r);
                    s5i <= (s2d3i - m4m7i);
                    s5d1r <= s5r;
                    s5d1i <= s5i;
                    s5d2r <= s5d1r;
                    s5d2i <= s5d1i;
                end
            endcase
        end
    end
    reg signed [18:0] s6r;
    reg signed [18:0] s6i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                5: begin
                    s6r <= (s3d3r + s3d1r);
                    s6i <= (s3d3i + s3d1i);
                end
                6: begin
                    s6r <= (q1r + s5r);
                    s6i <= (q1i + s5i);
                end
                7: begin
                    s6r <= (s3d2r + sjr);
                    s6i <= (s3d2i + sji);
                end
                0: begin
                    s6r <= (s5r - s5d1r);
                    s6i <= (s5i - s5d1i);
                end
                1: begin
                    s6r <= (s3d3r - s3d1r);
                    s6i <= (s3d3i - s3d1i);
                end
                2: begin
                    s6r <= (s5r + s5d1r);
                    s6i <= (s5i + s5d1i);
                end
                3: begin
                    s6r <= (s3d3r - sjr);
                    s6i <= (s3d3i - sji);
                end
                4: begin
                    s6r <= (q1r - s5d2r);
                    s6i <= (q1i - s5d2i);
                end
            endcase
        end
    end
    assign DOR = s6r[18:0];
    assign DOI = s6i[18:0];
endmodule

module USFFT64_2B_U_FFT1_UMR (
    input logic CLK,
    output reg[17:0] DO,
    input logic signed[17:0] DI,
    input logic EI
);
    reg signed [20:0] dx5;
    reg signed [17:0] dt;
    wire logic signed [21:0] dx5p;
    wire logic signed [21:0] dot;
    always @(posedge CLK) begin
        if (EI) begin
            dx5 <= (DI + (DI << 2));
            dt <= DI;
            DO <= (dot >>> 4);
        end
    end
    assign dot = ((dx5p + (dt >>> 4)) + (dx5 >>> 12));
    assign dx5p = ((dx5 << 1) + (dx5 >>> 2));
endmodule

module USFFT64_2B_U_FFT1_UMI (
    input logic CLK,
    output reg[17:0] DO,
    input logic signed[17:0] DI,
    input logic EI
);
    reg signed [20:0] dx5;
    reg signed [17:0] dt;
    wire logic signed [21:0] dx5p;
    wire logic signed [21:0] dot;
    always @(posedge CLK) begin
        if (EI) begin
            dx5 <= (DI + (DI << 2));
            dt <= DI;
            DO <= (dot >>> 4);
        end
    end
    assign dot = ((dx5p + (dt >>> 4)) + (dx5 >>> 12));
    assign dx5p = ((dx5 << 1) + (dx5 >>> 2));
endmodule
module USFFT64_2B_U_NORM1 (
    input logic CLK,
    input logic ED,
    input logic START,
    input logic[18:0] DR,
    input logic[18:0] DI,
    input logic[1:0] SHIFT,
    output reg OVF,
    output reg RDY,
    output logic[17:0] DOR,
    output logic[17:0] DOI
);
    wire logic[18:0] diri;
    wire logic[18:0] diii;
    assign diri = (DR << SHIFT);
    assign diii = (DI << SHIFT);
    reg[17:0] dir;
    reg[17:0] dii;
    always @(posedge CLK) begin
        if (ED) begin
            dir <= diri[18:1];
            dii <= diii[18:1];
        end
    end
    always @(posedge CLK) begin
        if (ED) begin
            RDY <= START;
            if (START) begin
                OVF <= 0;
            end
            else begin
                case (SHIFT)
                    2'b1: begin
                        OVF <= ((DR[18] != DR[17]) || (DI[18] != DI[17]));
                    end
                    2'b10: begin
                        OVF <= ((((DR[18] != DR[17]) || (DI[18] != DI[17])) || (DR[18] != DR[16])) || (DI[18] != DI[16]));
                    end
                    2'b11: begin
                        OVF <= ((((DI[18] != DI[17]) || (DR[18] != DR[16])) || (DI[18] != DI[16])) || (DR[18] != DR[17]));
                    end
                endcase
            end
        end
    end
    assign DOR = dir;
    assign DOI = dii;
endmodule


module USFFT64_2B_U_MPU (
    input logic CLK,
    input logic RST,
    input logic ED,
    input logic START,
    input logic[17:0] DR,
    input logic[17:0] DI,
    output logic[17:0] DOR,
    output logic[17:0] DOI,
    output reg RDY
);
    reg[5:0] addrw;
    reg sd1;
    reg sd2;
    always @(posedge CLK) begin
        if (RST) begin
            addrw <= 0;
            sd1 <= 0;
            sd2 <= 0;
        end
        else if ((START && ED)) begin
            addrw[5:0] <= 0;
            sd1 <= START;
            sd2 <= 0;
        end
        else if (ED) begin
            addrw <= (addrw + 1);
            sd1 <= START;
            sd2 <= sd1;
            RDY <= sd2;
        end
    end
    wire logic signed[14:0] wr;
    wire logic signed[14:0] wi;
    USFFT64_2B_U_MPU_UROM UROM (
        .WI(wi),
        .WR(wr),
        .ADDR(addrw)
    );
    reg signed[17:0] drd;
    reg signed[17:0] did;
    reg signed[14:0] wrd;
    reg signed[14:0] wid;
    wire logic signed[32:0] drri;
    wire logic signed[32:0] drii;
    wire logic signed[32:0] diri;
    wire logic signed[32:0] diii;
    reg signed[18:0] drr;
    reg signed[18:0] dri;
    reg signed[18:0] dir;
    reg signed[18:0] dii;
    reg signed[18:0] dwr;
    reg signed[18:0] dwi;
    assign drri = (drd * wrd);
    assign diri = (did * wrd);
    assign drii = (drd * wid);
    assign diii = (did * wid);
    always @(posedge CLK) begin
        if (ED) begin
            drd <= DR;
            did <= DI;
            wrd <= wr;
            wid <= wi;
            drr <= drri[32:14];
            dri <= drii[32:14];
            dir <= diri[32:14];
            dii <= diii[32:14];
            dwr <= (drr - dii);
            dwi <= (dri + dir);
        end
    end
    assign DOR = dwr[18:1];
    assign DOI = dwi[18:1];
endmodule
module USFFT64_2B_U_MPU_UROM (
    output logic[14:0] WI,
    output logic[14:0] WR,
    input logic[5:0] ADDR
);
    reg[31:0] wf[0:63];
    integer i;
    always @(ADDR) begin
        for (i = 0; (i < 8); i = (i + 1)) begin
            wf[i] = 32'd2147418112;
        end
        for (i = 8; (i < 63); i = (i + 8)) begin
            wf[i] = 32'd2147418112;
        end
        wf[9] = 32'd2137191284;
        wf[10] = 32'd2106255111;
        wf[11] = 32'd2055068376;
        wf[12] = 32'd1984089860;
        wf[13] = 32'd1893974953;
        wf[14] = 32'd1785641187;
        wf[15] = 32'd1660071628;
        wf[17] = 32'd2106255111;
        wf[18] = 32'd1984089860;
        wf[19] = 32'd1785641187;
        wf[20] = 32'd1518511486;
        wf[21] = 32'd1193121170;
        wf[22] = 32'd821856702;
        wf[23] = 32'd419005046;
        wf[25] = 32'd2055068376;
        wf[26] = 32'd1785641187;
        wf[27] = 32'd1362402574;
        wf[28] = 32'd821856702;
        wf[29] = 32'd210534558;
        wf[30] = 32'd3876029046;
        wf[31] = 32'd3282669341;
        wf[33] = 32'd1984089860;
        wf[34] = 32'd1518511486;
        wf[35] = 32'd821856702;
        wf[36] = 32'd32769;
        wf[37] = 32'd3473181118;
        wf[38] = 32'd2776540542;
        wf[39] = 32'd2310983428;
        wf[41] = 32'd1893974953;
        wf[42] = 32'd1193121170;
        wf[43] = 32'd210534558;
        wf[44] = 32'd3473181118;
        wf[45] = 32'd2634985164;
        wf[46] = 32'd2188830471;
        wf[47] = 32'd2239964456;
        wf[49] = 32'd1785641187;
        wf[50] = 32'd821856702;
        wf[51] = 32'd3876029046;
        wf[52] = 32'd2776540542;
        wf[53] = 32'd2188830471;
        wf[54] = 32'd2310942972;
        wf[55] = 32'd3101911662;
        wf[57] = 32'd1660071628;
        wf[58] = 32'd419005046;
        wf[59] = 32'd3282669341;
        wf[60] = 32'd2310983428;
        wf[61] = 32'd2239964456;
        wf[62] = 32'd3101911662;
        wf[63] = 32'd210534242;
    end
    wire logic[31:0] reim;
    assign reim = wf[ADDR];
    assign WR = reim[31:17];
    assign WI = reim[15:1];
endmodule


module USFFT64_2B_U_BUF2 (
    input logic CLK,
    input logic RST,
    input logic ED,
    input logic START,
    input logic[17:0] DR,
    input logic[17:0] DI,
    output reg RDY,
    output logic[17:0] DOR,
    output logic[17:0] DOI
);
    wire logic odd;
    wire logic we;
    wire logic[5:0] addrw;
    wire logic[5:0] addrr;
    reg[6:0] addr;
    reg [6:0] ct2;
    always @(posedge CLK) begin
        if (RST) begin
            addr <= 6'b0;
            ct2 <= 7'b1000001;
            RDY <= 1'b0;
        end
        else if (START) begin
            addr <= 6'b0;
            ct2 <= 6'b0;
            RDY <= 1'b0;
        end
        else if (ED) begin
            RDY <= 1'b0;
            addr <= (addr + 1);
            if ((ct2 != 65)) begin
                ct2 <= (ct2 + 1);
            end
            if ((ct2 == 64)) begin
                RDY <= 1'b1;
            end
        end
    end
    assign addrw = addr[5:0];
    assign odd = addr[6];
    assign addrr = {addr[2:0], addr[5:3]};
    assign we = ED;
    USFFT64_2B_U_BUF2_URAM URAM (
        .CLK(CLK),
        .ED(ED),
        .WE(1'b1),
        .ODD(odd),
        .ADDRW(addrw),
        .ADDRR(addrr),
        .DR(DR),
        .DI(DI),
        .DOR(DOR),
        .DOI(DOI)
    );
endmodule
module USFFT64_2B_U_BUF2_URAM (
    input logic CLK,
    input logic ED,
    input logic WE,
    input logic ODD,
    input logic[5:0] ADDRW,
    input logic[5:0] ADDRR,
    input logic[17:0] DR,
    input logic[17:0] DI,
    output logic[17:0] DOR,
    output logic[17:0] DOI
);
    wire logic[6:0] addrr2 = {ODD, ADDRR};
    wire logic[6:0] addrw2 = {~(ODD), ADDRW};
    wire logic[35:0] di = {DR, DI};
    wire logic[35:0] doi;
    reg[35:0] ram[127:0];
    reg[6:0] read_addra;
    always @(posedge CLK) begin
        if (ED) begin
            begin
                ram[addrw2] <= di;
            end
            read_addra <= addrr2;
        end
    end
    assign doi = ram[read_addra];
    assign DOR = doi[35:18];
    assign DOI = doi[17:0];
endmodule


module USFFT64_2B_U_FFT2 (
    output logic[20:0] DOR,
    input logic[17:0] DII,
    input logic RST,
    input logic ED,
    input logic CLK,
    output logic[20:0] DOI,
    input logic START,
    input logic[17:0] DIR,
    output reg RDY
);
    reg[2:0] ct;
    reg[3:0] ctd;
    always @(posedge CLK) begin
        if (RST) begin
            ct <= 0;
            ctd <= 15;
            RDY <= 0;
        end
        else if (START) begin
            ct <= 0;
            ctd <= 0;
            RDY <= 0;
        end
        else if (ED) begin
            RDY <= 0;
            ct <= (ct + 1);
            if ((ctd != 4'b1111)) begin
                ctd <= (ctd + 1);
            end
            if ((ctd == 12)) begin
                RDY <= 1;
            end
        end
    end
    reg signed[17:0] dr;
    reg signed[17:0] d1r;
    reg signed[17:0] d2r;
    reg signed[17:0] d3r;
    reg signed[17:0] d4r;
    reg signed[17:0] di;
    reg signed[17:0] d1i;
    reg signed[17:0] d2i;
    reg signed[17:0] d3i;
    reg signed[17:0] d4i;
    always @(posedge CLK) begin
        if (ED) begin
            dr <= DIR;
            d1r <= dr;
            d2r <= d1r;
            d3r <= d2r;
            d4r <= d3r;
            di <= DII;
            d1i <= di;
            d2i <= d1i;
            d3i <= d2i;
            d4i <= d3i;
        end
    end
    reg signed[18:0] s1r;
    reg signed[18:0] s2r;
    reg signed[18:0] s1d1r;
    reg signed[18:0] s1d2r;
    reg signed[18:0] s1d3r;
    reg signed[18:0] s2d1r;
    reg signed[18:0] s2d2r;
    reg signed[18:0] s2d3r;
    reg signed[18:0] s1i;
    reg signed[18:0] s2i;
    reg signed[18:0] s1d1i;
    reg signed[18:0] s1d2i;
    reg signed[18:0] s1d3i;
    reg signed[18:0] s2d1i;
    reg signed[18:0] s2d2i;
    reg signed[18:0] s2d3i;
    always @(posedge CLK) begin
        if ((ED && ((((ct == 5) || (ct == 6)) || (ct == 7)) || (ct == 0)))) begin
            s1r <= (d4r + dr);
            s1i <= (d4i + di);
            s2r <= (d4r - dr);
            s2i <= (d4i - di);
        end
        if (ED) begin
            s1d1r <= s1r;
            s1d2r <= s1d1r;
            s1d1i <= s1i;
            s1d2i <= s1d1i;
            if (((ct == 0) || (ct == 1))) begin
                s1d3r <= s1d2r;
                s1d3i <= s1d2i;
            end
            if ((((ct == 6) || (ct == 7)) || (ct == 0))) begin
                s2d1r <= s2r;
                s2d2r <= s2d1r;
                s2d1i <= s2i;
                s2d2i <= s2d1i;
            end
            if ((ct == 0)) begin
                s2d3r <= s2d2r;
                s2d3i <= s2d2i;
            end
        end
    end
    reg signed[19:0] s3r;
    reg signed[19:0] s4r;
    reg signed[19:0] s3d1r;
    reg signed[19:0] s3d2r;
    reg signed[19:0] s3d3r;
    reg signed[19:0] s3i;
    reg signed[19:0] s4i;
    reg signed[19:0] s3d1i;
    reg signed[19:0] s3d2i;
    reg signed[19:0] s3d3i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                0: begin
                    s3r <= (s1d2r + s1r);
                    s3i <= (s1d2i + s1i);
                end
                1: begin
                    s3r <= (s1d3r - s1d1r);
                    s3i <= (s1d3i - s1d1i);
                end
                2: begin
                    s3r <= (s1d3r + s1r);
                    s3i <= (s1d3i + s1i);
                end
                3: begin
                    s3r <= (s1d3r - s1r);
                    s3i <= (s1d3i - s1i);
                end
            endcase
        end
        if (ED) begin
            if ((((ct == 1) || (ct == 2)) || (ct == 3))) begin
                s3d1r <= s3r;
                s3d1i <= s3i;
            end
            if (((ct == 2) || (ct == 3))) begin
                s3d2r <= s3d1r;
                s3d3r <= s3d2r;
                s3d2i <= s3d1i;
                s3d3i <= s3d2i;
            end
        end
    end
    always @(posedge CLK) begin
        if (ED) begin
            if ((ct == 1)) begin
                s4r <= (s2d2r + s2r);
                s4i <= (s2d2i + s2i);
            end
            else begin
                s4r <= (s2d2r - s2r);
                s4i <= (s2d2i - s2i);
            end
        end
    end
    wire logic em;
    assign em = ((((ct == 2) || (ct == 3)) || (ct == 4)) && ED);
    wire logic signed[19:0] m4m7r;
    wire logic signed[19:0] m4m7i;
    USFFT64_2B_U_FFT2_UMR UMR (
        .CLK(CLK),
        .DO(m4m7r),
        .DI(s4r),
        .EI(em)
    );
    USFFT64_2B_U_FFT2_UMI UMI (
        .CLK(CLK),
        .DO(m4m7i),
        .DI(s4i),
        .EI(em)
    );
    reg signed[19:0] sjr;
    reg signed[19:0] sji;
    reg signed [18:0] m6r;
    reg signed[19:0] m6i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                3: begin
                    sjr <= s2d1i;
                    sji <= (0 - s2d1r);
                end
                4: begin
                    sjr <= m4m7i;
                    sji <= (0 - m4m7r);
                end
                6: begin
                    sjr <= s3i;
                    sji <= (0 - s3r);
                end
            endcase
            if ((ct == 4)) begin
                m6r <= sjr;
                m6i <= sji;
            end
        end
    end
    reg signed[20:0] s5r;
    reg signed[20:0] s5d1r;
    reg signed[20:0] s5d2r;
    reg signed[20:0] q1r;
    reg signed[20:0] s5i;
    reg signed[20:0] s5d1i;
    reg signed[20:0] s5d2i;
    reg signed[20:0] q1i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                5: begin
                    q1r <= (s2d3r + m4m7r);
                    q1i <= (s2d3i + m4m7i);
                    s5r <= (m6r + sjr);
                    s5i <= (m6i + sji);
                end
                6: begin
                    s5r <= (m6r - sjr);
                    s5i <= (m6i - sji);
                    s5d1r <= s5r;
                    s5d1i <= s5i;
                end
                7: begin
                    s5r <= (s2d3r - m4m7r);
                    s5i <= (s2d3i - m4m7i);
                    s5d1r <= s5r;
                    s5d1i <= s5i;
                    s5d2r <= s5d1r;
                    s5d2i <= s5d1i;
                end
            endcase
        end
    end
    reg signed [20:0] s6r;
    reg signed [20:0] s6i;
    always @(posedge CLK) begin
        if (ED) begin
            case (ct)
                5: begin
                    s6r <= (s3d3r + s3d1r);
                    s6i <= (s3d3i + s3d1i);
                end
                6: begin
                    s6r <= (q1r + s5r);
                    s6i <= (q1i + s5i);
                end
                7: begin
                    s6r <= (s3d2r + sjr);
                    s6i <= (s3d2i + sji);
                end
                0: begin
                    s6r <= (s5r - s5d1r);
                    s6i <= (s5i - s5d1i);
                end
                1: begin
                    s6r <= (s3d3r - s3d1r);
                    s6i <= (s3d3i - s3d1i);
                end
                2: begin
                    s6r <= (s5r + s5d1r);
                    s6i <= (s5i + s5d1i);
                end
                3: begin
                    s6r <= (s3d3r - sjr);
                    s6i <= (s3d3i - sji);
                end
                4: begin
                    s6r <= (q1r - s5d2r);
                    s6i <= (q1i - s5d2i);
                end
            endcase
        end
    end
    assign DOR = s6r[20:0];
    assign DOI = s6i[20:0];
endmodule

module USFFT64_2B_U_FFT2_UMR (
    input logic CLK,
    output reg[19:0] DO,
    input logic signed[19:0] DI,
    input logic EI
);
    reg signed [22:0] dx5;
    reg signed [19:0] dt;
    wire logic signed [23:0] dx5p;
    wire logic signed [23:0] dot;
    always @(posedge CLK) begin
        if (EI) begin
            dx5 <= (DI + (DI << 2));
            dt <= DI;
            DO <= (dot >>> 4);
        end
    end
    assign dot = ((dx5p + (dt >>> 4)) + (dx5 >>> 12));
    assign dx5p = ((dx5 << 1) + (dx5 >>> 2));
endmodule

module USFFT64_2B_U_FFT2_UMI (
    input logic CLK,
    output reg[19:0] DO,
    input logic signed[19:0] DI,
    input logic EI
);
    reg signed [22:0] dx5;
    reg signed [19:0] dt;
    wire logic signed [23:0] dx5p;
    wire logic signed [23:0] dot;
    always @(posedge CLK) begin
        if (EI) begin
            dx5 <= (DI + (DI << 2));
            dt <= DI;
            DO <= (dot >>> 4);
        end
    end
    assign dot = ((dx5p + (dt >>> 4)) + (dx5 >>> 12));
    assign dx5p = ((dx5 << 1) + (dx5 >>> 2));
endmodule
module USFFT64_2B_U_NORM2 (
    input logic CLK,
    input logic ED,
    input logic START,
    input logic[20:0] DR,
    input logic[20:0] DI,
    input logic[1:0] SHIFT,
    output reg OVF,
    output reg RDY,
    output logic[19:0] DOR,
    output logic[19:0] DOI
);
    wire logic[19:0] diri;
    wire logic[19:0] diii;
    assign diri = (DR << SHIFT);
    assign diii = (DI << SHIFT);
    reg[18:0] dir;
    reg[18:0] dii;
    always @(posedge CLK) begin
        if (ED) begin
            dir <= {1'b0, diri[19:1]};
            dii <= {1'b0, diii[19:1]};
        end
    end
    always @(posedge CLK) begin
        if (ED) begin
            RDY <= START;
            if (START) begin
                OVF <= 0;
            end
            else begin
                case (SHIFT)
                    2'b1: begin
                        OVF <= ((DR[20] != DR[19]) || (DI[20] != DI[19]));
                    end
                    2'b10: begin
                        OVF <= ((((DR[20] != DR[19]) || (DI[20] != DI[19])) || (DR[20] != DR[18])) || (DI[20] != DI[18]));
                    end
                    2'b11: begin
                        OVF <= ((((DI[20] != DI[19]) || (DR[20] != DR[18])) || (DI[20] != DI[18])) || (DR[20] != DR[19]));
                    end
                endcase
            end
        end
    end
    assign DOR = dir;
    assign DOI = dii;
endmodule


module USFFT64_2B_Ubuf3 (
    input logic CLK,
    input logic RST,
    input logic ED,
    input logic START,
    input logic[18:0] DR,
    input logic[18:0] DI,
    output reg RDY,
    output logic[18:0] DOR,
    output logic[18:0] DOI
);
    wire logic odd;
    wire logic we;
    wire logic[5:0] addrw;
    wire logic[5:0] addrr;
    reg[6:0] addr;
    reg [6:0] ct2;
    always @(posedge CLK) begin
        if (RST) begin
            addr <= 6'b0;
            ct2 <= 7'b1000001;
            RDY <= 1'b0;
        end
        else if (START) begin
            addr <= 6'b0;
            ct2 <= 6'b0;
            RDY <= 1'b0;
        end
        else if (ED) begin
            RDY <= 1'b0;
            addr <= (addr + 1);
            if ((ct2 != 65)) begin
                ct2 <= (ct2 + 1);
            end
            if ((ct2 == 64)) begin
                RDY <= 1'b1;
            end
        end
    end
    assign addrw = addr[5:0];
    assign odd = addr[6];
    assign addrr = {addr[2:0], addr[5:3]};
    assign we = ED;
    USFFT64_2B_Ubuf3_URAM URAM (
        .CLK(CLK),
        .ED(ED),
        .WE(1'b1),
        .ODD(odd),
        .ADDRW(addrw),
        .ADDRR(addrr),
        .DR(DR),
        .DI(DI),
        .DOR(DOR),
        .DOI(DOI)
    );
endmodule
module USFFT64_2B_Ubuf3_URAM (
    input logic CLK,
    input logic ED,
    input logic WE,
    input logic ODD,
    input logic[5:0] ADDRW,
    input logic[5:0] ADDRR,
    input logic[18:0] DR,
    input logic[18:0] DI,
    output logic[18:0] DOR,
    output logic[18:0] DOI
);
    wire logic[6:0] addrr2 = {ODD, ADDRR};
    wire logic[6:0] addrw2 = {~(ODD), ADDRW};
    wire logic[37:0] di = {DR, DI};
    wire logic[37:0] doi;
    reg[37:0] ram[127:0];
    reg[6:0] read_addra;
    always @(posedge CLK) begin
        if (ED) begin
            begin
                ram[addrw2] <= di;
            end
            read_addra <= addrr2;
        end
    end
    assign doi = ram[read_addra];
    assign DOR = doi[37:19];
    assign DOI = doi[18:0];
endmodule
