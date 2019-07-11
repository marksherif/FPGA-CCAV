module color_threee(s0, s1, s2, s3, led, state,segment1,segment2,segment3,segment4,segment5,segment6 ,frequency, clk);

output reg s0, s1, s2, s3, led;
output reg[1:0] state;
output [6:0] segment1,segment2,segment3,segment4,segment5,segment6;
input frequency, clk;
wire [2:0] b0,b1,b2,b3,b4,b5;
reg [6:0] count_clk, start_time, end_time;
reg [32:0] timer, count, num;
wire [32:0] v1,v2,v3,v4,v5;
reg flag;

initial 
begin
s0<=0;
s1<=1;
led<=1;
s2<=1;
s3<=0;
state<=0;
count_clk=0;
flag=0;
start_time=0;
end_time=0;
timer=0;
count=0;
num=0;
end

always@(posedge clk)
begin
if (timer < 20000000)
begin
timer<=timer+1;
flag<=1;
end
else
begin
timer<=0;
flag<=0;
num<=count;
end
end

always@(posedge frequency,negedge flag)
begin
if(flag==0)
begin
//num=count;
count<=0;
end
else
begin
count<=count+1;
//num<=count;
end
end

decoder(b0,segment1);
decoder(b1,segment2);
decoder(b2,segment3);
decoder(b3,segment4);
decoder(b4,segment5);
decoder(b5,segment6);

always@(posedge clk)
begin
if(num<=27000 & num>=20000)
begin
state<=2'b00; //YELLOW left
end
else if(num<=33000 & num>=29000)
begin
state<=2'b10; //WHITE  //right
end
else if(num<=7000 & num>=5000)
begin
state<=2'b01; //BLUE  //forward
end
else
state<=2'b11;

end


assign b0=num%10;
assign v1=num/10;
assign b1=v1%10;
assign v2=v1/10;

assign b2=v2%10;
assign v3=v2/10;
assign b3=v3%10;
assign v4=v3/10;

assign b4=v4%10;
assign v5=v4/10;
assign b5=v5%10;


//wire clk1;
//wire clk2;
//

//
//clock(clk,clk1, clk2);
//
//always @(posedge clk1, negedge clk2)
//begin
//if(~clk2)
//count<=0;
//if(clk1)
//begin
//count<=count+1;
//red<=count;
//if(red>550)
//btn=1;
//else
//btn=0;
//end
//end


//always @(posedge clk)
//begin
//if (count_clk == 50)
//begin
//clk1=~clk1;
//count_clk=0;
//timer=timer+1;
//end
//else
//count_clk= count_clk+1;
//if (timer==8589934591)
//timer=0;
//end
//
//
//always @(negedge frequency)
//begin
//if(flag==0)
//begin
//start_time<=timer;
//flag<=1;
//end
//else
//begin
//end_time<=timer;
//flag<=0;
//end
//end
//
//assign total_time = (end_time-start_time)/2;
//
//always @(posedge end_time)
//begin
//if(total_time>1)
//btn=1;
//else
//btn=0;
//end

endmodule