
module paj_raygentop_hierarchy_no_mem_sramcont (
    output reg want_addr,
    input logic addr_ready,
    input logic[17:0] addrin,
    output reg want_data,
    input logic data_ready,
    input logic[63:0] datain,
    input logic want_read,
    output reg read_ready,
    output logic[63:0] dataout,
    output reg dirReady,
    input logic wantDir,
    output reg[47:0] sramdatal,
    output logic[14:0] addr,
    input logic wantwriteback,
    output reg writebackack,
    input logic[63:0] writebackdata,
    input logic[17:0] writebackaddr,
    output reg[63:0] fbdata,
    input logic fbnextscanline,
    output reg fbdatavalid,
    input logic fbpage,
    output logic[63:0] shadedata,
    input logic[15:0] triID,
    input logic wantshadedata,
    output reg shadedataready,
    input logic[17:0] texeladdr,
    output logic[63:0] texel,
    input logic wanttexel,
    output reg texelready,
    input logic[63:0] tm3_sram_data_in,
    output logic[63:0] tm3_sram_data_out,
    output reg[18:0] tm3_sram_addr,
    output reg[7:0] tm3_sram_we,
    output reg[1:0] tm3_sram_oe,
    output reg tm3_sram_adsp,
    input logic globalreset,
    input logic clk
);
    reg[63:0] tm3_sram_data_xhdl0;
    reg[3:0] state;
    reg[3:0] next_state;
    reg[17:0] waddress;
    reg[14:0] faddress;
    reg[6:0] fcount;
    reg fbdatavalidl;
    reg[17:0] temp_waddress;
    reg[14:0] temp_faddress;
    reg[6:0] temp_fcount;
    reg temp_fbdatavalidl;
    reg temp_texelready;
    reg temp_shadedataready;
    assign tm3_sram_data_out = tm3_sram_data_xhdl0;
    assign dataout = tm3_sram_data_in;
    assign addr = tm3_sram_data_in[62:48];
    assign shadedata = tm3_sram_data_in;
    assign texel = tm3_sram_data_in;
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            state <= 0;
            waddress <= 0;
            faddress <= 0;
            fcount <= 7'b1101011;
            fbdatavalid <= 1'b0;
            fbdatavalidl <= 1'b0;
            shadedataready <= 1'b0;
            texelready <= 1'b0;
            sramdatal <= 0;
            fbdata <= 0;
        end
        else begin
            state <= next_state;
            sramdatal <= tm3_sram_data_in[47:0];
            fbdata <= tm3_sram_data_in;
            fbdatavalid <= fbdatavalidl;
            fbdatavalidl <= temp_fbdatavalidl;
            texelready <= temp_texelready;
            shadedataready <= temp_shadedataready;
            fcount <= temp_fcount;
            faddress <= temp_faddress;
            waddress <= temp_waddress;
        end
    end
    always @* begin
        case (state)
            0: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_fbdatavalidl = 1'b0;
                temp_shadedataready = 1'b0;
                temp_texelready = 1'b0;
                if ((addr_ready == 1'b1)) begin
                    temp_waddress = addrin;
                end
                else begin
                    temp_waddress = waddress;
                end
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            1: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b0;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_fbdatavalidl = fbdatavalidl;
                temp_shadedataready = shadedataready;
                temp_texelready = texelready;
                temp_waddress = waddress;
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            2: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b0;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_fbdatavalidl = 1'b0;
                temp_shadedataready = 1'b0;
                temp_texelready = 1'b0;
                if ((want_read == 1'b0)) begin
                    temp_waddress = (waddress + 1);
                end
                else begin
                    temp_waddress = waddress;
                end
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            3: begin
                tm3_sram_we = 8'd0;
                tm3_sram_oe = 2'b11;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = datain;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b1;
                want_data = 1'b0;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_fbdatavalidl = 1'b0;
                temp_shadedataready = 1'b0;
                temp_texelready = 1'b0;
                temp_waddress = (waddress + 1);
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            4: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b1;
                want_data = 1'b0;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_fbdatavalidl = fbdatavalidl;
                temp_shadedataready = shadedataready;
                temp_texelready = texelready;
                temp_waddress = waddress;
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            5: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b1;
                writebackack = 1'b0;
                temp_fbdatavalidl = 1'b0;
                temp_shadedataready = 1'b0;
                temp_texelready = 1'b0;
                if ((wantDir == 1'b0)) begin
                    temp_waddress = (waddress + 1);
                end
                else begin
                    temp_waddress = waddress;
                end
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            6: begin
                tm3_sram_we = 8'd0;
                tm3_sram_oe = 2'b11;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = writebackdata;
                tm3_sram_addr = {1'b0, writebackaddr};
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b1;
                temp_fbdatavalidl = fbdatavalidl;
                temp_shadedataready = shadedataready;
                temp_texelready = texelready;
                temp_waddress = waddress;
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            7: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {3'b11, fbpage, faddress};
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_shadedataready = 1'b0;
                temp_texelready = 1'b0;
                temp_fbdatavalidl = 1'b1;
                temp_waddress = waddress; begin
                    temp_faddress = (faddress + 1);
                    temp_fcount = (fcount - 1);
                end
            end
            8: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_fbdatavalidl = 1'b0;
                temp_shadedataready = 1'b0;
                temp_texelready = 1'b0;
                temp_waddress = waddress;
                temp_fcount = 7'b1101011;
                if ((faddress == 25680)) begin
                    temp_faddress = 0;
                end
                else begin
                    temp_faddress = faddress;
                end
            end
            9: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                tm3_sram_addr = {3'b10, triID};
                temp_fbdatavalidl = 1'b0;
                temp_texelready = 1'b0;
                temp_shadedataready = 1'b1;
                temp_waddress = waddress;
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            10: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                tm3_sram_addr = {1'b0, texeladdr};
                temp_fbdatavalidl = 1'b0;
                temp_shadedataready = 1'b0;
                temp_texelready = 1'b1;
                temp_waddress = waddress;
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
            default: begin
                tm3_sram_we = 8'd255;
                tm3_sram_oe = 2'b1;
                tm3_sram_adsp = 1'b0;
                tm3_sram_data_xhdl0 = 0;
                tm3_sram_addr = {1'b0, waddress};
                want_addr = 1'b1;
                want_data = 1'b1;
                read_ready = 1'b1;
                dirReady = 1'b0;
                writebackack = 1'b0;
                temp_fbdatavalidl = fbdatavalidl;
                temp_shadedataready = shadedataready;
                temp_texelready = texelready;
                temp_waddress = waddress;
                temp_faddress = faddress;
                temp_fcount = fcount;
            end
        endcase
    end
    always @* begin
        case (state)
            0: begin
                if ((addr_ready == 1'b1)) begin
                    next_state = 1;
                end
                else if ((want_read == 1'b1)) begin
                    next_state = 2;
                end
                else if ((data_ready == 1'b1)) begin
                    next_state = 3;
                end
                else if ((wantDir == 1'b1)) begin
                    next_state = 5;
                end
                else if ((wantwriteback == 1'b1)) begin
                    next_state = 6;
                end
                else if ((wantshadedata == 1'b1)) begin
                    next_state = 9;
                end
                else if ((wanttexel == 1'b1)) begin
                    next_state = 10;
                end
                else if ((fcount != 0)) begin
                    next_state = 7;
                end
                else if ((fbnextscanline == 1'b1)) begin
                    next_state = 8;
                end
                else begin
                    next_state = 0;
                end
            end
            1: begin
                if ((addr_ready == 1'b0)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 1;
                end
            end
            2: begin
                if ((want_read == 1'b0)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 2;
                end
            end
            3: begin
                next_state = 4;
            end
            4: begin
                if ((data_ready == 1'b0)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 4;
                end
            end
            5: begin
                if ((wantDir == 1'b0)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 5;
                end
            end
            6: begin
                next_state = 0;
            end
            7: begin
                if (((((((fcount == 1) | (addr_ready == 1'b1)) | (want_read == 1'b1)) | (data_ready == 1'b1)) | (wantDir == 1'b1)) | (wantwriteback == 1'b1))) begin
                    next_state = 0;
                end
                else begin
                    next_state = 7;
                end
            end
            8: begin
                next_state = 7;
            end
            9: begin
                next_state = 0;
            end
            10: begin
                next_state = 0;
            end
            default: begin
                next_state = state;
            end
        endcase
    end
endmodule