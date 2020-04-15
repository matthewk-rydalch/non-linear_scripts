%midterm problem 1 part b
clear;
clc;

%test this at mu > 0, mu = 0, and mu > 0
mu = -3;

% func = @(t,x)[-(x(1)^2+x(2)^2-mu)*x(2)-x(1); x(2)];
func = @(t,x)[ x(2); -(x(1)^2+x(2)^2-mu)*x(2)-x(1)];
tspan = [0,2];
x1 = linspace(-2,2,10);
x2 = linspace(-2,2,10);
init = [-1, -.5, 0, .5, 1; -1, -.5, 0, .5, 1]; %where the first row is x10 and the second row is x20

figure(1)
phase_portrait(func, tspan, x1, x2, init)
title('Fig. 5: problem 1b non-linear system, mu = 1');

figure(2)
% func = @(t,x)[-x(1)+mu*x(2); x(2)];
func = @(t,x)[x(2); -x(1)+mu*x(2)];
phase_portrait(func, tspan, x1, x2, init)
title('Fig. 6: problem 1b linearized system, mu = 1');

