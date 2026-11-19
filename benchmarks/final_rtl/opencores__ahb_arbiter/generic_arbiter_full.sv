module generic_arbiter_full (
    input logic[8:0] busreq,
    input logic[8:0] hlock,
    input logic hclk,
    input logic hreset,
    output reg hmaster_lock,
    output reg[3:0] hgrant,
    input logic hready,
    input logic[71:0] hwdata,
    output reg[7:0] data_out,
    input logic[71:0] haddr,
    output reg[7:0] addr_out,
    input logic[26:0] hburst,
    input logic[17:0] htrans,
    output reg[1:0] htrans_out,
    output reg[2:0] hburst_out,
    output reg[3:0] hmaster
);
    reg[71:0] data1;
    reg[71:0] addr1;
    reg[71:0] data2;
    reg[71:0] addr2;
    reg[26:0] hburst1;
    reg[17:0] htrans1;
    reg[26:0] hburst2;
    reg[17:0] htrans2;
    reg[3:0] w_hgrant;
    reg w_hlock;
    reg hmasterlock;
    reg hlock3;
    reg[3:0] j;
    reg[3:0] inter;
    reg inter1;
    reg[3:0] hmaster_pre;
    reg hlock_c;
    reg [3:0] count;
    reg[4:0] counter;
    reg hlock_out;
    reg hlock_bus;
    always @(posedge hclk) begin
        hmaster_pre <= hmaster;
    end
    always @(hlock or hgrant or hmaster_lock or hlock3) begin
        hlock_out = (hlock >> hgrant);
        if (hmaster_lock) begin
            hlock_bus = hlock_out;
        end
        else begin
            hlock_bus = hlock3;
        end
    end
    always @(busreq or hlock) begin
        inter = 4'b1000;
        inter1 = 0;
        for (j = 9; (j >= 1); j = (j - 1)) begin
            if ((busreq[(j - 1)] == 1)) begin
                w_hgrant = (j - 1);
                inter = (j - 1);
                w_hlock = hlock[(j - 1)];
                inter1 = hlock[(j - 1)];
            end
            else begin
                w_hgrant = inter;
                w_hlock = inter1;
            end
        end
    end
    always @(posedge hclk) begin
        if (!(hreset)) begin
            hgrant <= 1'b0;
            hlock3 <= 1'b0;
        end
        else if (!(hmasterlock)) begin
            hgrant <= w_hgrant;
            hlock3 <= w_hlock;
        end
    end
    always @(hmaster_lock) begin
        hmasterlock = hmaster_lock;
    end
    always @(posedge hclk) begin
        if (!(hreset)) begin
            hmaster = 1'b0;
            hlock_c = 1'b0;
        end
        else if (hready) begin
            hmaster = hgrant;
            hlock_c = hlock_bus;
        end
    end
    always @(hmaster or addr2 or htrans2 or hburst2) begin
        addr_out <= (addr2 >> (8 * hmaster));
        htrans_out <= (htrans2 >> (2 * hmaster));
        hburst_out <= (hburst2 >> (3 * hmaster));
    end
    always @(hmaster_pre or data2) begin
        data_out <= (data2 >> (8 * hmaster_pre));
    end
    always @(posedge hclk) begin
        if (hready) begin
            data2 <= data1;
            addr2 <= addr1;
            htrans2 <= htrans1;
            hburst2 <= hburst1;
        end
    end
    always @(posedge hclk) begin
        data1 <= hwdata;
        addr1 <= haddr;
        htrans1 <= htrans;
        hburst1 <= hburst;
    end
    always @(posedge hclk) begin
        if (!(hreset)) begin
            hmaster_lock = 1'b0;
            counter = 5'b0;
            count = 5'b0;
        end
        else begin
            case (hburst_out)
                3'b0, 3'b1: begin
                    if ((counter == 5'b0)) begin
                        counter = 5'b0;
                        hmaster_lock = hlock_c;
                    end
                end
                3'b10, 3'b11: begin
                    if ((counter == 5'b0)) begin
                        counter = 5'b100;
                        hmaster_lock = 1'b1;
                        count = 5'b0;
                    end
                end
                3'b100, 3'b101: begin
                    if ((counter == 5'b0)) begin
                        counter = 5'b1000;
                        hmaster_lock = 1'b1;
                        count = 5'b0;
                    end
                end
                3'b110, 3'b111: begin
                    if ((counter == 5'b0)) begin
                        counter = 5'b10000;
                        hmaster_lock = 1'b1;
                        count = 5'b0;
                    end
                end
            endcase
            case (htrans_out)
                2'b0, 2'b1: begin
                    if (((count + 3) <= counter)) begin
                        count = (count + 1);
                    end
                    else if (( ((count + 1) < counter))) begin
                        hmaster_lock = hlock_c;
                        count = (count + 1);
                    end
                    else begin
                        counter = 5'b0;
                        hmaster_lock = hlock_c;
                        count = 5'b0;
                    end
                end
                default: begin
                    count = count;
                end
            endcase
        end
    end
endmodule