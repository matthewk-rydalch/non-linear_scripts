%quadrotor simplified dynmaics
function [dyn] = dynamics(u, P)
    
% where is gravity in these equations?
    Ix = P.Ix;
    Iy = P.Iy;
    Iz = P.Iz;
    m = P.m;
    Ft = u.Ft;
    Tx = u.Tx;
    Ty = u.Ty;
    Tz = u.Tz;
    
    S = @(x)sin(x);
    C = @(x)cos(x);
    T = @(x)tan(x);
    
    %state vector X
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
    % X = [x y z psi th phi xd yd zd p q r].T
    %      1 2 3 4   5  6   7  8  9 10 11 12
    
%     f = @(t,X)[X(1); X(2)];
%     g = @(t,X)[X(2); X(1)];
%     dyn = @(t,X)f(t,X)+g(t,X);
    
    f_x = @(t,X)[X(7);
                 X(8);
                 X(9);
                 X(10)*S(X(6))/C(X(5))+X(12)*C(X(6))/C(X(5));
                 X(11)*C(X(6))-X(12)*S(X(6));
                 X(10)+X(11)*S(X(6))*T(X(5))+X(12)*C(X(6))+T(X(5));
                 0;
                 0;
                 0;
                 (Iy-Iz)/Ix*X(11)*X(12);
                 (Iz-Ix)/Iy*X(10)*X(12);
                 (Ix-Iy)/Iz*X(10)*X(11)];
     
     %G(x)*u
     G_x_u = @(t,X)[0;
                    0;
                    0;
                    0;
                    0;
                    0;
                    -1/m*(S(X(6))*S(X(4))+C(X(6))*C(X(6)))*Ft;
                    -1/m*(C(X(4))*S(X(6))-C(X(6))*S(X(4))*S(X(5)))*Ft;
                    -1/m*C(X(6))*C(X(5))*Ft;
                    Tx/Ix;
                    Ty/Iy;
                    Tz/Iz];
                
      dyn = @(t,X)f_x(t,X) + G_x_u(t,X);


%     dyn = @(t,X)[X(7);
%                  X(8);
%                  X(9);
%                  X(10)*s(X(6))/c(X(5))+X(12)*c(X(6))/c(X(5));
%                  X(11)*c(X(6))-X(12)*s(X(6));
%                  X(10)+X(11)*s(X(6))*t(X(5))+X(12)*c(X(6))+t(X(5));
%                  0;
%                  0;
%                  0;
%                  (Iy-Iz)/Ix*X(11)*X(12);
%                  (Iz-Ix)/Iy*X(10)*X(12);
%                  (Ix-Iy)/Iz*X(10)*X(11)] + ...
%              ... %G(x)*u
%                  [0;
%                   0;
%                   0;
%                   0;
%                   0;
%                   0;
%                   -1/m*(s(X(6))*s(X(4))+c(X(6))*c(X(6)))*Ft;
%                   -1/m*(c(X(4))*s(X(6))-c(X(6))*s(X(4))*s(X(5)))*Ft;
%                   -1/m*c(X(6))*c(X(5))*Ft;
%                   Tx/Ix;
%                   Ty/Iy;
%                   Tz/Iz];
             
end
% 
% function [sin_] = s(x)
%     sin_ = sin(x);
% end
% 
% function [cos_] = c(x)
%     cos_ = cos(x);
% end
% 
% function [tan_] = t(x)
%     tan_ = tan(x);
% end