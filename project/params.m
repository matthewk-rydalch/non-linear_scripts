function [P] = params()
    P.x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
    P.tspan = [0, 10];
    P.Ix = 1;
    P.Iy = 2;
    P.Iz = 3;
    P.m = 5;
    P.g = 9.81;