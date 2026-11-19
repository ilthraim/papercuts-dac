
module paj_raygentop_hierarchy_no_mem_dir01delay (
    input logic datain,
    output logic dataout,
    input logic clk
);
    reg buff0;
    reg buff1;
    reg buff2;
    assign dataout = buff2;
    always @(posedge clk) begin
        buff0 <= datain;
        buff1 <= buff0;
        buff2 <= buff1;
    end
endmodule