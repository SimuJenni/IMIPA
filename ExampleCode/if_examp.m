clear all
clc
%echo on

A = input('Enter A: ');
B = input('Enter B: ');

if A > B
   disp('A is greater than B');
elseif A < B
   disp('A is less than B');
elseif A == B
   disp('A is equal to B');
else
   error('Unexpected situation');
end

%echo off