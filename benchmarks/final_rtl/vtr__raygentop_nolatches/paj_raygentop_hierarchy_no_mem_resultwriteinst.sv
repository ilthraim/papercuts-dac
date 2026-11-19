
module paj_raygentop_hierarchy_no_mem_resultwriteinst (
    input logic valid01,
    input logic valid10,
    input logic[15:0] id01a,
    input logic[15:0] id01b,
    input logic[15:0] id01c,
    input logic[15:0] id10a,
    input logic[15:0] id10b,
    input logic[15:0] id10c,
    input logic hit01a,
    input logic hit01b,
    input logic hit01c,
    input logic hit10a,
    input logic hit10b,
    input logic hit10c,
    input logic[7:0] u01a,
    input logic[7:0] u01b,
    input logic[7:0] u01c,
    input logic[7:0] v01a,
    input logic[7:0] v01b,
    input logic[7:0] v01c,
    input logic[7:0] u10a,
    input logic[7:0] u10b,
    input logic[7:0] u10c,
    input logic[7:0] v10a,
    input logic[7:0] v10b,
    input logic[7:0] v10c,
    input logic[17:0] addr,
    input logic as01,
    input logic as10,
    input logic[20:0] bkcolour,
    input logic[63:0] shadedata,
    output reg[15:0] triID,
    output reg wantshadedata,
    input logic shadedataready,
    input logic[20:0] texinfo,
    output logic[3:0] texaddr,
    output logic[17:0] texeladdr,
    input logic[63:0] texel,
    output reg wanttexel,
    input logic texelready,
    output reg[63:0] dataout,
    output logic[17:0] addrout,
    output logic write,
    input logic ack,
    input logic globalreset,
    input logic clk
);
    reg temp_write;
    reg[3:0] state;
    reg[3:0] next_state;
    reg pending01;
    reg pending10;
    reg process01;
    wire logic[17:0] addrout01;
    wire logic[17:0] addrout10;
    wire logic shiften01;
    wire logic shiften10;
    reg temp_shiften01;
    reg temp_shiften10;
    reg[20:0] shadedataa;
    reg[20:0] shadedatab;
    reg[20:0] shadedatac;
    wire logic hita;
    wire logic hitb;
    wire logic hitc;
    reg[2:0] selectuv;
    wire logic[6:0] blr;
    wire logic[6:0] blg;
    wire logic[6:0] blb;
    reg texmap;
    reg lmenable;
    wire logic[1:0] texelselect;
    wire logic[6:0] texelr;
    wire logic[6:0] texelg;
    wire logic[6:0] texelb;
    reg[20:0] texinfol;
    reg temp_pending01;
    reg temp_pending10;
    reg temp_texmap;
    reg[20:0] temp_texinfol;
    reg[20:0] temp_shadedataa;
    reg[20:0] temp_shadedatab;
    reg[20:0] temp_shadedatac;
    paj_raygentop_hierarchy_no_mem_resultwriteinst_col16to21inst col16to21inst (
        .dataline(texel),
        .texelselect(texelselect),
        .r(texelr),
        .g(texelg),
        .b(texelb)
    );
    paj_raygentop_hierarchy_no_mem_resultwriteinst_linearmapinst linearmapinst (
        .u(blb),
        .v(blg),
        .start(texinfol[17:0]),
        .addr(texeladdr),
        .texelselect(texelselect),
        .factor(texinfol[20:18]),
        .enable(lmenable),
        .clk(clk)
    );
    paj_raygentop_hierarchy_no_mem_resultwriteinst_bilinearimp bilinearimp (
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
        .selectuv(selectuv),
        .ru(shadedata[41:35]),
        .rv(shadedata[62:56]),
        .rw(shadedata[20:14]),
        .gu(shadedata[34:28]),
        .gv(shadedata[55:49]),
        .gw(shadedata[13:7]),
        .bu(shadedata[27:21]),
        .bv(shadedata[48:42]),
        .bw(shadedata[6:0]),
        .r(blr),
        .g(blg),
        .b(blb),
        .clk(clk)
    );
    paj_raygentop_hierarchy_no_mem_resultwriteinst_fifo3insta fifo3insta (
        .datain(addr),
        .writeen(as01),
        .dataout(addrout01),
        .shiften(shiften01),
        .globalreset(globalreset),
        .clk(clk)
    );
    paj_raygentop_hierarchy_no_mem_resultwriteinst_fifo3instb fifo3instb (
        .datain(addr),
        .writeen(as10),
        .dataout(addrout10),
        .shiften(shiften10),
        .globalreset(globalreset),
        .clk(clk)
    );
    assign hita = ((hit01a & process01) | (hit10a & ~(process01)));
    assign hitb = ((hit01b & process01) | (hit10b & ~(process01)));
    assign hitc = ((hit01c & process01) | (hit10c & ~(process01)));
    assign texaddr = shadedata[59:56];
    assign shiften01 = temp_shiften01;
    assign shiften10 = temp_shiften10;
    assign write = temp_write;
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            state <= 0;
            pending01 <= 1'b0;
            pending10 <= 1'b0;
            shadedataa <= 0;
            shadedatab <= 0;
            shadedatac <= 0;
            process01 <= 1'b0;
            texmap <= 1'b0;
            texinfol <= 0;
        end
        else begin
            state <= next_state;
            if ((state == 0)) begin
                process01 <= pending01;
            end
            pending01 <= temp_pending01;
            pending10 <= temp_pending10;
            texmap <= temp_texmap;
            texinfol <= temp_texinfol;
            shadedataa <= temp_shadedataa;
            shadedatab <= temp_shadedatab;
            shadedatac <= temp_shadedatac;
            dataout <= {1'b0, shadedataa, shadedatab, shadedatac};
        end
    end
    assign addrout = ( addrout10);
    always @* begin
        case (state)
            2: begin
                lmenable = 1'b0;
                wanttexel = 1'b0;
                wantshadedata = 1'b1;
                selectuv[2] = ~(process01);
                selectuv[1:0] = 2'b0;
                if ((process01 == 1'b1)) begin
                    triID = id01a;
                end
                else begin
                    triID = id10a;
                end
            end
            4: begin
                wantshadedata = 1'b0;
                lmenable = 1'b0;
                wanttexel = 1'b0;
                selectuv[2] = ~(process01);
                selectuv[1:0] = 2'b1;
                if ((process01 == 1'b1)) begin
                    triID = id01b;
                end
                else begin
                    triID = id10b;
                end
            end
            5: begin
                lmenable = 1'b0;
                wanttexel = 1'b0;
                wantshadedata = 1'b1;
                selectuv[2] = ~(process01);
                selectuv[1:0] = 2'b10;
                if ((process01 == 1'b1)) begin
                    triID = id01c;
                end
                else begin
                    triID = id10c;
                end
            end
            8: begin
                wantshadedata = 1'b0;
                triID = 0;
                wanttexel = 1'b0;
                selectuv[2] = ~(process01);
                selectuv[1:0] = 2'b0;
                lmenable = 1'b1;
            end
            9: begin
                wantshadedata = 1'b0;
                triID = 0;
                wanttexel = 1'b0;
                selectuv[2] = ~(process01);
                selectuv[1:0] = 2'b1;
                lmenable = 1'b1;
            end
            10: begin
                wantshadedata = 1'b0;
                triID = 0;
                wanttexel = 1'b0;
                selectuv[2] = ~(process01);
                selectuv[1:0] = 2'b10;
                lmenable = 1'b1;
            end
            11: begin
                wantshadedata = 1'b0;
                triID = 0;
                selectuv = 0;
                lmenable = 1'b0;
                wanttexel = 1'b1;
            end
            12: begin
                wantshadedata = 1'b0;
                triID = 0;
                selectuv = 0;
                lmenable = 1'b0;
                wanttexel = 1'b1;
            end
            13: begin
                wantshadedata = 1'b0;
                triID = 0;
                selectuv = 0;
                lmenable = 1'b0;
                wanttexel = 1'b1;
            end
            default: begin
                wantshadedata = 1'b0;
                triID = 0;
                selectuv = 0;
                lmenable = 1'b0;
                wanttexel = 1'b0;
            end
        endcase
    end
    always @* begin
        case (state)
            1: begin
                if (( (process01 == 1'b1))) begin
                    temp_pending01 = 1'b0;
                    temp_pending10 = pending10;
                end
                else if (((ack == 1'b1))) begin
                    temp_pending10 = 1'b0;
                    temp_pending01 = pending01;
                end
                else begin
                    temp_pending01 = pending01;
                    temp_pending10 = pending10;
                end
            end
            default: begin
                if ((valid01 == 1'b1)) begin
                    temp_pending01 = 1'b1;
                end
                else begin
                    temp_pending01 = pending01;
                end
                if ((valid10 == 1'b1)) begin
                    temp_pending10 = 1'b1;
                end
                else begin
                    temp_pending10 = pending10;
                end
            end
        endcase
    end
    always @* begin
        case (state)
            1: begin
                if (((process01 == 1'b1) & (ack == 1'b1))) begin
                    temp_shiften01 = 1'b1;
                    temp_shiften10 = 1'b1;
                end
                else begin
                    temp_shiften01 = 1'b0;
                    temp_shiften10 = 1'b0;
                end
                temp_write = 1'b1;
            end
            default: begin
                temp_shiften01 = 1'b0;
                temp_shiften10 = 1'b0;
                temp_write = 1'b0;
            end
        endcase
    end
    always @* begin
        case (state)
            2: begin
                if ((hita == 1'b1)) begin
                    temp_shadedataa = shadedata[20:0];
                    temp_texmap = (~(shadedata[63]));
                end
                else begin
                    temp_shadedataa = bkcolour;
                    temp_texmap = texmap;
                end
                temp_shadedatab = shadedatab;
                temp_shadedatac = shadedatac;
                temp_texinfol = texinfol;
            end
            3: begin
                temp_texinfol = texinfo;
                temp_shadedataa = shadedataa;
                temp_shadedatab = shadedatab;
                temp_shadedatac = shadedatac;
                temp_texmap = texmap;
            end
            4: begin
                if ((hitb == 1'b1)) begin
                    temp_shadedatab = shadedata[20:0];
                    temp_texmap = (~(shadedata[63]));
                end
                else begin
                    temp_shadedatab = bkcolour;
                    temp_texmap = texmap;
                end
                temp_shadedataa = shadedataa;
                temp_shadedatac = shadedatac;
                temp_texinfol = texinfol;
            end
            5: begin
                if ((hitc == 1'b1)) begin
                    temp_shadedatac = shadedata[20:0];
                    temp_texmap = (~(shadedata[63]));
                end
                else begin
                    temp_shadedatac = bkcolour;
                    temp_texmap = texmap;
                end
                temp_shadedataa = shadedataa;
                temp_shadedatab = shadedatab;
                temp_texinfol = texinfol;
            end
            6: begin
                temp_texinfol = texinfo;
                temp_shadedataa = shadedataa;
                temp_shadedatab = shadedatab;
                temp_shadedatac = shadedatac;
                temp_texmap = texmap;
            end
            7: begin
                temp_texinfol = texinfo;
                temp_shadedataa = shadedataa;
                temp_shadedatab = shadedatab;
                temp_shadedatac = shadedatac;
                temp_texmap = texmap;
            end
            9: begin
                temp_shadedatab[6:0] = blb;
                temp_shadedatab[13:7] = blg;
                temp_shadedatab[20:14] = blr;
                temp_shadedataa = shadedataa;
                temp_shadedatac = shadedatac;
                temp_texinfol = texinfol;
                temp_texmap = texmap;
            end
            10: begin
                temp_shadedatac[6:0] = blb;
                temp_shadedatac[13:7] = blg;
                temp_shadedatac[20:14] = blr;
                temp_shadedataa = shadedataa;
                temp_shadedatab = shadedatab;
                temp_texinfol = texinfol;
                temp_texmap = texmap;
            end
            12: begin
                temp_shadedatab[6:0] = texelb;
                temp_shadedatab[13:7] = texelg;
                temp_shadedatab[20:14] = texelr;
                temp_shadedataa = shadedataa;
                temp_shadedatac = shadedatac;
                temp_texinfol = texinfol;
                temp_texmap = texmap;
            end
            13: begin
                temp_shadedatac[6:0] = texelb;
                temp_shadedatac[13:7] = texelg;
                temp_shadedatac[20:14] = texelr;
                temp_shadedataa = shadedataa;
                temp_shadedatab = shadedatab;
                temp_texinfol = texinfol;
                temp_texmap = texmap;
            end
            default: begin
                temp_shadedataa = shadedataa;
                temp_shadedatab = shadedatab;
                temp_shadedatac = shadedatac;
                temp_texinfol = texinfol;
                temp_texmap = texmap;
            end
        endcase
    end
    always @* begin
        case (state)
            0: begin
                if (((pending01 == 1'b1) | (pending10 == 1'b1))) begin
                    next_state = 2;
                end
                else begin
                    next_state = 0;
                end
            end
            1: begin
                if ((ack == 1'b1)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 1;
                end
            end
            2: begin
                if ((shadedataready == 1'b1)) begin
                    if (((hita == 1'b1) & ((shadedata[63] == 1'b1) | (shadedata[63:62] == 2'b1)))) begin
                        next_state = 3;
                    end
                    else begin
                        next_state = 4;
                    end
                end
                else begin
                    next_state = 2;
                end
            end
            3: begin
                next_state = 8;
            end
            4: begin
                if ((shadedataready == 1'b1)) begin
                    if (((hitb == 1'b1) & ((shadedata[63] == 1'b1) | (shadedata[63:62] == 2'b1)))) begin
                        next_state = 6;
                    end
                    else begin
                        next_state = 5;
                    end
                end
                else begin
                    next_state = 4;
                end
            end
            5: begin
                if ((shadedataready == 1'b1)) begin
                    if (((hitc == 1'b1) & ((shadedata[63] == 1'b1) | (shadedata[63:62] == 2'b1)))) begin
                        next_state = 7;
                    end
                    else begin
                        next_state = 1;
                    end
                end
                else begin
                    next_state = 5;
                end
            end
            6: begin
                next_state = 9;
            end
            7: begin
                next_state = 10;
            end
            8: begin
                if ((texmap == 1'b1)) begin
                    next_state = 11;
                end
                else begin
                    next_state = 4;
                end
            end
            9: begin
                if ((texmap == 1'b1)) begin
                    next_state = 12;
                end
                else begin
                    next_state = 5;
                end
            end
            10: begin
                if ((texmap == 1'b1)) begin
                    next_state = 13;
                end
                else begin
                    next_state = 1;
                end
            end
            11: begin
                if ((texelready == 1'b1)) begin
                    next_state = 4;
                end
                else begin
                    next_state = 11;
                end
            end
            12: begin
                if ((texelready == 1'b1)) begin
                    next_state = 5;
                end
                else begin
                    next_state = 12;
                end
            end
            13: begin
                if ((texelready == 1'b1)) begin
                    next_state = 1;
                end
                else begin
                    next_state = 13;
                end
            end
            default: begin
                next_state = state;
            end
        endcase
    end
endmodule