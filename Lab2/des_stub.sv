/*
 Data Encryption Standard (S-DES)
 64-bit 16-round block cipher encryption and decryption algorithm 
 using 56-bit key (64-bit key with Parity).
 */

module GenerateKeys (Key, SubKey1, SubKey2, SubKey3, SubKey4,
		     SubKey5, SubKey6, SubKey7, SubKey8,
		     SubKey9, SubKey10, SubKey11, SubKey12,
		     SubKey13, SubKey14, SubKey15, SubKey16);
   
   // Generate SubKeys
   input logic [63:0]  Key;
   output logic [47:0] SubKey1;
   output logic [47:0] SubKey2;
   output logic [47:0] SubKey3;
   output logic [47:0] SubKey4;
   output logic [47:0] SubKey5;
   output logic [47:0] SubKey6;
   output logic [47:0] SubKey7;
   output logic [47:0] SubKey8;
   output logic [47:0] SubKey9;
   output logic [47:0] SubKey10;
   output logic [47:0] SubKey11;
   output logic [47:0] SubKey12;
   output logic [47:0] SubKey13;
   output logic [47:0] SubKey14;
   output logic [47:0] SubKey15;
   output logic [47:0] SubKey16;

   logic [27:0] C, C1, C2, C3, C4, C5, C6, C7, C8, C9, C10, C11, C12, C13, C14, C15, C16,
    D, D1, D2, D3, D4, D5, D6, D7, D8, D9, D10, D11, D12, D13, D14, D15, D16;
   
   PC1 key1 (Key, C, D);
   assign C1 [27:0] = {C[26:0], C[27]};
   assign D1 [27:0] = {D[26:0], D[27]};
   PC2 Generatekey1 (C1, D1, SubKey1);
   
   //PC1 key2 (Key, C1, D1);
   assign C2 [27:0] = {C1[26:0], C1[27]};
   assign D2 [27:0] = {D1[26:0], D1[27]};
   PC2 Generatekey2 (C2, D2, SubKey2);
   

   //PC1 key3 (Key, C2, D2);
   assign C3 [27:0] = {C2[25:0], C2[27:26]};
   assign D3 [27:0] = {D2[25:0], D2 [27:26]};
   PC2 Generatekey3 (C3, D3, SubKey3);

   //PC1 key4 (Key, C3, D3);
   assign C4 [27:0] = {C3[25:0],C3[27:26]};
   assign D4 [27:0] = {D3[25:0],D3[27:26]};
   PC2 Generatekey4 (C4, D4, SubKey4);

   //PC1 key5 (Key, C4, D4);
   assign C5 [27:0] = {C4[25:0], C4[27:26]};
   assign D5 [27:0] = {D4[25:0], D4[27:26]};
   PC2 Generatekey5 (C5, D5, SubKey5);

    //PC1 key6 (Key, C5, D5);
   assign C6 [27:0] = {C5[25:0], C5[27:26]};
   assign D6 [27:0] = {D5[25:0], D5[27:26]};
   PC2 Generatekey6 (C6, D6, SubKey6);

    //PC1 key7 (Key, C6, D6);
   assign C7 [27:0] = {C6[25:0], C6[27:26]};
   assign D7 [27:0] = {D6[25:0], D6[27:26]};
   PC2 Generatekey7 (C7, D7, SubKey7);

    //PC1 key8 (Key, C7, D7);
   assign C8 [27:0] = {C7[25:0], C7[27:26]};
   assign D8 [27:0] = {D7[25:0], D7[27:26]};
   PC2 Generatekey8 (C8, D8, SubKey8);

    //PC1 key9 (Key, C8, D8);
   assign C9 [27:0] = {C8[26:0], C8[27]};
   assign D9 [27:0] = {D8[26:0], D8[27]};
   PC2 Generatekey9 (C9, D9, SubKey9);

    //PC1 key10 (Key, C9, D9);
   assign C10 [27:0] = {C9[25:0], C9[27:26]};
   assign D10 [27:0] = {D9[25:0], D9[27:26]};
   PC2 Generatekey10 (C10, D10, SubKey10);

    //PC1 key11 (Key, C10, D10);
   assign C11 [27:0] = {C10[25:0], C10[27:26]};
   assign D11 [27:0] = {D10[25:0], D10[27:26]};
   PC2 Generatekey11 (C11, D11, SubKey11);

    //PC1 key12 (Key, C11, D11);
   assign C12 [27:0] = {C11[25:0], C11[27:26]};
   assign D12 [27:0] = {D11[25:0], D11[27:26]};
   PC2 Generatekey12 (C12, D12, SubKey12);

    //PC1 key13 (Key, C12, D12);
   assign C13 [27:0] = {C12[25:0], C12[27:26]};
   assign D13 [27:0] = {D12[25:0], D12[27:26]};
   PC2 Generatekey13 (C13, D13, SubKey13);

    //PC1 key14 (Key, C13, D13);
   assign C14 [27:0] = {C13[25:0], C13[27:26]};
   assign D14 [27:0] = {D13[25:0], D13[27:26]};
   PC2 Generatekey14 (C14, D14, SubKey14);

    //PC1 key15 (Key, C14, D14);
   assign C15 [27:0] = {C14[25:0], C14[27:26]};
   assign D15 [27:0] = {D14[25:0], D14[27:26]};
   PC2 Generatekey15 (C15, D15, SubKey15);

    //PC1 key16 (Key, C15, D15);
   assign C16 [27:0] = {C15[26:0], C15[27]};
   assign D16 [27:0] = {D15[26:0], D15[27]};
   PC2 Generatekey16 (C16, D16, SubKey16);
   
   logic [27:0] PC1_Left;
   logic [27:0] PC1_Right;
   logic [55:0] PC1_Out;
   

endmodule // GenerateKeys

