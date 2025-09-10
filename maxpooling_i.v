module maxpooling_i(
    input clk,
    input rst,
    input i_valid,
    input [63:0] i_data,
    output reg o_valid,
    output reg [15:0] o_data
);

reg [15:0] desire_data [0:39];
reg [15:0] max_temp;
reg [15:0] max_value;
reg [15:0] row_cnt;
reg [15:0] column_cnt;
reg [15:0] cnt;
reg [15:0] cnt_counter;
reg [15:0] next_matrix;
reg [15:0] matrix_cnt;
reg [15:0] row_size;
reg [2:0] step;
reg [15:0] timing_cnt;
reg [1:0]check;
reg [10:0] max_temp_cnt;
reg i_valid_u;
reg [10:0] padding_cnt;
reg [10:0] padding_signal;


always@(posedge clk) begin
    if(i_valid||i_valid_u==1) begin
    if(cnt<cnt_counter+padding_signal*2) begin
    max_temp <= desire_data[0];
         if (desire_data[2] > max_temp) max_temp <= desire_data[2];
         if (desire_data[3] > max_temp) max_temp <= desire_data[3];
         if (desire_data[4] > max_temp) max_temp <= desire_data[4];
         if (desire_data[5 ] > max_temp) max_temp <= desire_data[5 ];
         if (desire_data[6 ] > max_temp) max_temp <= desire_data[6 ];
         if (desire_data[7 ] > max_temp) max_temp <= desire_data[7 ];
         if (desire_data[8 ] > max_temp) max_temp <= desire_data[8 ];
         if (desire_data[9 ] > max_temp) max_temp <= desire_data[9 ];
         if (desire_data[10] > max_temp) max_temp <= desire_data[10];
         if (desire_data[11] > max_temp) max_temp <= desire_data[11];
         if (desire_data[12] > max_temp) max_temp <= desire_data[12];
         if (desire_data[13] > max_temp) max_temp <= desire_data[13];
         if (desire_data[14] > max_temp) max_temp <= desire_data[14];
         if (desire_data[15] > max_temp) max_temp <= desire_data[15];
         if (desire_data[16] > max_temp) max_temp <= desire_data[16];
         if (desire_data[17] > max_temp) max_temp <= desire_data[17];
         if (desire_data[18] > max_temp) max_temp <= desire_data[18];
         if (desire_data[19] > max_temp) max_temp <= desire_data[19];
         if (desire_data[20] > max_temp) max_temp <= desire_data[20];
         if (desire_data[21] > max_temp) max_temp <= desire_data[21];
         if (desire_data[22] > max_temp) max_temp <= desire_data[22];
         if (desire_data[23] > max_temp) max_temp <= desire_data[23];
         if (desire_data[24] > max_temp) max_temp <= desire_data[24];
         if (desire_data[25] > max_temp) max_temp <= desire_data[25];
         if (desire_data[26] > max_temp) max_temp <= desire_data[26];
         if (desire_data[27] > max_temp) max_temp <= desire_data[27];
         if (desire_data[28] > max_temp) max_temp <= desire_data[28];
         if (desire_data[29] > max_temp) max_temp <= desire_data[29];
         if (desire_data[30] > max_temp) max_temp <= desire_data[30];
         if (desire_data[31] > max_temp) max_temp <= desire_data[31];
         if (desire_data[32] > max_temp) max_temp <= desire_data[32];
         if (desire_data[33] > max_temp) max_temp <= desire_data[33];
         if (desire_data[34] > max_temp) max_temp <= desire_data[34];
         if (desire_data[35] > max_temp) max_temp <= desire_data[35];
         if (desire_data[36] > max_temp) max_temp <= desire_data[36];
         if (desire_data[37] > max_temp) max_temp <= desire_data[37];
         if (desire_data[38] > max_temp) max_temp <= desire_data[38];
         if (desire_data[39] > max_temp) max_temp <= desire_data[39];
         cnt<=cnt+1;
          o_valid<=0;
          check<=1;
    i_valid_u<=1;
    end 
   else begin
    max_temp_cnt<=0;
    o_valid<=1;
    cnt<=0;
    o_data <= max_temp;
    check<=2;
    i_valid_u<=0;
     matrix_cnt<=matrix_cnt+1;
     timing_cnt<=timing_cnt+1;
    end
