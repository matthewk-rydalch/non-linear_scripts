%pd controller
function [ddr] = pd_control(Kp, Kd, xr, i)
    
    ddr = @(t,X)(xr-X(i))*Kp-X(i+6)*Kd;

end