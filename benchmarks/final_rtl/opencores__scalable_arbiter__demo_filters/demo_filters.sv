module demo_filters (
    input logic in,
    output logic out,
    output logic valid_in,
    output logic valid_out,
    input logic clock,
    input logic reset
);
    wire logic usec_tick;
    wire logic msec_tick;
    wire logic interconnect_sig;
    demo_filters_usec_pulser #(
        .count(39),
        .toggle(0)
    ) usec_pulser (
        .enable(1'b1),
        .out(usec_tick),
        .clock(clock),
        .reset(reset)
    );
    demo_filters_msec_pulser #(
        .count(1000),
        .toggle(0)
    ) msec_pulser (
        .enable(usec_tick),
        .out(msec_tick),
        .clock(clock),
        .reset(reset)
    );
    demo_filters_debouncer #(
        .count(0),
        .high_count(3),
        .low_count(2)
    ) debouncer (
        .enable(msec_tick),
        .in(in),
        .out(interconnect_sig),
        .valid(valid_in),
        .clock(clock),
        .reset(reset)
    );
    demo_filters_stretcher #(
        .count(0),
        .high_count(10),
        .low_count(5)
    ) stretcher (
        .enable(msec_tick),
        .in(interconnect_sig),
        .out(out),
        .valid(valid_out),
        .clock(clock),
        .reset(reset)
    );
endmodule