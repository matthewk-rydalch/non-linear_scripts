function [u] = control_law(P, ref)
    %NED frame, but positive Ft is up
    
    %get params
    m = P.m;
    g = P.g;
    Ix = P.Ix;
    Iy = P.Iy;
    Iz = P.Iz;
    
    %State vector X = [x y z phi th psi u v w p q r]
    al = @(t,X)[m*g/(cos(X(4))*cos(X(5))); %alpha
          -X(11)*X(12)*(Iy-Iz);
          -X(10)*X(12)*(Iz-Ix);
          -X(10)*X(11)*(Ix-Iy)];
    beta = @(t,X)[-m/(cos(X(4))*cos(X(5))) 0 0 0;
            0 Ix 0 0;
            0 0 Iy 0;
            0 0 0 Iz];
    
    %linearized input NED
%     v = control_accel(P, ref);
%     u = @(t,X)u1(t,X)+v(t,X);
    v_inner = inner_loop(P, ref);
%     al = @(t,X)[m*g; 0; 0; 0];
    
    u1 = @(t,X)al(t,X)+beta(t,X)*v_inner(t,X);
    
    v_outer = outer_loop(P, ref, u1);
%     
    u = @(t,X)u1(t,X)+v_outer(t,X);
%     u = @(t,X)al(t,X)+beta(t,X)*[4;3;0;0];
    
end
