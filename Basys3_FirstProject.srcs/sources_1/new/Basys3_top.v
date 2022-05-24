`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 04/26/2022 11:24:23 PM
// Design Name: 
// Module Name: Basys3_top
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


module Basys3_top(
    output [15:0] led,
    output Hsync, Vsync,
    output reg [3:0] vgaRed, vgaBlue, vgaGreen,
    input i_clk
    );

// Clock for the video card, 10 Mhz
wire clk; 
wire vert_clk;
wire display_v;
wire display_h;
wire display;
reg [3:0] vgaR_sig;
reg [3:0] vgaB_sig;
reg [3:0] vgaG_sig;
wire [9:0] v_count;
wire [8:0] h_count;

clock_pll PLL (
    .clk(i_clk),
    .o_clk(clk)
    );
    
horizontal_sync hsync (
    .clk(clk),
    .vert_clk(vert_clk),
    .D(display_h),
    .FP(),
    .SP(Hsync),
    .BP(),
    .count(h_count)
    );
 
vertical_sync vsync (
    .clk(vert_clk),
    .D(display_v),
    .FP(),
    .SP(Vsync),
    .BP(),
    .count(v_count)
    );

assign led[15] = clk;
assign display = ~display_h & ~display_v;

always @(h_count, v_count) begin
    if (v_count <= 225 || v_count >= 375) begin 
        if (h_count <= 54) begin
            vgaR_sig <= 4'hb;
            vgaG_sig <= 4'h1;
            vgaB_sig <= 4'h3;   
        end
        else if (h_count <= 63) begin
            vgaR_sig <= 4'hF;
            vgaG_sig <= 4'hF;
            vgaB_sig <= 4'hF;
        end
        else if (h_count <= 81) begin
            vgaR_sig <= 4'h0;
            vgaG_sig <= 4'h2;
            vgaB_sig <= 4'h5;
        end
        else if (h_count <= 90) begin
            vgaR_sig <= 4'hF;
            vgaG_sig <= 4'hF;
            vgaB_sig <= 4'hF;
        end 
        else begin
            vgaR_sig <= 4'hb;
            vgaG_sig <= 4'h1;
            vgaB_sig <= 4'h3;          
        end
    end
    else if (v_count <= 263 || v_count >= 338) begin
        if (h_count <= 63) begin
            vgaR_sig <= 4'hF;
            vgaG_sig <= 4'hF;
            vgaB_sig <= 4'hF;   
        end
        else if (h_count <= 81) begin
            vgaR_sig <= 4'h0;
            vgaG_sig <= 4'h2;
            vgaB_sig <= 4'h5;
        end
        else begin
            vgaR_sig <= 4'hF;
            vgaG_sig <= 4'hF;
            vgaB_sig <= 4'hF;        
        end
    end
    else begin
        vgaR_sig <= 4'h0;
        vgaG_sig <= 4'h2;
        vgaB_sig <= 4'h5;
    end
end


always @(display) begin
    if (display) begin
        vgaRed <= vgaR_sig;
        vgaBlue <= vgaB_sig;
        vgaGreen <= vgaG_sig;
    end
    else begin
        vgaRed <= 4'h0;
        vgaBlue <= 4'h0;
        vgaGreen <= 4'h0;
    end
end


endmodule
