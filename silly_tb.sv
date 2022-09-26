`timescale 1ns / 1ps
module tb ();

   logic  [3:0]      a;
   logic [3:0]	b;
   logic 	cin;
   logic  [3:0]  cout;
   logic        clk;   
   logic [3:0] SUM_CORRECT;
   logic [3:0] y;
   
  // instantiate device under test
   RCA dut ( a, b, cin, cout, y);

   // 2 ns clock
   initial 
     begin	
	clk = 1'b1;
	forever #10 clk = ~clk;
     end

	integer i;
    integer handle3;
    integer desc3;
	assign SUM_CORRECT = a + b + cin;
	
	 initial 
	 begin
		handle3=$fopen("RCA.out");
		desc3=handle3;
		#25000 $finish;
	 end



   initial
     begin
    for (i=0 ; i<128; i=i+1)
		begin 
			@(posedge clk)
			begin
				a=$random;
				b=$random;
				cin=1'b0;
			end
			@(negedge clk)
			begin
				$fdisplay (desc3, "%h %h || %h | %h | %b ", a, b, y, SUM_CORRECT, (y==SUM_CORRECT));
			end
		end
	 end
   
endmodule
