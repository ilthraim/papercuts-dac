module i2c_master_top_byte_controller_bit_controller (
    input logic clk,
    input logic rst,
    input logic nReset,
    input logic[15:0] clk_cnt,
    input logic ena,
    input logic[3:0] cmd,
    output reg cmd_ack,
    output reg busy,
    output reg al,
    input logic din,
    output reg dout,
    input logic scl_i,
    output logic scl_o,
    output reg scl_oen,
    input logic sda_i,
    output logic sda_o,
    output reg sda_oen
);
    reg sSCL;
    reg sSDA;
    reg dSCL;
    reg dSDA;
    reg dscl_oen;
    reg sda_chk;
    reg clk_en;
    reg slave_wait;
    reg[15:0] cnt;
    reg[17:0] c_state;
    always @(posedge clk) begin
        dscl_oen <= scl_oen;
    end
    always @(posedge clk or negedge nReset) begin
        if (!(nReset)) begin
            slave_wait = 1'b0;
        end
        else begin
            slave_wait = (((scl_oen & ~(dscl_oen)) & ~(sSCL)) | (slave_wait & ~(sSCL)));
        end
    end
    wire logic scl_sync = ((dSCL & ~(sSCL)) & scl_oen);
    always @(posedge clk or negedge nReset) begin
        if (~(nReset)) begin
            cnt <= 16'd0;
            clk_en <= 1'b1;
        end
        else if (((~|(cnt) || !(ena)) || scl_sync)) begin
            cnt <= clk_cnt;
            clk_en <= 1'b1;
        end
        else if (slave_wait) begin
            cnt <= cnt;
            clk_en <= 1'b0;
        end
        else begin
            cnt <= (cnt - 16'd1);
            clk_en <= 1'b0;
        end
    end
    reg sta_condition;
    reg sto_condition;
    always @(posedge clk or negedge nReset) begin
        if (~(nReset)) begin
            sSCL <= 1'b1;
            sSDA <= 1'b1;
            dSCL <= 1'b1;
            dSDA <= 1'b1;
        end
        else begin
            sSCL <= scl_i;
            sSDA <= sda_i;
            dSCL <= sSCL;
            dSDA <= sSDA;
        end
    end
    always @(posedge clk or negedge nReset) begin
        if (~(nReset)) begin
            sta_condition <= 1'b0;
            sto_condition <= 1'b0;
        end
        else begin
            sta_condition <= ((~(sSDA) & dSDA) & sSCL);
            sto_condition <= ((sSDA & ~(dSDA)) & sSCL);
        end
    end
    always @(posedge clk or negedge nReset) begin
        if (!(nReset)) begin
            busy <= 1'b0;
        end
        else begin
            busy <= ((sta_condition | busy) & ~(sto_condition));
        end
    end
    reg cmd_stop;
    always @(posedge clk or negedge nReset) begin
        if (~(nReset)) begin
            cmd_stop <= 1'b0;
        end
        else if (clk_en) begin
            cmd_stop <= (cmd == 4'b10);
        end
    end
    always @(posedge clk or negedge nReset) begin
        if (~(nReset)) begin
            al <= 1'b0;
        end
        else begin
            al <= (((sda_chk & ~(sSDA)) & sda_oen) | ((|(c_state) & sto_condition) & ~(cmd_stop)));
        end
    end
    always @(posedge clk) begin
        if ((sSCL & ~(dSCL))) begin
            dout <= sSDA;
        end
    end
    always @(posedge clk or negedge nReset) begin
        if (!(nReset)) begin
            c_state <= 18'd0;
            cmd_ack <= 1'b0;
            scl_oen <= 1'b1;
            sda_oen <= 1'b1;
            sda_chk <= 1'b0;
        end
        else if (al) begin
            c_state <= 18'd0;
            cmd_ack <= 1'b0;
            scl_oen <= 1'b1;
            sda_oen <= 1'b1;
            sda_chk <= 1'b0;
        end
        else begin
            cmd_ack <= 1'b0;
            if (clk_en) begin
                case (c_state)  // synopsys full_case parallel_case
                    18'd0: begin
                        case (cmd)  // synopsys full_case parallel_case
                            4'b1: begin
                                c_state <= 18'd1;
                            end
                            4'b10: begin
                                c_state <= 18'd32;
                            end
                            4'b100: begin
                                c_state <= 18'd8192;
                            end
                            4'b1000: begin
                                c_state <= 18'd512;
                            end
                            default: begin
                                c_state <= 18'd0;
                            end
                        endcase
                        scl_oen <= scl_oen;
                        sda_oen <= sda_oen;
                        sda_chk <= 1'b0;
                    end
                    18'd1: begin
                        c_state <= 18'd2;
                        scl_oen <= scl_oen;
                        sda_oen <= 1'b1;
                        sda_chk <= 1'b0;
                    end
                    18'd2: begin
                        c_state <= 18'd4;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b1;
                        sda_chk <= 1'b0;
                    end
                    18'd4: begin
                        c_state <= 18'd8;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b0;
                        sda_chk <= 1'b0;
                    end
                    18'd8: begin
                        c_state <= 18'd16;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b0;
                        sda_chk <= 1'b0;
                    end
                    18'd16: begin
                        c_state <= 18'd0;
                        cmd_ack <= 1'b1;
                        scl_oen <= 1'b0;
                        sda_oen <= 1'b0;
                        sda_chk <= 1'b0;
                    end
                    18'd32: begin
                        c_state <= 18'd64;
                        scl_oen <= 1'b0;
                        sda_oen <= 1'b0;
                        sda_chk <= 1'b0;
                    end
                    18'd64: begin
                        c_state <= 18'd128;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b0;
                        sda_chk <= 1'b0;
                    end
                    18'd128: begin
                        c_state <= 18'd256;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b0;
                        sda_chk <= 1'b0;
                    end
                    18'd256: begin
                        c_state <= 18'd0;
                        cmd_ack <= 1'b1;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b1;
                        sda_chk <= 1'b0;
                    end
                    18'd512: begin
                        c_state <= 18'd1024;
                        scl_oen <= 1'b0;
                        sda_oen <= 1'b1;
                        sda_chk <= 1'b0;
                    end
                    18'd1024: begin
                        c_state <= 18'd2048;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b1;
                        sda_chk <= 1'b0;
                    end
                    18'd2048: begin
                        c_state <= 18'd4096;
                        scl_oen <= 1'b1;
                        sda_oen <= 1'b1;
                        sda_chk <= 1'b0;
                    end
                    18'd4096: begin
                        c_state <= 18'd0;
                        cmd_ack <= 1'b1;
                        scl_oen <= 1'b0;
                        sda_oen <= 1'b1;
                        sda_chk <= 1'b0;
                    end
                    18'd8192: begin
                        c_state <= 18'd16384;
                        scl_oen <= 1'b0;
                        sda_oen <= din;
                        sda_chk <= 1'b0;
                    end
                    18'd16384: begin
                        c_state <= 18'd32768;
                        scl_oen <= 1'b1;
                        sda_oen <= din;
                        sda_chk <= 1'b1;
                    end
                    18'd32768: begin
                        c_state <= 18'd65536;
                        scl_oen <= 1'b1;
                        sda_oen <= din;
                        sda_chk <= 1'b1;
                    end
                    18'd65536: begin
                        c_state <= 18'd0;
                        cmd_ack <= 1'b1;
                        scl_oen <= 1'b0;
                        sda_oen <= din;
                        sda_chk <= 1'b0;
                    end
                endcase
            end
        end
    end
    assign scl_o = 1'b0;
    assign sda_o = 1'b0;
endmodule
