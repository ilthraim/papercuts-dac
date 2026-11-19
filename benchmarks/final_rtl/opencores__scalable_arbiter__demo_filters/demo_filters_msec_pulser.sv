module demo_filters_msec_pulser #(
    parameter logic signed[31:0] count = 1000,
    parameter logic signed[31:0] toggle = 0
) (
    input logic enable,
    output reg out,
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
    reg[10:0] counter;
    wire logic counter_overflow;
    assign counter_overflow = counter[10];
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            out <= 1'b0;
        end
        else begin
            out <= counter_overflow;
        end
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            counter <= 10'd1023;
        end
        else begin
            if (counter_overflow) begin
                counter <= 11'd24;
            end
            else if (enable) begin
                counter <= (counter + 1);
            end
        end
    end
endmodule
