%problem 6
clear;
clc;

% syms u b1 b0
% 
% [u] = solve (-1/3*u^3+(1-b1)*u-b0 == 0);
% 
% u= eval (u)

syms b1 b0 I
a = 1/3;
c = b1-1;
d = b0-I;

term_1 = (b0+I)/(2*a);
term_2 = sqrt((-(b0+I)/a)^2+((b1-1)/(3*a))^3);
cube_root_1 = (-term_1+term_2)^(1/3);
cube_root_2 = (-term_1-term_2)^(1/3);
u = cube_root_1 + cube_root_2;

u = simplify(u)
