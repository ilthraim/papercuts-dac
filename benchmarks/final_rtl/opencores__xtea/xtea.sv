module xtea (
    input logic clock,
    input logic reset,
    input logic mode,
    input logic[31:0] data_in1,
    input logic[31:0] data_in2,
    input logic[127:0] key_in,
    output reg[31:0] data_out1,
    output reg[31:0] data_out2,
    output reg all_done
);
    reg while_flag;
    reg modereg;
    reg[1:0] selectslice;
    reg [4:0] state;
    reg [5:0] x;
    reg[31:0] sum;
    reg[31:0] workunit1;
    reg[31:0] workunit2;
    reg[31:0] delta;
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            state <= 8'd0;
        end
        else begin
            case (state)
                8'd0: begin
                    state <= 8'd1;
                end
                8'd1: begin
                    state <= 8'd2;
                end
                8'd2: begin
                    state <= 8'd3;
                end
                8'd3: begin
                    state <= (while_flag ? 8'd4 : 8'd15);
                end
                8'd4: begin
                    state <= (modereg ? 8'd10 : 8'd5);
                end
                8'd5: begin
                    state <= 8'd6;
                end
                8'd6: begin
                    state <= 8'd7;
                end
                8'd7: begin
                    state <= 8'd8;
                end
                8'd8: begin
                    state <= 8'd9;
                end
                8'd9: begin
                    state <= 8'd2;
                end
                8'd10: begin
                    state <= 8'd11;
                end
                8'd11: begin
                    state <= 8'd12;
                end
                8'd12: begin
                    state <= 8'd13;
                end
                8'd13: begin
                    state <= 8'd14;
                end
                8'd14: begin
                    state <= 8'd2;
                end
                8'd15: begin
                    state <= 8'd16;
                end
                8'd16: begin
                    state <= 8'd17;
                end
                8'd17: begin
                    state <= 8'd17;
                end
                default: begin
                    state <= 4'bxxxx;
                end
            endcase
        end
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            data_out1 <= 32'd0;
            data_out2 <= 32'd0;
            x <= 8'd0;
            sum <= 32'd0;
            while_flag <= 1'b0;
            workunit1 <= 32'd0;
            workunit2 <= 32'd0;
            selectslice <= 1'b0;
            all_done <= 1'b0;
            delta <= 32'd0;
            modereg <= 1'b0;
        end
        else begin
            case (state)
                8'd1: begin
                    workunit1 <= data_in1;
                    workunit2 <= data_in2;
                    delta <= 32'd2654435769;
                    sum <= (mode ? 32'd0 : 32'd3337565984);
                    modereg <= mode;
                end
                8'd2: begin
                    if ((x < 8'd32)) begin
                        while_flag <= 1'b1;
                    end
                    else begin
                        while_flag <= 1'b0;
                    end
                end
                8'd5: begin
                    selectslice <= ((sum >> 32'd11));
                end
                8'd6: begin
                    case (selectslice)
                        2'b0: begin
                            workunit2 <= (workunit2 - ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[127:96])));
                        end
                        2'b1: begin
                            workunit2 <= (workunit2 - ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[95:64])));
                        end
                        2'b10: begin
                            workunit2 <= (workunit2 - ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[63:32])));
                        end
                        2'b11: begin
                            workunit2 <= (workunit2 - ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[31:0])));
                        end
                        default: begin
                            workunit2 <= 32'd0;
                        end
                    endcase
                end
                8'd7: begin
                    sum <= (sum - delta);
                end
                8'd8: begin
                    selectslice <= (sum);
                end
                8'd9: begin
                    case (selectslice)
                        2'b0: begin
                            workunit1 <= (workunit1 - ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[127:96])));
                        end
                        2'b1: begin
                            workunit1 <= (workunit1 - ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[95:64])));
                        end
                        2'b10: begin
                            workunit1 <= (workunit1 - ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[63:32])));
                        end
                        2'b11: begin
                            workunit1 <= (workunit1 - ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[31:0])));
                        end
                        default: begin
                            workunit1 <= 32'd0;
                        end
                    endcase
                    x <= (x + 1'b1);
                end
                8'd10: begin
                    selectslice <= (sum);
                end
                8'd11: begin
                    case (selectslice)
                        2'b0: begin
                            workunit1 <= (workunit1 + ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[127:96])));
                        end
                        2'b1: begin
                            workunit1 <= (workunit1 + ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[95:64])));
                        end
                        2'b10: begin
                            workunit1 <= (workunit1 + ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[63:32])));
                        end
                        2'b11: begin
                            workunit1 <= (workunit1 + ((((workunit2 << 4) ^ (workunit2 >> 5)) + workunit2) ^ (sum + key_in[31:0])));
                        end
                        default: begin
                            workunit1 <= 32'd0;
                        end
                    endcase
                end
                8'd12: begin
                    sum <= (sum + delta);
                end
                8'd13: begin
                    selectslice <= ((sum >> 32'd11));
                end
                8'd14: begin
                    case (selectslice)
                        2'b0: begin
                            workunit2 <= (workunit2 + ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[127:96])));
                        end
                        2'b1: begin
                            workunit2 <= (workunit2 + ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[95:64])));
                        end
                        2'b10: begin
                            workunit2 <= (workunit2 + ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[63:32])));
                        end
                        2'b11: begin
                            workunit2 <= (workunit2 + ((((workunit1 << 4) ^ (workunit1 >> 5)) + workunit1) ^ (sum + key_in[31:0])));
                        end
                        default: begin
                            workunit2 <= 32'd0;
                        end
                    endcase
                    x <= (x + 1'b1);
                end
                8'd16: begin
                    data_out1 <= workunit1;
                    data_out2 <= workunit2;
                end
                8'd17: begin
                    all_done <= 1'b1;
                end
                default: begin
                    data_out1 <= 32'd0;
                    data_out2 <= 32'd0;
                end
            endcase
        end
    end
endmodule