module PC1 (key, left_block, right_block);

   input logic [63:0]  key;
   output logic [27:0] left_block;
   output logic [27:0] right_block;

   logic [55:0]        out_block;  
   
   assign out_block[55]=key[64-57];
   assign out_block[54]=key[64-49];
   assign out_block[53]=key[64-41];
   assign out_block[52]=key[64-33];
   assign out_block[51]=key[64-25];
   assign out_block[50]=key[64-17];
   assign out_block[49]=key[64-9];
   assign out_block[48]=key[64-1];
   assign out_block[47]=key[64-58];
   assign out_block[46]=key[64-50];
   assign out_block[45]=key[64-42];
   assign out_block[44]=key[64-34];
   assign out_block[43]=key[64-26];
   assign out_block[42]=key[64-18];
   assign out_block[41]=key[64-10];
   assign out_block[40]=key[64-2];
   assign out_block[39]=key[64-59];
   assign out_block[38]=key[64-51];
   assign out_block[37]=key[64-43];
   assign out_block[36]=key[64-35];
   assign out_block[35]=key[64-27];
   assign out_block[34]=key[64-19];
   assign out_block[33]=key[64-11];
   assign out_block[32]=key[64-3];
   assign out_block[31]=key[64-60];
   assign out_block[30]=key[64-52];
   assign out_block[29]=key[64-44];
   assign out_block[28]=key[64-36];
   assign out_block[27]=key[64-63];
   assign out_block[26]=key[64-55];
   assign out_block[25]=key[64-47];
   assign out_block[24]=key[64-39];
   assign out_block[23]=key[64-31];
   assign out_block[22]=key[64-23];
   assign out_block[21]=key[64-15];
   assign out_block[20]=key[64-7];
   assign out_block[19]=key[64-62];
   assign out_block[18]=key[64-54];
   assign out_block[17]=key[64-46];
   assign out_block[16]=key[64-38];
   assign out_block[15]=key[64-30];
   assign out_block[14]=key[64-22];
   assign out_block[13]=key[64-14];
   assign out_block[12]=key[64-6];
   assign out_block[11]=key[64-61];
   assign out_block[10]=key[64-53];
   assign out_block[9]=key[64-45];
   assign out_block[8]=key[64-37];
   assign out_block[7]=key[64-29];
   assign out_block[6]=key[64-21];
   assign out_block[5]=key[64-13];
   assign out_block[4]=key[64-5];
   assign out_block[3]=key[64-28];
   assign out_block[2]=key[64-20];
   assign out_block[1]=key[64-12];
   assign out_block[0]=key[64-4];

   assign {left_block, right_block} = out_block;  

endmodule // PC1

module PC2 (left_block, right_block, subkey);

   input logic [27:0] left_block;
   input logic [27:0] right_block;
   output logic [47:0] subkey;
   
   logic [55:0] out_block;

   assign out_block = {left_block, right_block};
   
   assign subkey[47]=out_block[56-14];
   assign subkey[46]=out_block[56-17];
   assign subkey[45]=out_block[56-11];
   assign subkey[44]=out_block[56-24];
   assign subkey[43]=out_block[56-1];
   assign subkey[42]=out_block[56-5];
   assign subkey[41]=out_block[56-3];
   assign subkey[40]=out_block[56-28];
   assign subkey[39]=out_block[56-15];
   assign subkey[38]=out_block[56-6];
   assign subkey[37]=out_block[56-21];
   assign subkey[36]=out_block[56-10];
   assign subkey[35]=out_block[56-23];
   assign subkey[34]=out_block[56-19];
   assign subkey[33]=out_block[56-12];
   assign subkey[32]=out_block[56-4];
   assign subkey[31]=out_block[56-26];
   assign subkey[30]=out_block[56-8];
   assign subkey[29]=out_block[56-16];
   assign subkey[28]=out_block[56-7];
   assign subkey[27]=out_block[56-27];
   assign subkey[26]=out_block[56-20];
   assign subkey[25]=out_block[56-13];
   assign subkey[24]=out_block[56-2];
   assign subkey[23]=out_block[56-41];
   assign subkey[22]=out_block[56-52];
   assign subkey[21]=out_block[56-31];
   assign subkey[20]=out_block[56-37];
   assign subkey[19]=out_block[56-47];
   assign subkey[18]=out_block[56-55];
   assign subkey[17]=out_block[56-30];
   assign subkey[16]=out_block[56-40];
   assign subkey[15]=out_block[56-51];
   assign subkey[14]=out_block[56-45];
   assign subkey[13]=out_block[56-33];
   assign subkey[12]=out_block[56-48];
   assign subkey[11]=out_block[56-44];
   assign subkey[10]=out_block[56-49];
   assign subkey[9]=out_block[56-39];
   assign subkey[8]=out_block[56-56];
   assign subkey[7]=out_block[56-34];
   assign subkey[6]=out_block[56-53];
   assign subkey[5]=out_block[56-46];
   assign subkey[4]=out_block[56-42];
   assign subkey[3]=out_block[56-50];
   assign subkey[2]=out_block[56-36];
   assign subkey[1]=out_block[56-29];
   assign subkey[0]=out_block[56-32];

endmodule // PC2

// Straight Function
module SF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [31:0] out_block;

   assign out_block[31]= inp_block [32-16];
   assign out_block[30]= inp_block [32-7];
   assign out_block[29]= inp_block [32-20];
   assign out_block[28]= inp_block [32-21];
   assign out_block[27]= inp_block [32-29];
   assign out_block[26]= inp_block [32-12];
   assign out_block[25]= inp_block [32-28];
   assign out_block[24]= inp_block [32-17];
   assign out_block[23]= inp_block [32-1];
   assign out_block[22]= inp_block [32-15];
   assign out_block[21]= inp_block [32-23];
   assign out_block[20]= inp_block [32-26];
   assign out_block[19]= inp_block [32-5];
   assign out_block[18]= inp_block [32-18];
   assign out_block[17]= inp_block [32-31];
   assign out_block[16]= inp_block [32-10];
   assign out_block[15]= inp_block [32-2];
   assign out_block[14]= inp_block [32-8];
   assign out_block[13]= inp_block [32-24];
   assign out_block[12]= inp_block [32-14];
   assign out_block[11]= inp_block [32-32];
   assign out_block[10]= inp_block [32-27];
   assign out_block[9]= inp_block [32-3];
   assign out_block[8]= inp_block [32-9];
   assign out_block[7]= inp_block [32-19];
   assign out_block[6]= inp_block [32-13];
   assign out_block[5]= inp_block [32-30];
   assign out_block[4]= inp_block [32-6];
   assign out_block[3]= inp_block [32-22];
   assign out_block[2]= inp_block [32-11];
   assign out_block[1]= inp_block [32-4];
   assign out_block[0]= inp_block [32-25];

