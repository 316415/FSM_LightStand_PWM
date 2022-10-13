`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 16:38:27
// Design Name: 
// Module Name: button
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


module button(
    input i_clk, i_reset, i_button,
    output o_state
    );

    parameter PUSHED = 1'b1, RELEASED = 1'b0, TRUE = 1'b1, FALSE = 1'b0;
    parameter DEBOUNCE = 5_000; // 10ms
    reg prevState, r_state, nextState;
    reg [31:0] r_counter = 0;
    assign o_state = r_state;
    

    always @(posedge i_clk or posedge i_reset) begin
        if (i_reset) begin
            r_state <= RELEASED;
            prevState <= RELEASED;
            r_counter <= 0;
        end
        else begin
            if(i_button == PUSHED && prevState == RELEASED && r_counter < DEBOUNCE) begin
                r_state <= FALSE;
                r_counter <= r_counter + 1;
            end
            else if(i_button == PUSHED && prevState == RELEASED && r_counter == DEBOUNCE) begin
                prevState <= PUSHED;
                r_state <= FALSE;
                r_counter <= 0;
            end
            else if(i_button == RELEASED && prevState == PUSHED && r_counter < DEBOUNCE) begin
                r_counter <= r_counter + 1;
                r_state <= FALSE;
            end
            else if(i_button == RELEASED && prevState == PUSHED && r_counter == DEBOUNCE) begin
                prevState <= RELEASED;
                r_state <= TRUE;
                r_counter <= 0;
            end
            else begin
                r_state <= FALSE;
            end
        end
    end
endmodule
