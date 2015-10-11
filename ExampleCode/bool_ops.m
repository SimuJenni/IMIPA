echo on
clear all
Mass = [-2 10 NaN 30 -11 Inf 31];
each_pos = Mass>=0
all_pos = all(Mass>=0)
pos_fin = (Mass>=0)&(isfinite(Mass))
good_mass=Mass(pos_fin)
whos
echo off