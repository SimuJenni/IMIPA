echo off; clear; clc;
N=20000;
disp([char(10), 'Using Pre-Allocation:'])
pre_allo = zeros(N,1); 
tic;
for I = 1:N
   pre_allo(I) = rand(1); 
end
toc

disp([char(10), 'NOT Using Pre-Allocation:'])
tic;
for J = 1:N
    not_pre_allo(J) = rand(1); 
end
toc



