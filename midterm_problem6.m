%midterm problem 6
clear;
clc;

func = @(t,x)[x(2)+x(1)*x(3); -x(1)-x(2)+x(2)*x(3); -x(1)^2-x(2)^2];
tspan = [0,50];
x10 = .1;
x20 = -.2;
x30 = -.3;

[t,xs] = ode45(func,tspan,[x10;x20; x30]);

plot3(xs(:,1),xs(:,2),xs(:,3));
xlabel('x');
ylabel('y');
zlabel('z');