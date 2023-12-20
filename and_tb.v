module and_tb;

reg a;
reg b;
wire y;

and a( a,b,y);

initial 
begin
    a= 1'b0; b = 1'b0;
    #10 a= 1'b1;
    #10 b=1'b1;

    $dumpfile("test.vcd");
    $dumpvars();
end