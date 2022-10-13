`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 16:39:03
// Design Name: 
// Module Name: FSM_LightStand
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


module FSM_LightStand(
    input i_clk, i_reset,
    input [2:0] i_button,
    output [2:0] o_lightState
    );

    parameter TRUE = 1'b1, FALSE = 1'b0;
    parameter LIGHT0 = 3'b000, LIGHT1 = 3'b001, LIGHT2 = 3'b010, LIGHT3 = 3'b011, LIGHT4 = 3'b100;
    reg [2:0] r_lightState = LIGHT0, nextState, curState;
    assign o_lightState = r_lightState;

    always @(posedge i_clk or posedge i_reset) begin
        if(i_reset) begin
            curState <= LIGHT0;
        end
        else curState <= nextState;
    end


    always @(curState or i_button or i_clk) begin
        case (curState)
            LIGHT0:
            if(i_button[0] == TRUE) begin
                nextState <= LIGHT1;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= LIGHT0;
            end
            else nextState <= LIGHT0;

            LIGHT1:
            if(i_button[0] == TRUE) begin
                nextState <= LIGHT2;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= LIGHT0;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= LIGHT0;
            end
            else nextState <= LIGHT1;

            LIGHT2:
            if(i_button[0] == TRUE) begin
                nextState <= LIGHT3;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= LIGHT1;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= LIGHT0;
            end
            else nextState <= LIGHT2;

            LIGHT3:
            if(i_button[0] == TRUE) begin
                nextState <= LIGHT4;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= LIGHT2;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= LIGHT0;
            end
            else nextState <= LIGHT3;

            LIGHT4:
            if(i_button[0] == TRUE) begin
                nextState <= LIGHT4;
            end
            else if(i_button[1] == TRUE) begin
                nextState <= LIGHT3;
            end
            else if(i_button[2] == TRUE) begin
                nextState <= LIGHT0;
            end
            else nextState <= LIGHT4;

            default : nextState <= LIGHT0;
        endcase
    end

    always @(curState) begin
        case (curState)
            LIGHT0 : r_lightState <= 3'b000; 
            LIGHT1 : r_lightState <= 3'b001;
            LIGHT2 : r_lightState <= 3'b010;
            LIGHT3 : r_lightState <= 3'b011;
            LIGHT4 : r_lightState <= 3'b100;
            default: r_lightState <= 3'b000;
        endcase
    end
endmodule
