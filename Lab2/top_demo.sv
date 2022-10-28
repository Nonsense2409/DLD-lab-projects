`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 01/15/2021 06:40:11 PM
// Design Name: 
// Module Name: top_demo
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


module top_demo
(
  // input
  input  logic [7:0] sw,
  input  logic [3:0] btn,
  input  logic       sysclk_125mhz,
  input  logic       rst,
  // output  
  output logic [7:0] led,
  output logic sseg_ca,
  output logic sseg_cb,
  output logic sseg_cc,
  output logic sseg_cd,
  output logic sseg_ce,
  output logic sseg_cf,
  output logic sseg_cg,
  output logic sseg_dp,
  output logic [3:0] sseg_an
);

  logic [16:0] CURRENT_COUNT;
  logic [16:0] NEXT_COUNT;
  logic        smol_clk;
  logic [63:0]ciphertext;
  logic [63:0]plaintext;
  logic [63:0]key;
  logic [15:0] segment_out;
  // Place TicTacToe instantiation here
 
  DES dut (key, plaintext, 1'b1, ciphertext);
  assign plaintext = 64'h123456abcd132536;
  assign key = 64'h133457799bbcdff1;
  mux_4 mux (ciphertext[15:0], ciphertext[31:16], ciphertext[47:32], ciphertext[63:48],plaintext[15:0], plaintext[31:16], plaintext[47:32], plaintext[63:48], sw[2:0], segment_out[15:0]);
 
 
  // 7-segment display
  segment_driver driver(
  .clk(smol_clk),
  .rst(btn[3]),
  .digit0(segment_out[3:0]),
  .digit1(segment_out[7:4]),
  .digit2(segment_out[11:8]),
  .digit3(segment_out[15:12]),
  .decimals({1'b0, btn[2:0]}),
  .segment_cathodes({sseg_dp, sseg_cg, sseg_cf, sseg_ce, sseg_cd, sseg_cc, sseg_cb, sseg_ca}),
  .digit_anodes(sseg_an)
  );

// Register logic storing clock counts
  always@(posedge sysclk_125mhz)
  begin
    if(btn[3])
      CURRENT_COUNT = 17'h00000;
    else
      CURRENT_COUNT = NEXT_COUNT;
  end
 
  // Increment logic
  assign NEXT_COUNT = CURRENT_COUNT == 17'd100000 ? 17'h00000 : CURRENT_COUNT + 1;

  // Creation of smaller clock signal from counters
  assign smol_clk = CURRENT_COUNT == 17'd100000 ? 1'b1 : 1'b0;

endmodule

module mux_4 (input logic [15:0] a,                
                       logic [15:0] b,               
                       logic [15:0] c,               
                       logic [15:0] d,
                       logic [15:0] e,
                       logic [15:0] f,
                       logic [15:0] g,
                       logic [15:0] h,
                         
                                     
                       input logic [2:0] sel,              
                       output logic  [15:0] out);         

  
 
   always @ (a or b or c or d or sel) begin
      case (sel)
         3'b000 : out <= a[15:0];
         3'b001 : out <= b[15:0];
         3'b010 : out <= c[15:0];
         3'b011 : out <= d[15:0];
         3'b100 : out <= e[15:0];
         3'b101 : out <= f[15:0];
         3'b110 : out <= g[15:0];
         3'b111 : out <= h[15:0];
      endcase
   end
endmodule