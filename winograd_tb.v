`timescale 1ns / 1ps

module testbench;

    // Inputs
    reg [7:0] inp10, inp11, inp12, inp13;
    reg [7:0] inp20, inp21, inp22, inp23;
    reg [7:0] inp30, inp31, inp32, inp33;
    reg [7:0] inp40, inp41, inp42, inp43;
    reg [7:0] ker10, ker11, ker12;
    reg [7:0] ker20, ker21, ker22;
    reg [7:0] ker30, ker31, ker32;

    // Outputs
    wire [7:0] out10, out11, out20, out21;

    // Instantiate the module under test
    winograd dut(
        .inp10(inp10), .inp11(inp11), .inp12(inp12), .inp13(inp13),
        .inp20(inp20), .inp21(inp21), .inp22(inp22), .inp23(inp23),
        .inp30(inp30), .inp31(inp31), .inp32(inp32), .inp33(inp33),
        .inp40(inp40), .inp41(inp41), .inp42(inp42), .inp43(inp43),
        .ker10(ker10), .ker11(ker11), .ker12(ker12),
        .ker20(ker20), .ker21(ker21), .ker22(ker22),
        .ker30(ker30), .ker31(ker31), .ker32(ker32),
        .out10(out10), .out11(out11), .out20(out20), .out21(out21)
    );

    // Stimulus
    initial begin
        // Set inputs
        inp10 = 8'h1; inp11 = 8'h0; inp12 = 8'h1; inp13 = 8'h0;
        inp20 = 8'h2; inp21 = 8'h3; inp22 = 8'h1; inp23 = 8'h0;
        inp30 = 8'h1; inp31 = 8'h2; inp32 = 8'h2; inp33 = 8'h1;
        inp40 = 8'h2; inp41 = 8'h0; inp42 = 8'h1; inp43 = 8'h0;
        ker10 = 8'h1; ker11 = 8'h0; ker12 = 8'h1;
        ker20 = 8'h0; ker21 = 8'h1; ker22 = 8'h0;
        ker30 = 8'h1; ker31 = 8'h1; ker32 = 8'h1;
        
//        inp10 = 8'h0; inp11 = 8'h1; inp12 = 8'h0; inp13 = 8'h1;
//                inp20 = 8'h2; inp21 = 8'h3; inp22 = 8'h1; inp23 = 8'h0;
//                inp30 = 8'h1; inp31 = 8'h2; inp32 = 8'h2; inp33 = 8'h1;
//                inp40 = 8'h2; inp41 = 8'h0; inp42 = 8'h1; inp43 = 8'h0;
//                ker10 = 8'h1; ker11 = 8'h0; ker12 = 8'h1;
//                ker20 = 8'h0; ker21 = 8'h1; ker22 = 8'h0;
//                ker30 = 8'h1; ker31 = 8'h1; ker32 = 8'h1;

        // Wait for 10ns
        #10;

        // Display outputs
        $display("Output out10: %h, out11: %h, out20: %h, out21: %h", out10, out11, out20, out21);

        // End simulation
        $finish;
  end

endmodule