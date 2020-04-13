%project 774

clear;
clc;

u = control_law();
P = params();
[t,x] = ode45(dynamics(u, P), P.tspan, P.x0);

plot_states(t,x);