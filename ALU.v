// Copyright 2023 MERL-DSU

//    Licensed under the Apache License, Version 2.0 (the "License");
//    you may not use this file except in compliance with the License.
//    You may obtain a copy of the License at

//        http://www.apache.org/licenses/LICENSE-2.0

//    Unless required by applicable law or agreed to in writing, software
//    distributed under the License is distributed on an "AS IS" BASIS,
//    WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
//    See the License for the specific language governing permissions and
//    limitations under the License.

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

    // Convolution task
    task conv;
        input [31:0] A, B;
        output [31:0] Result;

        reg [4:0] x0, x1, x2, x3;
        reg [4:0] h0, h1, h2, h3;
        reg [4:0] y0, y1, y2, y3, y4, y5, y6;

        // Break A into x0, x1, x2, x3
        x0 = A[4:0];
        x1 = A[9:5];
        x2 = A[14:10];
        x3 = A[19:15];

        // Break B into h0, h1, h2, h3
        h0 = B[4:0];
        h1 = B[9:5];
        h2 = B[14:10];
        h3 = B[19:15];

        // Convolution logic
        y6 = h3 * x3;
        y5 = h3 * x2 + h2 * x3;
        y4 = h3 * x1 + h2 * x2 + h1 * x3;
        y3 = h3 * x0 + h2 * x1 + h1 * x2 + h0 * x3;
        y2 = h2 * x0 + h1 * x1 + h0 * x2;
        y1 = h1 * x0 + h0 * x1;
        y0 = h0 * x0;

        // Concatenate outputs
        Result = {2'b00,y6, y5, y4, y3, y2, y1, y0};
    endtask

    assign Sum = (ALUControl[0] == 1'b0) ? A + B :
                                          (A + ((~B)+1)) ;
    assign {Cout, Result} = (ALUControl == 3'b000) ? Sum :
                            (ALUControl == 3'b001) ? Sum :
                            (ALUControl == 3'b010) ? A & B :
                            (ALUControl == 3'b011) ? A | B :
                            (ALUControl == 3'b101) ? {{32{1'b0}}, (Sum[31])} :
                            (ALUControl == 3'b111) ? conv(A, B) :
                            {33{1'b0}};
    assign OverFlow = ((Sum[31] ^ A[31]) & 
                      (~(ALUControl[0] ^ B[31] ^ A[31])) &
                      (~ALUControl[1]));
    assign Carry = ((~ALUControl[1]) & Cout);
    assign Zero = &(~Result);
    assign Negative = Result[31];

endmodule

