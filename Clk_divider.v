`timescale 1ns / 1ps

module Clk_divider(
    input clk_in,
    output reg clk_out
);
integer counter;
// Initial values for clk_out and counter
initial begin
    clk_out = 0;
    counter = 0;
end

always @(posedge clk_in ) 
begin
        counter <= counter + 1;
        if (counter == 6)   // Say counter==K. where K can be calculated as [(Desired Time period of output clock)*(10^8)]
        begin
            clk_out <= ~clk_out;
            counter <= 0;
         end
end
endmodule
