
module present_encryptor_top_present_cipher_sp_sub_per_substitution (
    output logic[63:0] data_o,
    input logic[63:0] data_i
);
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_0_substitution_sbox boxes_0_substitution_sbox (
        .data_o(data_o[3:0]),
        .data_i(data_i[3:0])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_1_substitution_sbox boxes_1_substitution_sbox (
        .data_o(data_o[7:4]),
        .data_i(data_i[7:4])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_2_substitution_sbox boxes_2_substitution_sbox (
        .data_o(data_o[11:8]),
        .data_i(data_i[11:8])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_3_substitution_sbox boxes_3_substitution_sbox (
        .data_o(data_o[15:12]),
        .data_i(data_i[15:12])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_4_substitution_sbox boxes_4_substitution_sbox (
        .data_o(data_o[19:16]),
        .data_i(data_i[19:16])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_5_substitution_sbox boxes_5_substitution_sbox (
        .data_o(data_o[23:20]),
        .data_i(data_i[23:20])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_6_substitution_sbox boxes_6_substitution_sbox (
        .data_o(data_o[27:24]),
        .data_i(data_i[27:24])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_7_substitution_sbox boxes_7_substitution_sbox (
        .data_o(data_o[31:28]),
        .data_i(data_i[31:28])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_8_substitution_sbox boxes_8_substitution_sbox (
        .data_o(data_o[35:32]),
        .data_i(data_i[35:32])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_9_substitution_sbox boxes_9_substitution_sbox (
        .data_o(data_o[39:36]),
        .data_i(data_i[39:36])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_10_substitution_sbox boxes_10_substitution_sbox (
        .data_o(data_o[43:40]),
        .data_i(data_i[43:40])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_11_substitution_sbox boxes_11_substitution_sbox (
        .data_o(data_o[47:44]),
        .data_i(data_i[47:44])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_12_substitution_sbox boxes_12_substitution_sbox (
        .data_o(data_o[51:48]),
        .data_i(data_i[51:48])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_13_substitution_sbox boxes_13_substitution_sbox (
        .data_o(data_o[55:52]),
        .data_i(data_i[55:52])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_14_substitution_sbox boxes_14_substitution_sbox (
        .data_o(data_o[59:56]),
        .data_i(data_i[59:56])
    );
    present_encryptor_top_present_cipher_sp_sub_per_substitution_boxes_15_substitution_sbox boxes_15_substitution_sbox (
        .data_o(data_o[63:60]),
        .data_i(data_i[63:60])
    );
endmodule