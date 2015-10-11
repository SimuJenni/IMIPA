clear all
clc

%echo on
method = input('Enter a method (linear, bilinear, cubic, nearest, etc:) ', 's');

%echo on

%method = 'Bilinear';

switch lower(method)
   case {'linear','bilinear'}
      disp('Method is linear')
   case 'cubic'
      disp('Method is cubic')
   case 'nearest'
      disp('Method is nearest')
   otherwise
      disp('Unknown method.')
end

%echo off


