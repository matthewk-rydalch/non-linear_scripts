%hw5 problem 6
clear;
clc;

%Investigate open loop
A = [0 0 1 0; 0 0 0 1; 0 -1.73 -0.05 0; 0 17.3 0.07 0];
B = [0; 0; 0.94; -1.41]
K = [0 0 0 0];

evals_open_loop = eig(A-B*K)

%%% design state feedback controller
%check controllability
Cab = [B, A*B, A*A*B, A*A*A*B];
if rank(Cab) == 4
    fprintf('controllable')
else
    fprintf('not controllable')
end

%find characteristic polynomial
syms s
det(s*eye(4)-A)
%use the coefficients of these
aA = [1/20 -173/10 -7439/10000 0];
AA = [1 aA(1), aA(2), aA(3);
      0 1 aA(1), aA(2);
      0 0 1 aA(1);
      0 0 0 1];
  
%define desired characteristic polynomial
alpha = [10, 35, 50, 24];

%compute desired gains
K = (alpha-aA)*inv(AA)*inv(Cab);

%check stability
evals_closed_loop = eig(A-B*K)


      
