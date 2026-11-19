module aes_cipher_top_u0_inst5 (
    input logic clk,
    output logic[7:0] out,
    output logic[7:0] out2,
    output logic[7:0] out3,
    output logic[7:0] out4,
    output logic[7:0] out5,
    output logic[7:0] out6,
    output logic[7:0] out7,
    output logic[7:0] out8,
    output logic[7:0] out9,
    output logic[7:0] out10
);
    assign out = frcon(0);
    assign out2 = frcon(1);
    assign out3 = frcon(2);
    assign out4 = frcon(3);
    assign out5 = frcon(4);
    assign out6 = frcon(5);
    assign out7 = frcon(6);
    assign out8 = frcon(7);
    assign out9 = frcon(8);
    assign out10 = frcon(9);
    function logic[7:0] frcon(input logic[3:0] i);
        case (i)
            4'b1: begin
                frcon = 8'd2;
            end
            4'b10: begin
                frcon = 8'd4;
            end
            4'b11: begin
                frcon = 8'd8;
            end
            4'b100: begin
                frcon = 8'd16;
            end
            4'b101: begin
                frcon = 8'd32;
            end
            4'b110: begin
                frcon = 8'd64;
            end
            4'b111: begin
                frcon = 8'd128;
            end
            4'b1000: begin
                frcon = 8'd27;
            end
            4'b1001: begin
                frcon = 8'd54;
            end
            default: begin
                frcon = 8'd0;
            end
        endcase
    endfunction
endmodule
