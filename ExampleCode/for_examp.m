clear all
clc

echo on

N=10;
for I = 1:N,
   for J = 1:N,
      A(I,J) = 1/(I+J-1);
   end
end

echo off

