%problem 7
clear;
clc;

sig = 10;
b = 8/3;
r = 28;

init_1 = [0, 2, 0];
init_2 = [0, -2, 0];
init_3 = [0, 2.01, 0];

func = @(t,x)[sig*(x(2)-x(1)); r*x(1)-x(2)-x(1)*x(3); x(1)*x(2)-b*x(3)];
tspan = [0,50];

[t, x1] = ode45(func, tspan, init_1);
[t, x2] = ode45(func, tspan, init_2);
[t, x3] = ode45(func, tspan, init_3);

figure(1)
plot3(x1(:,1), x1(:,2), x1(:,3));
hold on;
plot3(x2(:,1), x2(:,2), x2(:,3));
plot3(x3(:,1), x3(:,2), x3(:,3));
xlabel('x');
ylabel('y');
zlabel('z');
legend('init_1','init_2','init_3');
title('Lorenz Equations');

% figure(1)
% plot3(x1(:,1), x1(:,2), x1(:,3));
% xlabel('x');
% ylabel('y');
% zlabel('z');
% title('(0,2,0) initial conditions');

% figure(2)
% plot3(x2(:,1), x2(:,2), x2(:,3));
% xlabel('x');
% ylabel('y');
% zlabel('z');
% title('(0,-2,0) initial conditions');
% 
% figure(3)
% plot3(x3(:,1), x3(:,2), x3(:,3));
% xlabel('x');
% ylabel('y');
% zlabel('z');
% title('(0,2.01,0) initial conditions');
% 
