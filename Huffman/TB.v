`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 21:07:33
// Design Name: 
// Module Name: TB
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
`include "Huffman.v"

module TB();
    reg clk_in;
    reg nRst;
    reg start;
    reg [3:0]Data_in;

    wire Out;
    wire Outt;

    Huffman uut(
        .Clk_in(clk_in),
        .n_Rst(nRst),
        .Start(start),
        .Data_in(Data_in),
        .Out(Out),
        .Outt(Outt)
    );

initial begin
        clk_in = 0;
        nRst = 0;
        Data_in = 0;
        start = 0;

        #500;
        nRst = 1;

        start = 1;
        #1;
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

    end

    always #5 clk_in = ~clk_in;

endmodule