end else begin
   o_data <= 0;
      o_valid<=0;
          desire_data[0]<=0;desire_data[1]<=0;desire_data[2]<=0;desire_data[3]<=0;desire_data[4]<=0;
    desire_data[5]<=0;desire_data[6]<=0;desire_data[7]<=0;desire_data[8]<=0;desire_data[9]<=0;
    desire_data[10]<=0;desire_data[11]<=0;desire_data[12]<=0;desire_data[13]<=0;desire_data[14]<=0;
    desire_data[15]<=0;desire_data[16]<=0;desire_data[17]<=0;desire_data[18]<=0;desire_data[19]<=0;
    desire_data[21]<=0;desire_data[22]<=0;desire_data[23]<=0;desire_data[24]<=0;desire_data[25]<=0;desire_data[20]<=0;
    desire_data[26]<=0;desire_data[27]<=0;desire_data[28]<=0;desire_data[29]<=0;desire_data[30]<=0;
    desire_data[31]<=0;desire_data[32]<=0;desire_data[33]<=0;desire_data[34]<=0;desire_data[35]<=0;
    desire_data[36]<=0;desire_data[37]<=0;desire_data[38]<=0;desire_data[39]<=0;
    max_temp <= 0;
    next_matrix<=0; 
    step<=0;
end
end

