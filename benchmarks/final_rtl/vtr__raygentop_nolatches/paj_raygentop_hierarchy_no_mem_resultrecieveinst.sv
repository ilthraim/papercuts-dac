
module paj_raygentop_hierarchy_no_mem_resultrecieveinst (
    output reg valid01,
    output reg valid10,
    output reg[15:0] id01a,
    output reg[15:0] id01b,
    output reg[15:0] id01c,
    output reg[15:0] id10a,
    output reg[15:0] id10b,
    output reg[15:0] id10c,
    output reg hit01a,
    output reg hit01b,
    output reg hit01c,
    output reg hit10a,
    output reg hit10b,
    output reg hit10c,
    output reg[7:0] u01a,
    output reg[7:0] u01b,
    output reg[7:0] u01c,
    output reg[7:0] v01a,
    output reg[7:0] v01b,
    output reg[7:0] v01c,
    output reg[7:0] u10a,
    output reg[7:0] u10b,
    output reg[7:0] u10c,
    output reg[7:0] v10a,
    output reg[7:0] v10b,
    output reg[7:0] v10c,
    input logic[31:0] rgResultData,
    input logic rgResultReady,
    input logic[1:0] rgResultSource,
    input logic globalreset,
    input logic clk
);
    reg[2:0] state;
    reg[2:0] next_state;
    always @(posedge clk) begin
        if ((globalreset == 1'b1)) begin
            state <= 0;
            valid01 <= 1'b0;
            valid10 <= 1'b0;
            hit01a <= 1'b0;
            hit01b <= 1'b0;
            hit01c <= 1'b0;
            hit10a <= 1'b0;
            hit10b <= 1'b0;
            hit10c <= 1'b0;
            id01a <= 0;
            id01b <= 0;
            id01c <= 0;
            id10a <= 0;
            id10b <= 0;
            id10c <= 0;
            u01a <= 0;
            u01b <= 0;
            u01c <= 0;
            v01a <= 0;
            v01b <= 0;
            v01c <= 0;
            u10a <= 0;
            u10b <= 0;
            u10c <= 0;
            v10a <= 0;
            v10b <= 0;
            v10c <= 0;
        end
        else begin
            state <= next_state;
            if ((state == 0)) begin
                if (((rgResultReady == 1'b1) & (rgResultSource == 2'b1))) begin
                    id01a <= rgResultData[31:16];
                    id01b <= rgResultData[15:0];
                end
                else if (((rgResultReady == 1'b1) & (rgResultSource == 2'b10))) begin
                    id10a <= rgResultData[31:16];
                    id10b <= rgResultData[15:0];
                end
            end
            if ((state == 1)) begin
                id01c <= rgResultData[15:0];
                hit01a <= rgResultData[18];
                hit01b <= rgResultData[17];
                hit01c <= rgResultData[16];
            end
            if ((state == 2)) begin
                u01a <= rgResultData[23:16];
                u01b <= rgResultData[15:8];
                u01c <= rgResultData[7:0];
            end
            if ((state == 5)) begin
                u10a <= rgResultData[23:16];
                u10b <= rgResultData[15:8];
                u10c <= rgResultData[7:0];
            end
            if ((state == 3)) begin
                v01a <= rgResultData[23:16];
                v01b <= rgResultData[15:8];
                v01c <= rgResultData[7:0];
            end
            if ((state == 6)) begin
                v10a <= rgResultData[23:16];
                v10b <= rgResultData[15:8];
                v10c <= rgResultData[7:0];
            end
            if ((state == 4)) begin
                id10c <= rgResultData[15:0];
                hit10a <= rgResultData[18];
                hit10b <= rgResultData[17];
                hit10c <= rgResultData[16];
            end
            if ((state == 3)) begin
                valid01 <= 1'b1;
            end
            else begin
                valid01 <= 1'b0;
            end
            if ((state == 6)) begin
                valid10 <= 1'b1;
            end
            else begin
                valid10 <= 1'b0;
            end
        end
    end
    always @* begin
        case (state)
            0: begin
                if (((rgResultReady == 1'b1) & (rgResultSource == 2'b1))) begin
                    next_state = 1;
                end
                else if (((rgResultReady == 1'b1) & (rgResultSource == 2'b10))) begin
                    next_state = 4;
                end
                else begin
                    next_state = 0;
                end
            end
            1: begin
                next_state = 2;
            end
            2: begin
                next_state = 3;
            end
            3: begin
                next_state = 0;
            end
            4: begin
                next_state = 5;
            end
            5: begin
                next_state = 6;
            end
            6: begin
                next_state = 0;
            end
            default: begin
                next_state = state;
            end
        endcase
    end
endmodule