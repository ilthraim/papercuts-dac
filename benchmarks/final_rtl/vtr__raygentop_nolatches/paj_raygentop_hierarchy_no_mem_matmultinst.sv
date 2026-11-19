
module paj_raygentop_hierarchy_no_mem_matmultinst (
    input logic[15:0] Ax,
    input logic[15:0] Ay,
    input logic[15:0] Az,
    input logic[15:0] m11,
    input logic[15:0] m12,
    input logic[15:0] m13,
    input logic[15:0] m21,
    input logic[15:0] m22,
    input logic[15:0] m23,
    input logic[15:0] m31,
    input logic[15:0] m32,
    input logic[15:0] m33,
    output reg[15:0] Cx,
    output reg[15:0] Cy,
    output reg[15:0] Cz,
    input logic clk
);
    reg [30:0] am11;
    reg [30:0] am12;
    reg [30:0] am13;
    reg [30:0] am21;
    reg [30:0] am22;
    reg [30:0] am23;
    reg [30:0] am31;
    reg [30:0] am32;
    reg [30:0] am33;
    always @(posedge clk) begin
        am11 <= (Ax * m11);
        am12 <= (Ay * m12);
        am13 <= (Az * m13);
        am21 <= (Ax * m21);
        am22 <= (Ay * m22);
        am23 <= (Az * m23);
        am31 <= (Ax * m31);
        am32 <= (Ay * m32);
        am33 <= (Az * m33);
        Cx <= ((am11[30:15] + am12[30:15]) + am13[30:15]);
        Cy <= ((am21[30:15] + am22[30:15]) + am23[30:15]);
        Cz <= ((am31[30:15] + am32[30:15]) + am33[30:15]);
    end
endmodule