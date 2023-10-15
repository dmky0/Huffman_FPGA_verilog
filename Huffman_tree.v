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
    Node0,
    Node1,
    Node2,
    Node3,
    Node4,
    Node5,
    Node6,
    Node7,
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
    output reg [14:0]Node0;//Node0-7 is used to save huffman tree
    output reg [14:0]Node1;
    output reg [14:0]Node2;
    output reg [14:0]Node3;
    output reg [14:0]Node4;
    output reg [14:0]Node5;
    output reg [14:0]Node6;
    output reg [14:0]Node7;
    output reg [4:0]m1;//right branch of root node
    output reg [4:0]m2;//left branch of root node
    //inner signal
    reg [8:0]min;//used to find smallest number
    reg [4:0]mm;//used to record the smallest number
    reg [8:0]min1;
    reg [8:0]min2;//used to find smallest two number
    reg [4:0]count;//used to record tree state
    reg Tr_en;//enable signal
    reg [8:0]NNum0;
    reg [8:0]NNum1;
    reg [8:0]NNum2;
    reg [8:0]NNum3;
    reg [8:0]NNum4;
    reg [8:0]NNum5;
    reg [8:0]NNum6;
    reg [8:0]NNum7;
    reg [8:0]NNum8;
    reg [8:0]NNum9;
    reg [8:0]Num10;
    reg [8:0]Num11;
    reg [8:0]Num12;
    reg [8:0]Num13;
    reg [8:0]Num14;
    reg [8:0]Num15;
    reg [8:0]Num16;
    reg [8:0]Num17;
    reg [8:0]min1_2;
    reg [1:0]State;//State 0=select min1 1=select min2 2=min1+min2

    always @(negedge Start_tree)begin
        Tr_en<=1;
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if(~n_Rst)//initial
            begin
                Node0<=15'h0;
                Node1<=15'h0;
                Node2<=15'h0;
                Node3<=15'h0;
                Node4<=15'h0;
                Node5<=15'h0;
                Node6<=15'h0;
                Node7<=15'h0;
                m1<=5'h0;
                m2<=5'h0;
                min<=9'h100;
                mm<=5'h1f;
                min1<=9'h100;// 1 0000 0000
                min2<=9'h100;
                count<=5'h0a;
                Tr_en<=0;
                NNum0<=Num0;
                NNum1<=Num1;
                NNum2<=Num2;
                NNum3<=Num3;
                NNum4<=Num4;
                NNum5<=Num5;
                NNum6<=Num6;
                NNum7<=Num7;
                NNum8<=Num8;
                NNum9<=Num9;
                Num10<=9'h100;
                Num11<=9'h100;
                Num12<=9'h100;
                Num13<=9'h100;
                Num14<=9'h100;
                Num15<=9'h100;
                Num16<=9'h100;
                Num17<=9'h100;
                min1_2<=0;
                State<=2'b00;
            end
        else if(Num0[8] || Num1[8] || Num2[8] || Num3[8] || Num4[8] || Num5[8] || Num6[8] || Num7[8] || Num8[8] || Num9[8])//Num0-9 have  1 0000 0000
            begin
                m1=5'b11111;
                Node0[0]<=Num0[8];
                Node0[1]<=Num1[8];
                Node0[2]<=Num2[8];
                Node0[3]<=Num3[8];
                Node0[4]<=Num4[8];
                Node0[5]<=Num5[8];
                Node0[6]<=Num6[8];
                Node0[7]<=Num7[8];
                Node0[8]<=Num8[8];
                Node0[9]<=Num9[8];//this case use Node0 to mark the number
                Tr_en=0;//end
            end
        else;
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if (Tr_en) begin
            case (State)
                2'b00: begin
                    //this part is used to select the min1
                    if(min>NNum0)
                        begin
                            min=NNum0;
                            mm=5'h00;
                        end
                    else;
                    if(min>NNum1)
                        begin
                            min=NNum1;
                            mm=5'h01;
                        end
                    else;
                    if(min>NNum2)
                        begin
                            min=NNum2;
                            mm=5'h02;
                        end
                    else;
                    if(min>NNum3)
                        begin
                            min=NNum3;
                            mm=5'h03;
                        end
                    else;
                    if(min>NNum4)
                        begin
                            min=NNum4;
                            mm=5'h04;
                        end
                    else;
                    if(min>NNum5)
                        begin
                            min=NNum5;
                            mm=5'h05;
                        end
                    else;
                    if(min>NNum6)
                        begin
                            min=NNum6;
                            mm=5'h06;
                        end
                    else;
                    if(min>NNum7)
                        begin
                            min=NNum7;
                            mm=5'h07;
                        end
                    else;
                    if(min>NNum8)
                        begin
                            min=NNum8;
                            mm=5'h08;
                        end
                    else;
                    if(min>NNum9)
                        begin
                            min=NNum9;
                            mm=5'h09;
                        end
                    else;
                    if(min>Num10)
                        begin
                            min=Num10;
                            mm=5'h0a;
                        end
                    else;
                    if(min>Num11)
                        begin
                            min=Num11;
                            mm=5'h0b;
                        end
                    else;
                    if(min>Num12)
                        begin
                            min=Num12;
                            mm=5'h0c;
                        end
                    else;
                    if(min>Num13)
                        begin
                            min=Num13;
                            mm=5'h0d;
                        end
                    else;
                    if(min>Num14)
                        begin
                            min=Num14;
                            mm=5'h0e;
                        end
                    else;
                    if(min>Num15)
                        begin
                            min=Num15;
                            mm=5'h0f;
                        end
                    else;
                    if(min>Num16)
                        begin
                            min=Num16;
                            mm=5'h10;
                        end
                    else;
                    if(min>Num17)
                        begin
                            min=Num17;
                            mm=5'h11;
                        end
                    else;

                    min1=min;
                    m1=mm;
                    min=9'h100;
                    mm=5'h1f;
                    State=State+1;

                    case (m1)
                    5'h00: NNum0[8]=1;
                    5'h01: NNum1[8]=1;
                    5'h02: NNum2[8]=1;
                    5'h03: NNum3[8]=1;
                    5'h04: NNum4[8]=1;
                    5'h05: NNum5[8]=1;
                    5'h06: NNum6[8]=1;
                    5'h07: NNum7[8]=1;
                    5'h08: NNum8[8]=1;
                    5'h09: NNum9[8]=1;
                    5'h0a: Num10[8]=1;
                    5'h0b: Num11[8]=1;
                    5'h0c: Num12[8]=1;
                    5'h0d: Num13[8]=1;
                    5'h0e: Num14[8]=1;
                    5'h0f: Num15[8]=1;
                    5'h10: Num16[8]=1;
                    5'h11: Num17[8]=1;
                    default: ;
                    endcase
                end
                2'b01:begin
                    //this part is used to select the min1
                    if(min>NNum0)
                        begin
                            min=NNum0;
                            mm=5'h00;
                        end
                    else;
                    if(min>NNum1)
                        begin
                            min=NNum1;
                            mm=5'h01;
                        end
                    else;
                    if(min>NNum2)
                        begin
                            min=NNum2;
                            mm=5'h02;
                        end
                    else;
                    if(min>NNum3)
                        begin
                            min=NNum3;
                            mm=5'h03;
                        end
                    else;
                    if(min>NNum4)
                        begin
                            min=NNum4;
                            mm=5'h04;
                        end
                    else;
                    if(min>NNum5)
                        begin
                            min=NNum5;
                            mm=5'h05;
                        end
                    else;
                    if(min>NNum6)
                        begin
                            min=NNum6;
                            mm=5'h06;
                        end
                    else;
                    if(min>NNum7)
                        begin
                            min=NNum7;
                            mm=5'h07;
                        end
                    else;
                    if(min>NNum8)
                        begin
                            min=NNum8;
                            mm=5'h08;
                        end
                    else;
                    if(min>NNum9)
                        begin
                            min=NNum9;
                            mm=5'h09;
                        end
                    else;
                    if(min>Num10)
                        begin
                            min=Num10;
                            mm=5'h0a;
                        end
                    else;
                    if(min>Num11)
                        begin
                            min=Num11;
                            mm=5'h0b;
                        end
                    else;
                    if(min>Num12)
                        begin
                            min=Num12;
                            mm=5'h0c;
                        end
                    else;
                    if(min>Num13)
                        begin
                            min=Num13;
                            mm=5'h0d;
                        end
                    else;
                    if(min>Num14)
                        begin
                            min=Num14;
                            mm=5'h0e;
                        end
                    else;
                    if(min>Num15)
                        begin
                            min=Num15;
                            mm=5'h0f;
                        end
                    else;
                    if(min>Num16)
                        begin
                            min=Num16;
                            mm=5'h10;
                        end
                    else;
                    if(min>Num17)
                        begin
                            min=Num17;
                            mm=5'h11;
                        end
                    else;
                    min2=min;
                    m2=mm;
                    min=9'h100;
                    mm=5'h1f;
                    State=State+1;

                    case (m2)
                    5'h00: NNum0[8]=1;
                    5'h01: NNum1[8]=1;
                    5'h02: NNum2[8]=1;
                    5'h03: NNum3[8]=1;
                    5'h04: NNum4[8]=1;
                    5'h05: NNum5[8]=1;
                    5'h06: NNum6[8]=1;
                    5'h07: NNum7[8]=1;
                    5'h08: NNum8[8]=1;
                    5'h09: NNum9[8]=1;
                    5'h0a: Num10[8]=1;
                    5'h0b: Num11[8]=1;
                    5'h0c: Num12[8]=1;
                    5'h0d: Num13[8]=1;
                    5'h0e: Num14[8]=1;
                    5'h0f: Num15[8]=1;
                    5'h10: Num16[8]=1;
                    5'h11: Num17[8]=1;
                    default: ;
                    endcase
                end
                2'b10:begin//this state is used to generate tree
                    min1_2=min1+min2;
                    if(~min1_2[8])begin//min1_2 != 1 0000 0000
                        case (count)
                        5'h0a:
                            begin
                                Num10=min1_2;
                                Node0[14:10]=count;//build table
                                Node0[9:5]=m2;
                                Node0[4:0]=m1;
                            end
                        5'h0b:
                            begin
                                Num11=min1_2;
                                Node1[14:10]=count;//build table
                                Node1[9:5]=m2;
                                Node1[4:0]=m1;
                            end
                        5'h0c:
                            begin
                                Num12=min1_2;
                                Node2[14:10]=count;//build table
                                Node2[9:5]=m2;
                                Node2[4:0]=m1;
                            end
                        5'h0d:
                            begin
                                Num13=min1_2;
                                Node3[14:10]=count;//build table
                                Node3[9:5]=m2;
                                Node3[4:0]=m1;
                            end
                        5'h0e:
                            begin
                                Num14=min1_2;
                                Node4[14:10]=count;//build table
                                Node4[9:5]=m2;
                                Node4[4:0]=m1;
                            end
                        5'h0f:
                            begin
                                Num15=min1_2;
                                Node5[14:10]=count;//build table
                                Node5[9:5]=m2;
                                Node5[4:0]=m1;
                            end
                        5'h10:
                            begin
                                Num16=min1_2;
                                Node6[14:10]=count;//build table
                                Node6[9:5]=m2;
                                Node6[4:0]=m1;
                            end
                        5'h11:
                            begin
                                Num17=min1_2;
                                Node7[14:10]=count;//build table
                                Node7[9:5]=m2;
                                Node7[4:0]=m1;
                            end
                        default: ;
                    endcase
                    count=count+1;
                    if (count == 5'h13) begin//one more loop for get new min1 and min2
                        Tr_en=0;//end
                    end
                    end
                    else if(min1_2[8])//min1+min2 == 1 0000 0000
                        Tr_en=0;//end;
                    State=2'b00;
                end
                2'b11: ;
                default: ;
            endcase
        end
        else;
    end

endmodule
