%symbolic solvers
clear;
clc;

syms m P zeta phi xsi Ix g

dx = [-1/m*sin(phi), cos(phi)/Ix*zeta;
      -1/m*cos(phi)+g, (1/m*sin(phi)+g)/Ix*zeta];

dx_inv = inv(dx)

clear;
clc;

syms m th phi Ix Iy Iz p q r g

dx = [-1/m*cos(th)*cos(phi) 0 0 0;
      0 1/Ix 0 0;
      0 0 1/Iy 0;
      0 0 0 1/Iz];
dx_inv = inv(dx)