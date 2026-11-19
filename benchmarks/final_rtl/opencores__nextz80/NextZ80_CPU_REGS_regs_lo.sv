
module NextZ80_CPU_REGS_regs_lo (
    output logic[7:0] DPO,
    output logic[7:0] SPO,
    input logic[3:0] A,
    input logic[7:0] D,
    input logic[3:0] DPRA,
    input logic WCLK,
    input logic WE
);
    reg[7:0] data[15:0];
    assign DPO = data[DPRA];
    assign SPO = data[A];
    always @(posedge WCLK) begin
        if (WE) begin
            data[A] <= D;
        end
    end
endmodule