endmodule // SF

// Expansion Function
module EF (inp_block, out_block);

   input logic [31:0] inp_block;
   output logic [47:0] out_block;
   
   assign out_block [47]=inp_block [32-32];
   assign out_block [46]=inp_block [32-1];
   assign out_block [45]=inp_block [32-2];
   assign out_block [44]=inp_block [32-3];
   assign out_block [43]=inp_block [32-4];
   assign out_block [42]=inp_block [32-5];
   assign out_block [41]=inp_block [32-4];
   assign out_block [40]=inp_block [32-5];
   assign out_block [39]=inp_block [32-6];
   assign out_block [38]=inp_block [32-7];
   assign out_block [37]=inp_block [32-8];
   assign out_block [36]=inp_block [32-9];
   assign out_block [35]=inp_block [32-8];
   assign out_block [34]=inp_block [32-9];
   assign out_block [33]=inp_block [32-10];
   assign out_block [32]=inp_block [32-11];
   assign out_block [31]=inp_block [32-12];
   assign out_block [30]=inp_block [32-13];
   assign out_block [29]=inp_block [32-12];
   assign out_block [28]=inp_block [32-13];
   assign out_block [27]=inp_block [32-14];
   assign out_block [26]=inp_block [32-15];
   assign out_block [25]=inp_block [32-16];
   assign out_block [24]=inp_block [32-17];
   assign out_block [23]=inp_block [32-16];
   assign out_block [22]=inp_block [32-17];
   assign out_block [21]=inp_block [32-18];
   assign out_block [20]=inp_block [32-19];
   assign out_block [19]=inp_block [32-20];
   assign out_block [18]=inp_block [32-21];
   assign out_block [17]=inp_block [32-20];
   assign out_block [16]=inp_block [32-21];
   assign out_block [15]=inp_block [32-22];
   assign out_block [14]=inp_block [32-23];
   assign out_block [13]=inp_block [32-24];
   assign out_block [12]=inp_block [32-25];
   assign out_block [11]=inp_block [32-24];
   assign out_block [10]=inp_block [32-25];
   assign out_block [9]=inp_block [32-26];
   assign out_block [8]=inp_block [32-27];
   assign out_block [7]=inp_block [32-28];
   assign out_block [6]=inp_block [32-29];
   assign out_block [5]=inp_block [32-28];
   assign out_block [4]=inp_block [32-29];
   assign out_block [3]=inp_block [32-30];
   assign out_block [2]=inp_block [32-31];
   assign out_block [1]=inp_block [32-32];
   assign out_block [0] =inp_block [32-1];



endmodule // EF

module feistel (inp_block, subkey, out_block);

   input logic [31:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [31:0] out_block;
   logic [47:0]SBOXES;
   logic [31:0]straight_in;
   logic [47:0] out;   

   EF SBOXES1 (inp_block, out);
   assign SBOXES = (out ^ subkey);
   
   S1_Box s1 (SBOXES[47:42], straight_in[31:28]);
   S2_Box s2 (SBOXES[41:36], straight_in[27:24]);
   S3_Box s3 (SBOXES[35:30], straight_in[23:20]);
   S4_Box s4 (SBOXES[29:24], straight_in[19:16]);
   S5_Box s5 (SBOXES[23:18], straight_in[15:12]);
   S6_Box s6 (SBOXES[17:12], straight_in[11:8]);
   S7_Box s7 (SBOXES[11:6], straight_in[7:4]);
   S8_Box s8 (SBOXES[5:0], straight_in[3:0]);
 
   SF straight (straight_in, out_block);

endmodule // Feistel

// DES block round
module round (inp_block, subkey, out_block);

   input logic [63:0]  inp_block;
   input logic [47:0]  subkey;
   output logic [63:0] out_block;

   logic [31:0] left_block, right_block, fout, left_temp, right_temp;
   
   assign {left_block,right_block}=inp_block;
   
   feistel SBOXES (right_block, subkey, fout);

   assign right_temp = left_block ^ fout;
   assign left_temp = right_block;

   assign out_block={left_temp, right_temp};


endmodule // round1

// Initial Permutation
module IP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-58];
   assign out_block[62] = inp_block[64-50];
   assign out_block[61] = inp_block[64-42];
   assign out_block[60] = inp_block[64-34];
   assign out_block[59] = inp_block[64-26];
   assign out_block[58] = inp_block[64-18];
   assign out_block[57] = inp_block[64-10];
   assign out_block[56] = inp_block[64-2];
   assign out_block[55] = inp_block[64-60];
   assign out_block[54] = inp_block[64-52];   
   assign out_block[53] = inp_block[64-44];   
   assign out_block[52] = inp_block[64-36];
   assign out_block[51] = inp_block[64-28];
   assign out_block[50] = inp_block[64-20];
   assign out_block[49] = inp_block[64-12];
   assign out_block[48] = inp_block[64-4];
   assign out_block[47] = inp_block[64-62];
   assign out_block[46] = inp_block[64-54];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-38];   
   assign out_block[43] = inp_block[64-30];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-14];
   assign out_block[40] = inp_block[64-6];
   assign out_block[39] = inp_block[64-64];
   assign out_block[38] = inp_block[64-56];
   assign out_block[37] = inp_block[64-48];
   assign out_block[36] = inp_block[64-40];
   assign out_block[35] = inp_block[64-32];
   assign out_block[34] = inp_block[64-24];   
   assign out_block[33] = inp_block[64-16];
   assign out_block[32] = inp_block[64-8];   
   assign out_block[31] = inp_block[64-57];
   assign out_block[30] = inp_block[64-49];
   assign out_block[29] = inp_block[64-41];
   assign out_block[28] = inp_block[64-33];
   assign out_block[27] = inp_block[64-25];
   assign out_block[26] = inp_block[64-17];
   assign out_block[25] = inp_block[64-9];   
   assign out_block[24] = inp_block[64-1];   
   assign out_block[23] = inp_block[64-59];
   assign out_block[22] = inp_block[64-51];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-35];
   assign out_block[19] = inp_block[64-27];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-11];
   assign out_block[16] = inp_block[64-3];
   assign out_block[15] = inp_block[64-61];
   assign out_block[14] = inp_block[64-53];   
   assign out_block[13] = inp_block[64-45];
   assign out_block[12] = inp_block[64-37];   
   assign out_block[11] = inp_block[64-29];
   assign out_block[10] = inp_block[64-21];
   assign out_block[9] = inp_block[64-13];
   assign out_block[8] = inp_block[64-5];
   assign out_block[7] = inp_block[64-63];
   assign out_block[6] = inp_block[64-55];
   assign out_block[5] = inp_block[64-47];
   assign out_block[4] = inp_block[64-39];   
   assign out_block[3] = inp_block[64-31];
   assign out_block[2] = inp_block[64-23];    
   assign out_block[1] = inp_block[64-15];
   assign out_block[0] = inp_block[64-7];   

