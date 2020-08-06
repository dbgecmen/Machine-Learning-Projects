clear window 
clc

x = linspace(0,2*pi,100);
y1 = x;
y2 = (3/2)*x;
figure
plot(x,y1,x,y2)
legend('x', '3/2 x')