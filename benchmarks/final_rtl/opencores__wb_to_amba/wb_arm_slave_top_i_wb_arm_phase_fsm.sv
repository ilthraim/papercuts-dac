
module wb_arm_slave_top_i_wb_arm_phase_fsm (
    input logic ahb_hclk,
    input logic ahb_hreset,
    input logic ahb_hsel,
    input logic ahb_hready_in,
    input logic ahb_hready_out,
    input logic[1:0] ahb_htrans,
    output logic ahb_data_phase,
    output logic fsm_error
);
    wire logic do_transfer = ((ahb_htrans == 2'b10) | (ahb_htrans == 2'b11));
    reg [1:0] state;
    reg [1:0] next_state;
    always @(posedge ahb_hclk) begin
        if (~(ahb_hreset)) begin
            state <= 3'b1;
        end
        else begin
            state <= next_state;
        end
    end
    always @* begin
        case (state)
            3'b1: begin
                if (((ahb_hsel & ahb_hready_in) & do_transfer)) begin
                    next_state <= 3'b10;
                end
                else begin
                    next_state <= 3'b1;
                end
            end
            3'b10: begin
                if (ahb_hready_out) begin
                    next_state <= 3'b1;
                end
                else begin
                    next_state <= 3'b10;
                end
            end
            default: begin
                next_state <= 3'b100;
            end
        endcase
    end
    assign ahb_data_phase = (state == 3'b10);
    assign fsm_error = (state == 3'b100);
endmodule