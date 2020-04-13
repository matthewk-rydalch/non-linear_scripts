%quadrotor simplified dynmaics
function [dyn] = dynamics(u, P)
   %NED frame
    Ix = P.Ix;
    Iy = P.Iy;
    Iz = P.Iz;
    m = P.m;
    g = P.g;
    
    Ft = u.Ft;
    Tx = u.Tx;
    Ty = u.Ty;
    Tz = u.Tz;
    
    S = @(x)sin(x);
    C = @(x)cos(x);
    T = @(x)tan(x);
    
    %state vector X
    % X = [x y z psi th phi xd yd zd p q r].T
    %dynamics
    % Xd = [xd;
%             yd;
%             zd;
%             q*s(phi)/c(th)+r*c(phi)/c(th);
%             q*c(phi)-r*s(phi);
%             p+q*s(phi)*t(th)+r*c(phi)+t(th);
%             0;
%             0;
%             (Iy-Iz)/Ix*q*r;
%             (Iz-Ix)/Iy*p*r;
%             (Ix-Iy)/Iz*p*q];

    %unforced system
    f_x = @(t,X)[X(7); %xd
                 X(8); %yd
                 X(9); %zd
                 X(11)*S(X(6))/C(X(5))+X(12)*C(X(6))/C(X(5)); %psi_d
                 X(11)*C(X(6))-X(12)*S(X(6)); %theta_d
                 X(10)+X(11)*S(X(6))*T(X(5))+X(12)*(C(X(6))*T(X(5))); %phi_d
                 0; %xdd
                 0; %ydd
                 g; %zdd
                 (Iy-Iz)/Ix*X(11)*X(12); %pd
                 (Iz-Ix)/Iy*X(10)*X(12); %qd
                 (Ix-Iy)/Iz*X(10)*X(11)]; %rd
     
     %forced part of the system
     %G(x)*u
     G_x_u = @(t,X)[0; %xd
                    0; %yd
                    0; %zd
                    0; %psi_d
                    0; %theta_d
                    0; %phi_d
                    -1/m*(S(X(6))*S(X(4))+C(X(6))*C(X(6))*S(X(5)))*Ft; %xdd
                    -1/m*(C(X(4))*S(X(6))-C(X(6))*S(X(4))*S(X(5)))*Ft; %ydd
                    -1/m*C(X(6))*C(X(5))*Ft; %zdd
                    Tx/Ix; %pd
                    Ty/Iy; %qd
                    Tz/Iz]; %rd
                
      dyn = @(t,X)f_x(t,X) + G_x_u(t,X);
             
end