module demo_filters_debouncer #(
    parameter logic signed[31:0] count = 0,
    parameter logic signed[31:0] high_count = 3,
    parameter logic signed[31:0] low_count = 2
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
    reg[1:0] in_reg;
    always @(posedge clock) begin
        in_reg <= {in_reg[0], in};
    end
    wire logic rising;
    wire logic falling;
    assign rising = (~(in_reg[1]) & in_reg[0]);
    assign falling = (in_reg[1] & ~(in_reg[0]));
    reg[2:0] counter;
    reg[1:0] counter_load;
    wire logic counter_overflow;
    assign counter_overflow = counter[2];
    always @(rising or falling) begin
        case ({rising, falling})
            32'd2: begin
                counter_load = -3;
            end
            32'd1: begin
                counter_load = -2;
            end
            default: begin
                counter_load = 2'bxx;
            end
        endcase
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            counter <= 2'b0;
        end
        else begin
            if ((rising | falling)) begin
                counter <= {1'b0, counter_load};
            end
            else if ((enable & ~(counter_overflow))) begin
                counter <= (counter + 1);
            end
        end
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            out <= 1'b0;
        end
        else begin
            if (counter_overflow) begin
                out <= in_reg[1];
            end
        end
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            valid <= 1'b0;
        end
        else begin
            valid <= counter_overflow;
        end
    end
endmodule
