
module paj_raygentop_hierarchy_no_mem_resultwriteinst_linearmapinst (
    input logic[6:0] u,
    input logic[6:0] v,
    input logic[17:0] start,
    output reg[17:0] addr,
    output logic[1:0] texelselect,
    input logic[2:0] factor,
    input logic enable,
    input logic clk
);
    reg[6:0] ul;
    reg[6:0] vl;
    assign texelselect = ul[1:0];
    always @(posedge clk) begin
        if ((enable == 1'b1)) begin
            ul <= u;
            vl <= v;
        end
        else begin
            ul <= ul;
            vl <= vl;
        end
        case (factor)
            3'b0: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {11'd0, vl});
            end
            3'b1: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {10'd0, vl, 1'b0});
            end
            3'b10: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {9'd0, vl, 2'b0});
            end
            3'b11: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {8'd0, vl, 3'b0});
            end
            3'b100: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {7'b0, vl, 4'b0});
            end
            3'b101: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {6'b0, vl, 5'b0});
            end
            3'b110: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {5'b0, vl, 6'b0});
            end
            3'b111: begin
                addr <= ((start + {13'd0, ul[6:2]}) + {4'b0, vl, 7'b0});
            end
        endcase
    end
endmodule