
module paj_raygentop_hierarchy_no_mem_resultwriteinst_col16to21inst (
    input logic[63:0] dataline,
    input logic[1:0] texelselect,
    output logic[6:0] r,
    output logic[6:0] g,
    output logic[6:0] b
);
    reg[15:0] col16;
    always @* begin
        case (texelselect)
            2'b0: begin
                col16 = dataline[15:0];
            end
            2'b1: begin
                col16 = dataline[31:16];
            end
            2'b10: begin
                col16 = dataline[47:32];
            end
            2'b11: begin
                col16 = dataline[63:48];
            end
        endcase
    end
    assign r = {col16[15:10], 1'b0};
    assign g = {col16[9:5], 2'b0};
    assign b = {col16[4:0], 2'b0};
endmodule