echo on

str ='Hi there,';
str1='Everyone!';
new_str=[str, ' ', str1]

str2 = 'Isn''t MATLAB great?';
new_str2=[new_str; str2]

new_str3 = strvcat(str, str2)

echo off

