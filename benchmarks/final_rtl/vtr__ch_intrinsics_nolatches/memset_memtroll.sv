
module memset_memtroll (
    input logic clk,
    input logic[31:0] memory_controller_address,
    input logic memory_controller_write_enable,
    input logic[31:0] memory_controller_in,
    output reg[31:0] memory_controller_out
);
    reg [0:0] str_address;
    reg str_write_enable;
    reg[7:0] str_in;
    wire logic[7:0] str_out;
    memset_memtroll__str #(
        .ADDR_WIDTH(5),
        .DATA_WIDTH(8)
    ) _str (
        .clk(clk),
        .addr({4'b0, str_address}),
        .data(str_in),
        .we(str_write_enable),
        .out(str_out)
    );
    wire logic tag;
    assign tag = (|(memory_controller_address));
    reg[0:0] prevTag;
    always @(posedge clk) begin
        prevTag <= 1'b0;
    end
    always @* begin begin
            str_address = memory_controller_address[4:0];
            str_write_enable = memory_controller_write_enable;
            str_in[7:0] = memory_controller_in[7:0];
        end
    end
    always @* begin begin
            memory_controller_out = str_out;
        end
    end
endmodule