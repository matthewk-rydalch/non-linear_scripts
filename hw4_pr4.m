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

% x1 = 0;
% x2 = 0;
% v_dot = -1; %just start the loop
% while v_dot <= 0 
%    est_c = k/2*x1^2+k/2*x1*x2+k/2*x2^2;
%    x1 = x1-.001;
%    x2 = x2-.001;
%    v_dot = -k*x1^4+x1*x2-k/2*x1*x2^3-k/2*x1^3*x2-k*x2^4;
% end 

scale = 5;
x1 = linspace(-scale,scale);
x2 = linspace(-scale,scale);
[x1,x2] = meshgrid(x1,x2);

% V = k/2*((x1-basis(1)).^2+(x1-basis(1)).*(x2-basis(2))+(x2-basis(2)).^2);
% M = contour(x1, x2, V);
% 
% for i = 1:1:size(M(1))
%     z1 = x1(1)-basis(1);
%     z2 = x2(1)-basis(2);
%     v_dot = -k*z1^4+z1*z2-k/2*z1*z2^3-k/2*z1^3*z2-k*z2^4
%     if 
    

basis = [1,1];
c_cand = [];
for i = 1:1:size(x1)
    z1 = x1(i)-basis(1);
    for j = 1:1:size(x2)
        z2 = x2(i)-basis(2);
%         v_dot = -k*z1^4+z1*z2-k/2*z1*z2^3-k/2*z1^3*z2-k*z2^4
          v_dot = (k*z1+k/2*z2)*(-(z1+z1^3)+2*z2)+(k/2*z1+k*z2)*(2*
        if v_dot > 0
            c_new = k/2*(z1^2+z1*z2+z2^2);
            c_cand = [c_cand, c_new];
        end
    end
end

c = min(c_cand);

V = k/2*((x1-basis(1)).^2+(x1-basis(1)).*(x2-basis(2))+(x2-basis(2)).^2);
contour(x1, x2, V,c);
hold on

func = @(t,x)[-(x(1)+x(1)^3)+2*x(2); 2*x(1)-(x(2)+x(2)^3)];
tspan = [0,5];
x1 = linspace(-scale,scale,10);
x2 = linspace(-scale,scale,10);
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
