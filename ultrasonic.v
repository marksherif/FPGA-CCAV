module ultrasonic(trig, led, clk, echo);
input clk, echo;
output reg trig, led;

reg[20:0] count, timee, et;
reg flag;
initial 
begin
count<=0;
led<=0;
timee<=0;
trig <=0;
end
always@(posedge clk)
begin
if (count==0)
trig <= 1;
else if (count==500)
begin
flag<=1;
trig<=0;
end
else if(count==50000000)begin
trig<=1;
count<=0;
end
count<=count+1;
if(echo==1)
timee<=timee+1;
else if (echo==0 & flag==1)begin
et<=timee;
timee<=0;
flag<=0;
end
if(et<28012) begin
led<=1;
end
else led<=0;
end

endmodule 