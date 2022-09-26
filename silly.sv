module Fulladder (input  logic a, b, cin, output logic y, cout);
   
  logic p, g;
    
  assign p=a ^ b;
  assign g=a & b;

  assign y=p ^ cin;
  assign cout =g | (p & cin);
   
endmodule

module RCA (input logic [3:0] a, b, input logic cin, output logic [3:0] cout, y );

Fulladder Fulladder1 ( a[0], b[0], cin, y[0], cout[0]);
Fulladder Fulladder2 ( a[1], b[1], cout[0],  y[1], cout[1]);
Fulladder Fulladder3 (  a[2], b[2], cout[1],  y[2], cout[2]);
Fulladder Fulladder4 (  a[3], b[3],cout[2],  y[3], cout[3]);

endmodule