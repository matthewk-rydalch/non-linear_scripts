%hw2 problem 4
clear;
clc;

%Jacobians
A0 = [0 1; 1 0];
A1 = [-3 1; 1 -3];

%for qualitative behavior
[evec1, eval1] = eig(A0);
[evec2, eval2] = eig(A1);
 
func = @(t,x)[-x(1)^3+x(2); x(1)-x(2)^3];
tspan = [0,50];
phase_portrait(func, tspan)