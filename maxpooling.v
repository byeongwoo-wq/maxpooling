module maxpooling(
    input clk,
    input rst,
    input i_valid,
    output reg [15:0] address,
    output reg o_valid
);

reg [12:0] need_address_count_r;
reg [12:0] need_address_count_c;
reg [2:0] row_cnt;
reg [2:0] column_cnt;
reg [2:0] S_row_cnt;
reg [2:0] S_column_cnt;
reg [15:0] n_c;
reg [15:0] r_c;
reg [15:0] next_cnt;

always@(posedge clk)begin
    if(rst==1)begin
        address<=0;
        row_cnt<=0;
        column_cnt<=0;
        next_cnt<=0;
        need_address_count_r<=0;
        need_address_count_c<=0;
        S_row_cnt<=1;
        S_column_cnt<=2;
        n_c<=0;
        r_c<=0;
        o_valid<=0;
    end
    else if (i_valid) begin
            if(row_cnt<S_row_cnt) begin
               address<=column_cnt*5+n_c/4+row_cnt+r_c*5+next_cnt*100;
               row_cnt<=row_cnt+1; 
               o_valid<=1;
            end else if(column_cnt<S_column_cnt) begin
                column_cnt<=column_cnt+1;
                row_cnt<=0;
                o_valid<=0;
            end else if(need_address_count_r<1) begin
                column_cnt<=0;
                row_cnt<=0;
                need_address_count_r<=need_address_count_r+1;
                o_valid<=0;
            end else if(need_address_count_r<17) begin
                column_cnt<=0;
                row_cnt<=0;
                S_row_cnt<=2;
                need_address_count_r<=need_address_count_r+1;
                o_valid<=0;
                if(need_address_count_r==2) begin
                    n_c<=n_c;
                end else begin
                    n_c<=n_c+1;
                end
            end else if(need_address_count_r<19) begin
                S_row_cnt<=1;
                row_cnt<=0;
                column_cnt<=0;
                o_valid<=0;
                n_c<=n_c+1;
                need_address_count_r<=need_address_count_r+1;
            end else if(need_address_count_c<1) begin
                S_column_cnt<=3;
                o_valid<=0;
                row_cnt<=0;
                column_cnt<=0;
                need_address_count_r<=0;
                need_address_count_c<=need_address_count_c+1;
                n_c<=0;
            end else if(need_address_count_c<2) begin
                S_column_cnt<=4;
                o_valid<=0;
                row_cnt<=0;
                column_cnt<=0;
                need_address_count_r<=0;
                n_c<=0;
                need_address_count_c<=need_address_count_c+1;
            end else if(need_address_count_c<17) begin
                r_c<=r_c+1;
                S_column_cnt<=4;
                o_valid<=0;
                row_cnt<=0;
                column_cnt<=0;
                need_address_count_r<=0;
                n_c<=0;
                need_address_count_c<=need_address_count_c+1;
            end else if(need_address_count_c<18) begin
                r_c<=r_c+1;
                S_column_cnt<=3;
                o_valid<=0;
                row_cnt<=0;
                column_cnt<=0;
                need_address_count_r<=0;
                n_c<=0;
                need_address_count_c<=need_address_count_c+1;
            end else if(need_address_count_c<19) begin
                r_c<=r_c+1;
                S_column_cnt<=2;
                n_c<=0;
                row_cnt<=0;
                column_cnt<=0;
                o_valid<=0;
                need_address_count_r<=0;
                need_address_count_c<=need_address_count_c+1;
            end 
            else begin
            need_address_count_c<=0;
            need_address_count_r<=0;
            o_valid<=0;
            n_c<=0;
                row_cnt<=0;
                column_cnt<=0;
                o_valid<=0;
                next_cnt<=1+next_cnt;
            end
        end else begin
            o_valid<=0;
            row_cnt<=0;
        end
    end
endmodule
