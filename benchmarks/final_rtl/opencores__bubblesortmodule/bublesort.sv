module bublesort #(
    parameter logic signed[31:0] N_BITS = 8,
    parameter logic signed[31:0] K_NUMBERS = 49
) (
    input logic clk,
    input logic rst,
    input logic[48:0] load_i,
    input logic[391:0] writedata_i,
    output logic[391:0] readdata_o,
    input logic start_i,
    output logic done_o,
    output logic interrupt_o,
    input logic abort_i
);
    reg[0:1] r_value_66;
    reg[0:1] r_run_late_66;
    wire logic w_runback;
    wire logic w_swapback;
    wire logic w_done;
    wire logic w_interrupt;
    wire logic[50:0] w_run_up;
    wire logic[49:0] w_swap_up;
    wire logic[49:0] w_bit_up;
    wire logic[49:0] w_value_down;
    wire logic w_run;
    bublesort_run_module #(
        .N_BITS(8)
    ) run_module (
        .clk(clk),
        .rst(rst),
        .start_i(start_i),
        .all_sorted_i(w_done),
        .run_o(w_run)
    );
    bublesort_interrupt_module #(
        .N_BITS(8),
        .K_NUMBERS(49)
    ) interrupt_module (
        .clk(clk),
        .rst(rst),
        .run_i(w_runback),
        .swap_i(w_swapback),
        .done_o(w_done),
        .interrupt_o(w_interrupt)
    );
    bublesort_STAGEN_0_stage #(
        .N_BITS(8)
    ) STAGEN_0_stage (
        .clk(clk),
        .load(load_i[0]),
        .data_i(writedata_i[7:0]),
        .data_o(readdata_o[7:0]),
        .swap_i(w_swap_up[0]),
        .swap_o(w_swap_up[1]),
        .run_i(w_run_up[0]),
        .run_late_i(w_run_up[2]),
        .run_o(w_run_up[1]),
        .bit_i(w_bit_up[0]),
        .bit_o(w_bit_up[1]),
        .value_i(w_value_down[1]),
        .value_o(w_value_down[0])
    );
    bublesort_STAGEN_1_stage #(
        .N_BITS(8)
    ) STAGEN_1_stage (
        .clk(clk),
        .load(load_i[1]),
        .data_i(writedata_i[15:8]),
        .data_o(readdata_o[15:8]),
        .swap_i(w_swap_up[1]),
        .swap_o(w_swap_up[2]),
        .run_i(w_run_up[1]),
        .run_late_i(w_run_up[3]),
        .run_o(w_run_up[2]),
        .bit_i(w_bit_up[1]),
        .bit_o(w_bit_up[2]),
        .value_i(w_value_down[2]),
        .value_o(w_value_down[1])
    );
    bublesort_STAGEN_2_stage #(
        .N_BITS(8)
    ) STAGEN_2_stage (
        .clk(clk),
        .load(load_i[2]),
        .data_i(writedata_i[23:16]),
        .data_o(readdata_o[23:16]),
        .swap_i(w_swap_up[2]),
        .swap_o(w_swap_up[3]),
        .run_i(w_run_up[2]),
        .run_late_i(w_run_up[4]),
        .run_o(w_run_up[3]),
        .bit_i(w_bit_up[2]),
        .bit_o(w_bit_up[3]),
        .value_i(w_value_down[3]),
        .value_o(w_value_down[2])
    );
    bublesort_STAGEN_3_stage #(
        .N_BITS(8)
    ) STAGEN_3_stage (
        .clk(clk),
        .load(load_i[3]),
        .data_i(writedata_i[31:24]),
        .data_o(readdata_o[31:24]),
        .swap_i(w_swap_up[3]),
        .swap_o(w_swap_up[4]),
        .run_i(w_run_up[3]),
        .run_late_i(w_run_up[5]),
        .run_o(w_run_up[4]),
        .bit_i(w_bit_up[3]),
        .bit_o(w_bit_up[4]),
        .value_i(w_value_down[4]),
        .value_o(w_value_down[3])
    );
    bublesort_STAGEN_4_stage #(
        .N_BITS(8)
    ) STAGEN_4_stage (
        .clk(clk),
        .load(load_i[4]),
        .data_i(writedata_i[39:32]),
        .data_o(readdata_o[39:32]),
        .swap_i(w_swap_up[4]),
        .swap_o(w_swap_up[5]),
        .run_i(w_run_up[4]),
        .run_late_i(w_run_up[6]),
        .run_o(w_run_up[5]),
        .bit_i(w_bit_up[4]),
        .bit_o(w_bit_up[5]),
        .value_i(w_value_down[5]),
        .value_o(w_value_down[4])
    );
    bublesort_STAGEN_5_stage #(
        .N_BITS(8)
    ) STAGEN_5_stage (
        .clk(clk),
        .load(load_i[5]),
        .data_i(writedata_i[47:40]),
        .data_o(readdata_o[47:40]),
        .swap_i(w_swap_up[5]),
        .swap_o(w_swap_up[6]),
        .run_i(w_run_up[5]),
        .run_late_i(w_run_up[7]),
        .run_o(w_run_up[6]),
        .bit_i(w_bit_up[5]),
        .bit_o(w_bit_up[6]),
        .value_i(w_value_down[6]),
        .value_o(w_value_down[5])
    );
    bublesort_STAGEN_6_stage #(
        .N_BITS(8)
    ) STAGEN_6_stage (
        .clk(clk),
        .load(load_i[6]),
        .data_i(writedata_i[55:48]),
        .data_o(readdata_o[55:48]),
        .swap_i(w_swap_up[6]),
        .swap_o(w_swap_up[7]),
        .run_i(w_run_up[6]),
        .run_late_i(w_run_up[8]),
        .run_o(w_run_up[7]),
        .bit_i(w_bit_up[6]),
        .bit_o(w_bit_up[7]),
        .value_i(w_value_down[7]),
        .value_o(w_value_down[6])
    );
    bublesort_STAGEN_7_stage #(
        .N_BITS(8)
    ) STAGEN_7_stage (
        .clk(clk),
        .load(load_i[7]),
        .data_i(writedata_i[63:56]),
        .data_o(readdata_o[63:56]),
        .swap_i(w_swap_up[7]),
        .swap_o(w_swap_up[8]),
        .run_i(w_run_up[7]),
        .run_late_i(w_run_up[9]),
        .run_o(w_run_up[8]),
        .bit_i(w_bit_up[7]),
        .bit_o(w_bit_up[8]),
        .value_i(w_value_down[8]),
        .value_o(w_value_down[7])
    );
    bublesort_STAGEN_8_stage #(
        .N_BITS(8)
    ) STAGEN_8_stage (
        .clk(clk),
        .load(load_i[8]),
        .data_i(writedata_i[71:64]),
        .data_o(readdata_o[71:64]),
        .swap_i(w_swap_up[8]),
        .swap_o(w_swap_up[9]),
        .run_i(w_run_up[8]),
        .run_late_i(w_run_up[10]),
        .run_o(w_run_up[9]),
        .bit_i(w_bit_up[8]),
        .bit_o(w_bit_up[9]),
        .value_i(w_value_down[9]),
        .value_o(w_value_down[8])
    );
    bublesort_STAGEN_9_stage #(
        .N_BITS(8)
    ) STAGEN_9_stage (
        .clk(clk),
        .load(load_i[9]),
        .data_i(writedata_i[79:72]),
        .data_o(readdata_o[79:72]),
        .swap_i(w_swap_up[9]),
        .swap_o(w_swap_up[10]),
        .run_i(w_run_up[9]),
        .run_late_i(w_run_up[11]),
        .run_o(w_run_up[10]),
        .bit_i(w_bit_up[9]),
        .bit_o(w_bit_up[10]),
        .value_i(w_value_down[10]),
        .value_o(w_value_down[9])
    );
    bublesort_STAGEN_10_stage #(
        .N_BITS(8)
    ) STAGEN_10_stage (
        .clk(clk),
        .load(load_i[10]),
        .data_i(writedata_i[87:80]),
        .data_o(readdata_o[87:80]),
        .swap_i(w_swap_up[10]),
        .swap_o(w_swap_up[11]),
        .run_i(w_run_up[10]),
        .run_late_i(w_run_up[12]),
        .run_o(w_run_up[11]),
        .bit_i(w_bit_up[10]),
        .bit_o(w_bit_up[11]),
        .value_i(w_value_down[11]),
        .value_o(w_value_down[10])
    );
    bublesort_STAGEN_11_stage #(
        .N_BITS(8)
    ) STAGEN_11_stage (
        .clk(clk),
        .load(load_i[11]),
        .data_i(writedata_i[95:88]),
        .data_o(readdata_o[95:88]),
        .swap_i(w_swap_up[11]),
        .swap_o(w_swap_up[12]),
        .run_i(w_run_up[11]),
        .run_late_i(w_run_up[13]),
        .run_o(w_run_up[12]),
        .bit_i(w_bit_up[11]),
        .bit_o(w_bit_up[12]),
        .value_i(w_value_down[12]),
        .value_o(w_value_down[11])
    );
    bublesort_STAGEN_12_stage #(
        .N_BITS(8)
    ) STAGEN_12_stage (
        .clk(clk),
        .load(load_i[12]),
        .data_i(writedata_i[103:96]),
        .data_o(readdata_o[103:96]),
        .swap_i(w_swap_up[12]),
        .swap_o(w_swap_up[13]),
        .run_i(w_run_up[12]),
        .run_late_i(w_run_up[14]),
        .run_o(w_run_up[13]),
        .bit_i(w_bit_up[12]),
        .bit_o(w_bit_up[13]),
        .value_i(w_value_down[13]),
        .value_o(w_value_down[12])
    );
    bublesort_STAGEN_13_stage #(
        .N_BITS(8)
    ) STAGEN_13_stage (
        .clk(clk),
        .load(load_i[13]),
        .data_i(writedata_i[111:104]),
        .data_o(readdata_o[111:104]),
        .swap_i(w_swap_up[13]),
        .swap_o(w_swap_up[14]),
        .run_i(w_run_up[13]),
        .run_late_i(w_run_up[15]),
        .run_o(w_run_up[14]),
        .bit_i(w_bit_up[13]),
        .bit_o(w_bit_up[14]),
        .value_i(w_value_down[14]),
        .value_o(w_value_down[13])
    );
    bublesort_STAGEN_14_stage #(
        .N_BITS(8)
    ) STAGEN_14_stage (
        .clk(clk),
        .load(load_i[14]),
        .data_i(writedata_i[119:112]),
        .data_o(readdata_o[119:112]),
        .swap_i(w_swap_up[14]),
        .swap_o(w_swap_up[15]),
        .run_i(w_run_up[14]),
        .run_late_i(w_run_up[16]),
        .run_o(w_run_up[15]),
        .bit_i(w_bit_up[14]),
        .bit_o(w_bit_up[15]),
        .value_i(w_value_down[15]),
        .value_o(w_value_down[14])
    );
    bublesort_STAGEN_15_stage #(
        .N_BITS(8)
    ) STAGEN_15_stage (
        .clk(clk),
        .load(load_i[15]),
        .data_i(writedata_i[127:120]),
        .data_o(readdata_o[127:120]),
        .swap_i(w_swap_up[15]),
        .swap_o(w_swap_up[16]),
        .run_i(w_run_up[15]),
        .run_late_i(w_run_up[17]),
        .run_o(w_run_up[16]),
        .bit_i(w_bit_up[15]),
        .bit_o(w_bit_up[16]),
        .value_i(w_value_down[16]),
        .value_o(w_value_down[15])
    );
    bublesort_STAGEN_16_stage #(
        .N_BITS(8)
    ) STAGEN_16_stage (
        .clk(clk),
        .load(load_i[16]),
        .data_i(writedata_i[135:128]),
        .data_o(readdata_o[135:128]),
        .swap_i(w_swap_up[16]),
        .swap_o(w_swap_up[17]),
        .run_i(w_run_up[16]),
        .run_late_i(w_run_up[18]),
        .run_o(w_run_up[17]),
        .bit_i(w_bit_up[16]),
        .bit_o(w_bit_up[17]),
        .value_i(w_value_down[17]),
        .value_o(w_value_down[16])
    );
    bublesort_STAGEN_17_stage #(
        .N_BITS(8)
    ) STAGEN_17_stage (
        .clk(clk),
        .load(load_i[17]),
        .data_i(writedata_i[143:136]),
        .data_o(readdata_o[143:136]),
        .swap_i(w_swap_up[17]),
        .swap_o(w_swap_up[18]),
        .run_i(w_run_up[17]),
        .run_late_i(w_run_up[19]),
        .run_o(w_run_up[18]),
        .bit_i(w_bit_up[17]),
        .bit_o(w_bit_up[18]),
        .value_i(w_value_down[18]),
        .value_o(w_value_down[17])
    );
    bublesort_STAGEN_18_stage #(
        .N_BITS(8)
    ) STAGEN_18_stage (
        .clk(clk),
        .load(load_i[18]),
        .data_i(writedata_i[151:144]),
        .data_o(readdata_o[151:144]),
        .swap_i(w_swap_up[18]),
        .swap_o(w_swap_up[19]),
        .run_i(w_run_up[18]),
        .run_late_i(w_run_up[20]),
        .run_o(w_run_up[19]),
        .bit_i(w_bit_up[18]),
        .bit_o(w_bit_up[19]),
        .value_i(w_value_down[19]),
        .value_o(w_value_down[18])
    );
    bublesort_STAGEN_19_stage #(
        .N_BITS(8)
    ) STAGEN_19_stage (
        .clk(clk),
        .load(load_i[19]),
        .data_i(writedata_i[159:152]),
        .data_o(readdata_o[159:152]),
        .swap_i(w_swap_up[19]),
        .swap_o(w_swap_up[20]),
        .run_i(w_run_up[19]),
        .run_late_i(w_run_up[21]),
        .run_o(w_run_up[20]),
        .bit_i(w_bit_up[19]),
        .bit_o(w_bit_up[20]),
        .value_i(w_value_down[20]),
        .value_o(w_value_down[19])
    );
    bublesort_STAGEN_20_stage #(
        .N_BITS(8)
    ) STAGEN_20_stage (
        .clk(clk),
        .load(load_i[20]),
        .data_i(writedata_i[167:160]),
        .data_o(readdata_o[167:160]),
        .swap_i(w_swap_up[20]),
        .swap_o(w_swap_up[21]),
        .run_i(w_run_up[20]),
        .run_late_i(w_run_up[22]),
        .run_o(w_run_up[21]),
        .bit_i(w_bit_up[20]),
        .bit_o(w_bit_up[21]),
        .value_i(w_value_down[21]),
        .value_o(w_value_down[20])
    );
    bublesort_STAGEN_21_stage #(
        .N_BITS(8)
    ) STAGEN_21_stage (
        .clk(clk),
        .load(load_i[21]),
        .data_i(writedata_i[175:168]),
        .data_o(readdata_o[175:168]),
        .swap_i(w_swap_up[21]),
        .swap_o(w_swap_up[22]),
        .run_i(w_run_up[21]),
        .run_late_i(w_run_up[23]),
        .run_o(w_run_up[22]),
        .bit_i(w_bit_up[21]),
        .bit_o(w_bit_up[22]),
        .value_i(w_value_down[22]),
        .value_o(w_value_down[21])
    );
    bublesort_STAGEN_22_stage #(
        .N_BITS(8)
    ) STAGEN_22_stage (
        .clk(clk),
        .load(load_i[22]),
        .data_i(writedata_i[183:176]),
        .data_o(readdata_o[183:176]),
        .swap_i(w_swap_up[22]),
        .swap_o(w_swap_up[23]),
        .run_i(w_run_up[22]),
        .run_late_i(w_run_up[24]),
        .run_o(w_run_up[23]),
        .bit_i(w_bit_up[22]),
        .bit_o(w_bit_up[23]),
        .value_i(w_value_down[23]),
        .value_o(w_value_down[22])
    );
    bublesort_STAGEN_23_stage #(
        .N_BITS(8)
    ) STAGEN_23_stage (
        .clk(clk),
        .load(load_i[23]),
        .data_i(writedata_i[191:184]),
        .data_o(readdata_o[191:184]),
        .swap_i(w_swap_up[23]),
        .swap_o(w_swap_up[24]),
        .run_i(w_run_up[23]),
        .run_late_i(w_run_up[25]),
        .run_o(w_run_up[24]),
        .bit_i(w_bit_up[23]),
        .bit_o(w_bit_up[24]),
        .value_i(w_value_down[24]),
        .value_o(w_value_down[23])
    );
    bublesort_STAGEN_24_stage #(
        .N_BITS(8)
    ) STAGEN_24_stage (
        .clk(clk),
        .load(load_i[24]),
        .data_i(writedata_i[199:192]),
        .data_o(readdata_o[199:192]),
        .swap_i(w_swap_up[24]),
        .swap_o(w_swap_up[25]),
        .run_i(w_run_up[24]),
        .run_late_i(w_run_up[26]),
        .run_o(w_run_up[25]),
        .bit_i(w_bit_up[24]),
        .bit_o(w_bit_up[25]),
        .value_i(w_value_down[25]),
        .value_o(w_value_down[24])
    );
    bublesort_STAGEN_25_stage #(
        .N_BITS(8)
    ) STAGEN_25_stage (
        .clk(clk),
        .load(load_i[25]),
        .data_i(writedata_i[207:200]),
        .data_o(readdata_o[207:200]),
        .swap_i(w_swap_up[25]),
        .swap_o(w_swap_up[26]),
        .run_i(w_run_up[25]),
        .run_late_i(w_run_up[27]),
        .run_o(w_run_up[26]),
        .bit_i(w_bit_up[25]),
        .bit_o(w_bit_up[26]),
        .value_i(w_value_down[26]),
        .value_o(w_value_down[25])
    );
    bublesort_STAGEN_26_stage #(
        .N_BITS(8)
    ) STAGEN_26_stage (
        .clk(clk),
        .load(load_i[26]),
        .data_i(writedata_i[215:208]),
        .data_o(readdata_o[215:208]),
        .swap_i(w_swap_up[26]),
        .swap_o(w_swap_up[27]),
        .run_i(w_run_up[26]),
        .run_late_i(w_run_up[28]),
        .run_o(w_run_up[27]),
        .bit_i(w_bit_up[26]),
        .bit_o(w_bit_up[27]),
        .value_i(w_value_down[27]),
        .value_o(w_value_down[26])
    );
    bublesort_STAGEN_27_stage #(
        .N_BITS(8)
    ) STAGEN_27_stage (
        .clk(clk),
        .load(load_i[27]),
        .data_i(writedata_i[223:216]),
        .data_o(readdata_o[223:216]),
        .swap_i(w_swap_up[27]),
        .swap_o(w_swap_up[28]),
        .run_i(w_run_up[27]),
        .run_late_i(w_run_up[29]),
        .run_o(w_run_up[28]),
        .bit_i(w_bit_up[27]),
        .bit_o(w_bit_up[28]),
        .value_i(w_value_down[28]),
        .value_o(w_value_down[27])
    );
    bublesort_STAGEN_28_stage #(
        .N_BITS(8)
    ) STAGEN_28_stage (
        .clk(clk),
        .load(load_i[28]),
        .data_i(writedata_i[231:224]),
        .data_o(readdata_o[231:224]),
        .swap_i(w_swap_up[28]),
        .swap_o(w_swap_up[29]),
        .run_i(w_run_up[28]),
        .run_late_i(w_run_up[30]),
        .run_o(w_run_up[29]),
        .bit_i(w_bit_up[28]),
        .bit_o(w_bit_up[29]),
        .value_i(w_value_down[29]),
        .value_o(w_value_down[28])
    );
    bublesort_STAGEN_29_stage #(
        .N_BITS(8)
    ) STAGEN_29_stage (
        .clk(clk),
        .load(load_i[29]),
        .data_i(writedata_i[239:232]),
        .data_o(readdata_o[239:232]),
        .swap_i(w_swap_up[29]),
        .swap_o(w_swap_up[30]),
        .run_i(w_run_up[29]),
        .run_late_i(w_run_up[31]),
        .run_o(w_run_up[30]),
        .bit_i(w_bit_up[29]),
        .bit_o(w_bit_up[30]),
        .value_i(w_value_down[30]),
        .value_o(w_value_down[29])
    );
    bublesort_STAGEN_30_stage #(
        .N_BITS(8)
    ) STAGEN_30_stage (
        .clk(clk),
        .load(load_i[30]),
        .data_i(writedata_i[247:240]),
        .data_o(readdata_o[247:240]),
        .swap_i(w_swap_up[30]),
        .swap_o(w_swap_up[31]),
        .run_i(w_run_up[30]),
        .run_late_i(w_run_up[32]),
        .run_o(w_run_up[31]),
        .bit_i(w_bit_up[30]),
        .bit_o(w_bit_up[31]),
        .value_i(w_value_down[31]),
        .value_o(w_value_down[30])
    );
    bublesort_STAGEN_31_stage #(
        .N_BITS(8)
    ) STAGEN_31_stage (
        .clk(clk),
        .load(load_i[31]),
        .data_i(writedata_i[255:248]),
        .data_o(readdata_o[255:248]),
        .swap_i(w_swap_up[31]),
        .swap_o(w_swap_up[32]),
        .run_i(w_run_up[31]),
        .run_late_i(w_run_up[33]),
        .run_o(w_run_up[32]),
        .bit_i(w_bit_up[31]),
        .bit_o(w_bit_up[32]),
        .value_i(w_value_down[32]),
        .value_o(w_value_down[31])
    );
    bublesort_STAGEN_32_stage #(
        .N_BITS(8)
    ) STAGEN_32_stage (
        .clk(clk),
        .load(load_i[32]),
        .data_i(writedata_i[263:256]),
        .data_o(readdata_o[263:256]),
        .swap_i(w_swap_up[32]),
        .swap_o(w_swap_up[33]),
        .run_i(w_run_up[32]),
        .run_late_i(w_run_up[34]),
        .run_o(w_run_up[33]),
        .bit_i(w_bit_up[32]),
        .bit_o(w_bit_up[33]),
        .value_i(w_value_down[33]),
        .value_o(w_value_down[32])
    );
    bublesort_STAGEN_33_stage #(
        .N_BITS(8)
    ) STAGEN_33_stage (
        .clk(clk),
        .load(load_i[33]),
        .data_i(writedata_i[271:264]),
        .data_o(readdata_o[271:264]),
        .swap_i(w_swap_up[33]),
        .swap_o(w_swap_up[34]),
        .run_i(w_run_up[33]),
        .run_late_i(w_run_up[35]),
        .run_o(w_run_up[34]),
        .bit_i(w_bit_up[33]),
        .bit_o(w_bit_up[34]),
        .value_i(w_value_down[34]),
        .value_o(w_value_down[33])
    );
    bublesort_STAGEN_34_stage #(
        .N_BITS(8)
    ) STAGEN_34_stage (
        .clk(clk),
        .load(load_i[34]),
        .data_i(writedata_i[279:272]),
        .data_o(readdata_o[279:272]),
        .swap_i(w_swap_up[34]),
        .swap_o(w_swap_up[35]),
        .run_i(w_run_up[34]),
        .run_late_i(w_run_up[36]),
        .run_o(w_run_up[35]),
        .bit_i(w_bit_up[34]),
        .bit_o(w_bit_up[35]),
        .value_i(w_value_down[35]),
        .value_o(w_value_down[34])
    );
    bublesort_STAGEN_35_stage #(
        .N_BITS(8)
    ) STAGEN_35_stage (
        .clk(clk),
        .load(load_i[35]),
        .data_i(writedata_i[287:280]),
        .data_o(readdata_o[287:280]),
        .swap_i(w_swap_up[35]),
        .swap_o(w_swap_up[36]),
        .run_i(w_run_up[35]),
        .run_late_i(w_run_up[37]),
        .run_o(w_run_up[36]),
        .bit_i(w_bit_up[35]),
        .bit_o(w_bit_up[36]),
        .value_i(w_value_down[36]),
        .value_o(w_value_down[35])
    );
    bublesort_STAGEN_36_stage #(
        .N_BITS(8)
    ) STAGEN_36_stage (
        .clk(clk),
        .load(load_i[36]),
        .data_i(writedata_i[295:288]),
        .data_o(readdata_o[295:288]),
        .swap_i(w_swap_up[36]),
        .swap_o(w_swap_up[37]),
        .run_i(w_run_up[36]),
        .run_late_i(w_run_up[38]),
        .run_o(w_run_up[37]),
        .bit_i(w_bit_up[36]),
        .bit_o(w_bit_up[37]),
        .value_i(w_value_down[37]),
        .value_o(w_value_down[36])
    );
    bublesort_STAGEN_37_stage #(
        .N_BITS(8)
    ) STAGEN_37_stage (
        .clk(clk),
        .load(load_i[37]),
        .data_i(writedata_i[303:296]),
        .data_o(readdata_o[303:296]),
        .swap_i(w_swap_up[37]),
        .swap_o(w_swap_up[38]),
        .run_i(w_run_up[37]),
        .run_late_i(w_run_up[39]),
        .run_o(w_run_up[38]),
        .bit_i(w_bit_up[37]),
        .bit_o(w_bit_up[38]),
        .value_i(w_value_down[38]),
        .value_o(w_value_down[37])
    );
    bublesort_STAGEN_38_stage #(
        .N_BITS(8)
    ) STAGEN_38_stage (
        .clk(clk),
        .load(load_i[38]),
        .data_i(writedata_i[311:304]),
        .data_o(readdata_o[311:304]),
        .swap_i(w_swap_up[38]),
        .swap_o(w_swap_up[39]),
        .run_i(w_run_up[38]),
        .run_late_i(w_run_up[40]),
        .run_o(w_run_up[39]),
        .bit_i(w_bit_up[38]),
        .bit_o(w_bit_up[39]),
        .value_i(w_value_down[39]),
        .value_o(w_value_down[38])
    );
    bublesort_STAGEN_39_stage #(
        .N_BITS(8)
    ) STAGEN_39_stage (
        .clk(clk),
        .load(load_i[39]),
        .data_i(writedata_i[319:312]),
        .data_o(readdata_o[319:312]),
        .swap_i(w_swap_up[39]),
        .swap_o(w_swap_up[40]),
        .run_i(w_run_up[39]),
        .run_late_i(w_run_up[41]),
        .run_o(w_run_up[40]),
        .bit_i(w_bit_up[39]),
        .bit_o(w_bit_up[40]),
        .value_i(w_value_down[40]),
        .value_o(w_value_down[39])
    );
    bublesort_STAGEN_40_stage #(
        .N_BITS(8)
    ) STAGEN_40_stage (
        .clk(clk),
        .load(load_i[40]),
        .data_i(writedata_i[327:320]),
        .data_o(readdata_o[327:320]),
        .swap_i(w_swap_up[40]),
        .swap_o(w_swap_up[41]),
        .run_i(w_run_up[40]),
        .run_late_i(w_run_up[42]),
        .run_o(w_run_up[41]),
        .bit_i(w_bit_up[40]),
        .bit_o(w_bit_up[41]),
        .value_i(w_value_down[41]),
        .value_o(w_value_down[40])
    );
    bublesort_STAGEN_41_stage #(
        .N_BITS(8)
    ) STAGEN_41_stage (
        .clk(clk),
        .load(load_i[41]),
        .data_i(writedata_i[335:328]),
        .data_o(readdata_o[335:328]),
        .swap_i(w_swap_up[41]),
        .swap_o(w_swap_up[42]),
        .run_i(w_run_up[41]),
        .run_late_i(w_run_up[43]),
        .run_o(w_run_up[42]),
        .bit_i(w_bit_up[41]),
        .bit_o(w_bit_up[42]),
        .value_i(w_value_down[42]),
        .value_o(w_value_down[41])
    );
    bublesort_STAGEN_42_stage #(
        .N_BITS(8)
    ) STAGEN_42_stage (
        .clk(clk),
        .load(load_i[42]),
        .data_i(writedata_i[343:336]),
        .data_o(readdata_o[343:336]),
        .swap_i(w_swap_up[42]),
        .swap_o(w_swap_up[43]),
        .run_i(w_run_up[42]),
        .run_late_i(w_run_up[44]),
        .run_o(w_run_up[43]),
        .bit_i(w_bit_up[42]),
        .bit_o(w_bit_up[43]),
        .value_i(w_value_down[43]),
        .value_o(w_value_down[42])
    );
    bublesort_STAGEN_43_stage #(
        .N_BITS(8)
    ) STAGEN_43_stage (
        .clk(clk),
        .load(load_i[43]),
        .data_i(writedata_i[351:344]),
        .data_o(readdata_o[351:344]),
        .swap_i(w_swap_up[43]),
        .swap_o(w_swap_up[44]),
        .run_i(w_run_up[43]),
        .run_late_i(w_run_up[45]),
        .run_o(w_run_up[44]),
        .bit_i(w_bit_up[43]),
        .bit_o(w_bit_up[44]),
        .value_i(w_value_down[44]),
        .value_o(w_value_down[43])
    );
    bublesort_STAGEN_44_stage #(
        .N_BITS(8)
    ) STAGEN_44_stage (
        .clk(clk),
        .load(load_i[44]),
        .data_i(writedata_i[359:352]),
        .data_o(readdata_o[359:352]),
        .swap_i(w_swap_up[44]),
        .swap_o(w_swap_up[45]),
        .run_i(w_run_up[44]),
        .run_late_i(w_run_up[46]),
        .run_o(w_run_up[45]),
        .bit_i(w_bit_up[44]),
        .bit_o(w_bit_up[45]),
        .value_i(w_value_down[45]),
        .value_o(w_value_down[44])
    );
    bublesort_STAGEN_45_stage #(
        .N_BITS(8)
    ) STAGEN_45_stage (
        .clk(clk),
        .load(load_i[45]),
        .data_i(writedata_i[367:360]),
        .data_o(readdata_o[367:360]),
        .swap_i(w_swap_up[45]),
        .swap_o(w_swap_up[46]),
        .run_i(w_run_up[45]),
        .run_late_i(w_run_up[47]),
        .run_o(w_run_up[46]),
        .bit_i(w_bit_up[45]),
        .bit_o(w_bit_up[46]),
        .value_i(w_value_down[46]),
        .value_o(w_value_down[45])
    );
    bublesort_STAGEN_46_stage #(
        .N_BITS(8)
    ) STAGEN_46_stage (
        .clk(clk),
        .load(load_i[46]),
        .data_i(writedata_i[375:368]),
        .data_o(readdata_o[375:368]),
        .swap_i(w_swap_up[46]),
        .swap_o(w_swap_up[47]),
        .run_i(w_run_up[46]),
        .run_late_i(w_run_up[48]),
        .run_o(w_run_up[47]),
        .bit_i(w_bit_up[46]),
        .bit_o(w_bit_up[47]),
        .value_i(w_value_down[47]),
        .value_o(w_value_down[46])
    );
    bublesort_STAGEN_47_stage #(
        .N_BITS(8)
    ) STAGEN_47_stage (
        .clk(clk),
        .load(load_i[47]),
        .data_i(writedata_i[383:376]),
        .data_o(readdata_o[383:376]),
        .swap_i(w_swap_up[47]),
        .swap_o(w_swap_up[48]),
        .run_i(w_run_up[47]),
        .run_late_i(w_run_up[49]),
        .run_o(w_run_up[48]),
        .bit_i(w_bit_up[47]),
        .bit_o(w_bit_up[48]),
        .value_i(w_value_down[48]),
        .value_o(w_value_down[47])
    );
    bublesort_STAGEN_48_stage #(
        .N_BITS(8)
    ) STAGEN_48_stage (
        .clk(clk),
        .load(load_i[48]),
        .data_i(writedata_i[391:384]),
        .data_o(readdata_o[391:384]),
        .swap_i(w_swap_up[48]),
        .swap_o(w_swap_up[49]),
        .run_i(w_run_up[48]),
        .run_late_i(w_run_up[50]),
        .run_o(w_run_up[49]),
        .bit_i(w_bit_up[48]),
        .bit_o(w_bit_up[49]),
        .value_i(w_value_down[49]),
        .value_o(w_value_down[48])
    );
    always @(posedge clk) begin
        r_value_66[0] <= w_bit_up[49];
        r_value_66[1] <= r_value_66[0];
    end
    always @(posedge clk) begin
        r_run_late_66[0] <= w_runback;
        r_run_late_66[1] <= r_run_late_66[0];
    end
    assign w_value_down[49] = r_value_66[1];
    assign w_run_up[50] = r_run_late_66[1];
    assign w_swap_up[0] = 1'b0;
    assign w_bit_up[0] = 1'b0;
    assign w_runback = w_run_up[49];
    assign w_run_up[0] = w_run;
    assign w_swapback = w_swap_up[49];
    assign done_o = w_done;
    assign interrupt_o = w_interrupt;
endmodule