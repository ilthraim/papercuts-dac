module simple_spi_top (
    input logic clk_i,
    input logic rst_i,
    input logic cyc_i,
    input logic stb_i,
    input logic[1:0] adr_i,
    input logic we_i,
    input logic[7:0] dat_i,
    output reg[7:0] dat_o,
    output reg ack_o,
    output reg inta_o,
    output reg sck_o,
    output logic mosi_o,
    input logic miso_i
);
    reg[7:0] spcr;
    wire logic[7:0] spsr;
    reg[7:0] sper;
    reg[7:0] treg;
    wire logic[7:0] rfdout;
    reg wfre;
    reg rfwe;
    wire logic rfre;
    wire logic rffull;
    wire logic rfempty;
    wire logic[7:0] wfdout;
    wire logic wfwe;
    wire logic wffull;
    wire logic wfempty;
    wire logic tirq;
    wire logic wfov;
    reg[1:0] state;
    reg[2:0] bcnt;
    wire logic wb_acc = (cyc_i & stb_i);
    wire logic wb_wr = (wb_acc & we_i);
    always @(posedge clk_i or negedge rst_i) begin
        if (~(rst_i)) begin
            spcr <= 8'd16;
            sper <= 8'd0;
        end
        else if (wb_wr) begin
            if ((adr_i == 2'b0)) begin
                spcr <= (dat_i | 8'd16);
            end
            if ((adr_i == 2'b11)) begin
                sper <= dat_i;
            end
        end
    end
    assign wfwe = (((wb_acc & (adr_i == 2'b10)) & ack_o) & we_i);
    assign wfov = (wfwe & wffull);
    always @(posedge clk_i) begin
        case (adr_i)  // synopsys full_case parallel_case
            2'b0: begin
                dat_o <= spcr;
            end
            2'b1: begin
                dat_o <= spsr;
            end
            2'b10: begin
                dat_o <= rfdout;
            end
            2'b11: begin
                dat_o <= sper;
            end
        endcase
    end
    assign rfre = (((wb_acc & (adr_i == 2'b10)) & ack_o) & ~(we_i));
    always @(posedge clk_i or negedge rst_i) begin
        if (~(rst_i)) begin
            ack_o <= 1'b0;
        end
        else begin
            ack_o <= (wb_acc & !(ack_o));
        end
    end
    wire logic spie = spcr[7];
    wire logic spe = spcr[6];
    wire logic cpol = spcr[3];
    wire logic cpha = spcr[2];
    wire logic[1:0] spr = spcr[1:0];
    wire logic[1:0] icnt = sper[7:6];
    wire logic[1:0] spre = sper[1:0];
    wire logic[3:0] espr = {spre, spr};
    wire logic wr_spsr = (wb_wr & (adr_i == 2'b1));
    reg spif;
    always @(posedge clk_i) begin
        if (~(spe)) begin
            spif <= 1'b0;
        end
        else begin
            spif <= ((tirq | spif) & ~((wr_spsr & dat_i[7])));
        end
    end
    reg wcol;
    always @(posedge clk_i) begin
        if (~(spe)) begin
            wcol <= 1'b0;
        end
        else begin
            wcol <= ((wfov | wcol) & ~((wr_spsr & dat_i[6])));
        end
    end
    assign spsr[7] = spif;
    assign spsr[6] = wcol;
    assign spsr[5:4] = 2'b0;
    assign spsr[3] = wffull;
    assign spsr[2] = wfempty;
    assign spsr[1] = rffull;
    assign spsr[0] = rfempty;
    always @(posedge clk_i) begin
        inta_o <= (spif & spie);
    end
    simple_spi_top_rfifo rfifo (
        .clk(clk_i),
        .rst(rst_i),
        .clr(~(spe)),
        .din(treg),
        .we(rfwe),
        .dout(rfdout),
        .re(rfre),
        .full(rffull),
        .empty(rfempty)
    );
    simple_spi_top_wfifo wfifo (
        .clk(clk_i),
        .rst(rst_i),
        .clr(~(spe)),
        .din(dat_i),
        .we(wfwe),
        .dout(wfdout),
        .re(wfre),
        .full(wffull),
        .empty(wfempty)
    );
    reg [10:0] clkcnt;
    always @(posedge clk_i) begin
        if (( (|(clkcnt) & |(state)))) begin
            clkcnt <= (clkcnt - 11'd1);
        end
        else begin
            case (espr)  // synopsys full_case parallel_case
                4'b0: begin
                    clkcnt <= 12'd0;
                end
                4'b1: begin
                    clkcnt <= 12'd1;
                end
                4'b10: begin
                    clkcnt <= 12'd3;
                end
                4'b11: begin
                    clkcnt <= 12'd15;
                end
                4'b100: begin
                    clkcnt <= 12'd31;
                end
                4'b101: begin
                    clkcnt <= 12'd7;
                end
                4'b110: begin
                    clkcnt <= 12'd63;
                end
                4'b111: begin
                    clkcnt <= 12'd127;
                end
                4'b1000: begin
                    clkcnt <= 12'd255;
                end
                4'b1001: begin
                    clkcnt <= 12'd511;
                end
                4'b1010: begin
                    clkcnt <= 12'd1023;
                end
                4'b1011: begin
                    clkcnt <= 12'd2047;
                end
            endcase
        end
    end
    wire logic ena = ~|(clkcnt);
    always @(posedge clk_i) begin
        if (~(spe)) begin
            state <= 2'b0;
            bcnt <= 3'b0;
            treg <= 8'd0;
            wfre <= 1'b0;
            rfwe <= 1'b0;
            sck_o <= 1'b0;
        end
        else begin
            wfre <= 1'b0;
            rfwe <= 1'b0;
            case (state)  // synopsys full_case parallel_case
                2'b0: begin
                    bcnt <= 3'b111;
                    treg <= wfdout;
                    sck_o <= cpol;
                    if (~(wfempty)) begin
                        wfre <= 1'b1;
                        state <= 2'b1;
                        if (cpha) begin
                            sck_o <= ~(sck_o);
                        end
                    end
                end
                2'b1: begin
                    if (ena) begin
                        sck_o <= ~(sck_o);
                        state <= 2'b11;
                    end
                end
                2'b11: begin
                    if (ena) begin
                        treg <= {treg[6:0], miso_i};
                        bcnt <= (bcnt - 3'b1);
                        if (~|(bcnt)) begin
                            state <= 2'b0;
                            sck_o <= cpol;
                            rfwe <= 1'b1;
                        end
                        else begin
                            state <= 2'b1;
                            sck_o <= ~(sck_o);
                        end
                    end
                end
                2'b10: begin
                    state <= 2'b0;
                end
            endcase
        end
    end
    assign mosi_o = treg[7];
    reg[1:0] tcnt;
    always @(posedge clk_i) begin
        if (~(spe)) begin
            tcnt <= icnt;
        end
        else if (rfwe) begin
            if (|(tcnt)) begin
                tcnt <= (tcnt - 2'b1);
            end
            else begin
                tcnt <= icnt;
            end
        end
    end
    assign tirq = (~|(tcnt) & rfwe);
endmodule