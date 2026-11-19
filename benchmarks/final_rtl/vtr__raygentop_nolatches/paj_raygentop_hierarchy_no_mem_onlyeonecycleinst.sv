module paj_raygentop_hierarchy_no_mem_onlyeonecycleinst (
    input logic trigger,
    output reg output_xhdl0,
    input logic globalreset,
    input logic clk
);
    reg[1:0] state;
    reg[1:0] next_state;
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            state <= 0;
        end
        else begin
            state <= next_state;
        end
    end
    always @* begin
        case (state)
            0: begin
                output_xhdl0 = 1'b0;
                if ((trigger == 1'b1)) begin
                    next_state = 1;
                end
                else begin
                    next_state = 0;
                end
            end
            1: begin
                output_xhdl0 = 1'b1;
                begin
                    next_state = 2;
                end
            end
            2: begin
                output_xhdl0 = 1'b0;
                if ((trigger == 1'b0)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 2;
                end
            end
            default: begin
                output_xhdl0 = 1'b0;
                next_state = state;
            end
        endcase
    end
endmodule
