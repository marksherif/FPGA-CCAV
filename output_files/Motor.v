module Motor(e1,e2,as1,as2,bs1,bs2, state,clock);
input clock;
input [1:0] state;
output reg e1,e2,as1,as2,bs1,bs2;
reg [25:0]count;
reg flag,flag2;

initial 
begin
flag2<=0;
count<=0;
flag<=0;
e1<=0;
e2<=0;
as2<=0;
as1<=0;
bs1<=0;
bs2<=0;
end

color_three(s0, s1, s2, s3, led, state,segment1,segment2,segment3,segment4,segment5,segment6 ,frequency, clk);

//turn left YELLOW
always@(posedge clock)
begin
if(state==2'b00)
begin
flag<=1;
end
if(flag==1 & count<27000000)
begin
 e1<=1;
 e2<=1;
 as2<=1;
 as1<=1;
 bs2<=1;
 bs1<=0;
count<=count+1;
end
if(count==27000000)
begin
flag2<=0;
flag<=0;
count<=0;
 e1<=0;
 e2<=0;
 as2<=0;
 as1<=0;
 bs2<=0;
 bs1<=0;
 end


//turn right RED

if(state==2'b01)
begin
flag2<=1;
end
if(flag2==1 & count<27000000)
begin
 e1<=1;
 e2<=1;
 as2<=1;
 as1<=0;
 bs2<=1;
 bs1<=1;
count<=count+1;
end


//Stop BLACK

if(state==2'b10)
begin
flag<=1;
end
if(flag==1 & count<27000000)
begin
 e1<=0;
 e2<=0;
 as2<=0;
 as1<=0;
 bs2<=0;
 bs1<=0;
count<=count+1;
end


//FORWARD GREEN

if(state==2'b11)
begin
flag2<=1;
end
if(flag2==1 & count<27000000)
begin
 e1<=1;
 e2<=1;
 as2<=1;
 as1<=1;
 bs2<=1;
 bs1<=1;
count<=count+1;
end


 end
endmodule