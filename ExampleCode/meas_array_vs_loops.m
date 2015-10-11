clear all
clc
echo on
N=10*10000;
M=rand(5,N);
L=rand(5,N);
W=rand(5,N);
H=rand(5,N);
[rows,cols]=size(M);

echo off
disp([char(10), 'Using Array Operations:'])
tic
Density=M./(L.*W.*H);
toc

disp([char(10), 'Using Loops:'])
tic;
for I=1:rows
       for J=1:cols
            Density(I,J)=M(I,J)/(L(I,J)*W(I,J)*H(I,J));
       end
end
toc

