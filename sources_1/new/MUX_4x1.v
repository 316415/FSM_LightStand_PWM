`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 16:18:53
// Design Name: 
// Module Name: 4x1_Mux
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


module MUX_4x1(
    input [3:0] i_a,
    input [2:0] i_sel,
    output o_y
    );

    reg r_y;
    assign o_y = r_y;

    always @(*) begin
        r_y <= 1'b0;
        case(i_sel)
            3'b000 : r_y <= 1'b0;
            3'b001 : r_y <= i_a[0];
            3'b010 : r_y <= i_a[1];
            3'b011 : r_y <= i_a[2];
            3'b100 : r_y <= i_a[3];
        endcase
    end
endmodule
