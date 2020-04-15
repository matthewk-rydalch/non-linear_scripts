%quadrotor simplified dynmaics
function [dyn] = dynamics(P, ref)

    %u = [Ft, Tx, Ty, Tz].T
    u = control_law(P, ref);
    
    %NED frame
    Ix = P.Ix;
    Iy = P.Iy;
    Iz = P.Iz;
    m = P.m;
    g = P.g;
    
    %Trig function handles
    S = @(x)sin(x);
    C = @(x)cos(x);
    T = @(x)tan(x);
    
    % state vector X = [x y z phi th psi xd yd zd p q r].T
    %unforced system
    f_x = @(t,X)[X(7); %xd
                 X(8); %yd
                 X(9); %zd
                 X(10);
                 X(11);
                 X(12);
%                  X(10)+X(11)*S(X(4))*T(X(5))+X(12)*(C(X(4))*T(X(5))); %phi_d
%                  X(11)*C(X(4))-X(12)*S(X(4)); %theta_d
%                  X(11)*S(X(4))/C(X(5))+X(12)*C(X(4))/C(X(5)); %psi_d
                 0; %xdd
                 0; %ydd
                 g; %zdd
                 (Iy-Iz)/Ix*X(11)*X(12); %pd
                 (Iz-Ix)/Iy*X(10)*X(12); %qd
                 (Ix-Iy)/Iz*X(10)*X(11)]; %rd
     
     %forced part of the system
     g17 = @(t,X)-1/m*(S(X(4))*S(X(6))+C(X(4))*C(X(6))*S(X(5)));
     g18 = @(t,X)-1/m*(C(X(6))*S(X(4))-C(X(4))*S(X(6))*S(X(5)));
     g19 = @(t,X)-1/m*(C(X(4))*C(X(5)));
     G_x = @(t,X)[0 0 0 0; %xd
                    0 0 0 0; %yd
                    0 0 0 0; %zd
                    0 0 0 0; %psi_d
                    0 0 0 0; %theta_d
                    0 0 0 0; %phi_d
                    g17(t,X) 0 0 0;%xdd
                    g18(t,X) 0 0 0; %ydd
                    g19(t,X) 0 0 0; %zdd
                    0 1/Ix 0 0; %pd
                    0 0 1/Iy 0; %qd
                    0 0 0 1/Iz]; %rd
                
      dyn = @(t,X)f_x(t,X) + G_x(t,X)*u(t,X);
             
end