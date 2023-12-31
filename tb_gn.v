`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/09 00:12:39
// Design Name: 
// Module Name: tb_gn
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
`include "getnum.v"

module tb_gn();

    reg clk_in;
    reg n_Rst;
    reg start;
    reg [3:0]Data_in;

    wire [8:0]num0;
    wire [8:0]num1;
    wire [8:0]num2;
    wire [8:0]num3;
    wire [8:0]num4;
    wire [8:0]num5;
    wire [8:0]num6;
    wire [8:0]num7;
    wire [8:0]num8;
    wire [8:0]num9;
    wire Fin;

    getnum uut(
        .Clk_in(clk_in),
        .nRst(n_Rst),
        .Start(start),
        .Data_in(Data_in),
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
        .Fin(Fin)
    );

    initial begin
        clk_in = 0;
        n_Rst = 0;
        Data_in = 0;
        start = 0;

        #500;
        n_Rst = 1;

        start = 1;
        #200;
        start = 0;

        Data_in = 4'b0000; #530;
        Data_in = 4'b0001; #400;
        Data_in = 4'b0010; #260;
        Data_in = 4'b0011; #140;
        Data_in = 4'b0100; #380;
        Data_in = 4'b0101; #230;
        Data_in = 4'b0110; #70;
        Data_in = 4'b0111; #120;
        Data_in = 4'b1000; #40;
        Data_in = 4'b1001; #390;
//        #10 Data_in = 4'b1111;

    end

    always #5 clk_in = ~clk_in;

endmodule