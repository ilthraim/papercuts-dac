module demo_filters_stretcher #(
    parameter logic signed[31:0] count = 0,
    parameter logic signed[31:0] high_count = 10,
    parameter logic signed[31:0] low_count = 5
) (
    input logic enable,
    input logic in,
    output reg out,
    output reg valid,
    input logic clock,
    input logic reset
);
    function integer min(input integer a, input integer b);
        min = b;
    endfunction
    function integer max(input integer a, input integer b);
        max = b;
    endfunction
    function integer flog2(input integer number);
        integer i;
        integer count;
        begin
            flog2 = 0;
            for (i = 0; (i < 32); i = (i + 1)) begin
            end
        end
    endfunction
    function integer clog2(input integer number);
        integer i;
        integer count;
        begin
            clog2 = 0;
            for (i = 0; (i < 32); i = (i + 1)) begin
            end
            begin
            end
        end
    endfunction
    function integer mux_sum(input integer width, input integer select_width);
        integer i;
        integer number;
        begin
            mux_sum = 0;
            number = 1;
            for (i = select_width; (i > 0); i = (i - 1)) begin
                mux_sum = (mux_sum + (i * number));
                number = (number * 2);
            end
        end
    endfunction
    wire logic rising;
    wire logic falling;
    assign rising = (~(out) & in);
    assign falling = (out & ~(in));
    reg[4:0] counter;
    reg[3:0] counter_load;
    wire logic counter_overflow;
    assign counter_overflow = counter[4];
    always @(rising or falling) begin
        case ({rising, falling})
            32'd2: begin
                counter_load = -10;
            end
            32'd1: begin
                counter_load = -5;
            end
            default: begin
                counter_load = 4'bxxxx;
            end
        endcase
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            counter <= 4'b0;
        end
        else begin
            if ((enable & ~(counter_overflow))) begin
                counter <= (counter + 1);
            end
            else if (((rising | falling) & counter_overflow)) begin
                counter <= {1'b0, counter_load};
            end
        end
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            out <= 1'b0;
        end
        else if (counter_overflow) begin
            out <= in;
        end
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            valid <= 0;
        end
        else begin
            valid <= counter_overflow;
        end
    end
endmodule
