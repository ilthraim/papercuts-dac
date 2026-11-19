module memset (
    input logic clk,
    input logic reset,
    input logic start,
    output reg finish,
    output reg[31:0] return_val,
    input logic[31:0] m,
    input logic[31:0] c,
    input logic[31:0] n,
    output reg memory_controller_write_enable,
    output reg[31:0] memory_controller_address,
    output reg[31:0] memory_controller_in,
    output logic[31:0] memory_controller_out
);
    reg[3:0] cur_state;
    memset_memtroll memtroll (
        .clk(clk),
        .memory_controller_address(memory_controller_address),
        .memory_controller_write_enable(memory_controller_write_enable),
        .memory_controller_in(memory_controller_in),
        .memory_controller_out(memory_controller_out)
    );
    reg [0:0] indvar;
    reg var1;
    reg[31:0] tmp;
    reg [0:0] tmp8;
    reg var2;
    reg [0:0] scevgep;
    reg [0:0] s_07;
    reg [0:0] indvar_next;
    reg exitcond;
    always @(posedge clk) begin
        if (reset) begin
            cur_state <= 4'b0;
        end
        else begin
            case (cur_state)
                4'b0: begin
                    finish <= 1'b0;
                    if ((start == 1'b1)) begin
                        cur_state <= 4'b1;
                    end
                    else begin
                        cur_state <= 4'b0;
                    end
                end
                4'b1: begin
                    cur_state <= 4'b10;
                end
                4'b10: begin
                    var1 <= 1'b0;
                    cur_state <= 4'b11;
                end
                4'b11: begin begin
                        cur_state <= 4'b100;
                    end
                end
                4'b100: begin
                    cur_state <= 4'b101;
                end
                4'b101: begin
                    cur_state <= 4'b110;
                end
                4'b110: begin
                    var2 <= |(n[31:4]);
                    cur_state <= 4'b111;
                end
                4'b111: begin
                    if (|(var2)) begin
                        cur_state <= 4'b1110;
                    end
                    else begin
                        cur_state <= 4'b1000;
                    end
                end
                4'b1000: begin
                    tmp <= n;
                    indvar <= 32'd0;
                    cur_state <= 4'b1001;
                end
                4'b1001: begin
                    cur_state <= 4'b1010;
                end
                4'b1010: begin
                    tmp8 <= indvar;
                    indvar_next <= indvar;
                    cur_state <= 4'b1011;
                end
                4'b1011: begin
                    scevgep <= ( tmp8);
                    exitcond <= (indvar_next == tmp);
                    cur_state <= 4'b1100;
                end
                4'b1100: begin
                    s_07 <= scevgep;
                    cur_state <= 4'b1101;
                end
                4'b1101: begin
                    if (exitcond) begin
                        cur_state <= 4'b1110;
                    end
                    else begin
                        indvar <= indvar_next;
                        cur_state <= 4'b1001;
                    end
                end
                4'b1110: begin
                    return_val <= m;
                    finish <= 1'b1;
                    cur_state <= 4'b0;
                end
            endcase
        end
    end
    always @* begin
        if ((cur_state == 4'b1101)) begin
            memory_controller_address = s_07;
            memory_controller_write_enable = 1'b1;
            memory_controller_in = c;
        end
        else begin
            memory_controller_address = 32'd0;
            memory_controller_write_enable = 1'b0;
            memory_controller_in = 32'd0;
        end
    end
endmodule