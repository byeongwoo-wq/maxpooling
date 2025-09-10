module top(
    input wire clk,
    input wire rst,
    input wire [63:0]i_data,                    // 들어오는 데이터
    input wire start,
    output wire [15:0]address,                  // Bram에 보내는 주소
    output wire o_valid,                    
    output reg [63:0]out_data,
    output reg out_valid,
    output reg done,
    output reg [15:0] o_address,
    output reg [9:0] done_cnt
    );
    
    reg i_valid;
    reg [5:0] cnt;
    reg first;
    reg en;
    reg [2:0]check;
    reg [9:0] padding_cnt;
    reg [9:0] padding_count;
    reg [9:0] total_cnt;
    reg [9:0] max_cnt;
    reg [3:0] o_address_cnt;
    reg [15:0]  o_data_1, o_data_2, o_data_3, o_data_4;
    reg [5:0] cnt_output;
    wire [15:0] o_data;
    reg trigger;

    
always@(posedge clk) begin
        done<=0;
        out_valid<=0;
    if (valid==1||trigger==1) begin
        if (max_cnt<=400||trigger==1) begin
        o_address_cnt<=o_address_cnt+1;
        if(max_cnt==403) begin
        done_cnt<=done_cnt+1;
            done<=1;
            max_cnt<=0;
            trigger<=0;
            o_address<=done_cnt*100;
        end
         if(o_address_cnt==0) begin
            if(cnt_output==0) begin
                o_data_1<=o_data;
            end else if (cnt_output==1||cnt_output==2) begin
                o_data_1<=o_data;
                out_data[15:0]<=o_data_1;
                out_data[31:16]<=o_data_2;
                out_data[47:32]<=o_data_3;
                out_data[63:48]<=o_data_4;
                out_valid<=1;
                if (cnt_output==1) begin
                cnt_output<=2;
                end else if (cnt_output==2) begin
                o_address<=o_address+1+done_cnt*100;
                end
            end
            end
         else if(o_address_cnt==1) begin
         o_data_2<=o_data;
         end 
         else if(o_address_cnt==2) begin
         o_data_3<=o_data;
         end
        else if(o_address_cnt==3) begin
        o_data_4<=o_data;
        o_address_cnt<=0;
        if (cnt_output==0) begin
                cnt_output<=1;
                end else if (cnt_output==2) begin
                cnt_output<=2;
                end
        end
        if(max_cnt==403) begin
        max_cnt<=0;
        end else begin
            max_cnt<=max_cnt+1;
            end
        end
    end
     else if(max_cnt==400) begin
        trigger<=1;
        end 
    if(rst==1) begin
    out_data<=0;
    trigger<=0;
    out_valid<=0;
    o_address<=0;
    max_cnt<=0;
    done<=0;
    cnt<=0;
    first<=0;
    i_valid<=0;
    en<=0;
    check<=0;
    padding_cnt<=0;
    padding_count<=0;
    total_cnt<=0;
    done_cnt<=0;
    o_address_cnt<=0;
    o_data_1<=0;
    o_data_2<=0;
    o_data_3<=0;
    o_data_4<=0;
    cnt_output<=0;
    end
    else if( start==1) begin
        if(padding_cnt>3)begin
            padding_cnt<=0;
            padding_count<=0;
            total_cnt<=total_cnt+1;
            first<=0;
        end
        if(total_cnt==0||total_cnt==19)begin
        if(padding_cnt<2||padding_count>209)begin
            if( first==0||valid==1)begin
                i_valid<=1;
                cnt<=cnt+1;
                first<=1;
                check<=1;
            end 
            else if (cnt==4||cnt==6||cnt==2) begin
                en<=1;
                check<=2;
                cnt<=cnt+1;
            end  
            else if(cnt==7)begin
                cnt<=cnt+1;       
                check<=3;
                i_valid<=0;
                en<=0;
            end
            else if(cnt==9)begin            
                cnt<=0;
                en<=0;
                padding_cnt<=padding_cnt+1;
            end
            else begin
                cnt<=cnt+1;
                en<=0;
            end
