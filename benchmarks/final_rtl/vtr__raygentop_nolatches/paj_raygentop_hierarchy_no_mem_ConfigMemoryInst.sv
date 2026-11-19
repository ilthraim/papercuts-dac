
module paj_raygentop_hierarchy_no_mem_ConfigMemoryInst (
    input logic[3:0] CfgAddr,
    input logic[27:0] CfgData,
    input logic CfgData_Ready,
    output reg want_CfgData,
    output reg[27:0] origx,
    output reg[27:0] origy,
    output reg[27:0] origz,
    output reg[15:0] m11,
    output reg[15:0] m12,
    output reg[15:0] m13,
    output reg[15:0] m21,
    output reg[15:0] m22,
    output reg[15:0] m23,
    output reg[15:0] m31,
    output reg[15:0] m32,
    output reg[15:0] m33,
    output reg[20:0] bkcolour,
    output logic[20:0] texinfo,
    input logic globalreset,
    input logic clk
);
    reg state;
    reg next_state;
    wire logic we;
    paj_raygentop_hierarchy_no_mem_ConfigMemoryInst_spraminst spraminst (
        .we(we),
        .dataout(texinfo),
        .datain(CfgData[20:0]),
        .clk(clk)
    );
    assign we = (((CfgData_Ready == 1'b1) & (CfgAddr == 4'b1110)) ? 1'b1 : 1'b0);
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            state <= 0;
            origx <= 0;
            origy <= 0;
            origz <= 0;
            m11 <= 1;
            m12 <= 0;
            m13 <= 0;
            m21 <= 0;
            m22 <= 1;
            m23 <= 0;
            m31 <= 0;
            m32 <= 0;
            m33 <= 1;
            bkcolour <= 0;
        end
        else begin
            state <= next_state;
            if (CfgData_Ready) begin
                if ((CfgAddr == 4'b1)) begin
                    origx <= CfgData;
                end
                if ((CfgAddr == 4'b10)) begin
                    origy <= CfgData;
                end
                if ((CfgAddr == 4'b11)) begin
                    origz <= CfgData;
                end
                if ((CfgAddr == 4'b100)) begin
                    m11 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b101)) begin
                    m12 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b110)) begin
                    m13 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b111)) begin
                    m21 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b1000)) begin
                    m22 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b1001)) begin
                    m23 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b1010)) begin
                    m31 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b1011)) begin
                    m32 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b1100)) begin
                    m33 <= CfgData[15:0];
                end
                if ((CfgAddr == 4'b1101)) begin
                    bkcolour <= CfgData[20:0];
                end
            end
        end
    end
    always @* begin
        case (state)
            0: begin
                want_CfgData = 1'b1;
                if ((CfgData_Ready == 1'b1)) begin
                    next_state = 1;
                end
                else begin
                    next_state = 0;
                end
            end
            1: begin
                want_CfgData = 1'b0;
                if ((CfgData_Ready == 1'b0)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 1;
                end
            end
        endcase
    end
endmodule