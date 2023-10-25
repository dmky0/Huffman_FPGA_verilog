`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/14 12:49:35
// Design Name: 
// Module Name: Huffman_code
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


module Huffman_code(
    Clk_in,
    n_Rst,
    Start_code,
    Tree0,
    Tree1,
    Tree2,
    Tree3,
    Tree4,
    Tree5,
    Tree6,
    Tree7,
    m1,
    m2,
    Code0,
    Code1,
    Code2,
    Code3,
    Code4,
    Code5,
    Code6,
    Code7,
    Code8,
    Code9,
    Fin
    );
    //input signal
    input wire Clk_in;
    input wire n_Rst;
    input wire Start_code;
    input wire [14:0]Tree0;
    input wire [14:0]Tree1;
    input wire [14:0]Tree2;
    input wire [14:0]Tree3;
    input wire [14:0]Tree4;
    input wire [14:0]Tree5;
    input wire [14:0]Tree6;
    input wire [14:0]Tree7;
    input wire [4:0]m1;
    input wire [4:0]m2;
    //output signal
    output reg [12:0]Code0;//[code_num][code_bit][code]
    output reg [12:0]Code1;
    output reg [12:0]Code2;
    output reg [12:0]Code3;
    output reg [12:0]Code4;
    output reg [12:0]Code5;
    output reg [12:0]Code6;
    output reg [12:0]Code7;
    output reg [12:0]Code8;
    output reg [12:0]Code9;
    //inner signal
    reg [8:0]code;//orignal huffman code
    reg [3:0]code_bit;//huffman code's bit
    reg [4:0]code_num;//huffman code's value
    reg Hc_en;//enable signal
    reg [14:0]Node[8:0];
    reg [1:0]State;
    reg [4:0]temp;
    reg flag;
    output reg Fin;

    always @(negedge Start_code)begin
        Hc_en<=1;
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if(~n_Rst)//initial
            begin
                Fin<=0;
                Code0<=16'h0;
                Code1<=16'h0;
                Code2<=16'h0;
                Code3<=16'h0;
                Code4<=16'h0;
                Code5<=16'h0;
                Code6<=16'h0;
                Code7<=16'h0;
                Code8<=16'h0;
                Code9<=16'h0;

                Hc_en<=0;                
                code<=9'h000000000;
                code_bit<=4'b0000;
                code_num<=0;

                Node[8][14:10]=5'b10010;//18 0x12
                Node[8][9:5]=m2;
                Node[8][4:0]=m1;
                Node[7]=Tree7;//11
                Node[6]=Tree6;//10
                Node[5]=Tree5;//0f
                Node[4]=Tree4;//0e
                Node[3]=Tree3;//0d
                Node[2]=Tree2;//0c
                Node[1]=Tree1;//0b
                Node[0]=Tree0;//0a

                State=2'b11;
                temp=m2;
                flag=0;//flag to update table

            end
        else if(m1==5'b11111)//Num0-9 have  1 0000 0000
            begin
                Code0<=13'b0001000000001;
                Code1<=13'b0100000000111;
                Code2<=13'b0100000000110;
                Code3<=13'b0100000000101;
                Code4<=13'b0100000000100;
                Code5<=13'b0100000000011;
                Code6<=13'b0100000000010;
                Code7<=13'b0100000000001;
                Code8<=13'b0101000000001;
                Code9<=13'b0101000000000;
                code=9'b000000001;
                code_bit=4'b0001;
                case (Tree0)
                    12'b10: begin
                        Code0=Code1;
                        Code1={code_bit,code};
                    end
                    12'b100: begin
                        Code0=Code2;
                        Code2={code_bit,code};
                    end
                    12'b1000: begin
                        Code0=Code3;
                        Code3={code_bit,code};
                    end
                    12'b10000: begin
                        Code0=Code4;
                        Code4={code_bit,code};
                    end
                    12'b100000: begin
                        Code0=Code5;
                        Code5={code_bit,code};
                    end
                    12'b1000000: begin
                        Code0=Code6;
                        Code6={code_bit,code};
                    end
                    12'b10000000: begin
                        Code0=Code7;
                        Code7={code_bit,code};
                    end
                    12'b100000000: begin
                        Code0=Code8;
                        Code8={code_bit,code};
                    end
                    12'b1000000000: begin
                        Code0=Code9;
                        Code9={code_bit,code};
                    end
                    default: ;
                endcase
                Hc_en=0;//end
                Fin=1;
            end
        else;
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if(Hc_en)begin
            case(State)
                2'b00:begin//prepare and update
                    if(flag)begin//update table,5'h1f stand for the child is readed
                        if (Node[8][9:5]==temp) Node[8][9:5]=5'h1f;
                        if (Node[7][9:5]==temp) Node[7][9:5]=5'h1f;
                        if (Node[6][9:5]==temp) Node[6][9:5]=5'h1f;
                        if (Node[5][9:5]==temp) Node[5][9:5]=5'h1f;
                        if (Node[4][9:5]==temp) Node[4][9:5]=5'h1f;
                        if (Node[3][9:5]==temp) Node[3][9:5]=5'h1f;
                        if (Node[2][9:5]==temp) Node[2][9:5]=5'h1f;
                        if (Node[1][9:5]==temp) Node[1][9:5]=5'h1f;
                        if (Node[0][9:5]==temp) Node[0][9:5]=5'h1f;

                        if (Node[8][4:0]==temp) Node[8][4:0]=5'h1f;
                        if (Node[7][4:0]==temp) Node[7][4:0]=5'h1f;
                        if (Node[6][4:0]==temp) Node[6][4:0]=5'h1f;
                        if (Node[5][4:0]==temp) Node[5][4:0]=5'h1f;
                        if (Node[4][4:0]==temp) Node[4][4:0]=5'h1f;
                        if (Node[3][4:0]==temp) Node[3][4:0]=5'h1f;
                        if (Node[2][4:0]==temp) Node[2][4:0]=5'h1f;
                        if (Node[1][4:0]==temp) Node[1][4:0]=5'h1f;
                        if (Node[0][4:0]==temp) Node[0][4:0]=5'h1f;

                        flag=0;
                    end
                    code_bit=1;
                    code=0;
                    if(Node[8][9:5]==5'h1f)begin
                        temp=Node[8][4:0]-5'h0a;
                        State=2'b01;
                    end
                    else begin
                        temp=Node[8][9:5]-5'h0a;
                        code=code+1;
                        State=2'b01;
                    end
                    code_num=5'h12;
                end
                2'b01:begin//left child
                    if(Node[8][9:0]==10'h3ff)begin
                        Hc_en=0; 
                        Fin=1;
                        end
                    code_num = Node[temp][9:5];
                    if(Node[temp][9:0]==10'h3ff)begin//
                        temp=Node[temp][14:10];
                        flag=1;
                        State=2'b00;
                    end
                    else if(code_num == 5'h1f)begin
                        State=2'b10;//read right child
                    end
                    else if(code_num == 5'h0a ||
                    code_num == 5'h0b ||
                    code_num == 5'h0c ||
                    code_num == 5'h0d ||
                    code_num == 5'h0e ||
                    code_num == 5'h0f ||
                    code_num == 5'h10 ||
                    code_num == 5'h11
                    )begin//go to left child
                        code_bit=code_bit+1;
                        code=code<<1;
                        code=code+1;
                        State=2'b01;
                        temp= code_num-5'ha;
                    end
                    else if(code_num == 5'h00 ||
                    code_num == 5'h01 ||
                    code_num == 5'h02 ||
                    code_num == 5'h03 ||
                    code_num == 5'h04 ||
                    code_num == 5'h05 ||
                    code_num == 5'h06 ||
                    code_num == 5'h07 ||
                    code_num == 5'h08 ||
                    code_num == 5'h09 
                    )begin//make code
                        code_bit=code_bit+1;
                        code=code<<1;
                        code=code+1;//11
                        case (code_num)
                            5'h00:Code0={code_bit,code};
                            5'h01:Code1={code_bit,code};
                            5'h02:Code2={code_bit,code};
                            5'h03:Code3={code_bit,code};
                            5'h04:Code4={code_bit,code};
                            5'h05:Code5={code_bit,code};
                            5'h06:Code6={code_bit,code};
                            5'h07:Code7={code_bit,code};
                            5'h08:Code8={code_bit,code};
                            5'h09:Code9={code_bit,code};
                            default: ;
                        endcase
                        Node[temp][9:5]=5'h1f;
                        State=2'b00;
                    end
                end
                2'b10:begin//right child
                    code_num = Node[temp][4:0];//read right child
                    if(code_num == 5'h1f)begin
                        temp = Node[temp][4:0];
                        State=2'b00;
                        flag=1;
                    end
                    else if(code_num == 5'h0a ||
                    code_num == 5'h0b ||
                    code_num == 5'h0c ||
                    code_num == 5'h0d ||
                    code_num == 5'h0e ||
                    code_num == 5'h0f ||
                    code_num == 5'h10 ||
                    code_num == 5'h11
                    )begin//go to right child and go to state 1
                        code_bit=code_bit+1;
                        code=code<<1;
                        State=2'b01;
                        temp=code_num-5'ha;
                    end
                    else if(code_num == 5'h00 ||
                    code_num == 5'h01 ||
                    code_num == 5'h02 ||
                    code_num == 5'h03 ||
                    code_num == 5'h04 ||
                    code_num == 5'h05 ||
                    code_num == 5'h06 ||
                    code_num == 5'h07 ||
                    code_num == 5'h08 ||
                    code_num == 5'h09
                    )begin//make code
                        code_bit=code_bit+1;
                        code=code<<1;
                        case (code_num)
                            5'h00:Code0={code_bit,code};
                            5'h01:Code1={code_bit,code};
                            5'h02:Code2={code_bit,code};
                            5'h03:Code3={code_bit,code};
                            5'h04:Code4={code_bit,code};
                            5'h05:Code5={code_bit,code};
                            5'h06:Code6={code_bit,code};
                            5'h07:Code7={code_bit,code};
                            5'h08:Code8={code_bit,code};
                            5'h09:Code9={code_bit,code};
                            default: ;
                        endcase
                        Node[temp][4:0]=5'h1f;
                        State=2'b00;
                    end
                end
                2'b11: begin//initial
                    if(temp>4'h9)begin
                        State=0;
                    end
                    else begin//temp=0-9 
                        case (temp)
                            4'h0:Code0=13'b0001000000001;
                            4'h1:Code1=13'b0001000000001;
                            4'h2:Code2=13'b0001000000001;
                            4'h3:Code3=13'b0001000000001;
                            4'h4:Code4=13'b0001000000001;
                            4'h5:Code5=13'b0001000000001;
                            4'h6:Code6=13'b0001000000001;
                            4'h7:Code7=13'b0001000000001;
                            4'h8:Code8=13'b0001000000001;
                            4'h9:Code9=13'b0001000000001;
                            default: ;
                        endcase
                        Node[8][9:5]=5'h1f;
                        State=2'b00;
                    end
                end
                default:;
            endcase
        end
    end

endmodule
