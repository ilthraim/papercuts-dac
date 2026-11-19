module top_a1 (
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
                    data[62:0] <= 64'h0;
                end
                32'd1: begin
                    data[62:0] <= 64'h3f91df0b2b89dd1e;
                end
                32'd2: begin
                    data[62:0] <= 64'h3fa1de58c9f7dc27;
                end
                32'd3: begin
                    data[62:0] <= 64'h3faacbc748efc90d;
                end
                32'd4: begin
                    data[62:0] <= 64'h3fb1db8f6d6a5128;
                end
                32'd5: begin
                    data[62:0] <= 64'h3fb64fd6b8c28102;
                end
                32'd6: begin
                    data[62:0] <= 64'h3fbac2609b3c576b;
                end
                32'd7: begin
                    data[62:0] <= 64'h3fbf32d44c4f62d3;
                end
                32'd8: begin
                    data[62:0] <= 64'h3fc1d06c968d9e19;
                end
                32'd9: begin
                    data[62:0] <= 64'h3fc4060b67a85375;
                end
                32'd10: begin
                    data[62:0] <= 64'h3fc63a1a7e0b7389;
                end
                32'd11: begin
                    data[62:0] <= 64'h3fc86c6ddd76624f;
                end
                32'd12: begin
                    data[62:0] <= 64'h3fca9cd9ac4258f5;
                end
                32'd13: begin
                    data[62:0] <= 64'h3fcccb3236cdc674;
                end
                32'd14: begin
                    data[62:0] <= 64'h3fcef74bf2e4b91d;
                end
                32'd15: begin
                    data[62:0] <= 64'h3fd0907dc1930690;
                end
                32'd16: begin
                    data[62:0] <= 64'h3fd1a40add328e29;
                end
                32'd17: begin
                    data[62:0] <= 64'h3fd2b637cf83d5c7;
                end
                32'd18: begin
                    data[62:0] <= 64'h3fd3c6ef372fe94f;
                end
                32'd19: begin
                    data[62:0] <= 64'h3fd4d61bd000cddc;
                end
                32'd20: begin
                    data[62:0] <= 64'h3fd5e3a8748a0bf5;
                end
                32'd21: begin
                    data[62:0] <= 64'h3fd6ef801fced33c;
                end
                32'd22: begin
                    data[62:0] <= 64'h3fd7f98deee59681;
                end
                32'd23: begin
                    data[62:0] <= 64'h3fd901bd2298ffaa;
                end
                32'd24: begin
                    data[62:0] <= 64'h3fda07f921061ad0;
                end
                32'd25: begin
                    data[62:0] <= 64'h3fdb0c2d77379853;
                end
                32'd26: begin
                    data[62:0] <= 64'h3fdc0e45dabe05c8;
                end
                32'd27: begin
                    data[62:0] <= 64'h3fdd0e2e2b44de00;
                end
                32'd28: begin
                    data[62:0] <= 64'h3fde0bd274245079;
                end
                32'd29: begin
                    data[62:0] <= 64'h3fdf071eedefa0ed;
                end
                32'd30: begin
                    data[62:0] <= 64'h3fdfffffffffffff;
                end
                32'd31: begin
                    data[62:0] <= 64'h3fe07b3120fddf13;
                end
                32'd32: begin
                    data[62:0] <= 64'h3fe0f5193eacdd2a;
                end
                32'd33: begin
                    data[62:0] <= 64'h3fe16daed770771c;
                end
                32'd34: begin
                    data[62:0] <= 64'h3fe1e4e88411fd12;
                end
                32'd35: begin
                    data[62:0] <= 64'h3fe25abcf87c4978;
                end
                32'd36: begin
                    data[62:0] <= 64'h3fe2cf2304755a5e;
                end
                32'd37: begin
                    data[62:0] <= 64'h3fe342119455beb6;
                end
                32'd38: begin
                    data[62:0] <= 64'h3fe3b37fb1bdc939;
                end
                32'd39: begin
                    data[62:0] <= 64'h3fe4236484487abe;
                end
                32'd40: begin
                    data[62:0] <= 64'h3fe491b7523c161c;
                end
                32'd41: begin
                    data[62:0] <= 64'h3fe4fe6f81384fd4;
                end
                32'd42: begin
                    data[62:0] <= 64'h3fe5698496e20bd8;
                end
                32'd43: begin
                    data[62:0] <= 64'h3fe5d2ee398c9c2b;
                end
                32'd44: begin
                    data[62:0] <= 64'h3fe63aa430e07310;
                end
                32'd45: begin
                    data[62:0] <= 64'h3fe6a09e667f3bcc;
                end
                32'd46: begin
                    data[62:0] <= 64'h3fe704d4e6a54d38;
                end
                32'd47: begin
                    data[62:0] <= 64'h3fe7673fe0c86982;
                end
                32'd48: begin
                    data[62:0] <= 64'h3fe7c7d7a833bec1;
                end
                32'd49: begin
                    data[62:0] <= 64'h3fe82694b4a11c36;
                end
                32'd50: begin
                    data[62:0] <= 64'h3fe8836fa2cf5039;
                end
                32'd51: begin
                    data[62:0] <= 64'h3fe8de613515a327;
                end
                32'd52: begin
                    data[62:0] <= 64'h3fe9376253f463d1;
                end
                32'd53: begin
                    data[62:0] <= 64'h3fe98e6c0ea27a14;
                end
                32'd54: begin
                    data[62:0] <= 64'h3fe9e3779b97f4a8;
                end
                32'd55: begin
                    data[62:0] <= 64'h3fea367e59158747;
                end
                32'd56: begin
                    data[62:0] <= 64'h3fea8779cda8eea5;
                end
                32'd57: begin
                    data[62:0] <= 64'h3fead663a8ae2fdb;
                end
                32'd58: begin
                    data[62:0] <= 64'h3feb2335c2cda945;
                end
                32'd59: begin
                    data[62:0] <= 64'h3feb6dea1e76eadd;
                end
                32'd60: begin
                    data[62:0] <= 64'h3febb67ae8584caa;
                end
                32'd61: begin
                    data[62:0] <= 64'h3febfce277d339c6;
                end
                32'd62: begin
                    data[62:0] <= 64'h3fec411b4f6d2707;
                end
                32'd63: begin
                    data[62:0] <= 64'h3fec83201d3d2c6c;
                end
                32'd64: begin
                    data[62:0] <= 64'h3fecc2ebbb5638ca;
                end
                32'd65: begin
                    data[62:0] <= 64'h3fed0079302dd767;
                end
                32'd66: begin
                    data[62:0] <= 64'h3fed3bc3aeff7f95;
                end
                32'd67: begin
                    data[62:0] <= 64'h3fed74c6982c666f;
                end
                32'd68: begin
                    data[62:0] <= 64'h3fedab7d7997cb57;
                end
                32'd69: begin
                    data[62:0] <= 64'h3feddfe40effb805;
                end
                32'd70: begin
                    data[62:0] <= 64'h3fee11f642522d1b;
                end
                32'd71: begin
                    data[62:0] <= 64'h3fee41b02bfeb4ca;
                end
                32'd72: begin
                    data[62:0] <= 64'h3fee6f0e134454ff;
                end
                32'd73: begin
                    data[62:0] <= 64'h3fee9a0c6e7bdb1f;
                end
                32'd74: begin
                    data[62:0] <= 64'h3feec2a7e35e7b80;
                end
                32'd75: begin
                    data[62:0] <= 64'h3feee8dd4748bf15;
                end
                32'd76: begin
                    data[62:0] <= 64'h3fef0ca99f79ba25;
                end
                32'd77: begin
                    data[62:0] <= 64'h3fef2e0a214e870f;
                end
                32'd78: begin
                    data[62:0] <= 64'h3fef4cfc327a0080;
                end
                32'd79: begin
                    data[62:0] <= 64'h3fef697d6938b6c2;
                end
                32'd80: begin
                    data[62:0] <= 64'h3fef838b8c811c17;
                end
                32'd81: begin
                    data[62:0] <= 64'h3fef9b24942fe45c;
                end
                32'd82: begin
                    data[62:0] <= 64'h3fefb046a930947a;
                end
                32'd83: begin
                    data[62:0] <= 64'h3fefc2f025a23e8b;
                end
                32'd84: begin
                    data[62:0] <= 64'h3fefd31f94f867c6;
                end
                32'd85: begin
                    data[62:0] <= 64'h3fefe0d3b41815a2;
                end
                32'd86: begin
                    data[62:0] <= 64'h3fefec0b7170fff6;
                end
                32'd87: begin
                    data[62:0] <= 64'h3feff4c5ed12e61d;
                end
                32'd88: begin
                    data[62:0] <= 64'h3feffb0278bf0567;
                end
                32'd89: begin
                    data[62:0] <= 64'h3feffec097f5af8a;
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
