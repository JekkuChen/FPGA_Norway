`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/11/2022 06:20:55 PM
// Design Name: 
// Module Name: clock_pll
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


module clock_pll(
    input clk,
    output o_clk
    );

reg status;
reg [3:0] count;

initial begin
    status = 0;
    count = 0;
end

always @(posedge clk) begin
    if (count < 5) begin
        count <= count + 1'b1;
    end
    else begin 
        count <= 1;
        status <= ~status;
    end
end
assign o_clk = status;

endmodule
