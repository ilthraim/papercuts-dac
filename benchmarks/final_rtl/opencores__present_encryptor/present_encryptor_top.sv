module present_encryptor_top (
    output logic[63:0] data_o,
    input logic[79:0] data_i,
    input logic data_load,
    input logic key_load,
    input logic clk_i
);
    reg[63:0] state;
    reg[4:0] round_counter;
    reg[79:0] key;
    wire logic[63:0] round_key;
    wire logic[63:0] sub_per_input;
    wire logic[63:0] sub_per_output;
    wire logic[79:0] key_update_output;
    present_encryptor_top_present_cipher_sp present_cipher_sp (
        .data_o(sub_per_output),
        .data_i(sub_per_input)
    );
    present_encryptor_top_present_cipher_key_update present_cipher_key_update (
        .data_o(key_update_output),
        .data_i(key),
        .round_counter(round_counter)
    );
    assign round_key = key[79:16];
    assign sub_per_input = (state ^ round_key);
    assign data_o = sub_per_input;
    always @(posedge clk_i) begin
        if (key_load) begin
            key <= data_i;
        end
        else begin
            if (data_load) begin
                state <= data_i[63:0];
                round_counter <= 5'b1;
            end
            else begin
                round_counter <= (round_counter + 1'b1);
                state <= sub_per_output;
                key <= key_update_output;
            end
        end
    end
endmodule