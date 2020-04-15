%midterm problem 7
clear;
clc;

func = @(t,x)[-x(2)^3;x(1)-x(2)];
tspan = [0,.1];
xspan = 2;
x1 = linspace(-xspan,xspan,10);
x2 = linspace(-xspan,xspan,10);
init = [-1.5 -1 -0.5 0 0.5 1 1.5; -1.5 -1 -0.5 0 0.5 1 1.5];

phase_portrait(func, tspan, x1, x2, init)
