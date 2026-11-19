module top_a6 (
    input logic[1:0] quad,
    input logic enable,
    input logic[31:0] degrees,
    output reg[63:0] data,
    input logic rst,
    input logic clk
);
    always @(posedge clk) begin
        if (((quad == 2'b1) || (quad == 2'b11))) begin
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
                    data[62:0] <= 64'h404ca51d76749a71;
                end
                32'd2: begin
                    data[62:0] <= 64'h403ca2e17ec2185c;
                end
                32'd3: begin
                    data[62:0] <= 64'h403314c55fbc4c67;
                end
                32'd4: begin
                    data[62:0] <= 64'h402c99f0ed772d4c;
                end
                32'd5: begin
                    data[62:0] <= 64'h4026dc2fd0bfdbe2;
                end
                32'd6: begin
                    data[62:0] <= 64'h4023075ac71a38c7;
                end
                32'd7: begin
                    data[62:0] <= 64'h402049e7c666e3fe;
                end
                32'd8: begin
                    data[62:0] <= 64'h401c76237b025ae8;
                end
                32'd9: begin
                    data[62:0] <= 64'h4019414813ba662c;
                end
                32'd10: begin
                    data[62:0] <= 64'h4016af648056a136;
                end
                32'd11: begin
                    data[62:0] <= 64'h40149405f7cc644c;
                end
                32'd12: begin
                    data[62:0] <= 64'h4012d18a8e2ff28c;
                end
                32'd13: begin
                    data[62:0] <= 64'h4011536e695dda95;
                end
                32'd14: begin
                    data[62:0] <= 64'h40100b0a2833d3c4;
                end
                32'd15: begin
                    data[62:0] <= 64'h400ddb3d742c2656;
                end
                32'd16: begin
                    data[62:0] <= 64'h400be6398b3f2869;
                end
                32'd17: begin
                    data[62:0] <= 64'h400a2ab4c713671e;
                end
                32'd18: begin
                    data[62:0] <= 64'h40089f188bdcd7b0;
                end
                32'd19: begin
                    data[62:0] <= 64'h40073bd2e9a270e0;
                end
                32'd20: begin
                    data[62:0] <= 64'h4005fad570f872d9;
                end
                32'd21: begin
                    data[62:0] <= 64'h4004d738ef803784;
                end
                32'd22: begin
                    data[62:0] <= 64'h4003ccfa561175d6;
                end
                32'd23: begin
                    data[62:0] <= 64'h4002d8c9200b5686;
                end
                32'd24: begin
                    data[62:0] <= 64'h4001f7e220cc4172;
                end
                32'd25: begin
                    data[62:0] <= 64'h400127f33e8d12e5;
                end
                32'd26: begin
                    data[62:0] <= 64'h40006705b35391e8;
                end
                32'd27: begin
                    data[62:0] <= 64'h3fff66da45fee3f1;
                end
                32'd28: begin
                    data[62:0] <= 64'h3ffe1774a2562593;
                end
                32'd29: begin
                    data[62:0] <= 64'h3ffcdd612dd501f4;
                end
                32'd30: begin
                    data[62:0] <= 64'h3ffbb67ae8584cab;
                end
                32'd31: begin
                    data[62:0] <= 64'h3ffaa0e385c196ab;
                end
                32'd32: begin
                    data[62:0] <= 64'h3ff99af8610e4105;
                end
                32'd33: begin
                    data[62:0] <= 64'h3ff8a34971bd7010;
                end
                32'd34: begin
                    data[62:0] <= 64'h3ff7b891d9a169b4;
                end
                32'd35: begin
                    data[62:0] <= 64'h3ff6d9b1b96ce128;
                end
                32'd36: begin
                    data[62:0] <= 64'h3ff605a90c73ab79;
                end
                32'd37: begin
                    data[62:0] <= 64'h3ff53b9359d2f919;
                end
                32'd38: begin
                    data[62:0] <= 64'h3ff47aa413b0ee1e;
                end
                32'd39: begin
                    data[62:0] <= 64'h3ff3c2238553dcee;
                end
                32'd40: begin
                    data[62:0] <= 64'h3ff3116c3711527e;
                end
                32'd41: begin
                    data[62:0] <= 64'h3ff267e8b3f5da82;
                end
                32'd42: begin
                    data[62:0] <= 64'h3ff1c511a0db83e3;
                end
                32'd43: begin
                    data[62:0] <= 64'h3ff1286c17acf49b;
                end
                32'd44: begin
                    data[62:0] <= 64'h3ff091883bfbf42e;
                end
                32'd45: begin
                    data[62:0] <= 64'h3ff0000000000001;
                end
                32'd46: begin
                    data[62:0] <= 64'h3feee6ec253d2464;
                end
                32'd47: begin
                    data[62:0] <= 64'h3fedd729e0bf9cb6;
                end
                32'd48: begin
                    data[62:0] <= 64'h3fecd01c246e4060;
                end
                32'd49: begin
                    data[62:0] <= 64'h3febd1326bb88d13;
                end
                32'd50: begin
                    data[62:0] <= 64'h3fead9e7783fbf1e;
                end
                32'd51: begin
                    data[62:0] <= 64'h3fe9e9c0346ca839;
                end
                32'd52: begin
                    data[62:0] <= 64'h3fe9004ab6d5cc93;
                end
                32'd53: begin
                    data[62:0] <= 64'h3fe81d1d621eb711;
                end
                32'd54: begin
                    data[62:0] <= 64'h3fe73fd61d9df544;
                end
                32'd55: begin
                    data[62:0] <= 64'h3fe66819a3a0bf7b;
                end
                32'd56: begin
                    data[62:0] <= 64'h3fe59592e296c625;
                end
                32'd57: begin
                    data[62:0] <= 64'h3fe4c7f26ed1d60f;
                end
                32'd58: begin
                    data[62:0] <= 64'h3fe3feee02d72514;
                end
                32'd59: begin
                    data[62:0] <= 64'h3fe33a400c85af9f;
                end
                32'd60: begin
                    data[62:0] <= 64'h3fe279a74590331e;
                end
                32'd61: begin
                    data[62:0] <= 64'h3fe1bce655fbb9bf;
                end
                32'd62: begin
                    data[62:0] <= 64'h3fe103c37f7ebedc;
                end
                32'd63: begin
                    data[62:0] <= 64'h3fe04e0850c1dd5d;
                end
                32'd64: begin
                    data[62:0] <= 64'h3fdf3702bf455cf5;
                end
                32'd65: begin
                    data[62:0] <= 64'h3fddd7fc13699ab1;
                end
                32'd66: begin
                    data[62:0] <= 64'h3fdc7ea074a90a11;
                end
                32'd67: begin
                    data[62:0] <= 64'h3fdb2a986b66229e;
                end
                32'd68: begin
                    data[62:0] <= 64'h3fd9db90d0ac0d44;
                end
                32'd69: begin
                    data[62:0] <= 64'h3fd8913a75259d04;
                end
                32'd70: begin
                    data[62:0] <= 64'h3fd74b49cf3902d6;
                end
                32'd71: begin
                    data[62:0] <= 64'h3fd60976af8c1614;
                end
                32'd72: begin
                    data[62:0] <= 64'h3fd4cb7bfb4961b0;
                end
                32'd73: begin
                    data[62:0] <= 64'h3fd391176b8feb5b;
                end
                32'd74: begin
                    data[62:0] <= 64'h3fd25a0951873b22;
                end
                32'd75: begin
                    data[62:0] <= 64'h3fd126145e9ecd56;
                end
                32'd76: begin
                    data[62:0] <= 64'h3fcfe9fae1181f52;
                end
                32'd77: begin
                    data[62:0] <= 64'h3fcd8d16c1491599;
                end
                32'd78: begin
                    data[62:0] <= 64'h3fcb350dac762348;
                end
                32'd79: begin
                    data[62:0] <= 64'h3fc8e174375dceba;
                end
                32'd80: begin
                    data[62:0] <= 64'h3fc691e1ebc5cbbf;
                end
                32'd81: begin
                    data[62:0] <= 64'h3fc445f0fbb1cf93;
                end
                32'd82: begin
                    data[62:0] <= 64'h3fc1fd3df8664fe6;
                end
                32'd83: begin
                    data[62:0] <= 64'h3fbf6ecf19881d32;
                end
                32'd84: begin
                    data[62:0] <= 64'h3fbae81c75231d96;
                end
                32'd85: begin
                    data[62:0] <= 64'h3fb665a8349d55ee;
                end
                32'd86: begin
                    data[62:0] <= 64'h3fb1e6b93a6931ff;
                end
                32'd87: begin
                    data[62:0] <= 64'h3faad53144273e86;
                end
                32'd88: begin
                    data[62:0] <= 64'h3fa1e12295d61fd2;
                end
                32'd89: begin
                    data[62:0] <= 64'h3f91dfbd9410a43b;
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
