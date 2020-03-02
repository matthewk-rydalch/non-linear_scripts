%problem 6
clear;
clc;

eps = 0.1;
b0 = 2;
% b1 = 1.5;
b1 = 0.5
% I = 0;
I = 2;

func = @(t,x)[x(1)-1/3*x(1)^3-x(2)+I; eps*(b0+b1*x(1)-x(2))];
tspan = [0,5];

phase_portrait(func, tspan);