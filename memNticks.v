module memNticks(input clk, input in, input [7:0] len, output reg out);
    reg [9:0] currentCount; //more bits to delay underflow
    initial begin currentCount = 226; out = 0; end
    always @(posedge clk) begin
        case (in)
            0: begin
                currentCount <= currentCount + 1;
                if(currentCount < len) out = 1;
                else out = 0;
                if(currentCount > 226) currentCount <= 226;
            end
            1: begin
                out = 1;
                currentCount <= 0;
            end
        endcase
    end
endmodule
