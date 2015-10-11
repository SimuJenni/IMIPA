clf
clear all
echo on

data = 1:1000;

subplot(2,2,1)
loglog(data)
title('LOGLOG(1:1000)')
subplot(2,2,2)
semilogy(data)
title('SEMILOGY(1:1000)');
subplot(2,2,3)
semilogx(data)
title('SEMILOGX(1:1000)')
subplot(2,2,4)
plotyy(data,data,data,data.^2)
title('PLOTYY');

echo off

