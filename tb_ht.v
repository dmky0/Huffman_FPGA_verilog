`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/12 15:28:10
// Design Name: 
// Module Name: tb_ht
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
`include "Huffman_tree.v"

module tb_ht();
    reg clk_in;
    reg nRst;
    reg start;
    reg [8:0]num0;
    reg [8:0]num1;
    reg [8:0]num2;
    reg [8:0]num3;
    reg [8:0]num4;
    reg [8:0]num5;
    reg [8:0]num6;
    reg [8:0]num7;
    reg [8:0]num8;
    reg [8:0]num9;

    wire [14:0]tree0;
    wire [14:0]tree1;
    wire [14:0]tree2;
    wire [14:0]tree3;
    wire [14:0]tree4;
    wire [14:0]tree5;
    wire [14:0]tree6;
    wire [14:0]tree7;
    wire [4:0]M1;
    wire [4:0]M2;

    Huffman_tree uut(
        .Clk_in(clk_in),
        .n_Rst(nRst),
        .Start_tree(start),
        .Num0(num0),
        .Num1(num1),
        .Num2(num2),
        .Num3(num3),
        .Num4(num4),
        .Num5(num5),
        .Num6(num6),
        .Num7(num7),
        .Num8(num8),
        .Num9(num9),
        .Tree0(tree0),
        .Tree1(tree1),
        .Tree2(tree2),
        .Tree3(tree3),
        .Tree4(tree4),
        .Tree5(tree5),
        .Tree6(tree6),
        .Tree7(tree7),
        .m1(M1),
        .m2(M2)
    );

    initial begin
        clk_in = 0;
        nRst = 0;
        start = 0;
        //input data [53, 40, 26, 14, 38, 23, 7, 12, 4, 39]
/*        num0 = 9'h35;
        num1 = 9'h28;
        num2 = 9'h1a;
        num3 = 9'h0e;
        num4 = 9'h26;
        num5 = 9'h17;
        num6 = 9'h07;
        num7 = 9'h0c;
        num8 = 9'h04;
        num9 = 9'h27;
*/

        num0 = 9'h100;
        num1 = 9'h0;
        num2 = 9'h0;
        num3 = 9'h0;
        num4 = 9'h0;
        num5 = 9'h0;
        num6 = 9'h0;
        num7 = 9'h0;
        num8 = 9'h0;
        num9 = 9'h0;

        #500;
        nRst = 1;

        start = 1;
        #200;
        start = 0;
        
    end

    always #5 clk_in = ~clk_in;

endmodule