endmodule // IP

// Final Permutation
module FP (inp_block, out_block);

   input logic [63:0]  inp_block;
   output logic [63:0] out_block;

   assign out_block[63] = inp_block[64-40];
   assign out_block[62] = inp_block[64-8];
   assign out_block[61] = inp_block[64-48];
   assign out_block[60] = inp_block[64-16];
   assign out_block[59] = inp_block[64-56];
   assign out_block[58] = inp_block[64-24];
   assign out_block[57] = inp_block[64-64];
   assign out_block[56] = inp_block[64-32];   
   assign out_block[55] = inp_block[64-39];
   assign out_block[54] = inp_block[64-7];   
   assign out_block[53] = inp_block[64-47];   
   assign out_block[52] = inp_block[64-15];
   assign out_block[51] = inp_block[64-55];
   assign out_block[50] = inp_block[64-23];
   assign out_block[49] = inp_block[64-63];
   assign out_block[48] = inp_block[64-31];   
   assign out_block[47] = inp_block[64-38];
   assign out_block[46] = inp_block[64-6];
   assign out_block[45] = inp_block[64-46];
   assign out_block[44] = inp_block[64-14];   
   assign out_block[43] = inp_block[64-54];
   assign out_block[42] = inp_block[64-22];   
   assign out_block[41] = inp_block[64-62];
   assign out_block[40] = inp_block[64-30];   
   assign out_block[39] = inp_block[64-37];
   assign out_block[38] = inp_block[64-5];
   assign out_block[37] = inp_block[64-45];
   assign out_block[36] = inp_block[64-13];
   assign out_block[35] = inp_block[64-53];
   assign out_block[34] = inp_block[64-21];   
   assign out_block[33] = inp_block[64-61];
   assign out_block[32] = inp_block[64-29];   
   assign out_block[31] = inp_block[64-36];
   assign out_block[30] = inp_block[64-4];
   assign out_block[29] = inp_block[64-44];
   assign out_block[28] = inp_block[64-12];
   assign out_block[27] = inp_block[64-52];
   assign out_block[26] = inp_block[64-20];
   assign out_block[25] = inp_block[64-60];   
   assign out_block[24] = inp_block[64-28];   
   assign out_block[23] = inp_block[64-35];
   assign out_block[22] = inp_block[64-3];   
   assign out_block[21] = inp_block[64-43];
   assign out_block[20] = inp_block[64-11];
   assign out_block[19] = inp_block[64-51];
   assign out_block[18] = inp_block[64-19];
   assign out_block[17] = inp_block[64-59];
   assign out_block[16] = inp_block[64-27];   
   assign out_block[15] = inp_block[64-34];
   assign out_block[14] = inp_block[64-2];   
   assign out_block[13] = inp_block[64-42];
   assign out_block[12] = inp_block[64-10];   
   assign out_block[11] = inp_block[64-50];
   assign out_block[10] = inp_block[64-18];
   assign out_block[9] = inp_block[64-58];
   assign out_block[8] = inp_block[64-26];   
   assign out_block[7] = inp_block[64-33];
   assign out_block[6] = inp_block[64-1];
   assign out_block[5] = inp_block[64-41];   
   assign out_block[4] = inp_block[64-9];
   assign out_block[3] = inp_block[64-49];    
   assign out_block[2] = inp_block[64-17];
   assign out_block[1] = inp_block[64-57];
   assign out_block[0] = inp_block[64-25];  

endmodule // FP

module S1_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd14;             
	  6'd1  : out_bits = 4'd4;             
	  6'd2  : out_bits = 4'd13;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd2;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd10;             
	  6'd10 : out_bits = 4'd6;             
	  6'd11 : out_bits = 4'd12;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd9;             
	  6'd14 : out_bits = 4'd0;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd0;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd7;             
	  6'd19 : out_bits = 4'd4;             
	  6'd20 : out_bits = 4'd14;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd10;             
	  6'd25 : out_bits = 4'd6;             
	  6'd26 : out_bits = 4'd12;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd9;             
	  6'd29 : out_bits = 4'd5;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd1;             
	  6'd34 : out_bits = 4'd14;             
	  6'd35 : out_bits = 4'd8;             
	  6'd36 : out_bits = 4'd13;             
	  6'd37 : out_bits = 4'd6;             
	  6'd38 : out_bits = 4'd2;             
	  6'd39 : out_bits = 4'd11;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd12;             
	  6'd42 : out_bits = 4'd9;             
	  6'd43 : out_bits = 4'd7;             
	  6'd44 : out_bits = 4'd3;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd0;             
	  6'd48 : out_bits = 4'd15;             
	  6'd49 : out_bits = 4'd12;             
	  6'd50 : out_bits = 4'd8;             
	  6'd51 : out_bits = 4'd2;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd1;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd5;        
	  6'd57 : out_bits = 4'd11;        
	  6'd58 : out_bits = 4'd3;       
	  6'd59 : out_bits = 4'd14;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd13;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S1_Box

