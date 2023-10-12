`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/12 08:42:17
// Design Name: 
// Module Name: Huffman_tree
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

//this module is used to generate huffman tree
module Huffman_tree(
    Clk_in,
    n_Rst,
    Start_tree,
    Num0,
    Num1,
    Num2,
    Num3,
    Num4,
    Num5,
    Num6,
    Num7,
    Num8,
    Num9,
    Tree0,
    Tree1,
    Tree2,
    Tree3,
    Tree4,
    Tree5,
    Tree6,
    Tree7,
    m1,
    m2
    );
    //input signal
    input wire Clk_in;
    input wire n_Rst;
    input wire Start_tree;
    input wire [8:0]Num0;
    input wire [8:0]Num1;
    input wire [8:0]Num2;
    input wire [8:0]Num3;
    input wire [8:0]Num4;
    input wire [8:0]Num5;
    input wire [8:0]Num6;
    input wire [8:0]Num7;
    input wire [8:0]Num8;
    input wire [8:0]Num9;
    //output signal
    output reg [14:0]Tree0;//Tree0-7 is used to save huffman tree
    output reg [14:0]Tree1;
    output reg [14:0]Tree2;
    output reg [14:0]Tree3;
    output reg [14:0]Tree4;
    output reg [14:0]Tree5;
    output reg [14:0]Tree6;
    output reg [14:0]Tree7;
    output reg [4:0]m1;//left branch of root node
    output reg [4:0]m2;//right branch of root node
    //inner signal
    reg [8:0]min;//used to find smallest number
    reg flag;//used to mark min1 and min2
    reg [4:0]mm;//used to record the smallest number
    reg [8:0]min1;
    reg [8:0]min2;//used to find smallest two number
    reg [4:0]count;//used to record tree state
    reg Tr_en;//enable signal
    reg [8:0]Num10;
    reg [8:0]Num11;
    reg [8:0]Num12;
    reg [8:0]Num13;
    reg [8:0]Num14;
    reg [8:0]Num15;
    reg [8:0]Num16;
    reg [8:0]Num17;

    always @(negedge Start_tree)begin
        Tr_en<=1;
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if(~n_Rst)//initial
            begin
                Tree0<=15'h0;
                Tree1<=15'h0;
                Tree2<=15'h0;
                Tree3<=15'h0;
                Tree4<=15'h0;
                Tree5<=15'h0;
                Tree6<=15'h0;
                Tree7<=15'h0;
                m1<=5'h0;
                m2<=5'h0;
                min<=9'h100;
                flag<=0;
                mm<=5'h00;
                min1<=9'h100;// 1 0000 0000
                min2<=9'h100;
                count<=5'h0a;
                Tr_en<=0;
                Num10<=9'h100;
                Num11<=9'h100;
                Num12<=9'h100;
                Num13<=9'h100;
                Num14<=9'h100;
                Num15<=9'h100;
                Num16<=9'h100;
                Num17<=9'h100;
            end
        else if(Num0[8] || Num1[8] || Num2[8] || Num3[8] || Num4[8] || Num5[8] || Num6[8] || Num7[8] || Num8[8] || Num9[8])//Num0-9 have  1 0000 0000
            begin
                m1<=5'b11111;
                Tr_en<=0;//end
            end
        else;
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if (Tr_en == 1) begin
            min<=9'h100;
            min1<=9'h100;
            min2<=9'h100;
            //this part is used to select the minimum number
            if(min<Num0)
                begin
                    min<=Num0;
                    mm<=5'h00;
                end
            else;
            if(min<Num1)
                begin
                    min<=Num1;
                    mm<=5'h01;
                end
            else;
            if(min<Num2)
                begin
                    min<=Num2;
                    mm<=5'h02;
                end
            else;
            if(min<Num3)
                begin
                    min<=Num3;
                    mm<=5'h03;
                end
            else;
            if(min<Num4)
                begin
                    min<=Num4;
                    mm<=5'h04;
                end
            else;
            if(min<Num5)
                begin
                    min<=Num5;
                    mm<=5'h05;
                end
            else;
            if(min<Num6)
                begin
                    min<=Num6;
                    mm<=5'h06;
                end
            else;
            if(min<Num7)
                begin
                    min<=Num7;
                    mm<=5'h00;
                end
            else;
            if(min<Num8)
                begin
                    min<=Num8;
                    mm<=5'h08;
                end
            else;
            if(min<Num9)
                begin
                    min<=Num9;
                    mm<=5'h09;
                end
            else;
            if(min<Num10)
                begin
                    min<=Num10;
                    mm<=5'h0a;
                end
            else;
            if(min<Num11)
                begin
                    min<=Num11;
                    mm<=5'h0b;
                end
            else;
            if(min<Num12)
                begin
                    min<=Num12;
                    mm<=5'h0c;
                end
            else;
            if(min<Num13)
                begin
                    min<=Num13;
                    mm<=5'h0d;
                end
            else;
            if(min<Num14)
                begin
                    min<=Num14;
                    mm<=5'h0e;
                end
            else;
            if(min<Num15)
                begin
                    min<=Num15;
                    mm<=5'h0f;
                end
            else;
            if(min<Num16)
                begin
                    min<=Num16;
                    mm<=5'h10;
                end
            else;
            if(min<Num17)
                begin
                    min<=Num17;
                    mm<=5'h11;
                end
            else;
        
        case (mm)
            5'h00: Num0[8]<=1;
            5'h01: Num1[8]<=1;
            5'h02: Num2[8]<=1;
            5'h03: Num3[8]<=1;
            5'h04: Num4[8]<=1;
            5'h05: Num5[8]<=1;
            5'h06: Num6[8]<=1;
            5'h07: Num7[8]<=1;
            5'h08: Num8[8]<=1;
            5'h09: Num9[8]<=1;
            5'h10: Num10[8]<=1;
            5'h11: Num11[8]<=1;
            5'h12: Num12[8]<=1;
            5'h13: Num13[8]<=1;
            5'h14: Num14[8]<=1;
            5'h15: Num15[8]<=1;
            5'h16: Num16[8]<=1;
            5'h17: Num17[8]<=1;
            default: ;
        endcase

        if (flag == 0) begin
            min1<=min;
            m1<=mm;
        end
        else begin//m1 and m2 is found
            min2<min;
            m2<=mm;
            min<=min1+min2;

            if (min[8] == 0) begin
                case (count)
                    5'h0a:
                        begin
                            Num10<=min;
                            Tree0[14:10]<=count;//build table
                            Tree0[9:5]<=m1;
                            Tree0[4:0]<=m2;
                        end
                    5'h0b:
                        begin
                            Num11<=min;
                            Tree1[14:10]<=count;//build table
                            Tree1[9:5]<=m1;
                            Tree1[4:0]<=m2;
                        end
                    5'h0c:
                        begin
                            Num12<=min;
                            Tree2[14:10]<=count;//build table
                            Tree2[9:5]<=m1;
                            Tree2[4:0]<=m2;
                        end
                    5'h0d:
                        begin
                            Num13<=min;
                            Tree3[14:10]<=count;//build table
                            Tree3[9:5]<=m1;
                            Tree3[4:0]<=m2;
                        end
                    5'h0e:
                        begin
                            Num14<=min;
                            Tree4[14:10]<=count;//build table
                            Tree4[9:5]<=m1;
                            Tree4[4:0]<=m2;
                        end
                    5'h0f:
                        begin
                            Num15<=min;
                            Tree5[14:10]<=count;//build table
                            Tree5[9:5]<=m1;
                            Tree5[4:0]<=m2;
                        end
                    5'h10:
                        begin
                            Num16<=min;
                            Tree6[14:10]<=count;//build table
                            Tree6[9:5]<=m1;
                            Tree6[4:0]<=m2;
                        end
                    5'h11:
                        begin
                            Num17<=min;
                            Tree7[14:10]<=count;//build table
                            Tree7[9:5]<=m1;
                            Tree7[4:0]<=m2;
                        end
                    default: ;
                endcase
                count<=count+1;
            end
            else//min1+min2 == 1 0000 0000
                Tr_en<=0;//end;
        end
        end
        else;
    end

endmodule
