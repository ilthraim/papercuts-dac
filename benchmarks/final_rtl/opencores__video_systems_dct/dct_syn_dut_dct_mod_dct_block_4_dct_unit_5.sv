
module dct_syn_dut_dct_mod_dct_block_4_dct_unit_5 (
    input logic clk,
    input logic ena,
    input logic ddgo,
    input logic[2:0] x,
    input logic[2:0] y,
    input logic[8:1] ddin,
    output logic[11:0] dout
);
    reg[31:0] coef;
    wire logic[23:0] result;
    function logic[31:0] dct_cos_table(input logic[2:0] x, input logic[2:0] y, input logic[2:0] u, input logic[2:0] v);
        case ({v, u})  // synopsys full_case parallel_case
            6'b0: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd536870912;
                    end
                endcase
            end
            6'b1: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                endcase
            end
            6'b10: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd701455650;
                    end
                endcase
            end
            6'b11: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                endcase
            end
            6'b100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd536870912;
                    end
                endcase
            end
            6'b101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                endcase
            end
            6'b110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd290552443;
                    end
                endcase
            end
            6'b111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                endcase
            end
            6'b1000: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                endcase
            end
            6'b1001: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd1032874959;
                    end
                endcase
            end
            6'b1010: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                endcase
            end
            6'b1011: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd875629109;
                    end
                endcase
            end
            6'b1100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                endcase
            end
            6'b1101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd585076665;
                    end
                endcase
            end
            6'b1110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                endcase
            end
            6'b1111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd205451603;
                    end
                endcase
            end
            6'b10000: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd701455650;
                    end
                endcase
            end
            6'b10001: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                endcase
            end
            6'b10010: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd916495974;
                    end
                endcase
            end
            6'b10011: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                endcase
            end
            6'b10100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd701455650;
                    end
                endcase
            end
            6'b10101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                endcase
            end
            6'b10110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd379625062;
                    end
                endcase
            end
            6'b10111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                endcase
            end
            6'b11000: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                endcase
            end
            6'b11001: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd875629109;
                    end
                endcase
            end
            6'b11010: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                endcase
            end
            6'b11011: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd742322515;
                    end
                endcase
            end
            6'b11100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                endcase
            end
            6'b11101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd496004047;
                    end
                endcase
            end
            6'b11110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                endcase
            end
            6'b11111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd174173459;
                    end
                endcase
            end
            6'b100000: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd536870912;
                    end
                endcase
            end
            6'b100001: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                endcase
            end
            6'b100010: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd701455650;
                    end
                endcase
            end
            6'b100011: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                endcase
            end
            6'b100100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3758096385;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd536870911;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd536870912;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3758096384;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd536870912;
                    end
                endcase
            end
            6'b100101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                endcase
            end
            6'b100110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd290552443;
                    end
                endcase
            end
            6'b100111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                endcase
            end
            6'b101000: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                endcase
            end
            6'b101001: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd585076665;
                    end
                endcase
            end
            6'b101010: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                endcase
            end
            6'b101011: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd496004047;
                    end
                endcase
            end
            6'b101100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                endcase
            end
            6'b101101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd331419308;
                    end
                endcase
            end
            6'b101110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                endcase
            end
            6'b101111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd116378984;
                    end
                endcase
            end
            6'b110000: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd290552443;
                    end
                endcase
            end
            6'b110001: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                endcase
            end
            6'b110010: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd379625062;
                    end
                endcase
            end
            6'b110011: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                endcase
            end
            6'b110100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd701455650;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3593511646;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd290552443;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4004414853;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd290552443;
                    end
                endcase
            end
            6'b110101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                endcase
            end
            6'b110110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3378471322;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd916495974;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd157245849;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4137721447;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd379625062;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd3915342234;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd157245849;
                    end
                endcase
            end
            6'b110111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                endcase
            end
            6'b111000: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                endcase
            end
            6'b111001: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd205451603;
                    end
                endcase
            end
            6'b111010: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4101436118;
                    end
                endcase
            end
            6'b111011: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd174173459;
                    end
                endcase
            end
            6'b111100: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3550305950;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd744661346;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd631293407;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3663673889;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3873150528;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd421816768;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4146844945;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd148122351;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4146844945;
                    end
                endcase
            end
            6'b111101: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd116378984;
                    end
                endcase
            end
            6'b111110: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd3891959480;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd972946937;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd3322020359;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd403007816;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd341653529;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd3470142711;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd824824585;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd3953313767;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd4066681706;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd551130168;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd3743837128;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd228285590;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4214804058;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd80163238;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd4101436118;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd193531178;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd4214804058;
                    end
                endcase
            end
            6'b111111: begin
                case ({y, x})  // synopsys full_case parallel_case
                    6'b0: begin
                        dct_cos_table = 32'd40866864;
                    end
                    6'b1: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b10: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b11: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b100: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b101: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b110: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b1000: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b1001: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b1010: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b1011: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b1100: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b1101: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b1110: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b1111: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b10000: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b10001: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b10010: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b10011: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b10100: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b10101: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b10110: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b10111: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b11000: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b11001: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b11010: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b11011: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b11100: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b11101: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b11110: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b11111: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100000: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b100001: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b100010: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b100011: begin
                        dct_cos_table = 32'd3262092337;
                    end
                    6'b100100: begin
                        dct_cos_table = 32'd1032874959;
                    end
                    6'b100101: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b100110: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b100111: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b101000: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b101001: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b101010: begin
                        dct_cos_table = 32'd3552644781;
                    end
                    6'b101011: begin
                        dct_cos_table = 32'd875629109;
                    end
                    6'b101100: begin
                        dct_cos_table = 32'd3419338187;
                    end
                    6'b101101: begin
                        dct_cos_table = 32'd742322515;
                    end
                    6'b101110: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b101111: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b110000: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b110001: begin
                        dct_cos_table = 32'd3963547988;
                    end
                    6'b110010: begin
                        dct_cos_table = 32'd496004047;
                    end
                    6'b110011: begin
                        dct_cos_table = 32'd3709890631;
                    end
                    6'b110100: begin
                        dct_cos_table = 32'd585076665;
                    end
                    6'b110101: begin
                        dct_cos_table = 32'd3798963249;
                    end
                    6'b110110: begin
                        dct_cos_table = 32'd331419308;
                    end
                    6'b110111: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111000: begin
                        dct_cos_table = 32'd4254100432;
                    end
                    6'b111001: begin
                        dct_cos_table = 32'd116378984;
                    end
                    6'b111010: begin
                        dct_cos_table = 32'd4120793837;
                    end
                    6'b111011: begin
                        dct_cos_table = 32'd205451603;
                    end
                    6'b111100: begin
                        dct_cos_table = 32'd4089515693;
                    end
                    6'b111101: begin
                        dct_cos_table = 32'd174173459;
                    end
                    6'b111110: begin
                        dct_cos_table = 32'd4178588312;
                    end
                    6'b111111: begin
                        dct_cos_table = 32'd40866864;
                    end
                endcase
            end
        endcase
    endfunction
    always @(posedge clk) begin begin
            coef <= dct_cos_table(x, y, 3'b101, 3'b100);
        end
    end
    dct_syn_dut_dct_mod_dct_block_4_dct_unit_5_macu macu (
        .clk(clk),
        .ena(ena),
        .dclr(ddgo),
        .din(ddin),
        .coef(coef[31:19]),
        .result(result)
    );
    assign dout = result[23:12];
endmodule