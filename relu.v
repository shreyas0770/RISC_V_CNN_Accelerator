module relu(inp10, inp11, inp12, inp13 ,inp20,inp21,inp22,inp23,inp30,inp31,
inp32,inp33,inp40,inp41,inp42,inp43,relu_out
    );
    
  input [7:0] inp10, inp11, inp12, inp13 ,inp20,inp21,inp22,inp23,inp30,inp31,
inp32,inp33,inp40,inp41,inp42,inp43;
  output [127:0] relu_out;
    
  wire [7:0] inp10x, inp11x, inp12x, inp13x ,inp20x,inp21x,inp22x,inp23x,inp30x,inp31x,
inp32x,inp33x,inp40x,inp41x,inp42x,inp43x;

  

    assign inp10x = (inp10[7] == 1'b1) ? 8'd0: inp10;
    assign inp11x = (inp11[7] == 1'b1) ? 8'd0: inp11;
    assign inp12x = (inp12[7] == 1'b1) ? 8'd0: inp12;
    assign inp13x = (inp13[7] == 1'b1) ? 8'd0: inp13;
    assign inp20x = (inp20[7] == 1'b1) ? 8'd0: inp20;
    assign inp21x = (inp21[7] == 1'b1) ? 8'd0: inp21;
    assign inp22x = (inp22[7] == 1'b1) ? 8'd0: inp22;
    assign inp23x = (inp23[7] == 1'b1) ? 8'd0: inp23;
    assign inp30x = (inp30[7] == 1'b1) ? 8'd0: inp30;
    assign inp31x = (inp31[7] == 1'b1) ? 8'd0: inp31;
    assign inp32x = (inp32[7] == 1'b1) ? 8'd0: inp32;
    assign inp33x = (inp33[7] == 1'b1) ? 8'd0: inp33;
    assign inp40x = (inp40[7] == 1'b1) ? 8'd0: inp40;
    assign inp41x = (inp41[7] == 1'b1) ? 8'd0: inp41;
    assign inp42x = (inp42[7] == 1'b1) ? 8'd0: inp42;
    assign inp43x = (inp43[7] == 1'b1) ? 8'd0: inp43;
    
    
    assign relu_out = {inp10x, inp11x, inp12x, inp13x ,inp20x,inp21x,inp22x,inp23x,inp30x,inp31x,
inp32x,inp33x,inp40x,inp41x,inp42x,inp43x}; 

endmodule

