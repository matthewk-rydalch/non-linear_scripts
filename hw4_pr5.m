%hw4_pr5
clear;
clc;

A = [0 -1; 1 -1];
Q = eye(2);
P = lyap(A,Q); %Matlab does it backwards AP+P*A' rather than PA+A'P
%flip signs on off diagnol to fix it.

scale = 5;
x1 = linspace(-scale,scale);
x2 = linspace(-scale,scale);

c_cand = [];
x1_size = size(x1);
x2_size = size(x2);
for i = 1:1:x1_size(2)
    X1 = x1(i);
    for j = 1:1:x2_size(2)
        X2 = x2(j);
        v_dot = 3*X1*(X1^3-X2)-(X1^3-X2)*X2-X1*(X1-X2)+2*X2*(X1-X2);
        if v_dot > 0
            c_new = 1.5*X1^2-X1*X2+X2^2;
            c_cand = [c_cand, c_new];
        end
    end
end

c = max(c_cand);

[x1, x2] = meshgrid(x1,x2);
V = 1.5*x1.^2-x1.*x2+x2.^2;
contour(x1, x2, V,[0,c]);
hold on

% func = @(t,x)[x(1)^3-x(2); x(1)-x(2)];
% tspan = [0,5];
% x1 = linspace(-scale,scale,10);
% x2 = linspace(-scale,scale,10);
% init = 0.3*[-10 1 4 3.2 7 -3 5; 11 -4.5 5 0 7 -1 1.5];
% phase_portrait(func, tspan, x1, x2, init)