///////////////////////////////////////////////////////////////////////////////////////////////////////
        end  else begin
        padding_count<=padding_count+1;
            if( first==0||valid==1)begin
                i_valid<=1;
                cnt<=cnt+1;
                first<=1;
                check<=1;
            end 
            else if (cnt==3||cnt==2||cnt==5||cnt==6||cnt==8||cnt==9) begin
                en<=1;
                check<=2;
                cnt<=cnt+1;
            end  
            else if(cnt==10)begin
                cnt<=cnt+1;       
                check<=3;
                i_valid<=0;
                en<=0;
            end
            else if(cnt==12)begin            
                cnt<=0;
                en<=0;
            end
            else begin
                cnt<=cnt+1;
                en<=0;
            end            
        end  
    end
 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
        else if(total_cnt==1||total_cnt==18)begin
        if(padding_cnt<2||padding_count>257)begin
            if( first==0||valid==1)begin
                i_valid<=1;
                cnt<=cnt+1;
                first<=1;
                check<=1;
            end 
            else if (cnt==4||cnt==6||cnt==2||cnt==8) begin
                en<=1;
                check<=2;
                cnt<=cnt+1;
            end  
            else if(cnt==9)begin
                cnt<=cnt+1;       
                check<=3;
                i_valid<=0;
                en<=0;
            end
            else if(cnt==11)begin            
                cnt<=0;
                en<=0;
                padding_cnt<=padding_cnt+1;
            end
            else begin
                cnt<=cnt+1;
                en<=0;
            end
///////////////////////////////////////////////////////////////////////////////////////////////////////
        end  else begin
        padding_count<=padding_count+1;
            if( first==0||valid==1)begin
                i_valid<=1;
                cnt<=cnt+1;
                first<=1;
                check<=1;
            end 
            else if (cnt==3||cnt==2||cnt==5||cnt==6||cnt==8||cnt==9||cnt==11||cnt==12) begin
                en<=1;
                check<=2;
                cnt<=cnt+1;
            end  
            else if(cnt==13)begin
                cnt<=cnt+1;       
                check<=3;
                i_valid<=0;
                en<=0;
            end
            else if(cnt==15)begin            
                cnt<=0;
                en<=0;
            end
            else begin
                cnt<=cnt+1;
                en<=0;
            end            
        end  
    end
//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////        
/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////        
        else if(total_cnt>1&&total_cnt<19)begin
        if(padding_cnt<2||padding_count>305)begin
            if( first==0||valid==1)begin
                i_valid<=1;
                cnt<=cnt+1;
                first<=1;
                check<=1;
            end 
            else if (cnt==4||cnt==6||cnt==2||cnt==8||cnt==10) begin
                en<=1;
                check<=2;
                cnt<=cnt+1;
            end  
            else if(cnt==11)begin
                cnt<=cnt+1;       
                check<=3;
                i_valid<=0;
                en<=0;
            end
            else if(cnt==13)begin            
                cnt<=0;
                en<=0;
                padding_cnt<=padding_cnt+1;
            end
            else begin
                cnt<=cnt+1;
                en<=0;
            end
///////////////////////////////////////////////////////////////////////////////////////////////////////
        end  else begin
        padding_count<=padding_count+1;
            if( first==0||valid==1)begin
                i_valid<=1;
                cnt<=cnt+1;
                first<=1;
                check<=1;
            end 
            else if (cnt==3||cnt==2||cnt==5||cnt==6||cnt==8||cnt==9||cnt==11||cnt==12||cnt==14||cnt==15) begin
                en<=1;
                check<=2;
                cnt<=cnt+1;
            end  
            else if(cnt==16)begin
                cnt<=cnt+1;       
                check<=3;
                i_valid<=0;
                en<=0;
            end
            else if(cnt==18)begin            
                cnt<=0;
                en<=0;
            end
            else begin
                cnt<=cnt+1;
                en<=0;
            end            
        end  
    end
end
end
maxpooling dut (
        .clk(clk),
        .rst(rst),
        .i_valid(i_valid),
        .address(address),
        .o_valid(o_valid)
    );
    
maxpooling_i u_value (
        .clk     (clk),
        .rst     (rst),
        .i_valid (en),
        .i_data    (i_data),
        .o_valid (valid),
        .o_data  (o_data)
    );
    
endmodule