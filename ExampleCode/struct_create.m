echo on

Students.Name      = 'Mary';
Students.Grades    = [97 93];
Students(2).Name   = 'Joe';
Students(2).Grades = [94 96]; 

%Students could also be created in one line using cell arrays:
Stud = struct('Name',{'Mary','Joe'},'Grades',{[97 93],[94 96]});

echo off