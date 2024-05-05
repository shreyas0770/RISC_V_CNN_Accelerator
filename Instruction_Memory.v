module Instruction_Memory(rst,A,RD);

  input rst;
  input [31:0]A;
  output [31:0]RD;

  reg [31:0] mem [1023:0];
  
  assign RD = (rst == 1'b0) ? {32{1'b0}} : mem[A[31:2]];

//  initial begin
//    $readmemh("memfile.hex",mem);             //Commented cuz vivado doesnt support hex file
//  end

/////////////////////////////////////////////////////////////////////////////////////////////
//under opcode 0110011:           this opcode --> ALUOP = 10
//    1. func3 = 000 and ({op[5],funct7[5]} != 2'b11)  --> Addition
//    2. func3 = 000 and ({op[5],funct7[5]} == 2'b11)  --> Subtraction
//    3. func3 = 001 --> Normal 2d convolution
//    4. func3 = 010 --> Pruned winograd convolution
//    5. func3 = 011 --> Non pre processed winograd convolution
//    6. funct3 = 3'b110  --> OR logic
//    7. funct3 = 3'b111  --> AND logic
/////////////////////////////////////////////////////////////////////////////////////////////

  initial begin
               
//        mem[0] = 32'h001020ab;          //Start of Input Matrix data //New matrix --> Calculation in sanjana book
//        mem[1] = 32'h003010ab;
//        mem[2] = 32'h003010ab;
//        mem[3] = 32'h002010ab;
//        mem[4] = 32'h004020ab;
//        mem[5] = 32'h001030ab;
//        mem[6] = 32'h003020ab;
//        mem[7] = 32'h004010ab;
//        mem[8] = 32'h037010ab;          //Start of Kernel data
//        mem[9] = 32'h0C9000ab;
//        mem[10] = 32'h037010ab;
//        mem[11] = 32'h0C9000ab;
//        mem[12] = 32'h037010ab;
//        mem[13] = 32'h0C9000ab;         //Loading data ends here
//        //mem[14] = 32'h00119133;       //Temporarily used linear_conv's opcode for wino , should be updated
//       // mem[14] = 32'h00003033;         //uncomment for normal winograd convolution as output
//        //mem[14] = 32'h00001033;       //uncomment for normal convolution as output
//        mem[14] = 32'h00002033;       //uncomment for pruned winograd convolution as output
     
     mem[0] = 32'h001020ab;          //Start of Input Matrix data //New matrix --> Calculation in sanjana book
        mem[1] = 32'h003010ab;
        mem[2] = 32'h003010ab;
        mem[3] = 32'h002010ab;
        mem[4] = 32'h004020ab;
        mem[5] = 32'h001030ab;
        mem[6] = 32'h003020ab;
        mem[7] = 32'h004010ab;
        mem[8] = 32'h001000ab;          //Start of Kernel data
        mem[9] = 32'h0FF000ab;
        mem[10] = 32'h001000ab;
        mem[11] = 32'h0FF000ab;
        mem[12] = 32'h001000ab;
        mem[13] = 32'h0FF000ab;         //Loading data ends here
        //mem[14] = 32'h00119133;       //Temporarily used linear_conv's opcode for wino , should be updated
        mem[14] = 32'h00003033;         //uncomment for normal winograd convolution as output
        //mem[14] = 32'h00001033;       //uncomment for normal convolution as output
        //mem[14] = 32'h00002033;       //uncomment for pruned winograd convolution as output
           
  end

endmodule
