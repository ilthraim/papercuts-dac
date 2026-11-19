
module present_encryptor_top_present_cipher_key_update (
    output logic[79:0] data_o,
    input logic[79:0] data_i,
    input logic[4:0] round_counter
);
    wire logic[79:0] s1;
    wire logic[79:0] s2;
    wire logic[79:0] s3;
    present_encryptor_top_present_cipher_key_update_key_update_sbox key_update_sbox (
        .data_o(s2[79:76]),
        .data_i(s1[79:76])
    );
    assign s1 = {data_i[18:0], data_i[79:19]};
    assign s2[75:0] = s1[75:0];
    assign s3 = {s2[79:20], (s2[19:15] ^ round_counter), s2[14:0]};
    assign data_o = s3;
endmodule