`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/26 13:40:12
// Design Name: 
// Module Name: output
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


module Out_put(
    Clk_in,
    n_Rst,
    Start_out,
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
    All,
    Out,
    Outt,
    state,
    Fin
    );
//input signal
    input wire Clk_in;
    input wire n_Rst;
    input wire Start_out;
    input wire [12:0]Code0;
    input wire [12:0]Code1;
    input wire [12:0]Code2;
    input wire [12:0]Code3;
    input wire [12:0]Code4;
    input wire [12:0]Code5;
    input wire [12:0]Code6;
    input wire [12:0]Code7;
    input wire [12:0]Code8;
    input wire [12:0]Code9;
    input wire [1023:0]All;
//output signal
    output reg Out;//编码的位数
    output reg Outt;//为1表示对应的Out有效
    output reg [1:0]state;
    output reg Fin;
//inner signal
    reg Out_en;//enable signal
    reg [3:0]count;//count num0-9
    reg [7:0]acnt;//整个序列的计数器
    reg judge;

    reg [3:0]temp;
    reg [3:0]bit;
    reg [3:0]cnt_bit;
    reg [12:0]Code;

    always @(negedge Start_out)begin
        Out_en<=1;
    end
    
    always @(posedge Clk_in or negedge n_Rst) begin
        if(~n_Rst)//initial
            begin
                Fin<=0;
                Out<=0;
                count<=0;
                Out_en<=0;
                temp<=0;
                state=0;
                Outt=0;
                bit=0;
                cnt_bit=0;
                Code=0;
                acnt=0;
                judge=0;
            end
    end
    
    always @(posedge Clk_in or negedge n_Rst) begin
        if (Out_en) begin
            case (state)
                2'b00: begin//get information
                    if(judge)begin
                        count={All[acnt*4+3],All[acnt*4+2],All[acnt*4+1],All[acnt*4]};
                        state=2'b10;
                    end
                    else begin
                        cnt_bit=4;
                        state=2'b01;
                    end
                    case (count)
                        4'h00: Code=Code0;
                        4'h01: Code=Code1;
                        4'h02: Code=Code2;
                        4'h03: Code=Code3;
                        4'h04: Code=Code4;
                        4'h05: Code=Code5;
                        4'h06: Code=Code6;
                        4'h07: Code=Code7;
                        4'h08: Code=Code8;
                        4'h09: Code=Code9;
                        default: ;
                    endcase
                    bit=Code[12:9];
                    temp=bit-1;
                end
                2'b01: begin//输出编码位数
                    Outt=1;
                    if(|cnt_bit)begin//!=0
                        cnt_bit=cnt_bit-1;
                        Out=bit[cnt_bit];
                    end
                    else begin
                        state=2'b10;
                        Outt=0;
                        Out=0;
                    end
                    if(count==4'h9)
                    begin
                        judge=1;
                    end
                end
                2'b10: begin//输出编码
                    if(|temp)begin
                        temp=temp-1;
                        Outt=1;
                        Out=Code[temp];
                    end
                    else begin
                        Outt=0;
                        Out=0;
                        state=2'b00;
                        if(!judge)begin
                            count=count+1;//下一个数字
                        end
                        if(&acnt)begin
                            Out_en<=0;
                            Fin<=1;
                        end
                        else begin
                            acnt=acnt+1;
                        end
                    end
                end
                default: ;
            endcase
        end
    end

endmodule
