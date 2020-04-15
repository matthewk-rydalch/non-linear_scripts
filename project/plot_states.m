function [] = plot_states(t,x)
    
    close all
    
    figure(1)
    hold on
    plot(t,x(:,1))
    plot(t,x(:,2))
    plot(t,x(:,3))
    legend('x', 'y', 'z')
    title('Position')
    hold off
    
    figure(2)
    hold on
    plot(t,x(:,4))
    plot(t,x(:,5))
    plot(t,x(:,6))
    legend('phi', 'theta', 'psi')
    title('Orientation')
    hold off
    
    figure(3)
    hold on
    plot(t,x(:,7))
    plot(t,x(:,8))
    plot(t,x(:,9))
    legend('x_dot', 'y_dot', 'z_dot')
    title('Linear Velocity')
    hold off
    
    figure(4)
    hold on
    plot(t,x(:,10))
    plot(t,x(:,11))
    plot(t,x(:,12))
    legend('p', 'q', 'r')
    title('Angluar Rates')
    hold off
end