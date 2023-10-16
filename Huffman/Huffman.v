`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/16 18:12:15
// Design Name: 
// Module Name: Huffman
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

module Huffman(
    Clk_in,
    n_Rst,
    Start,
    Data_in,
    Out,
    Outt
    );
    //input signal
    input wire Clk_in;
    input wire n_Rst;
    input wire Start;
    input wire [3:0]Data_in;
    ////output signal
    output reg Out;
    output reg Outt;
    //inner signal
    reg [8:0]Num0;
    reg [8:0]Num1;
    reg [8:0]Num2;
    reg [8:0]Num3;
    reg [8:0]Num4;
    reg [8:0]Num5;
    reg [8:0]Num6;
    reg [8:0]Num7;
    reg [8:0]Num8;
    reg [8:0]Num9;

    wire [8:0]NNum0;
    wire [8:0]NNum1;
    wire [8:0]NNum2;
    wire [8:0]NNum3;
    wire [8:0]NNum4;
    wire [8:0]NNum5;
    wire [8:0]NNum6;
    wire [8:0]NNum7;
    wire [8:0]NNum8;
    wire [8:0]NNum9;

    reg [14:0]Node0;
    reg [14:0]Node1;
    reg [14:0]Node2;
    reg [14:0]Node3;
    reg [14:0]Node4;
    reg [14:0]Node5;
    reg [14:0]Node6;
    reg [14:0]Node7;
    reg [4:0]m1;
    reg [4:0]m2;

    wire [14:0]NNode0;
    wire [14:0]NNode1;
    wire [14:0]NNode2;
    wire [14:0]NNode3;
    wire [14:0]NNode4;
    wire [14:0]NNode5;
    wire [14:0]NNode6;
    wire [14:0]NNode7;
    wire [4:0]mm1;
    wire [4:0]mm2;

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

    wire [12:0]CCode0;
    wire [12:0]CCode1;
    wire [12:0]CCode2;
    wire [12:0]CCode3;
    wire [12:0]CCode4;
    wire [12:0]CCode5;
    wire [12:0]CCode6;
    wire [12:0]CCode7;
    wire [12:0]CCode8;
    wire [12:0]CCode9;

    reg Start_getnum;
    reg Start_tree;
    reg Start_code;
    reg Start_out;
    
    reg Fin_getnum;
    reg Fin_tree;
    reg Fin_code;
    reg Fin_out;

    wire FFin_getnum;
    wire FFin_tree;
    wire FFin_code;
    wire FFin_out;
    wire OOut;
    wire OOutt;

    reg [1:0]Count;
    reg Enable;
    reg flag;
    
getnum Gn(
    .Clk_in(Clk_in),
    .nRst(n_Rst),
    .Start(Start_getnum),
    .Data_in(Data_in),
    .Num0(NNum0),
    .Num1(NNum1),
    .Num2(NNum2),
    .Num3(NNum3),
    .Num4(NNum4),
    .Num5(NNum5),
    .Num6(NNum6),
    .Num7(NNum7),
    .Num8(NNum8),
    .Num9(NNum9),
    .Fin(FFin_getnum)
);

Huffman_tree Ht(
    .Clk_in(Clk_in),
    .n_Rst(n_Rst),
    .Start_tree(Start_tree),
    .Num0(Num0),
    .Num1(Num1),
    .Num2(Num2),
    .Num3(Num3),
    .Num4(Num4),
    .Num5(Num5),
    .Num6(Num6),
    .Num7(Num7),
    .Num8(Num8),
    .Num9(Num9),
    .Node0(NNode0),
    .Node1(NNode1),
    .Node2(NNode2),
    .Node3(NNode3),
    .Node4(NNode4),
    .Node5(NNode5),
    .Node6(NNode6),
    .Node7(NNode7),
    .m1(mm1),
    .m2(mm2),
    .Fin(FFin_tree)
);

Huffman_code Hc(
    .Clk_in(Clk_in),
    .n_Rst(n_Rst),
    .Start_code(Start_code),
    .Tree0(Node0),
    .Tree1(Node1),
    .Tree2(Node2),
    .Tree3(Node3),
    .Tree4(Node4),
    .Tree5(Node5),
    .Tree6(Node6),
    .Tree7(Node7),
    .m1(m1),
    .m2(m2),
    .Code0(CCode0),
    .Code1(CCode1),
    .Code2(CCode2),
    .Code3(CCode3),
    .Code4(CCode4),
    .Code5(CCode5),
    .Code6(CCode6),
    .Code7(CCode7),
    .Code8(CCode8),
    .Code9(CCode9),
    .Fin(FFin_code)
);

Out_put Op(
    .Clk_in(CLk_in),
    .n_Rst(n_Rst),
    .Start_out(Start_out),
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
    .Out(OOut),
    .Outt(OOutt),
    .Fin(FFin_out)
);

always @(negedge Start) begin
    Enable<=1;
end

always @(posedge Clk_in or negedge n_Rst) begin
     if(~n_Rst)//initial
            begin
                Fin_getnum=0;
                Fin_tree=0;
                Fin_code=0;
                Fin_out=0;
                Start_getnum=0;
                Start_tree=0;
                Start_code=0;
                Start_out=0;
                Out=0;
                Outt=0;
                Count=0;
                Enable=0;
                flag=0;
            end
end

always @(posedge Clk_in or negedge n_Rst) begin
    Num0<=NNum0;
    Num1<=NNum1;
    Num2<=NNum2;
    Num3<=NNum3;
    Num4<=NNum4;
    Num5<=NNum5;
    Num6<=NNum6;
    Num7<=NNum7;
    Num8<=NNum8;
    Num9<=NNum9;
    Node0<=NNode0;
    Node1<=NNode1;
    Node2<=NNode2;
    Node3<=NNode3;
    Node4<=NNode4;
    Node5<=NNode5;
    Node6<=NNode6;
    Node7<=NNode7;
    m1<=mm1;
    m2<=mm2;
    Code0<=CCode0;
    Code1<=CCode1;
    Code2<=CCode2;
    Code3<=CCode3;
    Code4<=CCode4;
    Code5<=CCode5;
    Code6<=CCode6;
    Code7<=CCode7;
    Code8<=CCode8;
    Code9<=CCode9;
    Fin_code<=FFin_code;
    Fin_getnum<=FFin_getnum;
    Fin_out<=FFin_out;
    Fin_tree<=FFin_tree;
    Out<=OOut;
    Outt<=OOutt;
end

always @(posedge Clk_in or negedge n_Rst) begin
    if(Enable)begin
        case (Count)
            2'b00: begin
                if(!flag)begin
                    Start_getnum=1;
                    flag=1;
                end
                else begin
                    Start_getnum=0;
                end
                if(Fin_getnum)begin
                    Count=Count+1;
                    flag=0;
                end
            end
            2'b01: begin
                if(!flag)begin
                    Start_tree=1;
                    flag=1;
                end
                else begin
                    Start_tree=0;
                end
                if(Fin_tree)begin
                    Count=Count+1;
                    flag=0;
                end
            end
            2'b10: begin
                if(!flag)begin
                    Start_code=1;
                    flag=1;
                end
                else begin
                    Start_code=0;
                end
                if(Fin_code)begin
                    Count=Count+1;
                    flag=0;
                end
            end
            2'b11: begin
                if(!flag)begin
                    Start_out=1;
                    flag=1;
                end
                else begin
                    Start_out=0;
                end
                if(Fin_out)begin
                    Count=Count+1;
                    flag=0;
                end
            end
            default: ;
        endcase
    end
end

endmodule
