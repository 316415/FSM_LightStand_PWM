`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 16:14:02
// Design Name: 
// Module Name: comparator
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


module comparator(
    input [9:0] i_counter,
    output o_light1, o_light2, o_light3, o_light4
    );

    assign o_light1 = (i_counter < 300) ? 1'b1 : 1'b0;
    assign o_light2 = (i_counter < 600) ? 1'b1 : 1'b0;
    assign o_light3 = (i_counter < 800) ? 1'b1 : 1'b0;
    assign o_light4 = (i_counter < 999) ? 1'b1 : 1'b0;
endmodule
