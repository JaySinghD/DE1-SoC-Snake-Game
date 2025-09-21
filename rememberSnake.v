module rememberSnake(input clk, input [3:0] headX, headY, input [7:0] len, output [14:0] hasSnake0, hasSnake1, hasSnake2, hasSnake3, hasSnake4,  hasSnake5, hasSnake6, hasSnake7, hasSnake8, hasSnake9, hasSnake10,  hasSnake11, hasSnake12, hasSnake13, hasSnake14, output reg [3:0] snakeLeftX, snakeLeftY, output reg snakeTouchesSelf);

    reg [14:0] prevHasSnake0, prevHasSnake1, prevHasSnake2, prevHasSnake3, prevHasSnake4;
    reg [14:0] prevHasSnake5, prevHasSnake6, prevHasSnake7, prevHasSnake8, prevHasSnake9;
    reg [14:0] prevHasSnake10, prevHasSnake11, prevHasSnake12, prevHasSnake13, prevHasSnake14;

    integer x;
    always @(posedge clk) begin
        // Track previous states of hasSnake for transition detection
        prevHasSnake0 <= hasSnake0;
        prevHasSnake1 <= hasSnake1;
        prevHasSnake2 <= hasSnake2;
        prevHasSnake3 <= hasSnake3;
        prevHasSnake4 <= hasSnake4;
        prevHasSnake5 <= hasSnake5;
        prevHasSnake6 <= hasSnake6;
        prevHasSnake7 <= hasSnake7;
        prevHasSnake8 <= hasSnake8;
        prevHasSnake9 <= hasSnake9;
        prevHasSnake10 <= hasSnake10;
        prevHasSnake11 <= hasSnake11;
        prevHasSnake12 <= hasSnake12;
        prevHasSnake13 <= hasSnake13;
        prevHasSnake14 <= hasSnake14;

        // Check for transitions from 1 to 0
        for (x = 0; x <= 14; x = x + 1) begin
            if (prevHasSnake0[x] == 1 && hasSnake0[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 0;
            end
            else if (prevHasSnake1[x] == 1 && hasSnake1[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 1;
            end
            else if (prevHasSnake2[x] == 1 && hasSnake2[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 2;
            end
            else if (prevHasSnake3[x] == 1 && hasSnake3[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 3;
            end
            else if (prevHasSnake4[x] == 1 && hasSnake4[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 4;
            end
            else if (prevHasSnake5[x] == 1 && hasSnake5[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 5;
            end
            else if (prevHasSnake6[x] == 1 && hasSnake6[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 6;
            end
            else if (prevHasSnake7[x] == 1 && hasSnake7[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 7;
            end
            else if (prevHasSnake8[x] == 1 && hasSnake8[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 8;
            end
            else if (prevHasSnake9[x] == 1 && hasSnake9[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 9;
            end
            else if (prevHasSnake10[x] == 1 && hasSnake10[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 10;
            end
            else if (prevHasSnake11[x] == 1 && hasSnake11[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 11;
            end
            else if (prevHasSnake12[x] == 1 && hasSnake12[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 12;
            end
            else if (prevHasSnake13[x] == 1 && hasSnake13[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 13;
            end
            else if (prevHasSnake14[x] == 1 && hasSnake14[x] == 0) begin
                snakeLeftX <= x;
                snakeLeftY <= 14;
            end
        end

        // Check if the head is trying to go to a location already occupied by the snake
        snakeTouchesSelf <= (headY == 0 && prevHasSnake0[headX]) ||
                            (headY == 1 && prevHasSnake1[headX]) ||
                            (headY == 2 && prevHasSnake2[headX]) ||
                            (headY == 3 && prevHasSnake3[headX]) ||
                            (headY == 4 && prevHasSnake4[headX]) ||
                            (headY == 5 && prevHasSnake5[headX]) ||
                            (headY == 6 && prevHasSnake6[headX]) ||
                            (headY == 7 && prevHasSnake7[headX]) ||
                            (headY == 8 && prevHasSnake8[headX]) ||
                            (headY == 9 && prevHasSnake9[headX]) ||
                            (headY == 10 && prevHasSnake10[headX]) ||
                            (headY == 11 && prevHasSnake11[headX]) ||
                            (headY == 12 && prevHasSnake12[headX]) ||
                            (headY == 13 && prevHasSnake13[headX]) ||
                            (headY == 14 && prevHasSnake14[headX]);
    end

    memNticks s0_0(clk, (headX == 0 && headY == 0), len, hasSnake0[0]);
    memNticks s0_1(clk, (headX == 1 && headY == 0), len, hasSnake0[1]);
    memNticks s0_2(clk, (headX == 2 && headY == 0), len, hasSnake0[2]);
    memNticks s0_3(clk, (headX == 3 && headY == 0), len, hasSnake0[3]);
    memNticks s0_4(clk, (headX == 4 && headY == 0), len, hasSnake0[4]);
    memNticks s0_5(clk, (headX == 5 && headY == 0), len, hasSnake0[5]);
    memNticks s0_6(clk, (headX == 6 && headY == 0), len, hasSnake0[6]);
    memNticks s0_7(clk, (headX == 7 && headY == 0), len, hasSnake0[7]);
    memNticks s0_8(clk, (headX == 8 && headY == 0), len, hasSnake0[8]);
    memNticks s0_9(clk, (headX == 9 && headY == 0), len, hasSnake0[9]);
    memNticks s0_10(clk, (headX == 10 && headY == 0), len, hasSnake0[10]);
    memNticks s0_11(clk, (headX == 11 && headY == 0), len, hasSnake0[11]);
    memNticks s0_12(clk, (headX == 12 && headY == 0), len, hasSnake0[12]);
    memNticks s0_13(clk, (headX == 13 && headY == 0), len, hasSnake0[13]);
    memNticks s0_14(clk, (headX == 14 && headY == 0), len, hasSnake0[14]);

    memNticks s1_0(clk, (headX == 0 && headY == 1), len, hasSnake1[0]);
    memNticks s1_1(clk, (headX == 1 && headY == 1), len, hasSnake1[1]);
    memNticks s1_2(clk, (headX == 2 && headY == 1), len, hasSnake1[2]);
    memNticks s1_3(clk, (headX == 3 && headY == 1), len, hasSnake1[3]);
    memNticks s1_4(clk, (headX == 4 && headY == 1), len, hasSnake1[4]);
    memNticks s1_5(clk, (headX == 5 && headY == 1), len, hasSnake1[5]);
    memNticks s1_6(clk, (headX == 6 && headY == 1), len, hasSnake1[6]);
    memNticks s1_7(clk, (headX == 7 && headY == 1), len, hasSnake1[7]);
    memNticks s1_8(clk, (headX == 8 && headY == 1), len, hasSnake1[8]);
    memNticks s1_9(clk, (headX == 9 && headY == 1), len, hasSnake1[9]);
    memNticks s1_10(clk, (headX == 10 && headY == 1), len, hasSnake1[10]);
    memNticks s1_11(clk, (headX == 11 && headY == 1), len, hasSnake1[11]);
    memNticks s1_12(clk, (headX == 12 && headY == 1), len, hasSnake1[12]);
    memNticks s1_13(clk, (headX == 13 && headY == 1), len, hasSnake1[13]);
    memNticks s1_14(clk, (headX == 14 && headY == 1), len, hasSnake1[14]);

    memNticks s2_0(clk, (headX == 0 && headY == 2), len, hasSnake2[0]);
    memNticks s2_1(clk, (headX == 1 && headY == 2), len, hasSnake2[1]);
    memNticks s2_2(clk, (headX == 2 && headY == 2), len, hasSnake2[2]);
    memNticks s2_3(clk, (headX == 3 && headY == 2), len, hasSnake2[3]);
    memNticks s2_4(clk, (headX == 4 && headY == 2), len, hasSnake2[4]);
    memNticks s2_5(clk, (headX == 5 && headY == 2), len, hasSnake2[5]);
    memNticks s2_6(clk, (headX == 6 && headY == 2), len, hasSnake2[6]);
    memNticks s2_7(clk, (headX == 7 && headY == 2), len, hasSnake2[7]);
    memNticks s2_8(clk, (headX == 8 && headY == 2), len, hasSnake2[8]);
    memNticks s2_9(clk, (headX == 9 && headY == 2), len, hasSnake2[9]);
    memNticks s2_10(clk, (headX == 10 && headY == 2), len, hasSnake2[10]);
    memNticks s2_11(clk, (headX == 11 && headY == 2), len, hasSnake2[11]);
    memNticks s2_12(clk, (headX == 12 && headY == 2), len, hasSnake2[12]);
    memNticks s2_13(clk, (headX == 13 && headY == 2), len, hasSnake2[13]);
    memNticks s2_14(clk, (headX == 14 && headY == 2), len, hasSnake2[14]);

    memNticks s3_0(clk, (headX == 0 && headY == 3), len, hasSnake3[0]);
    memNticks s3_1(clk, (headX == 1 && headY == 3), len, hasSnake3[1]);
    memNticks s3_2(clk, (headX == 2 && headY == 3), len, hasSnake3[2]);
    memNticks s3_3(clk, (headX == 3 && headY == 3), len, hasSnake3[3]);
    memNticks s3_4(clk, (headX == 4 && headY == 3), len, hasSnake3[4]);
    memNticks s3_5(clk, (headX == 5 && headY == 3), len, hasSnake3[5]);
    memNticks s3_6(clk, (headX == 6 && headY == 3), len, hasSnake3[6]);
    memNticks s3_7(clk, (headX == 7 && headY == 3), len, hasSnake3[7]);
    memNticks s3_8(clk, (headX == 8 && headY == 3), len, hasSnake3[8]);
    memNticks s3_9(clk, (headX == 9 && headY == 3), len, hasSnake3[9]);
    memNticks s3_10(clk, (headX == 10 && headY == 3), len, hasSnake3[10]);
    memNticks s3_11(clk, (headX == 11 && headY == 3), len, hasSnake3[11]);
    memNticks s3_12(clk, (headX == 12 && headY == 3), len, hasSnake3[12]);
    memNticks s3_13(clk, (headX == 13 && headY == 3), len, hasSnake3[13]);
    memNticks s3_14(clk, (headX == 14 && headY == 3), len, hasSnake3[14]);

    memNticks s4_0(clk, (headX == 0 && headY == 4), len, hasSnake4[0]);
    memNticks s4_1(clk, (headX == 1 && headY == 4), len, hasSnake4[1]);
    memNticks s4_2(clk, (headX == 2 && headY == 4), len, hasSnake4[2]);
    memNticks s4_3(clk, (headX == 3 && headY == 4), len, hasSnake4[3]);
    memNticks s4_4(clk, (headX == 4 && headY == 4), len, hasSnake4[4]);
    memNticks s4_5(clk, (headX == 5 && headY == 4), len, hasSnake4[5]);
    memNticks s4_6(clk, (headX == 6 && headY == 4), len, hasSnake4[6]);
    memNticks s4_7(clk, (headX == 7 && headY == 4), len, hasSnake4[7]);
    memNticks s4_8(clk, (headX == 8 && headY == 4), len, hasSnake4[8]);
    memNticks s4_9(clk, (headX == 9 && headY == 4), len, hasSnake4[9]);
    memNticks s4_10(clk, (headX == 10 && headY == 4), len, hasSnake4[10]);
    memNticks s4_11(clk, (headX == 11 && headY == 4), len, hasSnake4[11]);
    memNticks s4_12(clk, (headX == 12 && headY == 4), len, hasSnake4[12]);
    memNticks s4_13(clk, (headX == 13 && headY == 4), len, hasSnake4[13]);
    memNticks s4_14(clk, (headX == 14 && headY == 4), len, hasSnake4[14]);

    memNticks s5_0(clk, (headX == 0 && headY == 5), len, hasSnake5[0]);
    memNticks s5_1(clk, (headX == 1 && headY == 5), len, hasSnake5[1]);
    memNticks s5_2(clk, (headX == 2 && headY == 5), len, hasSnake5[2]);
    memNticks s5_3(clk, (headX == 3 && headY == 5), len, hasSnake5[3]);
    memNticks s5_4(clk, (headX == 4 && headY == 5), len, hasSnake5[4]);
    memNticks s5_5(clk, (headX == 5 && headY == 5), len, hasSnake5[5]);
    memNticks s5_6(clk, (headX == 6 && headY == 5), len, hasSnake5[6]);
    memNticks s5_7(clk, (headX == 7 && headY == 5), len, hasSnake5[7]);
    memNticks s5_8(clk, (headX == 8 && headY == 5), len, hasSnake5[8]);
    memNticks s5_9(clk, (headX == 9 && headY == 5), len, hasSnake5[9]);
    memNticks s5_10(clk, (headX == 10 && headY == 5), len, hasSnake5[10]);
    memNticks s5_11(clk, (headX == 11 && headY == 5), len, hasSnake5[11]);
    memNticks s5_12(clk, (headX == 12 && headY == 5), len, hasSnake5[12]);
    memNticks s5_13(clk, (headX == 13 && headY == 5), len, hasSnake5[13]);
    memNticks s5_14(clk, (headX == 14 && headY == 5), len, hasSnake5[14]);

    memNticks s6_0(clk, (headX == 0 && headY == 6), len, hasSnake6[0]);
    memNticks s6_1(clk, (headX == 1 && headY == 6), len, hasSnake6[1]);
    memNticks s6_2(clk, (headX == 2 && headY == 6), len, hasSnake6[2]);
    memNticks s6_3(clk, (headX == 3 && headY == 6), len, hasSnake6[3]);
    memNticks s6_4(clk, (headX == 4 && headY == 6), len, hasSnake6[4]);
    memNticks s6_5(clk, (headX == 5 && headY == 6), len, hasSnake6[5]);
    memNticks s6_6(clk, (headX == 6 && headY == 6), len, hasSnake6[6]);
    memNticks s6_7(clk, (headX == 7 && headY == 6), len, hasSnake6[7]);
    memNticks s6_8(clk, (headX == 8 && headY == 6), len, hasSnake6[8]);
    memNticks s6_9(clk, (headX == 9 && headY == 6), len, hasSnake6[9]);
    memNticks s6_10(clk, (headX == 10 && headY == 6), len, hasSnake6[10]);
    memNticks s6_11(clk, (headX == 11 && headY == 6), len, hasSnake6[11]);
    memNticks s6_12(clk, (headX == 12 && headY == 6), len, hasSnake6[12]);
    memNticks s6_13(clk, (headX == 13 && headY == 6), len, hasSnake6[13]);
    memNticks s6_14(clk, (headX == 14 && headY == 6), len, hasSnake6[14]);

    memNticks s7_0(clk, (headX == 0 && headY == 7), len, hasSnake7[0]);
    memNticks s7_1(clk, (headX == 1 && headY == 7), len, hasSnake7[1]);
    memNticks s7_2(clk, (headX == 2 && headY == 7), len, hasSnake7[2]);
    memNticks s7_3(clk, (headX == 3 && headY == 7), len, hasSnake7[3]);
    memNticks s7_4(clk, (headX == 4 && headY == 7), len, hasSnake7[4]);
    memNticks s7_5(clk, (headX == 5 && headY == 7), len, hasSnake7[5]);
    memNticks s7_6(clk, (headX == 6 && headY == 7), len, hasSnake7[6]);
    memNticks s7_7(clk, (headX == 7 && headY == 7), len, hasSnake7[7]);
    memNticks s7_8(clk, (headX == 8 && headY == 7), len, hasSnake7[8]);
    memNticks s7_9(clk, (headX == 9 && headY == 7), len, hasSnake7[9]);
    memNticks s7_10(clk, (headX == 10 && headY == 7), len, hasSnake7[10]);
    memNticks s7_11(clk, (headX == 11 && headY == 7), len, hasSnake7[11]);
    memNticks s7_12(clk, (headX == 12 && headY == 7), len, hasSnake7[12]);
    memNticks s7_13(clk, (headX == 13 && headY == 7), len, hasSnake7[13]);
    memNticks s7_14(clk, (headX == 14 && headY == 7), len, hasSnake7[14]);

    memNticks s8_0(clk, (headX == 0 && headY == 8), len, hasSnake8[0]);
    memNticks s8_1(clk, (headX == 1 && headY == 8), len, hasSnake8[1]);
    memNticks s8_2(clk, (headX == 2 && headY == 8), len, hasSnake8[2]);
    memNticks s8_3(clk, (headX == 3 && headY == 8), len, hasSnake8[3]);
    memNticks s8_4(clk, (headX == 4 && headY == 8), len, hasSnake8[4]);
    memNticks s8_5(clk, (headX == 5 && headY == 8), len, hasSnake8[5]);
    memNticks s8_6(clk, (headX == 6 && headY == 8), len, hasSnake8[6]);
    memNticks s8_7(clk, (headX == 7 && headY == 8), len, hasSnake8[7]);
    memNticks s8_8(clk, (headX == 8 && headY == 8), len, hasSnake8[8]);
    memNticks s8_9(clk, (headX == 9 && headY == 8), len, hasSnake8[9]);
    memNticks s8_10(clk, (headX == 10 && headY == 8), len, hasSnake8[10]);
    memNticks s8_11(clk, (headX == 11 && headY == 8), len, hasSnake8[11]);
    memNticks s8_12(clk, (headX == 12 && headY == 8), len, hasSnake8[12]);
    memNticks s8_13(clk, (headX == 13 && headY == 8), len, hasSnake8[13]);
    memNticks s8_14(clk, (headX == 14 && headY == 8), len, hasSnake8[14]);

    memNticks s9_0(clk, (headX == 0 && headY == 9), len, hasSnake9[0]);
    memNticks s9_1(clk, (headX == 1 && headY == 9), len, hasSnake9[1]);
    memNticks s9_2(clk, (headX == 2 && headY == 9), len, hasSnake9[2]);
    memNticks s9_3(clk, (headX == 3 && headY == 9), len, hasSnake9[3]);
    memNticks s9_4(clk, (headX == 4 && headY == 9), len, hasSnake9[4]);
    memNticks s9_5(clk, (headX == 5 && headY == 9), len, hasSnake9[5]);
    memNticks s9_6(clk, (headX == 6 && headY == 9), len, hasSnake9[6]);
    memNticks s9_7(clk, (headX == 7 && headY == 9), len, hasSnake9[7]);
    memNticks s9_8(clk, (headX == 8 && headY == 9), len, hasSnake9[8]);
    memNticks s9_9(clk, (headX == 9 && headY == 9), len, hasSnake9[9]);
    memNticks s9_10(clk, (headX == 10 && headY == 9), len, hasSnake9[10]);
    memNticks s9_11(clk, (headX == 11 && headY == 9), len, hasSnake9[11]);
    memNticks s9_12(clk, (headX == 12 && headY == 9), len, hasSnake9[12]);
    memNticks s9_13(clk, (headX == 13 && headY == 9), len, hasSnake9[13]);
    memNticks s9_14(clk, (headX == 14 && headY == 9), len, hasSnake9[14]);

    memNticks s10_0(clk, (headX == 0 && headY == 10), len, hasSnake10[0]);
    memNticks s10_1(clk, (headX == 1 && headY == 10), len, hasSnake10[1]);
    memNticks s10_2(clk, (headX == 2 && headY == 10), len, hasSnake10[2]);
    memNticks s10_3(clk, (headX == 3 && headY == 10), len, hasSnake10[3]);
    memNticks s10_4(clk, (headX == 4 && headY == 10), len, hasSnake10[4]);
    memNticks s10_5(clk, (headX == 5 && headY == 10), len, hasSnake10[5]);
    memNticks s10_6(clk, (headX == 6 && headY == 10), len, hasSnake10[6]);
    memNticks s10_7(clk, (headX == 7 && headY == 10), len, hasSnake10[7]);
    memNticks s10_8(clk, (headX == 8 && headY == 10), len, hasSnake10[8]);
    memNticks s10_9(clk, (headX == 9 && headY == 10), len, hasSnake10[9]);
    memNticks s10_10(clk, (headX == 10 && headY == 10), len, hasSnake10[10]);
    memNticks s10_11(clk, (headX == 11 && headY == 10), len, hasSnake10[11]);
    memNticks s10_12(clk, (headX == 12 && headY == 10), len, hasSnake10[12]);
    memNticks s10_13(clk, (headX == 13 && headY == 10), len, hasSnake10[13]);
    memNticks s10_14(clk, (headX == 14 && headY == 10), len, hasSnake10[14]);

    memNticks s11_0(clk, (headX == 0 && headY == 11), len, hasSnake11[0]);
    memNticks s11_1(clk, (headX == 1 && headY == 11), len, hasSnake11[1]);
    memNticks s11_2(clk, (headX == 2 && headY == 11), len, hasSnake11[2]);
    memNticks s11_3(clk, (headX == 3 && headY == 11), len, hasSnake11[3]);
    memNticks s11_4(clk, (headX == 4 && headY == 11), len, hasSnake11[4]);
    memNticks s11_5(clk, (headX == 5 && headY == 11), len, hasSnake11[5]);
    memNticks s11_6(clk, (headX == 6 && headY == 11), len, hasSnake11[6]);
    memNticks s11_7(clk, (headX == 7 && headY == 11), len, hasSnake11[7]);
    memNticks s11_8(clk, (headX == 8 && headY == 11), len, hasSnake11[8]);
    memNticks s11_9(clk, (headX == 9 && headY == 11), len, hasSnake11[9]);
    memNticks s11_10(clk, (headX == 10 && headY == 11), len, hasSnake11[10]);
    memNticks s11_11(clk, (headX == 11 && headY == 11), len, hasSnake11[11]);
    memNticks s11_12(clk, (headX == 12 && headY == 11), len, hasSnake11[12]);
    memNticks s11_13(clk, (headX == 13 && headY == 11), len, hasSnake11[13]);
    memNticks s11_14(clk, (headX == 14 && headY == 11), len, hasSnake11[14]);

    memNticks s12_0(clk, (headX == 0 && headY == 12), len, hasSnake12[0]);
    memNticks s12_1(clk, (headX == 1 && headY == 12), len, hasSnake12[1]);
    memNticks s12_2(clk, (headX == 2 && headY == 12), len, hasSnake12[2]);
    memNticks s12_3(clk, (headX == 3 && headY == 12), len, hasSnake12[3]);
    memNticks s12_4(clk, (headX == 4 && headY == 12), len, hasSnake12[4]);
    memNticks s12_5(clk, (headX == 5 && headY == 12), len, hasSnake12[5]);
    memNticks s12_6(clk, (headX == 6 && headY == 12), len, hasSnake12[6]);
    memNticks s12_7(clk, (headX == 7 && headY == 12), len, hasSnake12[7]);
    memNticks s12_8(clk, (headX == 8 && headY == 12), len, hasSnake12[8]);
    memNticks s12_9(clk, (headX == 9 && headY == 12), len, hasSnake12[9]);
    memNticks s12_10(clk, (headX == 10 && headY == 12), len, hasSnake12[10]);
    memNticks s12_11(clk, (headX == 11 && headY == 12), len, hasSnake12[11]);
    memNticks s12_12(clk, (headX == 12 && headY == 12), len, hasSnake12[12]);
    memNticks s12_13(clk, (headX == 13 && headY == 12), len, hasSnake12[13]);
    memNticks s12_14(clk, (headX == 14 && headY == 12), len, hasSnake12[14]);

    memNticks s13_0(clk, (headX == 0 && headY == 13), len, hasSnake13[0]);
    memNticks s13_1(clk, (headX == 1 && headY == 13), len, hasSnake13[1]);
    memNticks s13_2(clk, (headX == 2 && headY == 13), len, hasSnake13[2]);
    memNticks s13_3(clk, (headX == 3 && headY == 13), len, hasSnake13[3]);
    memNticks s13_4(clk, (headX == 4 && headY == 13), len, hasSnake13[4]);
    memNticks s13_5(clk, (headX == 5 && headY == 13), len, hasSnake13[5]);
    memNticks s13_6(clk, (headX == 6 && headY == 13), len, hasSnake13[6]);
    memNticks s13_7(clk, (headX == 7 && headY == 13), len, hasSnake13[7]);
    memNticks s13_8(clk, (headX == 8 && headY == 13), len, hasSnake13[8]);
    memNticks s13_9(clk, (headX == 9 && headY == 13), len, hasSnake13[9]);
    memNticks s13_10(clk, (headX == 10 && headY == 13), len, hasSnake13[10]);
    memNticks s13_11(clk, (headX == 11 && headY == 13), len, hasSnake13[11]);
    memNticks s13_12(clk, (headX == 12 && headY == 13), len, hasSnake13[12]);
    memNticks s13_13(clk, (headX == 13 && headY == 13), len, hasSnake13[13]);
    memNticks s13_14(clk, (headX == 14 && headY == 13), len, hasSnake13[14]);

    memNticks s14_0(clk, (headX == 0 && headY == 14), len, hasSnake14[0]);
    memNticks s14_1(clk, (headX == 1 && headY == 14), len, hasSnake14[1]);
    memNticks s14_2(clk, (headX == 2 && headY == 14), len, hasSnake14[2]);
    memNticks s14_3(clk, (headX == 3 && headY == 14), len, hasSnake14[3]);
    memNticks s14_4(clk, (headX == 4 && headY == 14), len, hasSnake14[4]);
    memNticks s14_5(clk, (headX == 5 && headY == 14), len, hasSnake14[5]);
    memNticks s14_6(clk, (headX == 6 && headY == 14), len, hasSnake14[6]);
    memNticks s14_7(clk, (headX == 7 && headY == 14), len, hasSnake14[7]);
    memNticks s14_8(clk, (headX == 8 && headY == 14), len, hasSnake14[8]);
    memNticks s14_9(clk, (headX == 9 && headY == 14), len, hasSnake14[9]);
    memNticks s14_10(clk, (headX == 10 && headY == 14), len, hasSnake14[10]);
    memNticks s14_11(clk, (headX == 11 && headY == 14), len, hasSnake14[11]);
    memNticks s14_12(clk, (headX == 12 && headY == 14), len, hasSnake14[12]);
    memNticks s14_13(clk, (headX == 13 && headY == 14), len, hasSnake14[13]);
    memNticks s14_14(clk, (headX == 14 && headY == 14), len, hasSnake14[14]);

endmodule
