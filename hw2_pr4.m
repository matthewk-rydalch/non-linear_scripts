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
x1 = linspace(-2,2,10);
x2 = linspace(-2,2,10);
init = [-1.5 -1 -0.5 0 0.5 1 1.5; -1.5 -1 -0.5 0 0.5 1 1.5]; %where the first row is x10 and the second row is x20

phase_portrait(func, tspan, x1, x2, init)