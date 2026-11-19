module i2c_master_top (
    input logic wb_clk_i,
    input logic wb_rst_i,
    input logic arst_i,
    input logic[2:0] wb_adr_i,
    input logic[7:0] wb_dat_i,
    output reg[7:0] wb_dat_o,
    input logic wb_we_i,
    input logic wb_stb_i,
    input logic wb_cyc_i,
    output reg wb_ack_o,
    output reg wb_inta_o,
    input logic scl_pad_i,
    output logic scl_pad_o,
    output logic scl_padoen_o,
    input logic sda_pad_i,
    output logic sda_pad_o,
    output logic sda_padoen_o
);
    reg[15:0] prer;
    reg[7:0] ctr;
    reg[7:0] txr;
    wire logic[7:0] rxr;
    reg[7:0] cr;
    wire logic[7:0] sr;
    wire logic done;
    wire logic core_en;
    wire logic ien;
    wire logic irxack;
    reg rxack;
    reg tip;
    reg irq_flag;
    wire logic i2c_busy;
    wire logic i2c_al;
    reg al;
    wire logic rst_i = (arst_i);
    wire logic wb_wacc = ((wb_cyc_i & wb_stb_i) & wb_we_i);
    always @(posedge wb_clk_i) begin
        wb_ack_o <= ((wb_cyc_i & wb_stb_i) & ~(wb_ack_o));
    end
    always @(posedge wb_clk_i) begin
        case (wb_adr_i)  // synopsys parallel_case
            3'b0: begin
                wb_dat_o <= prer[7:0];
            end
            3'b1: begin
                wb_dat_o <= prer[15:8];
            end
            3'b10: begin
                wb_dat_o <= ctr;
            end
            3'b11: begin
                wb_dat_o <= rxr;
            end
            3'b100: begin
                wb_dat_o <= sr;
            end
            3'b101: begin
                wb_dat_o <= txr;
            end
            3'b110: begin
                wb_dat_o <= cr;
            end
            3'b111: begin
                wb_dat_o <= 0;
            end
        endcase
    end
    always @(posedge wb_clk_i or negedge rst_i) begin
        if (!(rst_i)) begin
            prer <= 16'd65535;
            ctr <= 8'd0;
            txr <= 8'd0;
        end
        else if (wb_wacc) begin
            case (wb_adr_i)  // synopsys parallel_case
                3'b0: begin
                    prer[7:0] <= wb_dat_i;
                end
                3'b1: begin
                    prer[15:8] <= wb_dat_i;
                end
                3'b10: begin
                    ctr <= wb_dat_i;
                end
                3'b11: begin
                    txr <= wb_dat_i;
                end
                default: begin
                    ;
                end
            endcase
        end
    end
    always @(posedge wb_clk_i or negedge rst_i) begin
        if (!(rst_i)) begin
            cr <= 8'd0;
        end
        else if (wb_wacc) begin
            if ((core_en & (wb_adr_i == 3'b100))) begin
                cr <= wb_dat_i;
            end
        end
        else begin
            if ((done | i2c_al)) begin
                cr[7:4] <= 4'b0;
            end
            cr[2:1] <= 2'b0;
            cr[0] <= 1'b0;
        end
    end
    wire logic sta = cr[7];
    wire logic sto = cr[6];
    wire logic rd = cr[5];
    wire logic wr = cr[4];
    wire logic ack = cr[3];
    wire logic iack = cr[0];
    assign core_en = ctr[7];
    assign ien = ctr[6];
    i2c_master_top_byte_controller byte_controller (
        .clk(wb_clk_i),
        .rst(wb_rst_i),
        .nReset(rst_i),
        .ena(core_en),
        .clk_cnt(prer),
        .start(sta),
        .stop(sto),
        .read(rd),
        .write(wr),
        .ack_in(ack),
        .din(txr),
        .cmd_ack(done),
        .ack_out(irxack),
        .dout(rxr),
        .i2c_busy(i2c_busy),
        .i2c_al(i2c_al),
        .scl_i(scl_pad_i),
        .scl_o(scl_pad_o),
        .scl_oen(scl_padoen_o),
        .sda_i(sda_pad_i),
        .sda_o(sda_pad_o),
        .sda_oen(sda_padoen_o)
    );
    always @(posedge wb_clk_i or negedge rst_i) begin
        if (!(rst_i)) begin
            al <= 1'b0;
            rxack <= 1'b0;
            tip <= 1'b0;
            irq_flag <= 1'b0;
        end
        else begin
            al <= (i2c_al | (al & ~(sta)));
            rxack <= irxack;
            tip <= (rd | wr);
            irq_flag <= (((done | i2c_al) | irq_flag) & ~(iack));
        end
    end
    always @(posedge wb_clk_i or negedge rst_i) begin
        if (!(rst_i)) begin
            wb_inta_o <= 1'b0;
        end
        else begin
            wb_inta_o <= (irq_flag && ien);
        end
    end
    assign sr[7] = rxack;
    assign sr[6] = i2c_busy;
    assign sr[5] = al;
    assign sr[4:2] = 3'b0;
    assign sr[1] = tip;
    assign sr[0] = irq_flag;
endmodule