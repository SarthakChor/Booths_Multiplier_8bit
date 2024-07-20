`timescale 1ns / 1ps

module Booths_Multiplier_8bit_tb();
// Inputs
reg clk_in;
reg [7:0] In1;
reg [7:0] In2;

// Outputs
wire [15:0] Product;
wire clk_out;

Booths_Multiplier_8bit dut (clk_out,clk_in,Product,In1,In2);

initial begin
	// Initialize Inputs
	clk_in = 0;
	forever #2 clk_in =~clk_in;
	end
	
initial begin
	In1 = 8'h04; // In1=4
	In2 = 8'h0a; // In2=10
	#4
	In1 = 1; // In1=1
	In2 = -1; // In2=-1
	#4
	In1 = 8'h06; // In1=6
	In2 = 8'h02; // In2=2
	#4
	In1 = 8'b00000111; // In1=7
	In2 = 8'b1000; // In2=8
	#4
	In1 = 8'h02; // In1=2
	In2 = 8'h1a; // In2=26
	#4
	In1 = 8'h02; //In1=2
	In2 = 8'h0b; //In2=11
	#4
	In1 = 8'h06; //In1=6
	In2 = 8'h05; //In2=5
	#4
	In1 = 10;
	In2 = -11;
	#4
	In1 = -5;
	In2 = -5;
	#4 $finish;	
end
endmodule
