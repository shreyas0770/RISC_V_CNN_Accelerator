module Instruction_Memory(rst,A,RD);

  input rst;
  input [31:0]A;
  output [31:0]RD;

  reg [31:0] mem [1023:0];
  
  assign RD = (rst == 1'b0) ? {32{1'b0}} : mem[A[31:2]];

//  initial begin
//    $readmemh("memfile.hex",mem);             //Commented cuz vivado doesnt support hex file
//  end



  initial begin
 
        mem[0] = 32'h001000ab;  //Just to reset the working registers w0 - w14 --> Dummy Value
        mem[1] = 32'h001000ab;
        mem[2] = 32'h001000ab;
        mem[3] = 32'h002030ab;
        mem[4] = 32'h001000ab;
        mem[5] = 32'h001020ab;
        mem[6] = 32'h002010ab;
        mem[7] = 32'h002000ab;
        mem[8] = 32'h001000ab;
        mem[9] = 32'h001000ab;
        mem[10] = 32'h001000ab;
        mem[11] = 32'h000010ab;
        mem[12] = 32'h000000ab;
        mem[13] = 32'h001010ab;
        mem[14] = 32'h001000ab;
        mem[15] = 32'h00119133; //Temporarily used linear_conv's opcode for wino , should be updated
        
  end

endmodule
