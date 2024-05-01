
module relu(
input [7:0] inp1,inp2,inp3,inp4,
output [31:0]O
    );

    
//     function [31:0] reluRowWise(input [31:0] A);
//        reg [7:0] value1 = A[7:0];
//        reg [7:0] value2 = A[15:8];
//        reg [7:0] value3 = A[23:16];
//        reg [7:0] value4 = A[31:24];
//        reg [31:0] reluOut;
    
//        if (value1[7] == 1'b1)
//            value1 = 8'd0;;
//        if (value2[7] == 1'b1)
//            value2 = 8'd0;
//        if (value3[7] == 1'b1)
//            value3 = 8'd0;
//        if (value4[7] == 1'b1)
//            value4 = 8'd0;        
//        reluOut = {value4, value3, value2, value1};
//        return reluOut;
//    endfunction 
     
    always@(*)
    begin
//        reluout = reluRowWise( A ) ;   
        if (inp1[7] == 1'b1)
            inp1 = 8'd0;;
        if (inp2[7] == 1'b1)
            inp2 = 8'd0;
        if (inp3[7] == 1'b1)
            inp3 = 8'd0;
        if (inp4[7] == 1'b1)
            inp4 = 8'd0;       
    end 
    
    assign O = {inp4,inp3,inp2,inp1}; 
endmodule
