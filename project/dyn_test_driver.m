%dynamics test driver
clear;
clc;
ref.x = 0;
ref.y = 0;
ref.z = 0;
ref.psi = 0;
P = params();
dyn = dynamics(P,ref);

state = [0; 0; 0; -0.3; 0.5; 0; 0; 0; 0; 0; 0; 0];
dyn(0,state)