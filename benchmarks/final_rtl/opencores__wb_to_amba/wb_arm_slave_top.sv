module wb_arm_slave_top #(
    parameter logic signed[31:0] AWIDTH = 32,
    parameter logic signed[31:0] DWIDTH = 32
) (
    input logic ahb_hclk,
    input logic ahb_hreset,
    output logic[31:0] ahb_hrdata,
    output logic[1:0] ahb_hresp,
    output logic ahb_hready_out,
    output logic[15:0] ahb_hsplit,
    input logic[31:0] ahb_hwdata,
    input logic[31:0] ahb_haddr,
    input logic[2:0] ahb_hsize,
    input logic ahb_hwrite,
    input logic[2:0] ahb_hburst,
    input logic[1:0] ahb_htrans,
    input logic[3:0] ahb_hprot,
    input logic ahb_hsel,
    input logic ahb_hready_in,
    input logic wb_ack_i,
    input logic wb_err_i,
    input logic wb_rty_i,
    input logic[31:0] wb_dat_i,
    output logic wb_cyc_o,
    output logic[31:0] wb_adr_o,
    output logic wb_stb_o,
    output logic wb_we_o,
    output logic[3:0] wb_sel_o,
    output logic[31:0] wb_dat_o,
    output logic wb_clk_o,
    output logic wb_rst_o
);
    wire logic ahb_data_phase;
    wire logic flop_en = ((ahb_hready_in & ahb_hsel) & ~(ahb_data_phase));
    reg[31:0] ahb_haddr_r;
    always @(posedge ahb_hclk) begin
        if (flop_en) begin
            ahb_haddr_r <= ahb_haddr;
        end
    end
    reg[1:0] ahb_htrans_r;
    always @(posedge ahb_hclk) begin
        if (flop_en) begin
            ahb_htrans_r <= ahb_htrans;
        end
    end
    reg ahb_hwrite_r;
    always @(posedge ahb_hclk) begin
        if (flop_en) begin
            ahb_hwrite_r <= ahb_hwrite;
        end
    end
    reg[2:0] ahb_hsize_r;
    always @(posedge ahb_hclk) begin
        if (flop_en) begin
            ahb_hsize_r <= ahb_hsize;
        end
    end
    wire logic fsm_error;
    wb_arm_slave_top_i_wb_arm_phase_fsm i_wb_arm_phase_fsm (
        .ahb_hclk(ahb_hclk),
        .ahb_hreset(ahb_hreset),
        .ahb_hsel(ahb_hsel),
        .ahb_hready_in(ahb_hready_in),
        .ahb_hready_out(ahb_hready_out),
        .ahb_htrans(ahb_htrans),
        .ahb_data_phase(ahb_data_phase),
        .fsm_error(fsm_error)
    );
    reg [0:0] enc_hresp;
    always @* begin
        casez ({ahb_htrans_r, 1'b0})
            3'bzz1: begin
                enc_hresp = 2'b1;
            end
            3'b11z: begin
                enc_hresp = 2'b1;
            end
            default: begin
                enc_hresp = 2'b0;
            end
        endcase
    end
    reg[3:0] enc_wb_sel;
    always @* begin
        casez ({ahb_hsize_r, ahb_haddr_r[1:0]})
            5'b10zz: begin
                enc_wb_sel = 4'b1111;
            end
            5'b10z: begin
                enc_wb_sel = 4'b11;
            end
            5'b11z: begin
                enc_wb_sel = 4'b1100;
            end
            5'b0: begin
                enc_wb_sel = 4'b1;
            end
            5'b1: begin
                enc_wb_sel = 4'b10;
            end
            5'b10: begin
                enc_wb_sel = 4'b100;
            end
            5'b11: begin
                enc_wb_sel = 4'b1000;
            end
            default: begin
                enc_wb_sel = 4'b0;
            end
        endcase
    end
    assign ahb_hresp = enc_hresp;
    assign ahb_hready_out = wb_ack_i;
    assign ahb_hsplit = 0;
    assign wb_sel_o = enc_wb_sel;
    assign wb_adr_o = ahb_haddr_r;
    assign ahb_hrdata = wb_dat_i;
    assign wb_we_o = (ahb_hwrite_r);
    assign wb_cyc_o = ahb_data_phase;
    assign wb_stb_o = ahb_data_phase;
    assign wb_dat_o = ahb_hwdata;
    assign wb_clk_o = ahb_hclk;
    assign wb_rst_o = ~(ahb_hreset);
endmodule