%outer loop
function [v] = outer_loop(P, ref, u)
    
    Ft = @(t,X)[1 0 0 0]*u(t,X);
    
    xddr = pd_control(P.Kp_x, P.Kd_x, ref.x, 1);
    yddr = pd_control(P.Kp_y, P.Kd_y, ref.y, 2);
    
    phi_r = @(t,X)P.m/Ft(t,X)*yddr(t,X);
    th_r = @(t,X)-P.m/Ft(t,X)*xddr(t,X);
    phi_ddr = pd_control_outer(P.Kp_phi, P.Kd_phi, phi_r,4);
    th_ddr = pd_control_outer(P.Kp_th, P.Kd_th, th_r,5);
    
    v = @(t,X)[0;
               phi_ddr(t,X);
               th_ddr(t,X);
               0];
end

%p controller
function [ddr] = pd_control_outer(Kp, Kd, xr, i)
    
    ddr = @(t,X)(xr(t,X)-X(i))*Kp-X(i+6)*Kd;

end