%hw 6 problem 5
clear;
clc;
% 
% sig = 10;
% b = 8/3;
% r = 28;
% 
% init_1 = [0, 2, 0];
% init_2 = [0, -2, 0];
% init_3 = [0, 2.01, 0];
% 
% func = @(t,x)[sig*(x(2)-x(1)); r*x(1)-x(2)-x(1)*x(3); x(1)*x(2)-b*x(3)];

a = 1;
k = 1;
c = 1;
B0 = 1;
tspan = [0,100];
init = [-pi/2,0];

%linearized system
func1 = @(t,x)[x(2); a*(sin(x(1)) + ...
    (-1/a*(x(1)+a*x(1)+k*x(2)))... %u
    *cos(x(1)))];
%Feeback linearized system
func2 = @(t,x)[x(2); a*(sin(x(1)) + ...
    ( -tan(x(1)) + 1/(a*cos(x(1)))*(-2*x(2)-x(1)) )... % u 
    * cos(x(1)))];
%sliding mode control
func3 = @(t,x)[x(2); a*(sin(x(1)) + ...
    ( -(c/a*abs(x(2))+1+B0)*sign(c*x(1)+x(2)) )... % u 
    * cos(x(1)))];


[t, X] = ode45(func1, tspan, init);
[t_fb, X_fb] = ode45(func2, tspan, init);
[t_s, X_s] = ode45(func3, tspan, init);
bound = pi/2;
upper_bound = bound*ones(size(t));
lower_bound = -upper_bound;

plot(t,X(:,1))
hold on
plot(t,X(:,2))
plot(t_fb,X_fb(:,1))
hold on
plot(t_fb,X_fb(:,2))
% plot(t_s,X_s(:,1))
% hold on
% plot(t_s,X_s(:,2))
plot(t, upper_bound)
plot(t, lower_bound)
legend('theta linear', 'theta dot linear', 'theta FB', 'theta dot FB')%, 'upper bound', 'lower bound')

