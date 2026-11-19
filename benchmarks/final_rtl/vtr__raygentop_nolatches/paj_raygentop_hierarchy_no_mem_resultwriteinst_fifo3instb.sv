
module paj_raygentop_hierarchy_no_mem_resultwriteinst_fifo3instb (
    input logic[17:0] datain,
    input logic writeen,
    output logic[17:0] dataout,
    input logic shiften,
    input logic globalreset,
    input logic clk
);
    reg[17:0] data0;
    reg[17:0] data1;
    reg[17:0] data2;
    reg[1:0] pos;
    assign dataout = data0;
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            pos <= 2'b0;
            data0 <= 0;
            data1 <= 0;
            data2 <= 0;
        end
        else begin
            if (((writeen == 1'b1) & (shiften == 1'b1))) begin
                case (pos)
                    2'b0: begin
                        data0 <= 0;
                        data1 <= 0;
                        data2 <= 0;
                    end
                    2'b1: begin
                        data0 <= datain;
                        data1 <= 0;
                        data2 <= 0;
                    end
                    2'b10: begin
                        data0 <= data1;
                        data1 <= datain;
                        data2 <= 0;
                    end
                    2'b11: begin
                        data0 <= data1;
                        data1 <= data2;
                        data2 <= datain;
                    end
                endcase
            end
            else if ((shiften == 1'b1)) begin
                data0 <= data1;
                data1 <= data2;
                pos <= (pos - 1);
            end
            else if ((writeen == 1'b1)) begin
                case (pos)
                    2'b0: begin
                        data0 <= datain;
                    end
                    2'b1: begin
                        data1 <= datain;
                    end
                    2'b10: begin
                        data2 <= datain;
                    end
                endcase
                pos <= (pos + 1);
            end
        end
    end
endmodule