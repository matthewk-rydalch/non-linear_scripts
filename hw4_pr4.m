%practice 2
clear;
clc;

syms x y;

[x, y] = solve (-(x+x^3)+2*y==0,2*x-(y+y^3)==0);

eval (x);
eval (y);

A1 = [-1 2; 2 -1]; %these matrices come from the real solutions of x and y and the jacobian of the equations
A2 = [-4 2; 2, -4];

evalue1 = eig(A1);
evalue2 = eig(A2);

Q = eye(2);
P = lyap(A2,Q);

func = @(t,x)[-(x(1)+x(1)^3)+2*x(2); 2*x(1)-(x(2)+x(2)^3)];
tspan = [0,100];
x1 = linspace(-15,15,10);
x2 = linspace(-15,15,10);
init = [-10 1 4 3.2 7 -3 5; 11 -4.5 5 0 7 -1 1.5];
phase_portrait(func, tspan, x1, x2, init)
