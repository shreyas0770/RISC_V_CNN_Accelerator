`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05.05.2024 19:23:05
// Design Name: 
// Module Name: pruning
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////
module pruning(
input [7:0] ker10, ker11, ker12, ker20, ker21, ker22, ker30, ker31, ker32, 
output [71:0]O
    );

  wire [7:0] ker10x, ker11x, ker12x, ker20x, ker21x, ker22x, ker30x, ker31x, ker32x ;  
   
//assign ker10x = (ker10 >= -8'b11001001 && ker10 <= 8'b00110111) ? ker10 : 8'd0;
//assign ker11x = (ker11 >= -8'b11001001 && ker11 <= 8'b00110111) ? ker11 : 8'd0;
//assign ker12x = (ker12 >= -8'b11001001 && ker12 <= 8'b00110111) ? ker12 : 8'd0;
//assign ker20x = (ker20 >= -8'b11001001 && ker20 <= 8'b00110111) ? ker20 : 8'd0;
//assign ker21x = (ker21 >= -8'b11001001 && ker21 <= 8'b00110111) ? ker21 : 8'd0;
//assign ker22x = (ker22 >= -8'b11001001 && ker22 <= 8'b00110111) ? ker22 : 8'd0;
//assign ker30x = (ker30 >= -8'b11001001 && ker30 <= 8'b00110111) ? ker30 : 8'd0;
//assign ker31x = (ker31 >= -8'b11001001 && ker31 <= 8'b00110111) ? ker31 : 8'd0;
//assign ker32x = (ker32 >= -8'b11001001 && ker32 <= 8'b00110111) ? ker32 : 8'd0;

assign ker10x = (ker10 >= -8'b11001001 && ker10 <= 8'b00110111) ? ker10 : ker10;
assign ker11x = (ker11 >= -8'b11001001 && ker11 <= 8'b00110111) ? ker11 : ker11;
assign ker12x = (ker12 >= -8'b11001001 && ker12 <= 8'b00110111) ? ker12 : ker12;
assign ker20x = (ker20 >= -8'b11001001 && ker20 <= 8'b00110111) ? ker20 : ker20;
assign ker21x = (ker21 >= -8'b11001001 && ker21 <= 8'b00110111) ? ker21 : ker21;
assign ker22x = (ker22 >= -8'b11001001 && ker22 <= 8'b00110111) ? ker22 : ker22;
assign ker30x = (ker30 >= -8'b11001001 && ker30 <= 8'b00110111) ? ker30 : ker30;
assign ker31x = (ker31 >= -8'b11001001 && ker31 <= 8'b00110111) ? ker31 : ker31;
assign ker32x = (ker32 >= -8'b11001001 && ker32 <= 8'b00110111) ? ker32 : ker32;
;
    
    
    assign O = {ker10x, ker11x, ker12x, ker20x, ker21x, ker22x, ker30x, ker31x, ker32x}; 
endmodule
