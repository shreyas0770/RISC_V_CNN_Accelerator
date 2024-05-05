
module CNNConvolution(inp10, inp11, inp12, inp13 ,inp20,inp21,inp22,inp23,inp30,inp31,
inp32,inp33,inp40,inp41,inp42,inp43,ker10,ker11,ker12,ker20,ker21,ker22,
ker30,ker31,ker32,out10,out11,out20,out21);

//input [7:0] inp1 [3:0];
//input [7:0] inp2 [3:0];
//input [7:0] inp3 [3:0];
//input [7:0] inp4 [3:0];

input [7:0] inp10, inp11, inp12, inp13;
input [7:0] inp20, inp21, inp22, inp23;
input [7:0] inp30, inp31, inp32, inp33;
input [7:0] inp40, inp41, inp42, inp43;

input [7:0] ker10, ker11, ker12;
input [7:0] ker20, ker21, ker22;
input [7:0] ker30, ker31, ker32;

output reg [7:0] out10, out11;
output reg [7:0] out20, out21;


always@(*)
begin 
    out10 = (inp10*ker10)+(inp11*ker11)+(inp12*ker12)+(inp20*ker20)+(inp21*ker21)+(inp22*ker22)+(inp30*ker30)+(inp31*ker31)+(inp32*ker32);
    out11 = (inp11*ker10)+(inp12*ker11)+(inp13*ker12)+(inp21*ker20)+(inp22*ker21)+(inp23*ker22)+(inp31*ker30)+(inp32*ker31)+(inp33*ker32);
    out20 = (inp20*ker10)+(inp21*ker11)+(inp22*ker12)+(inp30*ker20)+(inp31*ker21)+(inp32*ker22)+(inp40*ker30)+(inp41*ker31)+(inp42*ker32);
    out21 = (inp21*ker10)+(inp22*ker11)+(inp23*ker12)+(inp31*ker20)+(inp32*ker21)+(inp33*ker22)+(inp41*ker30)+(inp42*ker31)+(inp43*ker32);
end


endmodule
