%project 774

clear;
clc;

P = params();
u = control_law(P);
[t,x] = ode45(dynamics(u, P), P.tspan, P.x0);

plot_states(t,x);