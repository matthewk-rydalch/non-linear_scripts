%test
clear;
clc;

x = -2:0.2:2;
y = -2:0.2:2;
[X,Y] = meshgrid(x,y);
Z = X.*exp(-X.^2-Y.^2);
contour(X,Y,Z,2)