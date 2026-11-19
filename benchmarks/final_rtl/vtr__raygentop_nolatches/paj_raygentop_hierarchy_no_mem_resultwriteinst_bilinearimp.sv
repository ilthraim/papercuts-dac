
module paj_raygentop_hierarchy_no_mem_resultwriteinst_bilinearimp (
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
    input logic[2:0] selectuv,
    input logic[6:0] ru,
    input logic[6:0] rv,
    input logic[6:0] rw,
    input logic[6:0] gu,
    input logic[6:0] gv,
    input logic[6:0] gw,
    input logic[6:0] bu,
    input logic[6:0] bv,
    input logic[6:0] bw,
    output logic[6:0] r,
    output logic[6:0] g,
    output logic[6:0] b,
    input logic clk
);
    reg [6:0] u;
    reg [6:0] v;
    reg [6:0] ul;
    reg [6:0] vl;
    reg [6:0] wl;
    reg [6:0] i1b;
    reg [6:0] i2b;
    reg [6:0] i3b;
    reg [6:0] i1g;
    reg [6:0] i2g;
    reg [6:0] i3g;
    reg [6:0] i1r;
    reg [6:0] i2r;
    reg [6:0] i3r;
    reg[6:0] rul;
    reg[6:0] rvl;
    reg[6:0] rwl;
    reg[6:0] gul;
    reg[6:0] gvl;
    reg[6:0] gwl;
    reg[6:0] bul;
    reg[6:0] bvl;
    reg[6:0] bwl;
    always @* begin
        case (selectuv)
            3'b0: begin
                u = u01a;
                v = v01a;
            end
            3'b1: begin
                u = u01b;
                v = v01b;
            end
            3'b10: begin
                u = u01c;
                v = v01c;
            end
            3'b100: begin
                u = u10a;
                v = v10a;
            end
            3'b101: begin
                u = u10b;
                v = v10b;
            end
            3'b110: begin
                u = u10c;
                v = v10c;
            end
            default: begin
                u = 0;
                v = 0;
            end
        endcase
    end
    always @(posedge clk) begin
        wl <= ((8'd255 - u) - v);
        ul <= u;
        vl <= v;
        rul <= ru;
        rvl <= rv;
        rwl <= rw;
        gul <= gu;
        gvl <= gv;
        gwl <= gw;
        bul <= bu;
        bvl <= bv;
        bwl <= bw;
        i1r <= (ul * rul);
        i2r <= (vl * rvl);
        i3r <= (wl * rwl);
        i1g <= (ul * gul);
        i2g <= (vl * gvl);
        i3g <= (wl * gwl);
        i1b <= (ul * bul);
        i2b <= (vl * bvl);
        i3b <= (wl * bwl);
    end
    assign r = ((i1r + i2r) + i3r);
    assign g = ((i1g + i2g) + i3g);
    assign b = ((i1b + i2b) + i3b);
endmodule