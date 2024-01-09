module convolution_tb;

  reg [5:0] x0, x1, x2, x3;
  reg [5:0] h0, h1, h2, h3;
  wire [5:0] y0, y1, y2, y3, y4, y5, y6;

  convolution dut (
    .x0(x0), .x1(x1), .x2(x2), .x3(x3),
    .h0(h0), .h1(h1), .h2(h2), .h3(h3),
    .y0(y0), .y1(y1), .y2(y2), .y3(y3), .y4(y4), .y5(y5), .y6(y6)
  );

  initial begin
    x0 = 6'b000001; x1 = 6'b000010; x2 = 6'b000011; x3 = 6'b000100;
    h0 = 6'b000001; h1 = 6'b000010; h2 = 6'b000010; h3 = 6'b000001;
    #50 $finish;
  end

  initial begin
    $monitor("x: %b %b %b %b, h: %b %b %b %b, y: %b %b %b %b %b %b %b",
             x0, x1, x2, x3, h0, h1, h2, h3, y0, y1, y2, y3, y4, y5, y6);
  end

endmodule
