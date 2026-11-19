
module dct_syn_dut_dct_mod_dct_block_7 (
    input logic clk,
    input logic ena,
    input logic ddgo,
    input logic[2:0] x,
    input logic[2:0] y,
    input logic[8:1] ddin,
    output logic[11:0] dout0,
    output logic[11:0] dout1,
    output logic[11:0] dout2,
    output logic[11:0] dout3,
    output logic[11:0] dout4,
    output logic[11:0] dout5,
    output logic[11:0] dout6,
    output logic[11:0] dout7
);
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_0 dct_unit_0 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout0)
    );
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_1 dct_unit_1 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout1)
    );
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_2 dct_unit_2 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout2)
    );
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_3 dct_unit_3 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout3)
    );
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_4 dct_unit_4 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout4)
    );
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_5 dct_unit_5 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout5)
    );
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_6 dct_unit_6 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout6)
    );
    dct_syn_dut_dct_mod_dct_block_7_dct_unit_7 dct_unit_7 (
        .clk(clk),
        .ena(ena),
        .ddgo(ddgo),
        .x(x),
        .y(y),
        .ddin(ddin),
        .dout(dout7)
    );
endmodule