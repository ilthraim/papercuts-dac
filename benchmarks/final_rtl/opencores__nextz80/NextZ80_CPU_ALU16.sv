
module NextZ80_CPU_ALU16 (
    input logic[15:0] D0,
    input logic[7:0] D1,
    output logic[15:0] DOUT,
    input logic[2:0] OP
);
    reg[15:0] mux;
    always @* begin
        case (OP)
            0: begin
                mux = 0;
            end
            1: begin
                mux = 1;
            end
            2: begin
                mux = 2;
            end
            3: begin
                mux = {D1[7], D1[7], D1[7], D1[7], D1[7], D1[7], D1[7], D1[7], D1[7:0]};
            end
            4: begin
                mux = 0;
            end
            5: begin
                mux = 16'd65535;
            end
            6: begin
                mux = 16'd65534;
            end
            default: begin
                mux = 16'dx;
            end
        endcase
    end
    assign DOUT = (D0 + mux);
endmodule