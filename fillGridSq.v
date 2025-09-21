module fillGridSq(
    input [3:0] x, y,
    input [2:0] clr,
    input enable, clk50,
    output reg done,
    output reg [7:0] hpos,
    output reg [6:0] vpos
);
    reg [2:0] ix, iy;

    always @(posedge clk50) begin
        if (!enable) begin
            // Reset state when enable is low
            ix <= 0;
            iy <= 0;
            done <= 0;
            hpos <= 0;
            vpos <= 0;
        end else begin
            // Progress logic
            if (!done) begin
                if (ix == 5) begin
                    ix <= 0;
                    if (iy == 5) begin
                        iy <= 0;
                        done <= 1;
                    end else begin
                        iy <= iy + 1;
                    end
                end else begin
                    ix <= ix + 1;
                end
            end
            
            // Update positions
            hpos <= x * 7 + 28 + ix;
            vpos <= (y + 1) * 7 + 1 + iy;
        end
    end
endmodule

