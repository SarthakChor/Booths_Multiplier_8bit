`timescale 1ns / 1ps

module Booths_Multiplier_8bit(clk,Product,In1,In2);
input clk;
input [7:0]In1;
input [7:0]In2;
output reg [15:0]Product;
integer i;
reg [16:0]comp2s_In1,Accu0,Accu1;

always @ (posedge clk) // Positive edge triggred operations
begin 
       comp2s_In1 = {~In1 + 1'b1,9'b000000000}; // 2s complement of In1
       Accu0 = {In1,9'b000000000};
       Accu1 = {8'b00000000,In2,1'b0};
        
       for(i=0; i<8; i=i+1)
       begin
       case(Accu1[1:0])
       2'b00: Accu1 = {Accu1[16], Accu1[16:1]}; // Performing Signed right shift
       2'b01: begin
                  Accu1 = Accu1 + Accu0;
                  Accu1 = {Accu1[16],Accu1[16:1]}; // Performing Signed right shift
              end
       2'b10: begin
                  Accu1 = Accu1 + comp2s_In1;
                  Accu1 = {Accu1[16],Accu1[16:1]}; // Performing Signed right shift
              end
       2'b11: Accu1 = {Accu1[16], Accu1[16:1]}; // Performing Signed right shift
       default : Accu1 = 17'bxxxxxxxxxxxxxxxxx;
       endcase
       end // end of the loop
Product = Accu1[16:1];
end // end of always block
endmodule
