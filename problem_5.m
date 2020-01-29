%hw2 problem 5
clear;
clc;

% func = @(t,x)[x(2); -0.5*x(1)+1.5*x(2)+0.5*0];
% func = @(t,x)[x(2); -0.5*x(1)+1.5*x(2)+0.5*(0.9*x(1)-3.2*x(2))];
func = @(t,x)[x(2); -0.5*x(1)+1.5*x(2)+0.5*saturate(0.9*x(1)-3.2*x(2), -1, 1)];
tspan = [0,.4];
phase_portrait(func, tspan)

function [u] = saturate(u, small, big)

    if u > big
        u = big;
    elseif u < small
        u = small;
    end
    
end