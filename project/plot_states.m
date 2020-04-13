function [] = plot_states(t,x)

    figure(1)
    hold on
    plot(t,x(:,1))
    plot(t,x(:,2))
    plot(t,x(:,3))
    legend('x', 'y', 'z')
    hold off
    
    figure(2)
    hold on
    plot(t,x(:,4))
    plot(t,x(:,5))
    plot(t,x(:,6))
    legend('psi', 'theta', 'phi')
    hold off
    
    figure(3)
    hold on
    plot(t,x(:,7))
    plot(t,x(:,8))
    plot(t,x(:,9))
    legend('x_dot', 'y_dot', 'z_dot')
    hold off
    
    figure(4)
    hold on
    plot(t,x(:,10))
    plot(t,x(:,11))
    plot(t,x(:,12))
    legend('psi_dot', 'theta_dot', 'phi_dot')
    hold off
end