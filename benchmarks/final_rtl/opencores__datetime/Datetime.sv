module Datetime #(
    parameter logic[23:0] pIOAddress = 24'd14418944,
    parameter logic[0:0] pMars = 1'b0
) (
    input logic rst_i,
    input logic clk_i,
    input logic cyc_i,
    input logic stb_i,
    output logic ack_o,
    input logic we_i,
    input logic[7:0] sel_i,
    input logic[23:0] adr_i,
    input logic[63:0] dat_i,
    output reg[63:0] dat_o,
    input logic tod,
    output reg alarm
);
    reg[1:0] tod_freq;
    wire logic[7:0] max_jcnt = ( ((tod_freq == 2'b1) ? 8'd89 : ((tod_freq == 2'b10) ? 8'd73 : 8'd153)));
    reg tod_en;
    reg mars;
    reg snapshot;
    wire logic IsLeapYear;
    wire logic IsDuckYear;
    reg[3:0] dayL;
    reg[3:0] dayH;
    reg[3:0] monthL;
    reg[3:0] monthH;
    reg[3:0] yearN0;
    reg[3:0] yearN1;
    reg[3:0] yearN2;
    reg[3:0] yearN3;
    reg[3:0] jiffyL;
    reg[3:0] secL;
    reg[3:0] minL;
    reg[3:0] hourL;
    reg[3:0] jiffyH;
    reg[3:0] secH;
    reg[3:0] minH;
    reg[3:0] hourH;
    reg[3:0] dayLo;
    reg[3:0] dayHo;
    reg[3:0] monthLo;
    reg[3:0] monthHo;
    reg[3:0] yearN0o;
    reg[3:0] yearN1o;
    reg[3:0] yearN2o;
    reg[3:0] yearN3o;
    reg[3:0] jiffyLo;
    reg[3:0] secLo;
    reg[3:0] minLo;
    reg[3:0] hourLo;
    reg[3:0] jiffyHo;
    reg[3:0] secHo;
    reg[3:0] minHo;
    reg[3:0] hourHo;
    reg[7:0] alarm_care;
    wire logic[63:0] alarm_carex = {{8{alarm_care[7]}}, {8{alarm_care[6]}}, {8{alarm_care[5]}}, {8{alarm_care[4]}}, {8{alarm_care[3]}}, {8{alarm_care[2]}}, {8{alarm_care[1]}}, {8{alarm_care[0]}}};
    reg[3:0] alm_dayL;
    reg[3:0] alm_dayH;
    reg[3:0] alm_monthL;
    reg[3:0] alm_monthH;
    reg[3:0] alm_yearN0;
    reg[3:0] alm_yearN1;
    reg[3:0] alm_yearN2;
    reg[3:0] alm_yearN3;
    reg[3:0] alm_jiffyL;
    reg[3:0] alm_secL;
    reg[3:0] alm_minL;
    reg[3:0] alm_hourL;
    reg[3:0] alm_jiffyH;
    reg[3:0] alm_secH;
    reg[3:0] alm_minH;
    reg[3:0] alm_hourH;
    wire logic incJiffyH = (jiffyL == 4'b1001);
    wire logic incSecL = ({jiffyH, jiffyL} == max_jcnt);
    wire logic incSecH = (incSecL && (secL == 4'b1001));
    wire logic incMinL = (incSecH && (secH == 4'b101));
    wire logic incMinH = (incMinL && (minL == 4'b1001));
    wire logic incHourL = (incMinH && (minH == 4'b101));
    wire logic incHourH = (incHourL && (hourL == 4'b1001));
    wire logic incDayL = (mars ? ({hourH, hourL, minH, minL, secH, secL, jiffyH, jiffyL} == {24'd2373409, max_jcnt}) : ({hourH, hourL, minH, minL, secH, secL, jiffyH, jiffyL} == {24'd2316633, max_jcnt}));
    wire logic incDayH = (incDayL && (dayL == 4'b1001));
    reg incMarsMonth;
    always @(monthH or monthL or dayH or dayL) begin
        case ({monthH, monthL})  // synopsys full_case parallel_case
            8'd1: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd2: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd3: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd4: begin
                incMarsMonth = ({dayH, dayL} == 8'd52);
            end
            8'd5: begin
                incMarsMonth = ({dayH, dayL} == 8'd52);
            end
            8'd6: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd7: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd8: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd9: begin
                incMarsMonth = ({dayH, dayL} == 8'd52);
            end
            8'd16: begin
                incMarsMonth = ({dayH, dayL} == 8'd52);
            end
            8'd17: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd18: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd19: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd20: begin
                incMarsMonth = ({dayH, dayL} == 8'd52);
            end
            8'd21: begin
                incMarsMonth = ({dayH, dayL} == 8'd52);
            end
            8'd22: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd23: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd24: begin
                incMarsMonth = ({dayH, dayL} == 8'd51);
            end
            8'd25: begin
                incMarsMonth = ({dayH, dayL} == 8'd52);
            end
            8'd32: begin
                incMarsMonth = (IsDuckYear ? ({dayH, dayL} == 8'd52) : ({dayH, dayL} == 8'd53));
            end
        endcase
    end
    reg incEarthMonth;
    always @(monthH or monthL or dayH or dayL) begin
        case ({monthH, monthL})  // synopsys full_case parallel_case
            8'd1: begin
                incEarthMonth = ({dayH, dayL} == 8'd49);
            end
            8'd2: begin
                incEarthMonth = (IsLeapYear ? ({dayH, dayL} == 8'd41) : ({dayH, dayL} == 8'd40));
            end
            8'd3: begin
                incEarthMonth = ({dayH, dayL} == 8'd49);
            end
            8'd4: begin
                incEarthMonth = ({dayH, dayL} == 8'd48);
            end
            8'd5: begin
                incEarthMonth = ({dayH, dayL} == 8'd49);
            end
            8'd6: begin
                incEarthMonth = ({dayH, dayL} == 8'd48);
            end
            8'd7: begin
                incEarthMonth = ({dayH, dayL} == 8'd49);
            end
            8'd8: begin
                incEarthMonth = ({dayH, dayL} == 8'd49);
            end
            8'd9: begin
                incEarthMonth = ({dayH, dayL} == 8'd48);
            end
            8'd16: begin
                incEarthMonth = ({dayH, dayL} == 8'd49);
            end
            8'd17: begin
                incEarthMonth = ({dayH, dayL} == 8'd48);
            end
            8'd18: begin
                incEarthMonth = ({dayH, dayL} == 8'd49);
            end
        endcase
    end
    wire logic incMonthL = (incDayL && (mars ? incMarsMonth : incEarthMonth));
    wire logic incMonthH = (incMonthL && (monthL == 4'b1001));
    wire logic incYearN0 = (incMonthL && (mars ? ({monthH, monthL} == 8'd32) : ({monthH, monthL} == 8'd18)));
    wire logic incYearN1 = (incYearN0 && (yearN0 == 4'b1001));
    wire logic incYearN2 = (incYearN1 && (yearN1 == 4'b1001));
    wire logic incYearN3 = (incYearN2 && (yearN2 == 4'b1001));
    wire logic cs = ((cyc_i && stb_i) && (adr_i[23:5] == 19'd450592));
    reg ack1;
    always @(posedge clk_i) begin
        ack1 <= cs;
    end
    assign ack_o = (cs ? (we_i ? 1'b1 : ack1) : 1'b0);
    wire logic tods;
    Datetime_sync0 sync0 (
        .rst(rst_i),
        .clk(clk_i),
        .i(tod),
        .o(tods)
    );
    wire logic tod_edge;
    Datetime_ed_tod ed_tod (
        .rst(rst_i),
        .clk(clk_i),
        .ce(1'b1),
        .i(tods),
        .pe(tod_edge),
        .ne(),
        .ee()
    );
    wire logic isAlarm = (({alm_jiffyH, alm_jiffyL, alm_secH, alm_secL, alm_minH, alm_minL, alm_hourH, alm_hourL, alm_dayH, alm_dayL, alm_monthH, alm_monthL, alm_yearN1, alm_yearN0, alm_yearN3, alm_yearN2} & (alarm_carex == {jiffyH, jiffyL, secH, secL, minH, minL, hourH, hourL, dayH, dayL, monthH, monthL, yearN1, yearN0, yearN3, yearN3})) & alarm_carex);
    reg oalarm;
    always @(posedge clk_i) begin
        if (rst_i) begin
            oalarm <= 1'b0;
            mars <= 1'b0;
            tod_en <= 1'b1;
            tod_freq <= 2'b0;
            jiffyL <= 4'b0;
            jiffyH <= 4'b0;
            secL <= 4'b0;
            secH <= 4'b0;
            minL <= 4'b110;
            minH <= 4'b0;
            hourL <= 4'b11;
            hourH <= 4'b1;
            dayL <= 4'b0;
            dayH <= 4'b1;
            monthL <= 4'b110;
            monthH <= 4'b0;
            yearN0 <= 4'b10;
            yearN1 <= 4'b1;
            yearN2 <= 4'b0;
            yearN3 <= 4'b10;
            alarm_care <= 8'd255;
            alm_jiffyL <= 4'b0;
            alm_jiffyH <= 4'b0;
            alm_secL <= 4'b0;
            alm_secH <= 4'b0;
            alm_minL <= 4'b0;
            alm_minH <= 4'b0;
            alm_hourL <= 4'b0;
            alm_hourH <= 4'b0;
            alm_dayL <= 4'b0;
            alm_dayH <= 4'b0;
            alm_monthL <= 4'b0;
            alm_monthH <= 4'b0;
            alm_yearN0 <= 4'b0;
            alm_yearN1 <= 4'b0;
            alm_yearN2 <= 4'b0;
            alm_yearN3 <= 4'b0;
            snapshot <= 1'b0;
        end
        else begin
            oalarm <= isAlarm;
            snapshot <= 1'b0;
            if ((isAlarm & !(oalarm))) begin
                alarm <= 1'b1;
            end
            if ((cs & we_i)) begin
                case (adr_i[4:3])
                    2'b0: begin
                        if (sel_i[0]) begin
                            jiffyL <= dat_i[3:0];
                            jiffyH <= dat_i[7:4];
                        end
                        if (sel_i[1]) begin
                            secL <= dat_i[3:0];
                            secH <= dat_i[7:4];
                        end
                        if (sel_i[2]) begin
                            minL <= dat_i[3:0];
                            minH <= dat_i[7:4];
                        end
                        if (sel_i[3]) begin
                            hourL <= dat_i[3:0];
                            hourH <= dat_i[7:4];
                        end
                        if (sel_i[4]) begin
                            dayL <= dat_i[3:0];
                            dayH <= dat_i[7:4];
                        end
                        if (sel_i[5]) begin
                            monthL <= dat_i[3:0];
                            monthH <= dat_i[7:4];
                        end
                        if (sel_i[6]) begin
                            yearN0 <= dat_i[3:0];
                            yearN1 <= dat_i[7:4];
                        end
                        if (sel_i[7]) begin
                            yearN2 <= dat_i[3:0];
                            yearN3 <= dat_i[7:4];
                        end
                    end
                    2'b1: begin
                        if (sel_i[0]) begin
                            alm_jiffyL <= dat_i[3:0];
                            alm_jiffyH <= dat_i[7:4];
                        end
                        if (sel_i[1]) begin
                            alm_secL <= dat_i[3:0];
                            alm_secH <= dat_i[7:4];
                        end
                        if (sel_i[2]) begin
                            alm_minL <= dat_i[3:0];
                            alm_minH <= dat_i[7:4];
                        end
                        if (sel_i[3]) begin
                            alm_hourL <= dat_i[3:0];
                            alm_hourH <= dat_i[7:4];
                        end
                        if (sel_i[4]) begin
                            alm_dayL <= dat_i[3:0];
                            alm_dayH <= dat_i[7:4];
                        end
                        if (sel_i[5]) begin
                            alm_monthL <= dat_i[3:0];
                            alm_monthH <= dat_i[7:4];
                        end
                        if (sel_i[6]) begin
                            alm_yearN0 <= dat_i[3:0];
                            alm_yearN1 <= dat_i[7:4];
                        end
                        if (sel_i[7]) begin
                            alm_yearN2 <= dat_i[3:0];
                            alm_yearN3 <= dat_i[7:4];
                        end
                    end
                    2'b10: begin
                        if (sel_i[0]) begin
                            alarm_care <= dat_i[7:0];
                        end
                        if (sel_i[1]) begin
                            tod_en <= dat_i[8];
                            tod_freq <= dat_i[10:9];
                        end
                        if (sel_i[2]) begin
                            mars <= dat_i[16];
                        end
                    end
                    2'b11: begin
                        snapshot <= 1'b1;
                    end
                endcase
            end
            if (cs) begin
                case (adr_i[4:3])
                    2'b0: begin
                        dat_o <= {yearN3o, yearN2o, yearN1o, yearN0o, monthHo, monthLo, dayHo, dayLo, hourHo, hourLo, minHo, minLo, secHo, secLo, jiffyHo, jiffyLo};
                    end
                    2'b1: begin
                        dat_o <= {alm_yearN3, alm_yearN2, alm_yearN1, alm_yearN0, alm_monthH, alm_monthL, alm_dayH, alm_dayL, alm_hourH, alm_hourL, alm_minH, alm_minL, alm_secH, alm_secL, alm_jiffyH, alm_jiffyL};
                        alarm <= 1'b0;
                    end
                    2'b10: begin
                        dat_o <= {mars, 5'b0, tod_freq, tod_en, alarm_care};
                    end
                    2'b11: begin
                        dat_o <= 0;
                    end
                endcase
            end
            else begin
                dat_o <= 64'h0;
            end
            if ((tod_en & tod_edge)) begin
                jiffyL <= (jiffyL + 4'b1);
                if (incJiffyH) begin
                    jiffyL <= 4'b0;
                    jiffyH <= (jiffyH + 4'b1);
                end
                if (incSecL) begin
                    jiffyH <= 4'b0;
                    secL <= (secL + 4'b1);
                end
                if (incSecH) begin
                    secL <= 4'b0;
                    secH <= (secH + 4'b1);
                end
                if (incMinL) begin
                    minL <= (minL + 4'b1);
                    secH <= 4'b0;
                end
                if (incMinH) begin
                    minL <= 4'b0;
                    minH <= (minH + 4'b1);
                end
                if (incHourL) begin
                    minH <= 4'b0;
                    hourL <= (hourL + 4'b1);
                end
                if (incHourH) begin
                    hourL <= 4'b0;
                    hourH <= (hourH + 4'b1);
                end
                if (incDayL) begin
                    dayL <= (dayL + 4'b1);
                    jiffyL <= 4'b0;
                    jiffyH <= 4'b0;
                    secL <= 4'b0;
                    secH <= 4'b0;
                    minL <= 4'b0;
                    minH <= 4'b0;
                    hourL <= 4'b0;
                    hourH <= 4'b0;
                end
                if (incDayH) begin
                    dayL <= 4'b0;
                    dayH <= (dayH + 4'b1);
                end
                if (incMonthL) begin
                    dayL <= 4'b1;
                    dayH <= 4'b0;
                    monthL <= (monthL + 4'b1);
                end
                if (incMonthH) begin
                    monthL <= 4'b0;
                    monthH <= (monthH + 4'b1);
                end
                if (incYearN0) begin
                    monthL <= 4'b1;
                    monthH <= 4'b0;
                end
                if (incYearN1) begin
                    yearN0 <= 4'b0;
                    yearN1 <= (yearN1 + 4'b1);
                end
                if (incYearN2) begin
                    yearN1 <= 4'b0;
                    yearN2 <= (yearN2 + 4'b1);
                end
                if (incYearN3) begin
                    yearN2 <= 4'b0;
                    yearN3 <= (yearN3 + 4'b1);
                end
            end
        end
    end
    always @(posedge clk_i) begin
        if (rst_i) begin
            jiffyLo <= 4'b0;
            jiffyHo <= 4'b0;
            secLo <= 4'b0;
            secHo <= 4'b0;
            minLo <= 4'b0;
            minHo <= 4'b0;
            hourLo <= 4'b0;
            hourHo <= 4'b0;
            dayLo <= 4'b0;
            dayHo <= 4'b0;
            monthLo <= 4'b0;
            monthHo <= 4'b0;
            yearN0o <= 4'b0;
            yearN1o <= 4'b0;
            yearN2o <= 4'b0;
            yearN3o <= 4'b0;
        end
        else if (snapshot) begin
            jiffyLo <= jiffyL;
            jiffyHo <= jiffyH;
            secLo <= secL;
            secHo <= secH;
            minLo <= minL;
            minHo <= minH;
            hourLo <= hourL;
            hourHo <= hourH;
            dayLo <= dayL;
            dayHo <= dayH;
            monthLo <= monthL;
            monthHo <= monthH;
            yearN0o <= yearN0;
            yearN1o <= yearN1;
            yearN2o <= yearN2;
            yearN3o <= yearN3;
        end
    end
    wire logic [1:0] binyear = ((yearN0 + {yearN1, 3'b0}) + {yearN1, 1'b0});
    wire logic [1:0] bincent = (({yearN3, 3'b0} + {yearN3, 1'b0}) + yearN2);
    assign IsLeapYear = ((binyear[1:0] == 2'b0) && (({yearN1, yearN0} != 8'd0) || ((bincent[1:0] == 2'b0))));
    assign IsDuckYear = ((((yearN0 == 4'b1) || (yearN0 == 4'b11)) || (yearN0 == 4'b110)) || (yearN0 == 4'b1000));
endmodule