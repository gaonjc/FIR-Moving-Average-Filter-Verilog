`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2024 10:55:55 PM
// Design Name: 
// Module Name: D_FlipFlop
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


module D_FlipFlop #(parameter N=16) (
    input clk, reset_n, 
    input [N-1:0] sig_in,
    output reg [N-1:0] delay_out

    );
    
    always @(posedge clk, negedge reset_n)
    begin
        if(~reset_n)
            delay_out <= 'b0;
        else
            delay_out <= sig_in;
    end
    
    
endmodule
