function [u] = control_law(P)
    %NED frame, but positive Ft is up
    u.Ft = P.m*P.g;
    u.Tx = 0;
    u.Ty = 0;
    u.Tz = 0;