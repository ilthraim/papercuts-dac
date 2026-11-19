module multiclock_reader_writer (
    input logic clock_reader_head,
    input logic clock_writer_head,
    input logic in,
    output reg out
);
    reg[2:0] reader_head;
    reg [1:0] writer_head;
    reg [3:0] register;
    always @(posedge clock_reader_head) begin
        case (reader_head)
            0: begin
                register[0] <= in;
            end
            1: begin
                register[1] <= in;
            end
            2: begin
                register[2] <= in;
            end
            3: begin
                register[3] <= in;
            end
            4: begin
                begin end
            end
            5: begin
                begin end
            end
            6: begin
                begin end
            end
            7: begin
                begin end
            end
        endcase begin
            reader_head <= (reader_head + 1);
        end
    end
    always @(posedge clock_writer_head) begin
        case (writer_head)
            0: begin
                out <= register[0];
            end
            1: begin
                out <= register[1];
            end
            2: begin
                out <= register[2];
            end
            3: begin
                out <= register[3];
            end
            4: begin
                out <= register[0];
            end
            5: begin
                out <= register[1];
            end
            6: begin
                out <= register[2];
            end
            7: begin
                out <= register[3];
            end
        endcase begin
            writer_head <= (writer_head + 1);
        end
    end
endmodule