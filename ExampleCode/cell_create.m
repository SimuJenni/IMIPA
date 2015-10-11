echo on

A = {rand(2,2,2), 'Hello', 17.35} %Braces on RHS
B{1,1} = 1:10; %Braces on LHS
B{2,2} = A
B{1,1}
A{1,1}(2,:,1)

echo off