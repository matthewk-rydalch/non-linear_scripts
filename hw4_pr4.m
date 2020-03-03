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

k = 0.333333333; %a common coefficient in the equation

x1 = 0;
x2 = 0;
v_dot = -1; %just start the loop
while v_dot <= 0 
   est_c = k/2*x1^2+k/2*x1*x2+k/2*x2^2;
   x1 = x1-.001;
   x2 = x2-.001;
   v_dot = -k*x1^4+x1*x2-k/2*x1*x2^3-k/2*x1^3*x2-k*x2^4;
end 

func = @(t,x)[-(x(1)+x(1)^3)+2*x(2); 2*x(1)-(x(2)+x(2)^3)];
tspan = [0,5];
x1 = linspace(-2,2,10);
x2 = linspace(-2,2,10);
init = 0.3*[-10 1 4 3.2 7 -3 5; 11 -4.5 5 0 7 -1 1.5];
phase_portrait(func, tspan, x1, x2, init)

% x = linspace(-10,10);
% y = linspace(-10,10);
% [X1,X2] = meshgrid(x,y);
% V = c/2*X1^2+c/2*X1*X2+c/2*X2^2;
% contour(V)

% fun = @(x,c)(-k*x(1)^4+k*x(1)*x(2)-k/2*x(1)*x(2)^3-k/2*x(1)^3*x(2)-k*x(2)^4==0, k/2*X1^2+k/2*X1*X2+k/2*X2^2==c;
% 
% x = fmincon(fun)
