`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 17:28:39
// Design Name: 
// Module Name: tb_hc
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
`include "Huffman_code.v"

module tb_hc();
    reg clk_in;
    reg nRst;
    reg start;
    reg [14:0]Tree0;
    reg [14:0]Tree1;
    reg [14:0]Tree2;
    reg [14:0]Tree3;
    reg [14:0]Tree4;
    reg [14:0]Tree5;
    reg [14:0]Tree6;
    reg [14:0]Tree7;
    reg [4:0]m1;
    reg [4:0]m2;

    wire [12:0]Code0;
    wire [12:0]Code1;
    wire [12:0]Code2;
    wire [12:0]Code3;
    wire [12:0]Code4;
    wire [12:0]Code5;
    wire [12:0]Code6;
    wire [12:0]Code7;
    wire [12:0]Code8;
    wire [12:0]Code9;

    Huffman_code uut(
        .Clk_in(clk_in),
        .n_Rst(nRst),
        .Start_code(start),
        .Tree0(Tree0),
        .Tree1(Tree1),
        .Tree2(Tree2),
        .Tree3(Tree3),
        .Tree4(Tree4),
        .Tree5(Tree5),
        .Tree6(Tree6),
        .Tree7(Tree7),
        .m1(m1),
        .m2(m2),
        .Code0(Code0),
        .Code1(Code1),
        .Code2(Code2),
        .Code3(Code3),
        .Code4(Code4),
        .Code5(Code5),
        .Code6(Code6),
        .Code7(Code7),
        .Code8(Code8),
        .Code9(Code9)
    );

    initial begin
        clk_in = 0;
        nRst = 0;
        start = 0;
        //input data [53, 40, 26, 14, 38, 23, 7, 12, 4, 39]
        Tree0=15'h28c8;
        Tree1=15'h2cea;
        Tree2=15'h30a3;
        Tree3=15'h344b;
        Tree4=15'h388c;
        Tree5=15'h3c29;
        Tree6=15'h400d;
        Tree7=15'h45ee;
        m1=16;
        m2=17;

        #500;
        nRst = 1;

        start = 1;
        #200;
        start = 0;

    end

    always #5 clk_in = ~clk_in;

endmodule
