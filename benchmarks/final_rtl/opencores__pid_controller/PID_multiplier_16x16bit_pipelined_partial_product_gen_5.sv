
module PID_multiplier_16x16bit_pipelined_partial_product_gen_5 (
    input logic[15:0] md,
    input logic zero,
    input logic double,
    input logic negation,
    output logic[16:0] pp
);
    wire logic[15:0] nmd;
    assign nmd = (negation ? ~(md) : md);
    wire logic[15:0] zmd;
    assign zmd = (zero ? 0 : nmd);
    assign pp = (double ? {~(zmd[15]), zmd[14:0], negation} : {~(zmd[15]), zmd[15:0]});
endmodule