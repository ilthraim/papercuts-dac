
module present_encryptor_top_present_cipher_sp (
    output logic[63:0] data_o,
    input logic[63:0] data_i
);
    wire logic[63:0] s;
    present_encryptor_top_present_cipher_sp_sub_per_substitution sub_per_substitution (
        .data_o(s),
        .data_i(data_i)
    );
    present_encryptor_top_present_cipher_sp_sub_per_permutation sub_per_permutation (
        .data_o(data_o),
        .data_i(s)
    );
endmodule