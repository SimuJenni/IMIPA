echo on
clear all
clf

x = 0:.1:2*pi;
y = sin(x);
plot(x,y,'b')
grid on
hold on
plot(x,exp(-x),'r:*')
axis([0 2*pi 0 1])

title ('2-D Plots')
ylabel ('Sin(t)')
xlabel ('Time')
text(pi/3,sin(pi/3),'\leftarrow Sin(\pi/3)')
legend('Sine Wave', 'Decaying Exponential')

echo off