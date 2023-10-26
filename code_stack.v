`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/26 09:59:53
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


module code_stack(
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
    Code9
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
    reg [4:0]stack[8:0];//stack
    reg [8:0]stack_judge;//判断对应栈中的节点左孩子是否访问过（否0）
    reg [3:0]stack_pointer;//指向栈顶位置
    reg Hc_en;//enable signal
    reg [14:0]Node[18:10];
    reg [1:0]State;
    reg [4:0]temp;

    always @(negedge Start_code)begin
        Hc_en<=1;
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if(~n_Rst)//initial
            begin
                Code0<=12'h0;
                Code1<=12'h0;
                Code2<=12'h0;
                Code3<=12'h0;
                Code4<=12'h0;
                Code5<=12'h0;
                Code6<=12'h0;
                Code7<=12'h0;
                Code8<=12'h0;
                Code9<=12'h0;

                Hc_en<=0;                
                code<=9'h000000000;
                code_bit<=4'b0000;

                Node[18][14:10]=5'b10010;//18 0x12
                Node[18][9:5]=m2;
                Node[18][4:0]=m1;
                Node[17]=Tree7;//11
                Node[16]=Tree6;//10
                Node[15]=Tree5;//0f
                Node[14]=Tree4;//0e
                Node[13]=Tree3;//0d
                Node[12]=Tree2;//0c
                Node[11]=Tree1;//0b
                Node[10]=Tree0;//0a

                stack_pointer=-4'h1;
                stack[0]=5'h0;
                stack[1]=5'h0;
                stack[2]=5'h0;
                stack[3]=5'h0;
                stack[4]=5'h0;
                stack[5]=5'h0;
                stack[6]=5'h0;
                stack[7]=5'h0;
                stack[8]=5'h0;
                stack_judge=9'h0;
                State=2'b00;
                temp=Node[18][14:10];
            end
        else if(m1==5'b11111)//Num0-9 have  1 0000 0000
            begin
                Code0=16'hffff;
                Code1[12:0]=Tree0;
                Hc_en=0;//end
            end
        else;
    end

    always @(posedge Clk_in) begin
        if(Hc_en)begin
            case(State)
                2'b00:begin//入栈
		            stack_pointer=stack_pointer+1;
		            stack[stack_pointer]=temp;
		            stack_judge[stack_pointer]=0;
		            State=2'b10;
                end
                2'b01:begin//弹栈
                    if(stack_pointer==4'h00)begin
                        Hc_en=0;
                    end
                    else begin
		                stack_pointer=stack_pointer-1;
		                temp=stack[stack_pointer];
		                code_bit=code_bit-1;
		                code=code>>1;
		                if(stack_judge[stack_pointer])begin//继续弹栈
		                    State=2'b01;
		                end
		                else begin
		                    State=2'b11;
		                end
		            end
                end
                2'b10:begin//访问左孩子     
		            temp=Node[temp][4:0];
		            code_bit=code_bit+1;
		            code=code<<1;         
		            if(temp>5'h09)begin
		                State=2'b00;
		            end
		            else if(temp>=5'h00)begin
		                case(temp)
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
                            default:;
		                endcase
		                temp=stack[stack_pointer];//temp此为栈顶
		                code_bit=code_bit-1;
		                code=code>>1;
		                State=2'b11;
		            end
		            else;
                end
                2'b11:begin//访问右孩子  
		            stack_judge[stack_pointer]=1;  
		            temp=Node[temp][9:5];
		            code_bit=code_bit+1;
		            code=code<<1;     
		            code=code+1;  
		            if(temp>5'h09)begin
		                State=2'b00;
		            end
		            else if(temp>=5'h00)begin
		                case(temp)
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
                            default:;
		                endcase
		                temp=stack[stack_pointer];
		                State=2'b01;
		                code_bit=code_bit-1;
		                code=code>>1;
		            end     
		            else;    
                end
		        default:;
	        endcase
        end
    end

endmodule