`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 01:41:25 AM
// Design Name: 
// Module Name: fadder_1bit
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


module fadder_1bit(
    input A,
    input B,
    output X,
    output CARRY
    );
    

assign X = A ^ B;
assign CARRY = A & B;
endmodule
