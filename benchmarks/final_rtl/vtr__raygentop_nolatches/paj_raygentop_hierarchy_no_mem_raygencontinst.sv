
module paj_raygentop_hierarchy_no_mem_raygencontinst (
    input logic go,
    input logic[14:0] initcount,
    output logic busyout,
    output reg[30:0] cycles,
    output logic[17:0] nextaddr,
    output logic nas0,
    output logic nas1,
    input logic page,
    input logic dirReady,
    output reg wantDir,
    input logic[47:0] dirIn,
    input logic[14:0] addrIn,
    output reg as,
    output reg[3:0] addr,
    input logic ack,
    output reg[47:0] dir,
    output logic[1:0] raygroup0,
    output reg raygroupvalid0,
    input logic busy0,
    output logic[1:0] raygroup1,
    output reg raygroupvalid1,
    input logic busy1,
    input logic globalreset,
    input logic clk,
    output reg[2:0] statepeek
);
    reg temp_busyout;
    reg temp_nas0;
    reg temp_nas1;
    reg[2:0] state;
    reg[2:0] next_state;
    reg[14:0] count;
    wire logic[1:0] busy;
    reg[1:0] loaded;
    reg[1:0] groupID;
    reg active;
    reg[1:0] temp_addr;
    reg[1:0] temp_loaded;
    reg[1:0] temp_groupID;
    reg[14:0] temp_count;
    reg temp_active;
    reg temp_raygroupvalid1;
    reg temp_raygroupvalid0;
    assign busy = {busy1, busy0};
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            state <= 0;
            cycles <= 0;
            dir <= 0;
            addr[1:0] <= 2'b0;
            groupID <= 2'b0;
            count <= 0;
            raygroupvalid0 <= 1'b0;
            raygroupvalid1 <= 1'b0;
            loaded <= 2'b0;
            active <= 1'b0;
        end
        else begin
            addr[3:2] <= ((active == 1'b0) ? {1'b0, groupID[0]} : {1'b1, groupID[1]});
            addr[1:0] <= temp_addr[1:0];
            state <= next_state;
            if ((state == 1)) begin
                dir <= dirIn;
            end
            if ((state == 0)) begin
                if (go) begin
                    cycles <= 0;
                end
            end
            else begin
                cycles <= (cycles + 1);
            end
            loaded <= temp_loaded;
            groupID <= temp_groupID;
            count <= temp_count;
            active <= temp_active;
            raygroupvalid0 <= temp_raygroupvalid0;
            raygroupvalid1 <= temp_raygroupvalid1;
        end
    end
    assign raygroup0 = {1'b0, groupID[0]};
    assign raygroup1 = {1'b1, groupID[1]};
    assign nextaddr = {2'b11, page, addrIn};
    assign busyout = temp_busyout;
    assign nas0 = temp_nas0;
    assign nas1 = temp_nas1;
    always @* begin
        case (state)
            0: begin
                temp_addr[1:0] = 2'b0;
                temp_loaded = 2'b0;
                temp_groupID = 2'b0;
                temp_count = initcount;
                temp_active = 1'b0;
                temp_raygroupvalid0 = raygroupvalid0;
                temp_raygroupvalid1 = raygroupvalid1;
            end
            1: begin begin
                    if ((active == 1'b0)) begin
                        temp_loaded[0] = 1'b1;
                        temp_loaded[1] = loaded[1];
                    end
                    else begin
                        temp_loaded[1] = 1'b1;
                        temp_loaded[0] = loaded[0];
                    end
                end
                temp_addr[1:0] = addr;
                temp_groupID = groupID;
                temp_count = count;
                temp_active = active;
                temp_raygroupvalid0 = raygroupvalid0;
                temp_raygroupvalid1 = raygroupvalid1;
            end
            2: begin
                if (((ack == 1'b1) & (addr[1:0] != 2'b10))) begin
                    temp_active = active;
                    temp_addr[1:0] = (addr[1:0] + 2'b1);
                    temp_raygroupvalid0 = raygroupvalid0;
                    temp_raygroupvalid1 = raygroupvalid1;
                end
                else if (((ack == 1'b1))) begin
                    if (((loaded[0] == 1'b1) & (busy[0] == 1'b0))) begin
                        temp_active = active;
                        temp_addr[1:0] = addr;
                        temp_raygroupvalid0 = 1'b1;
                        temp_raygroupvalid1 = raygroupvalid1;
                    end
                    else if (((loaded[1] == 1'b1) & (busy[1] == 1'b0))) begin
                        temp_active = active;
                        temp_addr[1:0] = addr;
                        temp_raygroupvalid0 = raygroupvalid0;
                        temp_raygroupvalid1 = 1'b1;
                    end
                    else if ((loaded[0] == 1'b0)) begin
                        temp_active = 1'b0;
                        temp_addr[1:0] = 2'b0;
                        temp_raygroupvalid0 = raygroupvalid0;
                        temp_raygroupvalid1 = raygroupvalid1;
                    end
                    else if ((loaded[1] == 1'b0)) begin
                        temp_active = 1'b1;
                        temp_addr[1:0] = 2'b0;
                        temp_raygroupvalid0 = raygroupvalid0;
                        temp_raygroupvalid1 = raygroupvalid1;
                    end
                    else begin
                        temp_addr[1:0] = addr;
                        temp_active = active;
                        temp_raygroupvalid0 = raygroupvalid0;
                        temp_raygroupvalid1 = raygroupvalid1;
                    end
                end
                else begin
                    temp_addr[1:0] = addr;
                    temp_active = active;
                    temp_raygroupvalid0 = raygroupvalid0;
                    temp_raygroupvalid1 = raygroupvalid1;
                end
                temp_loaded = loaded;
                temp_groupID = groupID;
                temp_count = count;
            end
            3: begin
                if ((busy[0] == 1'b1)) begin
                    temp_groupID = {groupID[1], ~(groupID[0])};
                    temp_raygroupvalid0 = 1'b0;
                    temp_count = (count - 1);
                    if (((loaded[1] == 1'b1) & (busy[1] == 1'b0))) begin
                        temp_raygroupvalid1 = 1'b1;
                        temp_active = active;
                    end
                    else if ((loaded[1] == 1'b0)) begin
                        temp_raygroupvalid1 = raygroupvalid1;
                        temp_active = 1'b1;
                    end
                    else begin
                        temp_raygroupvalid1 = raygroupvalid1;
                        temp_active = 1'b0;
                    end
                end
                else begin
                    temp_active = active;
                    temp_raygroupvalid0 = raygroupvalid0;
                    temp_raygroupvalid1 = raygroupvalid1;
                    temp_count = count;
                    temp_groupID = groupID;
                end
                temp_loaded = {loaded[1], 1'b0};
                temp_addr[1:0] = 2'b0;
            end
            4: begin
                if ((busy[1] == 1'b1)) begin
                    temp_groupID = {~(groupID[1]), groupID[0]};
                    temp_raygroupvalid1 = 1'b0;
                    temp_count = (count - 1);
                    if (((loaded[0] == 1'b1) & (busy[0] == 1'b0))) begin
                        temp_raygroupvalid0 = 1'b1;
                        temp_active = active;
                    end
                    else if ((loaded[0] == 1'b0)) begin
                        temp_raygroupvalid0 = raygroupvalid0;
                        temp_active = 1'b0;
                    end
                    else begin
                        temp_raygroupvalid0 = raygroupvalid0;
                        temp_active = 1'b1;
                    end
                end
                else begin
                    temp_active = active;
                    temp_raygroupvalid0 = raygroupvalid0;
                    temp_raygroupvalid1 = raygroupvalid1;
                    temp_count = count;
                    temp_groupID = groupID;
                end
                temp_loaded = {1'b0, loaded[0]};
                temp_addr[1:0] = 2'b0;
            end
            default: begin
                temp_addr[1:0] = addr;
                temp_loaded = loaded;
                temp_groupID = groupID;
                temp_count = count;
                temp_active = active;
                temp_raygroupvalid0 = raygroupvalid0;
                temp_raygroupvalid1 = raygroupvalid1;
            end
        endcase
    end
    always @* begin
        case (state)
            0: begin
                as = 1'b0;
                wantDir = 1'b0;
                statepeek = 3'b1;
                temp_busyout = 1'b0;
                temp_nas0 = 1'b0;
                temp_nas1 = 1'b0;
            end
            1: begin
                as = dirReady;
                wantDir = 1'b1;
                statepeek = 3'b10;
                temp_busyout = 1'b1;
                if ((((addr[1:0] == 2'b0) & (dirReady == 1'b1)) & (active == 1'b0))) begin
                    temp_nas0 = 1'b1;
                    temp_nas1 = 1'b1;
                end
                else begin
                    temp_nas0 = 1'b0;
                    temp_nas1 = 1'b0;
                end
            end
            2: begin
                wantDir = 1'b0;
                as = 1'b1;
                statepeek = 3'b11;
                temp_busyout = 1'b1;
                temp_nas0 = 1'b0;
                temp_nas1 = 1'b0;
            end
            default: begin
                wantDir = 1'b0;
                as = 1'b0;
                statepeek = (state + 1);
                temp_busyout = 1'b1;
                temp_nas0 = 1'b0;
                temp_nas1 = 1'b0;
            end
        endcase
    end
    always @* begin
        case (state)
            0: begin
                if ((go == 1'b1)) begin
                    next_state = 1;
                end
                else begin
                    next_state = 0;
                end
            end
            1: begin
                if ((dirReady == 1'b1)) begin
                    next_state = 2;
                end
                else begin
                    next_state = 1;
                end
            end
            2: begin
                if (((ack == 1'b1) & (addr[1:0] != 2'b10))) begin
                    next_state = 1;
                end
                else if ((ack == 1'b1)) begin
                    if (((loaded[0] == 1'b1) & (busy[0] == 1'b0))) begin
                        next_state = 3;
                    end
                    else if (((loaded[1] == 1'b1) & (busy[1] == 1'b0))) begin
                        next_state = 4;
                    end
                    else if ((loaded != 2'b11)) begin
                        next_state = 1;
                    end
                    else begin
                        next_state = 2;
                    end
                end
                else begin
                    next_state = 2;
                end
            end
            3: begin
                if ((busy[0] == 1'b0)) begin
                    next_state = 3;
                end
                else if (((loaded[1] == 1'b1) & (busy[1] == 1'b0))) begin
                    next_state = 4;
                end
                else if ((count > 0)) begin
                    next_state = 1;
                end
                else begin
                    next_state = 0;
                end
            end
            4: begin
                if ((busy[1] == 1'b0)) begin
                    next_state = 4;
                end
                else if (((loaded[0] == 1'b1) & (busy[0] == 1'b0))) begin
                    next_state = 3;
                end
                else if ((count > 0)) begin
                    next_state = 1;
                end
                else begin
                    next_state = 0;
                end
            end
            default: begin
                next_state = state;
            end
        endcase
    end
endmodule