%inner loop
function [v] = inner_loop(P, ref)
    
    zddr = pd_control(P.Kp_z, P.Kd_z, ref.z, 3);
    psi_ddr = pd_control(P.Kp_psi, P.Kd_psi, ref.psi, 6);
    
    v = @(t,X)[zddr(t,X);
               0;
               0;
               psi_ddr(t,X)];
end