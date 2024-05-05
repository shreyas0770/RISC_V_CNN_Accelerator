module ALU_Decoder(ALUOp,funct3,funct7,op,ALUControl);

    input [1:0]ALUOp;
    input [2:0]funct3;
    input [6:0]funct7,op;
    output [2:0]ALUControl;

    assign ALUControl = (ALUOp == 2'b00) ? 3'b000 : 
                        (ALUOp == 2'b01) ? 3'b001 :
                        (ALUOp == 2'b11) ? 3'b100 ://load
                        ((ALUOp == 2'b10) & (funct3 == 3'b001)) ? 3'b111 : //Normal 2d convolution
                        ((ALUOp == 2'b10) & (funct3 == 3'b011)) ? 3'b110 : //Normal 2d wino
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} == 2'b11)) ? 3'b001 : //Subtract
                        ((ALUOp == 2'b10) & (funct3 == 3'b000) & ({op[5],funct7[5]} != 2'b11)) ? 3'b000 : //Add
                        ((ALUOp == 2'b10) & (funct3 == 3'b010)) ? 3'b101 :      //Pruned winograd convolutino
                        ((ALUOp == 2'b10) & (funct3 == 3'b110)) ? 3'b011 :      //OR logic
                        ((ALUOp == 2'b10) & (funct3 == 3'b111)) ? 3'b010 :      //AND LOGIC                      
                                                                  3'b000 ;
endmodule
