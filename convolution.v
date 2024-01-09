
module convolution(
    input [31:0] A,
    input [31:0] B,
    output reg [31:0] Result
);

    reg [3:0] x0, x1, x2, x3; // Individual wires for x
    reg [3:0] h0, h1, h2, h3; // Individual wires for h
    reg [3:0] y0, y1, y2, y3, y4, y5, y6; // Individual wires for y

    // Break A into x0, x1, x2, x3
    always @(*)
    begin
        x0 = A[4:0];
        x1 = A[9:5];
        x2 = A[14:10];
        x3 = A[19:15];
    end

    // Break B into h0, h1, h2, h3
    always @(*)
    begin
        h0 = B[4:0];
        h1 = B[9:5];
        h2 = B[14:10];
        h3 = B[19:15];
    end

    always @(*)
    begin
        y6 = h3 * x3;
        y5 = h3 * x2 + h2 * x3;
        y4 = h3 * x1 + h2 * x2 + h1 * x3;
        y3 = h3 * x0 + h2 * x1 + h1 * x2 + h0 * x3;
        y2 = h2 * x0 + h1 * x1 + h0 * x2;
        y1 = h1 * x0 + h0 * x1;
        y0 = h0 * x0;
    end

    // Concatenate outputs
    always @(*)
    begin
        Result = {2'b00, y6, y5, y4, y3, y2, y1, y0};
    end

endmodule