module S2_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})             
	  6'd0  : out_bits = 4'd15;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd11;             
	  6'd6  : out_bits = 4'd3;             
	  6'd7  : out_bits = 4'd4;             
	  6'd8  : out_bits = 4'd9;             
	  6'd9  : out_bits = 4'd7;             
	  6'd10 : out_bits = 4'd2;             
	  6'd11 : out_bits = 4'd13;             
	  6'd12 : out_bits = 4'd12;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd10;             
	  6'd16 : out_bits = 4'd3;             
	  6'd17 : out_bits = 4'd13;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd15;             
	  6'd21 : out_bits = 4'd2;             
	  6'd22 : out_bits = 4'd8;             
	  6'd23 : out_bits = 4'd14;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd1;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd6;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd11;             
	  6'd31 : out_bits = 4'd5;             
	  6'd32 : out_bits = 4'd0;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd7;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd4;             
	  6'd38 : out_bits = 4'd13;             
	  6'd39 : out_bits = 4'd1;             
	  6'd40 : out_bits = 4'd5;             
	  6'd41 : out_bits = 4'd8;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd6;             
	  6'd44 : out_bits = 4'd9;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd2;             
	  6'd47 : out_bits = 4'd15;             
	  6'd48 : out_bits = 4'd13;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd10;             
	  6'd51 : out_bits = 4'd1;             
	  6'd52 : out_bits = 4'd3;             
	  6'd53 : out_bits = 4'd15;            
	  6'd54 : out_bits = 4'd4;             
	  6'd55 : out_bits = 4'd2;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd6;        
	  6'd58 : out_bits = 4'd7;       
	  6'd59 : out_bits = 4'd12;       
	  6'd60 : out_bits = 4'd0;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd14;      
	  6'd63 : out_bits = 4'd9;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S2_Box

module S3_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})
	  6'd0  : out_bits = 4'd10;             
	  6'd1  : out_bits = 4'd0;             
	  6'd2  : out_bits = 4'd9;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd3;             
	  6'd6  : out_bits = 4'd15;             
	  6'd7  : out_bits = 4'd5;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd12;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd4;             
	  6'd14 : out_bits = 4'd2;             
	  6'd15 : out_bits = 4'd8;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd7;             
	  6'd18 : out_bits = 4'd0;             
	  6'd19 : out_bits = 4'd9;             
	  6'd20 : out_bits = 4'd3;             
	  6'd21 : out_bits = 4'd4;             
	  6'd22 : out_bits = 4'd6;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd2;             
	  6'd25 : out_bits = 4'd8;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd12;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd15;             
	  6'd31 : out_bits = 4'd1;             
	  6'd32 : out_bits = 4'd13;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd9;             
	  6'd36 : out_bits = 4'd8;             
	  6'd37 : out_bits = 4'd15;             
	  6'd38 : out_bits = 4'd3;             
	  6'd39 : out_bits = 4'd0;             
	  6'd40 : out_bits = 4'd11;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd2;             
	  6'd43 : out_bits = 4'd12;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd10;             
	  6'd46 : out_bits = 4'd14;             
	  6'd47 : out_bits = 4'd7;             
	  6'd48 : out_bits = 4'd1;             
	  6'd49 : out_bits = 4'd10;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd0;             
	  6'd52 : out_bits = 4'd6;             
	  6'd53 : out_bits = 4'd9;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd4;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd14;       
	  6'd59 : out_bits = 4'd3;       
	  6'd60 : out_bits = 4'd11;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd12;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S3_Box

module S4_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd7;             
	  6'd1  : out_bits = 4'd13;             
	  6'd2  : out_bits = 4'd14;            
	  6'd3  : out_bits = 4'd3;             
	  6'd4  : out_bits = 4'd0;             
	  6'd5  : out_bits = 4'd6;             
	  6'd6  : out_bits = 4'd9;             
	  6'd7  : out_bits = 4'd10;             
	  6'd8  : out_bits = 4'd1;             
	  6'd9  : out_bits = 4'd2;             
	  6'd10 : out_bits = 4'd8;             
	  6'd11 : out_bits = 4'd5;             
	  6'd12 : out_bits = 4'd11;             
	  6'd13 : out_bits = 4'd12;             
	  6'd14 : out_bits = 4'd4;             
	  6'd15 : out_bits = 4'd15;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd8;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd5;             
	  6'd20 : out_bits = 4'd6;             
	  6'd21 : out_bits = 4'd15;             
	  6'd22 : out_bits = 4'd0;             
	  6'd23 : out_bits = 4'd3;             
	  6'd24 : out_bits = 4'd4;             
	  6'd25 : out_bits = 4'd7;             
	  6'd26 : out_bits = 4'd2;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd1;             
	  6'd29 : out_bits = 4'd10;             
	  6'd30 : out_bits = 4'd14;             
	  6'd31 : out_bits = 4'd9;             
	  6'd32 : out_bits = 4'd10;             
	  6'd33 : out_bits = 4'd6;             
	  6'd34 : out_bits = 4'd9;             
	  6'd35 : out_bits = 4'd0;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd11;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd13;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd1;             
	  6'd42 : out_bits = 4'd3;             
	  6'd43 : out_bits = 4'd14;             
	  6'd44 : out_bits = 4'd5;             
	  6'd45 : out_bits = 4'd2;             
	  6'd46 : out_bits = 4'd8;             
	  6'd47 : out_bits = 4'd4;             
	  6'd48 : out_bits = 4'd3;             
	  6'd49 : out_bits = 4'd15;             
	  6'd50 : out_bits = 4'd0;             
	  6'd51 : out_bits = 4'd6;             
	  6'd52 : out_bits = 4'd10;             
	  6'd53 : out_bits = 4'd1;            
	  6'd54 : out_bits = 4'd13;             
	  6'd55 : out_bits = 4'd8;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd4;        
	  6'd58 : out_bits = 4'd5;       
	  6'd59 : out_bits = 4'd11;       
	  6'd60 : out_bits = 4'd12;       
	  6'd61 : out_bits = 4'd7;       
	  6'd62 : out_bits = 4'd2;      
	  6'd63 : out_bits = 4'd14;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S4_Box

