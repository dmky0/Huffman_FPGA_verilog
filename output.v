`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2023/10/15 23:01:13
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
//output signal
    output reg Out;
    output reg Outt;
    output reg [1:0]state;
    output reg Fin;
//inner signal
    reg Out_en;//enable signal
    reg [3:0]count;//count num0-9

    reg [3:0]temp;
    reg [3:0]bit;
    reg [3:0]cnt_bit;
    reg [12:0]Code;

    always @(negedge Start_out)begin
        Out_en<=1;
    end

    always @(posedge Clk_in) begin
        if(count==4'ha)
            begin
                Out<=0;
                count<=0;
                Out_en<=0;
                Fin<=1;
                temp<=0;
                state=0;
                Outt=0;
                bit=0;
                cnt_bit=0;
                Code=0;
                state=0;
            end
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
            end
    end

    always @(posedge Clk_in or negedge n_Rst) begin
        if (Out_en) begin
            case (state)
                2'b00: begin//get information
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
                    cnt_bit=4;
                    state=2'b01;
                end
                2'b01: begin
                    Outt=1;
                    if(|cnt_bit)begin//!=0
                        cnt_bit=cnt_bit-1;
                        Out=bit[cnt_bit];
                    end
                    else begin
                        state=2'b11;
                        Outt=0;
                        Out=0;
                    end
                end
                2'b10: begin
                    Out=0;
                    if(|temp)begin
                        temp=temp-1;
                        Out=Code[temp];
                    end
                    else begin
                        Outt=0;
                        Out=0;
                        state=0;
                        count=count+1;
                    end
                end
                2'b11:begin
                    Outt=1;
                    Out=Code[temp];
                    state=2'b10;
                end
                default: ;
            endcase
        end
    end

endmodule
