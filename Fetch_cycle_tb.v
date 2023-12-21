module tb();

// Declare I/O

reg clk =1, rst, PCSrcE;

reg [31:0] PCTargetE;

wire [31:0] InstrD, PCD, PCPlus4D;

// Declare the design under test

fetch_cycle dut (

.clk(clk),

.rst(rst),

.PCSrCE (PCSrcE),

.PCTargetE (PCTargetE),

.InstrD(InstrD),

.PCD (PCD),

.PCPlus4D (PCPlus4D)

);

always begin

// Generation of clock clk = ~clk; #50;

end

// Provide the Stimulus

initial begin

rst <= 1b*theta ;

#200;

rst <=1b1

PCSrcE <= 1 b0;
PCTargetE <= 32 h00000000;

#500;

$finish;