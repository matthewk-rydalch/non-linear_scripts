function [P] = params()
    P.x0 = [0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0; 0];
    P.tspan = [0, 30];
    
    P.Ix = 1;
    P.Iy = 2;
    P.Iz = 3;
    P.m = 5;
    P.g = 9.81;

    P.Kp_x = .1;
    P.Kp_y = 1;
    P.Kp_z = 1;
    P.Kp_phi = 1;
    P.Kp_th = .5;
    P.Kp_psi = 1;
    
    P.Kd_x = .3;
    P.Kd_y = .3;
    P.Kd_z = .8;
    P.Kd_phi = .3;
    P.Kd_th = .3;
    P.Kd_psi = .8;
    
    P.phi_limit = 1;
    P.th_limit = 1;
    
    
    