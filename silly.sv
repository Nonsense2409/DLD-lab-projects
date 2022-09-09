module silly (input  logic a, b, cin, output logic y, cout);
   
  logic p, g;
    
  assign p=a ^ b;
  assign g=a & b;

  assign y=p ^ cin;
  assign cout =g | (p & cin);
   
endmodule
