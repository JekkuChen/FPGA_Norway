`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 05/04/2022 01:53:38 AM
// Design Name: 
// Module Name: horizontal_sync 
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


module horizontal_sync(
    input clk,
    output reg D, FP, SP, BP,
    output reg vert_clk,
    output reg [8:0] count
    );



initial begin
    count = 0;
end
 
 
always @ (posedge clk) begin
  if (count >= 264) begin
    count <= 1'b0;
    vert_clk <= 1;
  end
  else begin
    count <= count + 1'b1;
    vert_clk <= 0;
  end
end

always @ (count) begin
    D <= 1;
    FP <= 1;
    SP <= 1;
    BP <= 1;
    
    if (count < 200) begin
    D <= 0;
    end
    else if (count < 210) begin
    FP <= 0;
    end 
    else if (count < 242) begin
    SP <= 0;
    end
    else begin
    BP <= 0;
    end
end
    
endmodule
