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
% P(1,2) = -P(1,2);
% p(2,1) = -P(2,1);

basis = [-1,-1];
scale = 5;
% x1 = linspace(-scale,scale);
% x2 = linspace(-scale,scale);
% z1 = x1 - basis(1);
% z2 = x2 - basis(2);
x1 = linspace(-scale-1, scale-1);
x2 = linspace(-scale-1, scale-1);
z1 = linspace(-scale,scale);
z2 = linspace(-scale,scale);

c_cand = [];
x1_size = size(z1);
x2_size = size(z2);
for i = 1:1:x1_size(2)
%     z1 = x1(i)-basis(1);
    for j = 1:1:x2_size(2)
%         z2 = x2(j)-basis(2);
%         v_dot = -0.3*z1(i)^4+z1(i)*z2(j)-0.16*z1(i)*z2(j)^3-0.16*z1(i)^3*z2(j)-0.3*z2(j)^4;
          v_dot = -(z1(i)^2+z2(j)^2)-1/6*(2*z1(i)+z2(j))*(3+z1(i))*z1(i)^2-1/6*(z1(i)+2*z2(j))*(3+z2(j))*z2(j)^2;
        if v_dot > 0
            c_new = 0.1667*z1(i)^2+0.1667*z1(i)*z2(j)+0.1667*z2(j)^2;
            c_cand = [c_cand, c_new];
        end
    end
end

c = min(c_cand);

[z1, z2] = meshgrid(z1,z2);
% V = 0.1667*(x1-basis(1)).^2+0.1667*(x1-basis(1)).*(x2-basis(2))+0.1667*(x2-basis(2)).^2;
V = 0.1667*z1.^2+0.1667*z1.*z2+0.1667*z2.^2;
contour(z1-basis(1), z2-basis(2), V,[0,c]);
hold on

func = @(t,x)[-(x(1)+x(1)^3)+2*x(2); 2*x(1)-(x(2)+x(2)^3)];
tspan = [0,5];
x1 = linspace(-scale,scale,10);
x2 = linspace(-scale,scale,10);
init = 0.3*[-10 1 4 3.2 7 -3 5; 11 -4.5 5 0 7 -1 1.5];
phase_portrait(func, tspan, x1, x2, init)