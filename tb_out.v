`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 13:45:39
// Design Name: 
// Module Name: tb_out
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
`include "output.v"

module tb_out();
    reg clk_in;
    reg nRst;
    reg start;
    reg [12:0]Code0;
    reg [12:0]Code1;
    reg [12:0]Code2;
    reg [12:0]Code3;
    reg [12:0]Code4;
    reg [12:0]Code5;
    reg [12:0]Code6;
    reg [12:0]Code7;
    reg [12:0]Code8;
    reg [12:0]Code9;

    wire Out;
    wire Outt;
    wire [1:0]state;
    wire Fin;

    Out_put uut(
        .Clk_in(clk_in),
        .n_Rst(nRst),
        .Start_out(start),
        .Code0(Code0),
        .Code1(Code1),
        .Code2(Code2),
        .Code3(Code3),
        .Code4(Code4),
        .Code5(Code5),
        .Code6(Code6),
        .Code7(Code7),
        .Code8(Code8),
        .Code9(Code9),
        .Out(Out),
        .Outt(Outt),
        .state(state),
        .Fin(Fin)
    );

    initial begin
        clk_in = 0;
        nRst = 0;
        start = 0;
        //input data [53, 40, 26, 14, 38, 23, 7, 12, 4, 39]
        Code0=13'h0401;
        Code1=13'h0607;
        Code2=13'h0601;
        Code3=13'h0808;
        Code4=13'h0605;
        Code5=13'h0809;
        Code6=13'h0a01;
        Code7=13'h0801;
        Code8=13'h0a00;
        Code9=13'h0606;

        #500;
        nRst = 1;

        start = 1;
        #200;
        start = 0;

    end

    always #5 clk_in = ~clk_in;

endmodule