module S5_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd2;             
	  6'd1  : out_bits = 4'd12;             
	  6'd2  : out_bits = 4'd4;            
	  6'd3  : out_bits = 4'd1;             
	  6'd4  : out_bits = 4'd7;             
	  6'd5  : out_bits = 4'd10;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd6;             
	  6'd8  : out_bits = 4'd8;             
	  6'd9  : out_bits = 4'd5;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd15;             
	  6'd12 : out_bits = 4'd13;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd14;             
	  6'd15 : out_bits = 4'd9;             
	  6'd16 : out_bits = 4'd14;             
	  6'd17 : out_bits = 4'd11;             
	  6'd18 : out_bits = 4'd2;             
	  6'd19 : out_bits = 4'd12;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd7;             
	  6'd22 : out_bits = 4'd13;             
	  6'd23 : out_bits = 4'd1;             
	  6'd24 : out_bits = 4'd5;             
	  6'd25 : out_bits = 4'd0;             
	  6'd26 : out_bits = 4'd15;             
	  6'd27 : out_bits = 4'd10;             
	  6'd28 : out_bits = 4'd3;             
	  6'd29 : out_bits = 4'd9;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd4;             
	  6'd33 : out_bits = 4'd2;             
	  6'd34 : out_bits = 4'd1;             
	  6'd35 : out_bits = 4'd11;             
	  6'd36 : out_bits = 4'd10;             
	  6'd37 : out_bits = 4'd13;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd8;             
	  6'd40 : out_bits = 4'd15;             
	  6'd41 : out_bits = 4'd9;             
	  6'd42 : out_bits = 4'd12;             
	  6'd43 : out_bits = 4'd5;             
	  6'd44 : out_bits = 4'd6;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd0;             
	  6'd47 : out_bits = 4'd14;             
	  6'd48 : out_bits = 4'd11;             
	  6'd49 : out_bits = 4'd8;             
	  6'd50 : out_bits = 4'd12;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd14;            
	  6'd54 : out_bits = 4'd2;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd6;        
	  6'd57 : out_bits = 4'd15;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd9;       
	  6'd60 : out_bits = 4'd10;       
	  6'd61 : out_bits = 4'd4;       
	  6'd62 : out_bits = 4'd5;      
	  6'd63 : out_bits = 4'd3;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S5_Box

module S6_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd12;             
	  6'd1  : out_bits = 4'd1;             
	  6'd2  : out_bits = 4'd10;            
	  6'd3  : out_bits = 4'd15;             
	  6'd4  : out_bits = 4'd9;             
	  6'd5  : out_bits = 4'd2;             
	  6'd6  : out_bits = 4'd6;             
	  6'd7  : out_bits = 4'd8;             
	  6'd8  : out_bits = 4'd0;             
	  6'd9  : out_bits = 4'd13;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd4;             
	  6'd12 : out_bits = 4'd14;             
	  6'd13 : out_bits = 4'd7;             
	  6'd14 : out_bits = 4'd5;             
	  6'd15 : out_bits = 4'd11;             
	  6'd16 : out_bits = 4'd10;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd4;             
	  6'd19 : out_bits = 4'd2;             
	  6'd20 : out_bits = 4'd7;             
	  6'd21 : out_bits = 4'd12;             
	  6'd22 : out_bits = 4'd9;             
	  6'd23 : out_bits = 4'd5;             
	  6'd24 : out_bits = 4'd6;             
	  6'd25 : out_bits = 4'd1;             
	  6'd26 : out_bits = 4'd13;             
	  6'd27 : out_bits = 4'd14;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd11;             
	  6'd30 : out_bits = 4'd3;             
	  6'd31 : out_bits = 4'd8;             
	  6'd32 : out_bits = 4'd9;             
	  6'd33 : out_bits = 4'd14;             
	  6'd34 : out_bits = 4'd15;             
	  6'd35 : out_bits = 4'd5;             
	  6'd36 : out_bits = 4'd2;             
	  6'd37 : out_bits = 4'd8;             
	  6'd38 : out_bits = 4'd12;             
	  6'd39 : out_bits = 4'd3;             
	  6'd40 : out_bits = 4'd7;             
	  6'd41 : out_bits = 4'd0;             
	  6'd42 : out_bits = 4'd4;             
	  6'd43 : out_bits = 4'd10;             
	  6'd44 : out_bits = 4'd1;             
	  6'd45 : out_bits = 4'd13;             
	  6'd46 : out_bits = 4'd11;             
	  6'd47 : out_bits = 4'd6;             
	  6'd48 : out_bits = 4'd4;             
	  6'd49 : out_bits = 4'd3;             
	  6'd50 : out_bits = 4'd2;             
	  6'd51 : out_bits = 4'd12;             
	  6'd52 : out_bits = 4'd9;             
	  6'd53 : out_bits = 4'd5;            
	  6'd54 : out_bits = 4'd15;             
	  6'd55 : out_bits = 4'd10;            
	  6'd56 : out_bits = 4'd11;        
	  6'd57 : out_bits = 4'd14;        
	  6'd58 : out_bits = 4'd1;       
	  6'd59 : out_bits = 4'd7;       
	  6'd60 : out_bits = 4'd6;       
	  6'd61 : out_bits = 4'd0;       
	  6'd62 : out_bits = 4'd8;      
	  6'd63 : out_bits = 4'd13;	  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S6_Box

