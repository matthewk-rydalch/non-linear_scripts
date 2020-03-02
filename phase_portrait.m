function [] = phase_portrait(func, tspan, x1, x2, init)
    %this is the format of func
    %func = @(t,x)[-x(1)^3+x(2); x(1)-x(2)^3];
    %this is the format for tspan
    %tspan = [0,5];
    %x1 = linspace(-2,2,10);
    %x2 = linspace(-2,2,10);
    %init = [-1.5 -1 -0.5 0 0.5 1 1.5; -1.5 -1 -0.5 0 0.5 1 1.5] where the first row is x10 and the second row is x20
    
    %define grid space (from ex. -2 to 2 in x1 and x2)
    [x1,x2] = meshgrid(x1,x2);

    %find derivatives at each point at the starting time
    u = zeros(size(x1));
    v = zeros(size(x2));
    t=0;
    for i = 1:numel(x1)
        Xprime = func(t,[x1(i); x2(i)]);
        u(i) = Xprime(1);
        v(i) = Xprime(2);
    end

    %plot the derivatives (vector space)
    quiver(x1,x2,u,v,'r'); figure(gcf)
    xlabel('x_1')
    ylabel('x_2')
    axis tight equal;
    hold on
    
    %Plot some solutions with initial conditions at each combination of x10
    %and x20.
    for x10 = init(1,:)
        for x20 = init(2,:)
            [ts,xs] = ode45(func,tspan,[x10;x20]);
            plot(xs(:,1),xs(:,2))
            plot(xs(1,1),xs(1,2),'bo') % starting point
            plot(xs(end,1),xs(end,2),'ks') % ending point
        end
    end
    hold off
end