%inverted pendulum simulation
%hw5 problem6

clear;
clc;

%parameters
perturbation = 1;

m1 = 0.25*perturbation;
m2 = 1.0*perturbation;
l = 0.5;
b = 0.05;
g = 9.8;

%equations of motion
C = [1 0 0 0; 0 1 0 0];
K = [-1.7363 -38.2181 -3.6581 -9.4954]; %from problem 6
nu = 0;
%x = transpose([z, theta, zdot, thdot])
den = 1/4*m1+m2;
c1 = -3/4*m1*g/den;
c2 = -b/den;
c3 = 1/den;
c4 = 3*(m1+m2)*g/(2*den*l);
c5 = 3*b/(2*den*l);
c6 = -3/(2*den*l);
%u = -K*x+nu
func = @(t,x)[x(3); x(4); c1*x(2) + c2*x(3) + c3*(-K*x+nu); c4*x(2) + c5*x(3) + c6*(-K*x+nu)];

%numerical solutions
tspan = [0, 10];
x0 = [33; 0; 0; 0];
[t,x] = ode45(func, tspan, x0);

%plot
plot(t,x(:,1))
hold on
% plot(t,x(:,2))
% plot(t,x(:,3))
% plot(t,x(:,4))
% legend('z (m)', 'theta (rad)', 'z dot (m/s)', 'theta dot (rad/s)')
% xlabel('Time (sec.)')

