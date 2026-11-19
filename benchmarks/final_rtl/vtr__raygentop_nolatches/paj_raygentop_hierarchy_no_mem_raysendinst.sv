
module paj_raygentop_hierarchy_no_mem_raysendinst (
    input logic as,
    output reg ack,
    input logic[3:0] addr,
    input logic[47:0] dir,
    input logic[27:0] origx,
    input logic[27:0] origy,
    input logic[27:0] origz,
    output reg[31:0] rgData,
    output reg[3:0] rgAddr,
    output reg[2:0] rgWE,
    output reg rgAddrValid,
    input logic rgDone,
    input logic globalreset,
    input logic clk,
    output reg[2:0] statepeek
);
    reg[3:0] state;
    reg[3:0] next_state;
    reg[31:0] temp_rgData;
    reg[2:0] temp_rgWE;
    reg temp_rgAddrValid;
    reg temp_ack;
    reg[3:0] temp_rgAddr;
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            state <= 0;
            ack <= 1'b0;
            rgWE <= 3'b0;
            rgData <= 0;
            rgAddrValid <= 1'b0;
            rgAddr <= 0;
        end
        else begin
            state <= next_state;
            rgData <= temp_rgData;
            rgWE <= temp_rgWE;
            rgAddrValid <= temp_rgAddrValid;
            ack <= temp_ack;
            rgAddr <= temp_rgAddr;
        end
    end
    always @* begin
        case (state)
            0: begin
                if (((as == 1'b1) & (ack == 1'b0))) begin
                    next_state = 1;
                end
                else begin
                    next_state = 0;
                end
                statepeek = 3'b1;
                if (((as == 1'b1) & (ack == 1'b0))) begin
                    temp_rgData = {4'b0, origx};
                    temp_rgWE = 3'b1;
                    temp_rgAddrValid = 1'b1;
                    temp_rgAddr = addr;
                end
                else begin
                    temp_rgData = rgData;
                    temp_rgWE = rgWE;
                    temp_rgAddrValid = rgAddrValid;
                    temp_rgAddr = addr;
                end
                if (((as == 1'b0))) begin
                    temp_ack = 1'b0;
                end
                else begin
                    temp_ack = ack;
                end
            end
            1: begin
                if ((rgDone == 1'b1)) begin
                    next_state = 6;
                end
                else begin
                    next_state = 1;
                end
                statepeek = 3'b10;
                temp_rgData = rgData;
                temp_rgWE = rgWE;
                temp_rgAddr = rgAddr;
                if ((rgDone == 1'b1)) begin
                    temp_rgAddrValid = 1'b0;
                end
                else begin
                    temp_rgAddrValid = rgAddrValid;
                end
                temp_ack = ack;
            end
            2: begin
                if ((rgDone == 1'b1)) begin
                    next_state = 7;
                end
                else begin
                    next_state = 2;
                end
                statepeek = 3'b11;
                temp_rgData = rgData;
                temp_rgWE = rgWE;
                temp_rgAddr = rgAddr;
                if ((rgDone == 1'b1)) begin
                    temp_rgAddrValid = 1'b0;
                end
                else begin
                    temp_rgAddrValid = rgAddrValid;
                end
                temp_ack = ack;
            end
            3: begin
                if ((rgDone == 1'b1)) begin
                    next_state = 8;
                end
                else begin
                    next_state = 3;
                end
                statepeek = 3'b100;
                temp_rgData = rgData;
                temp_rgWE = rgWE;
                temp_rgAddr = rgAddr;
                if ((rgDone == 1'b1)) begin
                    temp_rgAddrValid = 1'b0;
                end
                else begin
                    temp_rgAddrValid = rgAddrValid;
                end
                temp_ack = ack;
            end
            4: begin
                if ((rgDone == 1'b1)) begin
                    next_state = 9;
                end
                else begin
                    next_state = 4;
                end
                statepeek = 3'b101;
                temp_rgData = rgData;
                temp_rgWE = rgWE;
                temp_rgAddr = rgAddr;
                if ((rgDone == 1'b1)) begin
                    temp_rgAddrValid = 1'b0;
                end
                else begin
                    temp_rgAddrValid = rgAddrValid;
                end
                temp_ack = ack;
            end
            5: begin
                if ((rgDone == 1'b1)) begin
                    next_state = 0;
                end
                else begin
                    next_state = 5;
                end
                statepeek = 3'b110;
                temp_rgData = rgData;
                temp_rgWE = rgWE;
                temp_rgAddr = rgAddr;
                temp_ack = 1'b1;
                if ((rgDone == 1'b1)) begin
                    temp_rgAddrValid = 1'b0;
                end
                else begin
                    temp_rgAddrValid = rgAddrValid;
                end
            end
            6: begin
                next_state = 2;
                temp_rgAddr = rgAddr;
                temp_ack = ack;
                temp_rgData = {4'b0, origy};
                temp_rgWE = 3'b10;
                temp_rgAddrValid = 1'b1;
            end
            7: begin
                next_state = 3;
                temp_rgAddr = rgAddr;
                temp_ack = ack;
                temp_rgData = {4'b0, origz};
                temp_rgWE = 3'b11;
                temp_rgAddrValid = 1'b1;
            end
            8: begin
                next_state = 4;
                temp_rgAddr = rgAddr;
                temp_ack = ack;
                temp_rgData = {dir[31:16], dir[47:32]};
                temp_rgWE = 3'b100;
                temp_rgAddrValid = 1'b1;
            end
            9: begin
                next_state = 5;
                temp_rgAddr = rgAddr;
                temp_ack = ack;
                temp_rgData = {16'd0, dir[15:0]};
                temp_rgWE = 3'b101;
                temp_rgAddrValid = 1'b1;
            end
            default: begin
                temp_rgData = rgData;
                temp_rgWE = rgWE;
                temp_rgAddrValid = rgAddrValid;
                temp_rgAddr = rgAddr;
                temp_ack = ack;
                next_state = state;
            end
        endcase
    end
endmodule