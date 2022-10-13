`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2022/10/13 16:55:09
// Design Name: 
// Module Name: top_FSM_LightStand_PWM
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


module top_FSM_LightStand_PWM(
    input i_clk, i_reset,
    input [2:0] i_button,
    output o_light
    );

    wire w_clk;

    clock_divider clk_div(
    .i_clk(i_clk),
    .i_reset(i_reset),
    .o_clk(w_clk)
    );

    wire [9:0] w_clock_counter;
    clock_counter clk_cnt(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .o_counter(w_clock_counter)
    );

    wire [3:0] w_light;

    comparator cmp(
    .i_counter(w_clock_counter),
    .o_light1(w_light[0]),
    .o_light2(w_light[1]),
    .o_light3(w_light[2]),
    .o_light4(w_light[3])
    );

    wire [2:0] w_button;

    button up_btn(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .i_button(i_button[0]),
    .o_state(w_button[0])
    );

    button down_btn(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .i_button(i_button[1]),
    .o_state(w_button[1])
    );

    button onOff_btn(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .i_button(i_button[2]),
    .o_state(w_button[2])
    );

    wire [2:0] w_lightState;
    FSM_LightStand FSM_lightStand(
    .i_clk(w_clk),
    .i_reset(i_reset),
    .i_button(w_button),
    .o_lightState(w_lightState)
    );

    MUX_4x1 mux_4x1(
    .i_a(w_light),
    .i_sel(w_lightState),
    .o_y(o_light)
    );
endmodule
