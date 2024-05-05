
`include "convolution.v"
`include "winograd.v"
module ALU(
    A, B,
    Result,
    ALUControl,
    OverFlow,
    Carry,
    Zero,
    Negative
);

    input [31:0] A, B;
    input [2:0] ALUControl;
    output Carry, OverFlow, Zero, Negative;
    output [31:0] Result;

    wire Cout;
    wire [31:0] Sum;
    wire [31:0]conv_output;

    reg [31:0] w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13;
    wire [31:0] wino_out,convo_out, pruned_wino_out;
    wire [71:0]pruned_out;
    wire [127:0]relu_out;
    reg [31:0] pre_wino, pre_relu, pre_convo, pre_pruned_wino;
    
    always @(*)
    begin
        if(ALUControl == 3'b100)    //To prevent pre_wino from resetting to zero when ALU Control changes to 3'b111
            begin
            pre_wino <= wino_out;
          //  pre_relu <= relu_out;
            pre_convo <= convo_out;
            pre_pruned_wino <= pruned_wino_out;    //Module to be added    
            end
    end    
    

    always @(*)       //Jugaad Logic for new matrix
    begin
    if(!w0)
        w0 = B;
    else if(!w1)
        {w1,w2} = {B,B};
//    else if(!w2)
//        w2 = B;
    else if(!w3)
        w3 = B; 
    else if(!w4)
        w4 = B;
    else if(!w5)
        w5 = B;    
    else if(!w6)
        w6 = B;
    else if(!w7)
        w7 = B;
    else if(!w8)
        w8 = B;
    else if(!w9)
        w9 = B; 
    else if(!w10)
        w10 = B;
    else if(!w11)
        w11 = B;    
    else if(!w12)
        w12 = B;
    else if(!w13)
        w13 = B;
    else
        {w0, w1, w2, w3, w4, w5, w6, w7, w8, w9, w10, w11, w12, w13} = 448'd0;
    end
     
    pruning prune(w8[15:8],w8[7:0],w9[15:8],w10[15:8],w10[7:0],w11[15:8],w12[15:8],w12[7:0],w13[15:8],pruned_out);
    relu inst1(w0[15:8],w0[7:0],w1[15:8],w1[7:0],w2[15:8],w2[7:0],w3[15:8],w3[7:0],w4[15:8], w4[7:0], w5[15:8],w5[7:0], w6[15:8],w6[7:0],w7[15:8],w7[7:0],relu_out);
    winograd wino(w0[15:8],w0[7:0],w1[15:8],w1[7:0],w2[15:8],w2[7:0],w3[15:8],w3[7:0],w4[15:8], w4[7:0], w5[15:8],w5[7:0], w6[15:8],w6[7:0],w7[15:8],w7[7:0],w8[15:8],w8[7:0],w9[15:8],w10[15:8],w10[7:0],w11[15:8],w12[15:8],w12[7:0],w13[15:8],wino_out[31:24],wino_out[23:16],wino_out[15:8],wino_out[7:0]);
   // relu relu_0(w0[15:8],w0[7:0],w1[15:8],w1[7:0],relu_out); // the values of w0 and w1 should be same cause you did a jugaad there! didnt change anything up there in always block!
    CNNConvolution CNNConvolution_0(w0[15:8],w0[7:0],w1[15:8],w1[7:0],w2[15:8],w2[7:0],w3[15:8],w3[7:0],w4[15:8], w4[7:0], w5[15:8],w5[7:0], w6[15:8],w6[7:0],w7[15:8],w7[7:0],w8[15:8],w8[7:0],w9[15:8],w10[15:8],w10[7:0],w11[15:8],w12[15:8],w12[7:0],w13[15:8],convo_out[31:24],convo_out[23:16],convo_out[15:8],convo_out[7:0]);
   
   // winograd wino_processed(w0[15:8],w0[7:0],w1[15:8],w1[7:0],w2[15:8],w2[7:0],w3[15:8],w3[7:0],w4[15:8], w4[7:0], w5[15:8],w5[7:0], w6[15:8],w6[7:0],w7[15:8],w7[7:0],w8[15:8],w8[7:0],w9[15:8],w10[15:8],w10[7:0],w11[15:8],w12[15:8],w12[7:0],w13[15:8],wino_out[31:24],wino_out[23:16],wino_out[15:8],wino_out[7:0]);
    winograd wino_processed( relu_out[127:120], relu_out[119:112], relu_out[111:104], relu_out[103:96], relu_out[95:88], relu_out[87:80], relu_out[79:72], relu_out[71:64], relu_out[63:56], relu_out[55:48], relu_out[47:40], relu_out[39:32], relu_out[31:24], relu_out[23:16], relu_out[15:8], relu_out[7:0],pruned_out[71:64], pruned_out[63:56], pruned_out[55:48], pruned_out[47:40], pruned_out[39:32], pruned_out[31:24], pruned_out[23:16], pruned_out[15:8], pruned_out[7:0],wino_out[31:24],wino_out[23:16],wino_out[15:8],wino_out[7:0]);
    
    convolution c1(.A(A),.B(B),.Result(conv_output));

    assign Sum = (ALUControl[0] == 1'b0) ? A + B :
                                          (A + ((~B)+1)) ;
    assign {Cout, Result} = (ALUControl == 3'b000) ? Sum :
                            (ALUControl == 3'b001) ? Sum :
                            (ALUControl == 3'b010) ? A & B :
                            (ALUControl == 3'b011) ? A | B :                        //preprocessed winograd convolution
                            (ALUControl == 3'b101) ? {1'b0, pre_pruned_wino} :      //preprocessed winograd convolution
                            (ALUControl == 3'b110) ? {1'b0, pre_wino}:              // non-preprocessed winograd convolution
                            (ALUControl == 3'b111) ? {1'b0, pre_convo}:             // normal 2d convolution
                            (ALUControl == 3'b100) ? {1'b0, B}:                     //Loading operation
                            {33{1'b0}};
    assign OverFlow = ((Sum[31] ^ A[31]) & 
                      (~(ALUControl[0] ^ B[31] ^ A[31])) &
                      (~ALUControl[1]));
    assign Carry = ((~ALUControl[1]) & Cout);
    assign Zero = &(~Result);
    assign Negative = Result[31];

endmodule

