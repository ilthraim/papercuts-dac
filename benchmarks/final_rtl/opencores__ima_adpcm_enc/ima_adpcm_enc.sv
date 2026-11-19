module ima_adpcm_enc (
    input logic clock,
    input logic reset,
    input logic[15:0] inSamp,
    input logic inValid,
    output reg inReady,
    output reg[3:0] outPCM,
    output reg outValid,
    output logic[15:0] outPredictSamp,
    output logic[6:0] outStepIndex
);
    reg[2:0] pcmSq;
    reg[19:0] sampDiff;
    reg[19:0] prePredSamp;
    reg[18:0] predictorSamp;
    reg[18:0] dequantSamp;
    reg[3:0] prePCM;
    reg[14:0] stepSize;
    reg[6:0] stepIndex;
    reg[4:0] stepDelta;
    wire logic[7:0] preStepIndex;
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            pcmSq <= 3'b0;
            sampDiff <= 20'd0;
            predictorSamp <= 19'd0;
            dequantSamp <= 19'd0;
            prePCM <= 4'b0;
            inReady <= 1'b0;
        end
        else begin
            case (pcmSq)
                3'b0: begin
                    if (inValid) begin
                        sampDiff <= ({inSamp[15], inSamp, 3'b0} - {predictorSamp[18], predictorSamp});
                        inReady <= 1'b0;
                        pcmSq <= 3'b1;
                    end
                    else begin
                        inReady <= 1'b1;
                    end
                end
                3'b1: begin
                    if (sampDiff[19]) begin
                        prePCM[3] <= 1'b1;
                        sampDiff <= (~(sampDiff) + 20'd1);
                    end
                    else begin
                        prePCM[3] <= 1'b0;
                    end
                    dequantSamp <= {4'b0, stepSize};
                    pcmSq <= 3'b10;
                end
                3'b10: begin
                    if ((sampDiff[19:3] >= {2'b0, stepSize})) begin
                        prePCM[2] <= 1'b1;
                        sampDiff[19:3] <= (sampDiff[19:3] - {2'b0, stepSize});
                        dequantSamp <= (dequantSamp + {1'b0, stepSize, 3'b0});
                    end
                    else begin
                        prePCM[2] <= 1'b0;
                    end
                    pcmSq <= 3'b11;
                end
                3'b11: begin
                    if ((sampDiff[19:2] >= {3'b0, stepSize})) begin
                        prePCM[1] <= 1'b1;
                        sampDiff[19:2] <= (sampDiff[19:2] - {3'b0, stepSize});
                        dequantSamp <= (dequantSamp + {2'b0, stepSize, 2'b0});
                    end
                    else begin
                        prePCM[1] <= 1'b0;
                    end
                    pcmSq <= 3'b100;
                end
                3'b100: begin
                    if ((sampDiff[19:1] >= {4'b0, stepSize})) begin
                        prePCM[0] <= 1'b1;
                        dequantSamp <= (dequantSamp + {3'b0, stepSize, 1'b0});
                    end
                    else begin
                        prePCM[0] <= 1'b0;
                    end
                    pcmSq <= 3'b101;
                end
                3'b101: begin
                    if ((prePredSamp[19] && !(prePredSamp[18]))) begin
                        predictorSamp <= 19'd262144;
                    end
                    else if ((!(prePredSamp[19]) && prePredSamp[18])) begin
                        predictorSamp <= 19'd262143;
                    end
                    else begin
                        predictorSamp <= prePredSamp[18:0];
                    end
                    inReady <= 1'b1;
                    pcmSq <= 3'b0;
                end
                default: begin
                    pcmSq <= 3'b0;
                end
            endcase
        end
    end
    assign outPredictSamp = (predictorSamp[18:3] + predictorSamp[2]);
    assign outStepIndex = stepIndex;
    always @(prePCM or predictorSamp or dequantSamp) begin
        if (prePCM[3]) begin
            prePredSamp <= ({predictorSamp[18], predictorSamp} - {1'b0, dequantSamp});
        end
        else begin
            prePredSamp <= ({predictorSamp[18], predictorSamp} + {1'b0, dequantSamp});
        end
    end
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            outPCM <= 4'b0;
            outValid <= 1'b0;
        end
        else if ((pcmSq == 3'b101)) begin
            outPCM <= prePCM;
            outValid <= 1'b1;
        end
        else begin
            outValid <= 1'b0;
        end
    end
    always @(prePCM) begin
        case (prePCM[2:0])
            3'b0: begin
                stepDelta <= 5'b11111;
            end
            3'b1: begin
                stepDelta <= 5'b11111;
            end
            3'b10: begin
                stepDelta <= 5'b11111;
            end
            3'b11: begin
                stepDelta <= 5'b11111;
            end
            3'b100: begin
                stepDelta <= 5'b10;
            end
            3'b101: begin
                stepDelta <= 5'b100;
            end
            3'b110: begin
                stepDelta <= 5'b110;
            end
            3'b111: begin
                stepDelta <= 5'b1000;
            end
        endcase
    end
    assign preStepIndex = ({1'b0, stepIndex} + {{3{stepDelta[4]}}, stepDelta});
    always @(posedge clock or posedge reset) begin
        if (reset) begin
            stepIndex <= 7'b0;
        end
        else if ((pcmSq == 3'b101)) begin
            if (preStepIndex[7]) begin
                stepIndex <= 7'b0;
            end
            else if ((preStepIndex[6:0] > 7'b1011000)) begin
                stepIndex <= 7'b1011000;
            end
            else begin
                stepIndex <= preStepIndex[6:0];
            end
        end
    end
    always @(posedge clock) begin
        case (stepIndex)
            7'b0: begin
                stepSize <= 15'd7;
            end
            7'b1: begin
                stepSize <= 15'd8;
            end
            7'b10: begin
                stepSize <= 15'd9;
            end
            7'b11: begin
                stepSize <= 15'd10;
            end
            7'b100: begin
                stepSize <= 15'd11;
            end
            7'b101: begin
                stepSize <= 15'd12;
            end
            7'b110: begin
                stepSize <= 15'd13;
            end
            7'b111: begin
                stepSize <= 15'd14;
            end
            7'b1000: begin
                stepSize <= 15'd16;
            end
            7'b1001: begin
                stepSize <= 15'd17;
            end
            7'b1010: begin
                stepSize <= 15'd19;
            end
            7'b1011: begin
                stepSize <= 15'd21;
            end
            7'b1100: begin
                stepSize <= 15'd23;
            end
            7'b1101: begin
                stepSize <= 15'd25;
            end
            7'b1110: begin
                stepSize <= 15'd28;
            end
            7'b1111: begin
                stepSize <= 15'd31;
            end
            7'b10000: begin
                stepSize <= 15'd34;
            end
            7'b10001: begin
                stepSize <= 15'd37;
            end
            7'b10010: begin
                stepSize <= 15'd41;
            end
            7'b10011: begin
                stepSize <= 15'd45;
            end
            7'b10100: begin
                stepSize <= 15'd50;
            end
            7'b10101: begin
                stepSize <= 15'd55;
            end
            7'b10110: begin
                stepSize <= 15'd60;
            end
            7'b10111: begin
                stepSize <= 15'd66;
            end
            7'b11000: begin
                stepSize <= 15'd73;
            end
            7'b11001: begin
                stepSize <= 15'd80;
            end
            7'b11010: begin
                stepSize <= 15'd88;
            end
            7'b11011: begin
                stepSize <= 15'd97;
            end
            7'b11100: begin
                stepSize <= 15'd107;
            end
            7'b11101: begin
                stepSize <= 15'd118;
            end
            7'b11110: begin
                stepSize <= 15'd130;
            end
            7'b11111: begin
                stepSize <= 15'd143;
            end
            7'b100000: begin
                stepSize <= 15'd157;
            end
            7'b100001: begin
                stepSize <= 15'd173;
            end
            7'b100010: begin
                stepSize <= 15'd190;
            end
            7'b100011: begin
                stepSize <= 15'd209;
            end
            7'b100100: begin
                stepSize <= 15'd230;
            end
            7'b100101: begin
                stepSize <= 15'd253;
            end
            7'b100110: begin
                stepSize <= 15'd279;
            end
            7'b100111: begin
                stepSize <= 15'd307;
            end
            7'b101000: begin
                stepSize <= 15'd337;
            end
            7'b101001: begin
                stepSize <= 15'd371;
            end
            7'b101010: begin
                stepSize <= 15'd408;
            end
            7'b101011: begin
                stepSize <= 15'd449;
            end
            7'b101100: begin
                stepSize <= 15'd494;
            end
            7'b101101: begin
                stepSize <= 15'd544;
            end
            7'b101110: begin
                stepSize <= 15'd598;
            end
            7'b101111: begin
                stepSize <= 15'd658;
            end
            7'b110000: begin
                stepSize <= 15'd724;
            end
            7'b110001: begin
                stepSize <= 15'd796;
            end
            7'b110010: begin
                stepSize <= 15'd876;
            end
            7'b110011: begin
                stepSize <= 15'd963;
            end
            7'b110100: begin
                stepSize <= 15'd1060;
            end
            7'b110101: begin
                stepSize <= 15'd1166;
            end
            7'b110110: begin
                stepSize <= 15'd1282;
            end
            7'b110111: begin
                stepSize <= 15'd1411;
            end
            7'b111000: begin
                stepSize <= 15'd1552;
            end
            7'b111001: begin
                stepSize <= 15'd1707;
            end
            7'b111010: begin
                stepSize <= 15'd1878;
            end
            7'b111011: begin
                stepSize <= 15'd2066;
            end
            7'b111100: begin
                stepSize <= 15'd2272;
            end
            7'b111101: begin
                stepSize <= 15'd2499;
            end
            7'b111110: begin
                stepSize <= 15'd2749;
            end
            7'b111111: begin
                stepSize <= 15'd3024;
            end
            7'b1000000: begin
                stepSize <= 15'd3327;
            end
            7'b1000001: begin
                stepSize <= 15'd3660;
            end
            7'b1000010: begin
                stepSize <= 15'd4026;
            end
            7'b1000011: begin
                stepSize <= 15'd4428;
            end
            7'b1000100: begin
                stepSize <= 15'd4871;
            end
            7'b1000101: begin
                stepSize <= 15'd5358;
            end
            7'b1000110: begin
                stepSize <= 15'd5894;
            end
            7'b1000111: begin
                stepSize <= 15'd6484;
            end
            7'b1001000: begin
                stepSize <= 15'd7132;
            end
            7'b1001001: begin
                stepSize <= 15'd7845;
            end
            7'b1001010: begin
                stepSize <= 15'd8630;
            end
            7'b1001011: begin
                stepSize <= 15'd9493;
            end
            7'b1001100: begin
                stepSize <= 15'd10442;
            end
            7'b1001101: begin
                stepSize <= 15'd11487;
            end
            7'b1001110: begin
                stepSize <= 15'd12635;
            end
            7'b1001111: begin
                stepSize <= 15'd13899;
            end
            7'b1010000: begin
                stepSize <= 15'd15289;
            end
            7'b1010001: begin
                stepSize <= 15'd16818;
            end
            7'b1010010: begin
                stepSize <= 15'd18500;
            end
            7'b1010011: begin
                stepSize <= 15'd20350;
            end
            7'b1010100: begin
                stepSize <= 15'd22385;
            end
            7'b1010101: begin
                stepSize <= 15'd24623;
            end
            7'b1010110: begin
                stepSize <= 15'd27086;
            end
            7'b1010111: begin
                stepSize <= 15'd29794;
            end
            default: begin
                stepSize <= 15'd32767;
            end
        endcase
    end
endmodule