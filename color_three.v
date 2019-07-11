module color_three(echo,trig,frequency, e1,e2,as1,as2,bs1,bs2,clock,s0, s1, s2, s3, led,segment1,segment2,segment3,segment4,segment5,segment6 );
input clock, s0, s1, s2, s3, led, frequency,echo;
wire [1:0] state;
output reg e1,e2,as1,as2,bs1,bs2;
output wire [6:0] segment1,segment2,segment3,segment4,segment5,segment6;
wire proximity;
output trig;
reg [25:0]count;
reg flag,flag2,flag3,flag4;

initial 
begin
flag2<=0;
count<=0;
flag<=0;
e1<=1;
e2<=1;
as2<=0;
as1<=1;
bs1<=0;
bs2<=0;
flag3<=0;
flag4<=0;
end

color_threee(s0, s1, s2, s3, led, state,segment1,segment2,segment3,segment4,segment5,segment6 ,frequency, clock);
ultrasonic(trig, proximity, clock, echo);


always@(posedge clock)
begin

if(proximity==1)
begin
 e1<=0;
 e2<=0;
 as2<=0;
 as1<=0;
 bs2<=0;
 bs1<=0;
end
else
begin

//FORWARD BLUE

if(state==2'b01)
begin
flag4<=1;
end
if(flag4==1 & count<20000000)
begin
 e1<=1;
 e2<=1;
 as2<=1;
 as1<=0;
 bs2<=1;
 bs1<=0;
count<=count+1;
end

//turn left YELLOW

if(state==2'b00)
begin
flag<=1;
end
if(flag==1 & count<20000000)
begin
 e1<=1;
 e2<=1;
 as2<=1;
 as1<=1;
 bs2<=1;
 bs1<=0;
count<=count+1;
end
if(count==20000000)
begin
flag2<=0;
flag<=0;
flag3<=0;
flag4<=0;
count<=0;
 e1<=0;
 e2<=0;
 as2<=0;
 as1<=0;
 bs2<=0;
 bs1<=0;
 end


//turn right WHITE

if(state==2'b10)
begin
flag2<=1;
end
if(flag2==1 & count<20000000)
begin
 e1<=1;
 e2<=1;
 as2<=1;
 as1<=0;
 bs2<=1;
 bs1<=1;
count<=count+1;
end


//Stop

if(state==2'b11)
begin
flag3<=1;
end
if(flag3==1 & count<20000000)
begin
 e1<=0;
 e2<=0;
 as2<=0;
 as1<=0;
 bs2<=0;
 bs1<=0;
count<=count+1;
end
end

 end
endmodule