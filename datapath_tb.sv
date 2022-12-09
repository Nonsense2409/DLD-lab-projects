`timescale 1ns / 1ps
module tb ();

logic  clk;
logic  reset;
logic  [63:0] seed;
logic  start;
logic  [63:0] out_grid;
   
integer handle3;
integer desc3;
   


control dut (clk, reset, seed, start, out_grid);
    
   
initial 
begin	
clk = 1'b1;
forever #5 clk = ~clk;
end

initial
begin

handle3 = $fopen("pr.out");
#500 $finish;		
end

always 
begin
desc3 = handle3;
#5 $fdisplay(desc3, "Start: %b || Reset: %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b \n %b",
start, reset, out_grid[7:0], out_grid[15:8], out_grid[23:16], out_grid[31:24], 
out_grid[39:32], out_grid[47:40], out_grid[55:48], out_grid[63:56]);
end   
   
initial 
begin      
#0    reset = 1'b1;
#5    reset = 1'b0;	
#0    start = 1'b1;
#0    seed = 64'h0412_6424_0034_3C28;
end
   
endmodule