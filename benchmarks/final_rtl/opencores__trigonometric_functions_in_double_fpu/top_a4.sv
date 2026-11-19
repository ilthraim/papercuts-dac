module top_a4 (
    input logic[1:0] quad,
    input logic enable,
    input logic[31:0] degrees,
    output reg[63:0] data,
    input logic rst,
    input logic clk
);
    always @(posedge clk) begin
        if (((quad == 2'b10) || (quad == 2'b11))) begin
            data[63] <= 1'b1;
        end
        else begin
            data[63] <= 1'b0;
        end
        if (enable) begin
            case (degrees)
                32'd0: begin
                    data[62:0] <= 64'h7ff0000000000000;
                end
                32'd1: begin
                    data[62:0] <= 64'h404ca63b6cba7b71;
                end
                32'd2: begin
                    data[62:0] <= 64'h403ca7596e271c86;
                end
                32'd3: begin
                    data[62:0] <= 64'h40331b797e990dc0;
                end
                32'd4: begin
                    data[62:0] <= 64'h402cabd2100d036c;
                end
                32'd5: begin
                    data[62:0] <= 64'h4026f28a8ae3ab08;
                end
                32'd6: begin
                    data[62:0] <= 64'h4023222ff85e6006;
                end
                32'd7: begin
                    data[62:0] <= 64'h402069387b617567;
                end
                32'd8: begin
                    data[62:0] <= 64'h401cbdbe5febffb0;
                end
                32'd9: begin
                    data[62:0] <= 64'h401991df41de341d;
                end
                32'd10: begin
                    data[62:0] <= 64'h401708fb2129168e;
                end
                32'd11: begin
                    data[62:0] <= 64'h4014f69f90704701;
                end
                32'd12: begin
                    data[62:0] <= 64'h40133d2b00047f03;
                end
                32'd13: begin
                    data[62:0] <= 64'h4011c819f29be025;
                end
                32'd14: begin
                    data[62:0] <= 64'h401088c56499f439;
                end
                32'd15: begin
                    data[62:0] <= 64'h400ee8dd4748bf16;
                end
                32'd16: begin
                    data[62:0] <= 64'h400d060d6ac58d68;
                end
                32'd17: begin
                    data[62:0] <= 64'h400b5cc824ec982e;
                end
                32'd18: begin
                    data[62:0] <= 64'h4009e3779b97f4a8;
                end
                32'd19: begin
                    data[62:0] <= 64'h4008928aa26c4c08;
                end
                32'd20: begin
                    data[62:0] <= 64'h400763f38fb4cf95;
                end
                32'd21: begin
                    data[62:0] <= 64'h400652cbf905707a;
                end
                32'd22: begin
                    data[62:0] <= 64'h40055b11998752c1;
                end
                32'd23: begin
                    data[62:0] <= 64'h40047974b96de77f;
                end
                32'd24: begin
                    data[62:0] <= 64'h4003ab32fb93a3a7;
                end
                32'd25: begin
                    data[62:0] <= 64'h4002edfb187b1137;
                end
                32'd26: begin
                    data[62:0] <= 64'h40023fd71f682341;
                end
                32'd27: begin
                    data[62:0] <= 64'h40019f1b8c9526f0;
                end
                32'd28: begin
                    data[62:0] <= 64'h40010a59ff3c94be;
                end
                32'd29: begin
                    data[62:0] <= 64'h40008056af82561d;
                end
                32'd30: begin
                    data[62:0] <= 64'h4000000000000001;
                end
                32'd31: begin
                    data[62:0] <= 64'h3fff10cf62336e31;
                end
                32'd32: begin
                    data[62:0] <= 64'h3ffe317ab5700fce;
                end
                32'd33: begin
                    data[62:0] <= 64'h3ffd6093ce555fa8;
                end
                32'd34: begin
                    data[62:0] <= 64'h3ffc9cd7b485648a;
                end
                32'd35: begin
                    data[62:0] <= 64'h3ffbe52877982347;
                end
                32'd36: begin
                    data[62:0] <= 64'h3ffb38880b4603e4;
                end
                32'd37: begin
                    data[62:0] <= 64'h3ffa9613f8fd7862;
                end
                32'd38: begin
                    data[62:0] <= 64'h3ff9fd01bf93f3a3;
                end
                32'd39: begin
                    data[62:0] <= 64'h3ff96c9bc1d2abfe;
                end
                32'd40: begin
                    data[62:0] <= 64'h3ff8e43eaadf9334;
                end
                32'd41: begin
                    data[62:0] <= 64'h3ff863573463a809;
                end
                32'd42: begin
                    data[62:0] <= 64'h3ff7e9603e24eb24;
                end
                32'd43: begin
                    data[62:0] <= 64'h3ff775e129d20b11;
                end
                32'd44: begin
                    data[62:0] <= 64'h3ff7086c7026f77e;
                end
                32'd45: begin
                    data[62:0] <= 64'h3ff6a09e667f3bcd;
                end
                32'd46: begin
                    data[62:0] <= 64'h3ff63e1c2d781ada;
                end
                32'd47: begin
                    data[62:0] <= 64'h3ff5e092c2857578;
                end
                32'd48: begin
                    data[62:0] <= 64'h3ff587b62f6162b4;
                end
                32'd49: begin
                    data[62:0] <= 64'h3ff53340d31354d5;
                end
                32'd50: begin
                    data[62:0] <= 64'h3ff4e2f2c0fa463b;
                end
                32'd51: begin
                    data[62:0] <= 64'h3ff4969132d53892;
                end
                32'd52: begin
                    data[62:0] <= 64'h3ff44de60b3c3d86;
                end
                32'd53: begin
                    data[62:0] <= 64'h3ff408bf665efb99;
                end
                32'd54: begin
                    data[62:0] <= 64'h3ff3c6ef372fe94f;
                end
                32'd55: begin
                    data[62:0] <= 64'h3ff3884aef684af8;
                end
                32'd56: begin
                    data[62:0] <= 64'h3ff34cab310ac280;
                end
                32'd57: begin
                    data[62:0] <= 64'h3ff313eb883ae677;
                end
                32'd58: begin
                    data[62:0] <= 64'h3ff2ddea2c696f6a;
                end
                32'd59: begin
                    data[62:0] <= 64'h3ff2aa87c7f7612b;
                end
                32'd60: begin
                    data[62:0] <= 64'h3ff279a74590331d;
                end
                32'd61: begin
                    data[62:0] <= 64'h3ff24b2da2943b49;
                end
                32'd62: begin
                    data[62:0] <= 64'h3ff21f01c602373d;
                end
                32'd63: begin
                    data[62:0] <= 64'h3ff1f50c5b61511e;
                end
                32'd64: begin
                    data[62:0] <= 64'h3ff1cd37b13ce9c7;
                end
                32'd65: begin
                    data[62:0] <= 64'h3ff1a76f9ad128b7;
                end
                32'd66: begin
                    data[62:0] <= 64'h3ff183a154932d8b;
                end
                32'd67: begin
                    data[62:0] <= 64'h3ff161bb6b4a03f3;
                end
                32'd68: begin
                    data[62:0] <= 64'h3ff141ada5766663;
                end
                32'd69: begin
                    data[62:0] <= 64'h3ff12368eecf1f68;
                end
                32'd70: begin
                    data[62:0] <= 64'h3ff106df459ea073;
                end
                32'd71: begin
                    data[62:0] <= 64'h3ff0ec03a9d451e4;
                end
                32'd72: begin
                    data[62:0] <= 64'h3ff0d2ca0da1530d;
                end
                32'd73: begin
                    data[62:0] <= 64'h3ff0bb27477cf20f;
                end
                32'd74: begin
                    data[62:0] <= 64'h3ff0a51105712a50;
                end
                32'd75: begin
                    data[62:0] <= 64'h3ff0907dc1930690;
                end
                32'd76: begin
                    data[62:0] <= 64'h3ff07d64b78dea34;
                end
                32'd77: begin
                    data[62:0] <= 64'h3ff06bbddb2b91b8;
                end
                32'd78: begin
                    data[62:0] <= 64'h3ff05b81cfc51885;
                end
                32'd79: begin
                    data[62:0] <= 64'h3ff04ca9e08b8cb6;
                end
                32'd80: begin
                    data[62:0] <= 64'h3ff03f2ff9989907;
                end
                32'd81: begin
                    data[62:0] <= 64'h3ff0330ea1b99998;
                end
                32'd82: begin
                    data[62:0] <= 64'h3ff02840f4e91085;
                end
                32'd83: begin
                    data[62:0] <= 64'h3ff01ec29f6be927;
                end
                32'd84: begin
                    data[62:0] <= 64'h3ff0168fd9895209;
                end
                32'd85: begin
                    data[62:0] <= 64'h3ff00fa563d53203;
                end
                32'd86: begin
                    data[62:0] <= 64'h3ff00a008406617c;
                end
                32'd87: begin
                    data[62:0] <= 64'h3ff0059f0252e0bc;
                end
                32'd88: begin
                    data[62:0] <= 64'h3ff0027f274d432f;
                end
                32'd89: begin
                    data[62:0] <= 64'h3ff0009fba3f7835;
                end
                32'd90: begin
                    data[62:0] <= 64'h3ff0000000000000;
                end
                default: begin
                    data <= 64'h0;
                end
            endcase
        end
        else begin
            data <= 64'dx;
        end
    end
endmodule