module S7_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd4;             
	  6'd1  : out_bits = 4'd11;             
	  6'd2  : out_bits = 4'd2;            
	  6'd3  : out_bits = 4'd14;             
	  6'd4  : out_bits = 4'd15;             
	  6'd5  : out_bits = 4'd0;             
	  6'd6  : out_bits = 4'd8;             
	  6'd7  : out_bits = 4'd13;             
	  6'd8  : out_bits = 4'd3;             
	  6'd9  : out_bits = 4'd12;             
	  6'd10 : out_bits = 4'd9;             
	  6'd11 : out_bits = 4'd7;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd10;             
	  6'd14 : out_bits = 4'd6;             
	  6'd15 : out_bits = 4'd1;             
	  6'd16 : out_bits = 4'd13;             
	  6'd17 : out_bits = 4'd0;             
	  6'd18 : out_bits = 4'd11;             
	  6'd19 : out_bits = 4'd7;             
	  6'd20 : out_bits = 4'd4;             
	  6'd21 : out_bits = 4'd9;             
	  6'd22 : out_bits = 4'd1;             
	  6'd23 : out_bits = 4'd10;             
	  6'd24 : out_bits = 4'd14;             
	  6'd25 : out_bits = 4'd3;             
	  6'd26 : out_bits = 4'd5;             
	  6'd27 : out_bits = 4'd12;             
	  6'd28 : out_bits = 4'd2;             
	  6'd29 : out_bits = 4'd15;             
	  6'd30 : out_bits = 4'd8;             
	  6'd31 : out_bits = 4'd6;             
	  6'd32 : out_bits = 4'd1;             
	  6'd33 : out_bits = 4'd4;             
	  6'd34 : out_bits = 4'd11;             
	  6'd35 : out_bits = 4'd13;             
	  6'd36 : out_bits = 4'd12;             
	  6'd37 : out_bits = 4'd3;             
	  6'd38 : out_bits = 4'd7;             
	  6'd39 : out_bits = 4'd14;             
	  6'd40 : out_bits = 4'd10;             
	  6'd41 : out_bits = 4'd15;             
	  6'd42 : out_bits = 4'd6;             
	  6'd43 : out_bits = 4'd8;             
	  6'd44 : out_bits = 4'd0;             
	  6'd45 : out_bits = 4'd5;             
	  6'd46 : out_bits = 4'd9;             
	  6'd47 : out_bits = 4'd2;             
	  6'd48 : out_bits = 4'd6;             
	  6'd49 : out_bits = 4'd11;             
	  6'd50 : out_bits = 4'd13;             
	  6'd51 : out_bits = 4'd8;             
	  6'd52 : out_bits = 4'd1;             
	  6'd53 : out_bits = 4'd4;            
	  6'd54 : out_bits = 4'd10;             
	  6'd55 : out_bits = 4'd7;            
	  6'd56 : out_bits = 4'd9;        
	  6'd57 : out_bits = 4'd5;        
	  6'd58 : out_bits = 4'd0;       
	  6'd59 : out_bits = 4'd15;       
	  6'd60 : out_bits = 4'd14;       
	  6'd61 : out_bits = 4'd2;       
	  6'd62 : out_bits = 4'd3;      
	  6'd63 : out_bits = 4'd12;  
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S7_Box

module S8_Box (inp_bits, out_bits);

   input logic [5:0] inp_bits;
   output logic [3:0] out_bits;

   always_comb
     begin
	case ({{inp_bits[5], inp_bits[0]}, inp_bits[4:1]})   
	  6'd0  : out_bits = 4'd13;             
	  6'd1  : out_bits = 4'd2;             
	  6'd2  : out_bits = 4'd8;            
	  6'd3  : out_bits = 4'd4;             
	  6'd4  : out_bits = 4'd6;             
	  6'd5  : out_bits = 4'd15;             
	  6'd6  : out_bits = 4'd11;             
	  6'd7  : out_bits = 4'd1;             
	  6'd8  : out_bits = 4'd10;             
	  6'd9  : out_bits = 4'd9;             
	  6'd10 : out_bits = 4'd3;             
	  6'd11 : out_bits = 4'd14;             
	  6'd12 : out_bits = 4'd5;             
	  6'd13 : out_bits = 4'd0;             
	  6'd14 : out_bits = 4'd12;             
	  6'd15 : out_bits = 4'd7;             
	  6'd16 : out_bits = 4'd1;             
	  6'd17 : out_bits = 4'd15;             
	  6'd18 : out_bits = 4'd13;             
	  6'd19 : out_bits = 4'd8;             
	  6'd20 : out_bits = 4'd10;             
	  6'd21 : out_bits = 4'd3;             
	  6'd22 : out_bits = 4'd7;             
	  6'd23 : out_bits = 4'd4;             
	  6'd24 : out_bits = 4'd12;             
	  6'd25 : out_bits = 4'd5;             
	  6'd26 : out_bits = 4'd6;             
	  6'd27 : out_bits = 4'd11;             
	  6'd28 : out_bits = 4'd0;             
	  6'd29 : out_bits = 4'd14;             
	  6'd30 : out_bits = 4'd9;             
	  6'd31 : out_bits = 4'd2;             
	  6'd32 : out_bits = 4'd7;             
	  6'd33 : out_bits = 4'd11;             
	  6'd34 : out_bits = 4'd4;             
	  6'd35 : out_bits = 4'd1;             
	  6'd36 : out_bits = 4'd9;             
	  6'd37 : out_bits = 4'd12;             
	  6'd38 : out_bits = 4'd14;             
	  6'd39 : out_bits = 4'd2;             
	  6'd40 : out_bits = 4'd0;             
	  6'd41 : out_bits = 4'd6;             
	  6'd42 : out_bits = 4'd10;             
	  6'd43 : out_bits = 4'd13;             
	  6'd44 : out_bits = 4'd15;             
	  6'd45 : out_bits = 4'd3;             
	  6'd46 : out_bits = 4'd5;             
	  6'd47 : out_bits = 4'd8;             
	  6'd48 : out_bits = 4'd2;             
	  6'd49 : out_bits = 4'd1;             
	  6'd50 : out_bits = 4'd14;             
	  6'd51 : out_bits = 4'd7;             
	  6'd52 : out_bits = 4'd4;             
	  6'd53 : out_bits = 4'd10;            
	  6'd54 : out_bits = 4'd8;             
	  6'd55 : out_bits = 4'd13;            
	  6'd56 : out_bits = 4'd15;        
	  6'd57 : out_bits = 4'd12;        
	  6'd58 : out_bits = 4'd9;       
	  6'd59 : out_bits = 4'd0;       
	  6'd60 : out_bits = 4'd3;       
	  6'd61 : out_bits = 4'd5;       
	  6'd62 : out_bits = 4'd6;      
	  6'd63 : out_bits = 4'd11;      
	  default : out_bits = 4'd0; 		
        endcase
     end // always_comb
   
