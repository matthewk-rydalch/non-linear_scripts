%hw4_pr5
clear;
clc;

func = @(t,x)[-x(1)^3-x(2); x(1)-x(2)];
tspan = [0,5];
x1 = linspace(-2,2,10);
x2 = linspace(-2,2,10);
init = [-1.5 -1 -0.5 0 0.5 1 1.5; -1.5 -1 -0.5 0 0.5 1 1.5];

phase_portrait(func, tspan, x1, x2, init)
