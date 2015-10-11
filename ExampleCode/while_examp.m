clear all
clc

echo on

I=1; N=10;

while I<=N
  J=1;	
  while J<=N
     A(I,J)=1/(I+J-1);
     J=J+1;
  end
  I=I+1;
end

echo off