endmodule // S8_Box

module DES (input logic [63:0] key, input logic [63:0] plaintext, 
	    input logic encrypt, output logic [63:0] ciphertext);   

   logic [47:0] 	SubKey1, SubKey2, SubKey3, SubKey4;   
   logic [47:0] 	SubKey5, SubKey6, SubKey7, SubKey8;   
   logic [47:0] 	SubKey9, SubKey10, SubKey11, SubKey12;
   logic [47:0] 	SubKey13, SubKey14, SubKey15, SubKey16;
   logic [47:0]     encryption1, encryption2, encryption3, encryption4;
   logic [47:0]     encryption5, encryption6, encryption7, encryption8;
   logic [47:0]     encryption9, encryption10, encryption11, encryption12;
   logic [47:0]     encryption13, encryption14, encryption15, encryption16;

   logic [63:0] 	ip_out;
   logic [63:0] 	out_block, out_block2, out_block3, out_block4;
   logic [63:0] 	out_block5, out_block6, out_block7, out_block8;
   logic [63:0] 	out_block9, out_block10, out_block11, out_block12;
   logic [63:0] 	out_block13, out_block14, out_block15, out_block16;
   
   // SubKey generation
   GenerateKeys k1 (key, SubKey1, SubKey2, SubKey3, SubKey4,
		    SubKey5, SubKey6, SubKey7, SubKey8,
		    SubKey9, SubKey10, SubKey11, SubKey12,
		    SubKey13, SubKey14, SubKey15, SubKey16);
   // encrypt (encrypt=1) or decrypt (encrypt=0) 
assign {encryption1, encryption2, encryption3, encryption4,
        encryption5, encryption6, encryption7,  encryption8,
        encryption9, encryption10, encryption11, encryption12,
		encryption13, encryption14, encryption15, encryption16} = (encrypt==1)
		? {SubKey1, SubKey2, SubKey3, SubKey4, 
		SubKey5, SubKey6, SubKey7, SubKey8, 
		SubKey9, SubKey10, SubKey11, SubKey12, 
		SubKey13, SubKey14, SubKey15, SubKey16}
		: {SubKey16, SubKey15, SubKey14, SubKey13,
		   SubKey12, SubKey11, SubKey10, SubKey9, 
		   SubKey8, SubKey7, SubKey6, SubKey5,
		   SubKey4, SubKey3, SubKey2, SubKey1};
   // Initial Permutation (IP)
   IP b1 (plaintext, ip_out);

   // round 1
   round round1 (ip_out, encryption1, out_block);
   // round 2
   round round2 (out_block, encryption2, out_block2);
   // round 3
    round round3 (out_block2, encryption3, out_block3);
   // round 4
    round round4 (out_block3, encryption4, out_block4);
   // round 5
    round round5 (out_block4, encryption5, out_block5);
   // round 6
    round round6 (out_block5, encryption6, out_block6);
   // round 7
    round round7 (out_block6, encryption7, out_block7);
   // round 8
    round round8 (out_block7, encryption8, out_block8);
   // round 9
   round round9 (out_block8, encryption9, out_block9);
   // round 10
   round round10 (out_block9, encryption10, out_block10);
   // round 11
   round round11 (out_block10, encryption11, out_block11);
   // round 12
    round round12 (out_block11, encryption12, out_block12);
   // round 13
    round round13 (out_block12, encryption13, out_block13);
   // round 14
   round round14 (out_block13, encryption14, out_block14);
   // round 15
    round round15 (out_block14, encryption15, out_block15);
   // round 16
    round round16 (out_block15, encryption16, out_block16);
   
   // Final Permutation (IP^{-1}) (swap output of round16)
   FP FP({out_block16[31:0], out_block16[63:32]}, ciphertext);
   
endmodule // DES

module MUX (input logic [3:0] selection, logic [15:0] ciphertext_1, ciphertext_2, ciphertext_3, ciphertext_4, 
            output logic [15:0] ciphertext_display);

logic [63:0] ciphertext;

assign ciphertext_1 = {ciphertext [63:48]};
assign ciphertext_2 = {ciphertext [47:32]};
assign ciphertext_3 = {ciphertext [31:16]};
assign ciphertext_4 = {ciphertext [15:0]};

assign ciphertext_display = (selection[0] & ciphertext_1) + (selection[1] & ciphertext_2) +
(selection [2] & ciphertext_3) + (selection[3] & ciphertext_4);



//assign selection [0] = {ciphertext_display==ciphertext_1};
//assign selection [1] = {ciphertext_display==ciphertext_2};
//assign selection [2] = {ciphertext_display==ciphertext_3};
//assign selection [3] = {ciphertext_display==ciphertext_4};

endmodule
