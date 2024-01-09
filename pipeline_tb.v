`include "Pipeline_Top.v"

module tb();

    reg clk=0, rst;

    Pipeline_Top dut (.clk(clk), .rst(rst));
    
    always begin
        clk = ~clk;
        #50;
    end

    initial begin
        rst <= 1'b0;
        #200;
        rst <= 1'b1;
        #5000;
        $finish;    
    end

    initial begin
        $dumpfile("dump.vcd");
        $dumpvars(0);
    end

    
endmodule