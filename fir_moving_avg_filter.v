`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/09/2024 10:15:37 PM
// Design Name: 
// Module Name: fir_moving_avg_filter
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


module fir_moving_avg_filter #(parameter N=16) (
    input clk, reset_n, 
    input [N-1:0] noisy,
    output reg [N-1:0] noisy_scaled,
    output reg [N-1:0] filtered_scaled
    );
    // moving average filter, 3rd order
    // 4 coefficients; 1/(order+1) = 1/4 
    // 1/4 x 128(scaling factor) = 32 = 6 bits = 6'd32
    localparam scaling_factor = 6'd32;
    localparam scaling_input = 8'd128;
    wire [N-1:0] x1, x2, x3; 
    
    D_FlipFlop #(.N(16)) DFF1 (
        .clk(clk),
        .reset_n(reset_n),
        .sig_in(noisy),
        .delay_out(x1)
    );
        D_FlipFlop #(.N(16)) DFF2 (
        .clk(clk),
        .reset_n(reset_n),
        .sig_in(x1),
        .delay_out(x2)
    );
        D_FlipFlop #(.N(16)) DFF3 (
        .clk(clk),
        .reset_n(reset_n),
        .sig_in(x2),
        .delay_out(x3)
    );
    
    wire [N-1:0] mult0, mult1, mult2, mult3;
    assign mult0 = noisy * scaling_factor; 
    assign mult1 = x1 * scaling_factor;  
    assign mult2 = x2 * scaling_factor;  
    assign mult3 = x3 * scaling_factor; 
    
    wire [N-1:0] sum; 
    assign sum = (mult0+mult1+mult2+mult3);
    
    always @(posedge clk)
    begin
        noisy_scaled <= (noisy * scaling_input);
        filtered_scaled <= sum;
    end 
    
endmodule
