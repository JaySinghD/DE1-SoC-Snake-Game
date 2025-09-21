module manageDraw(input clk50, gameClk, doneHead, doneTail, doneObj, input [7:0] headXVGA, tailRmXVGA, objXVGA, input [6:0] headYVGA, tailRmYVGA, objYVGA, input[2:0] objColour, output reg drawingHead, removingTail, drawingObj,  output [7:0] xVGA, output [6:0] yVGA, output reg [2:0] colour, output reg plot, output ERROR);
    reg gameClkPrev;
    reg [1:0] selectMux;

    mux3to1_8b xMUX(selectMux, headXVGA, tailRmXVGA, objXVGA, xVGA);
    mux3to1_7b yMUX(selectMux, headYVGA, tailRmYVGA, objYVGA, yVGA);

    assign ERROR = (drawingHead & removingTail & drawingObj) | (drawingHead & removingTail) | (drawingHead & drawingObj) | (removingTail & drawingObj);

    always @(posedge clk50) begin
        gameClkPrev <= gameClk;

        if (gameClk && ~gameClkPrev) begin
            drawingHead = 1;
            removingTail = 0;
            drawingObj = 0;
            selectMux = 0;
            plot = 1;
            colour = 3'b111;
        end
        else begin
            if(drawingHead && doneHead) begin drawingHead = 0; removingTail = 1; drawingObj = 0; selectMux = 1; plot = 1; colour = 1; end
            else if(removingTail && doneTail) begin drawingHead = 0; removingTail = 0; drawingObj = 1; selectMux = 2; plot = 1; colour = objColour; end
            else if(drawingObj && doneObj) begin drawingHead = 0; removingTail = 0; drawingObj = 0; selectMux = 0; plot = 0; colour = 1; end
        end
    end

endmodule
