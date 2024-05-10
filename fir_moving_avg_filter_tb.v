`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/10/2024 12:05:50 AM
// Design Name: 
// Module Name: fir_moving_avg_filter_tb
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


module fir_moving_avg_filter_tb(
    
    );
    
    fir_moving_avg_filter #(.N(16)) uut (
        .clk(clk),
        .reset_n(reset_n),
        .noisy(noisy),
        .noisy_scaled(noisy_scaled),
        .filtered_scaled(filtered_scaled)
    );
    localparam N=16;
    reg clk, reset_n;
    reg [N-1:0] noisy;
    wire [N-1:0] noisy_scaled;
    wire [N-1:0] filtered_scaled; 
    
    
    
    // input sine wave data
    initial
    $readmemb("noisy8.mem", RAM);
    
    // Create the RAM
    reg [N-1:0] RAM [31:0]; 
    
    // create a clock
    initial 
    begin
    reset_n=1'b1;
    clk = 0;
    end
    always 
    #2 clk = ~ clk;  
    
    // Read RAMM data and give to design
    always@(posedge clk)
        noisy <= RAM[Address]; 
        
    // Address counter
    reg [4:0] Address; 
    initial
    Address = 0; 
    always@(posedge clk)
    begin
        if (Address == 31)
            Address = 0; 
        else
            Address = Address + 1; 
    end     


endmodule