always@(posedge clk) begin
    if(rst==1)begin
    i_valid_u<=0;
    desire_data[0]<=0;desire_data[1]<=0;desire_data[2]<=0;desire_data[3]<=0;desire_data[4]<=0;
    desire_data[5]<=0;desire_data[6]<=0;desire_data[7]<=0;desire_data[8]<=0;desire_data[9]<=0;
    desire_data[10]<=0;desire_data[11]<=0;desire_data[12]<=0;desire_data[13]<=0;desire_data[14]<=0;
    desire_data[15]<=0;desire_data[16]<=0;desire_data[17]<=0;desire_data[18]<=0;desire_data[19]<=0;
    desire_data[21]<=0;desire_data[22]<=0;desire_data[23]<=0;desire_data[24]<=0;desire_data[25]<=0;desire_data[20]<=0;
    desire_data[26]<=0;desire_data[27]<=0;desire_data[28]<=0;desire_data[29]<=0;desire_data[30]<=0;
    desire_data[31]<=0;desire_data[32]<=0;desire_data[33]<=0;desire_data[34]<=0;desire_data[35]<=0;
    desire_data[36]<=0;desire_data[37]<=0;desire_data[38]<=0;desire_data[39]<=0;
        max_temp_cnt<=0;
        max_value <= 0;
        row_cnt<=0;
        next_matrix<=0;
        cnt_counter<=6;
        cnt<=0;
        column_cnt<=0;
        row_size<=3;
        matrix_cnt<=0;
        step<=0;
        timing_cnt<=0;
        o_valid<=0;
        o_data<=0;
        check<=0;
        padding_cnt<=0;
        padding_signal<=0;
    end
    else if (i_valid)begin 
    if(next_matrix<row_size+padding_cnt*2) begin
            if(step==1) begin
                step<=0;
            end else begin
                step<=step+1;
            end
            if(matrix_cnt>1&&matrix_cnt<18&&step==0)begin
                if(timing_cnt%4==2)begin
                    desire_data[next_matrix*4]  <= i_data[15:0];
                    desire_data[next_matrix*4+1]<= i_data[31:16];
                    desire_data[next_matrix*4+2]<= i_data[47:32];
                    desire_data[next_matrix*4+3]<= i_data[63:48];
                end
                else if(timing_cnt%4==3)begin
                    desire_data[next_matrix*4]  <= 0;
                    desire_data[next_matrix*4+1]<= i_data[31:16];
                    desire_data[next_matrix*4+2]<= i_data[47:32];
                    desire_data[next_matrix*4+3]<= i_data[63:48];
                end
                else if(timing_cnt%4==0)begin
                    desire_data[next_matrix*4]  <= 0;
                    desire_data[next_matrix*4+1]<= 0;
                    desire_data[next_matrix*4+2]<= i_data[47:32];
                    desire_data[next_matrix*4+3]<= i_data[63:48];
                end
                else if(timing_cnt%4==1)begin
                    desire_data[next_matrix*4]  <= 0;
                    desire_data[next_matrix*4+1]<= 0;
                    desire_data[next_matrix*4+2]<= 0;
                    desire_data[next_matrix*4+3]<= i_data[63:48];
                end
            end 
            else if(matrix_cnt>1&&matrix_cnt<18&&step==1)begin
                if(timing_cnt%4==2)begin
                    desire_data[next_matrix*4]  <= i_data[15:0];
                    desire_data[next_matrix*4+1]<= 0;
                    desire_data[next_matrix*4+2]<= 0;
                    desire_data[next_matrix*4+3]<= 0;
                end
                else if(timing_cnt%4==3)begin
                    desire_data[next_matrix*4]  <= i_data[15:0];
                    desire_data[next_matrix*4+1]<= i_data[31:16];
                    desire_data[next_matrix*4+2]<= 0;
                    desire_data[next_matrix*4+3]<= 0;
                end
                else if(timing_cnt%4==0)begin
                    desire_data[next_matrix*4]  <= i_data[15:0];
                    desire_data[next_matrix*4+1]<= i_data[31:16];
                    desire_data[next_matrix*4+2]<= i_data[47:32];
                    desire_data[next_matrix*4+3]<= 0;
                end
                else if(timing_cnt%4==1)begin
                    desire_data[next_matrix*4]  <= i_data[15:0];
                    desire_data[next_matrix*4+1]<= i_data[31:16];
                    desire_data[next_matrix*4+2]<= i_data[47:32];
                    desire_data[next_matrix*4+3]<= i_data[63:48];
                end           
                o_valid<=0;
                o_data<=0;
            end else begin
                    desire_data[next_matrix*4]  <= i_data[15:0];
                    desire_data[next_matrix*4+1]<= i_data[31:16];
                    desire_data[next_matrix*4+2]<= i_data[47:32];
                    if (row_size==3)begin
                        desire_data[next_matrix*4+3]<= 0;
                    end else begin
                        desire_data[next_matrix*4+3]<= i_data[63:48];
                    end
                end
            next_matrix<=next_matrix+1;
            o_valid<=0;
            o_data<=0;
    end 
end else if (matrix_cnt==0) begin
    check<=3;
end 
else if (matrix_cnt==1)begin
        row_size<=4;
    end else if (matrix_cnt>1&&matrix_cnt<18)begin;
        row_size<=6;
        cnt_counter<=9+padding_signal;
    end else if (matrix_cnt>16&&matrix_cnt<19)begin
        row_size<=4;
        cnt_counter<=6;
    end else if (matrix_cnt>19&&matrix_cnt<20)begin
        row_size<=3;
        cnt_counter<=6;
    end else if (matrix_cnt==20)begin
    if (padding_cnt==0||padding_cnt==17) begin
    padding_signal<=1;
    end else if (padding_cnt==18)begin
    padding_signal<=0;
    end else begin
    padding_signal<=2;
    end
    padding_cnt<=padding_cnt+1;
        matrix_cnt<=0;
        row_size<=3;
        cnt_counter<=6;
    end 
end
endmodule
