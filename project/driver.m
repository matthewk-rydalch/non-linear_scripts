%project 774

clear;
clc;

ref.x = 0;
ref.y = 0;
ref.z = 0;
ref.psi = 1;

P = params();
[t,x] = ode45(dynamics(P, ref), P.tspan, P.x0);

plot_states(t,x);