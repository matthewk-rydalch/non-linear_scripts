%hw3_problem 2d
clear;
clc;
I1 = 3;
I2 = 2;
I3 = 1;
L = 1;
mu = [0,0,0];


func = @(t,w)[(I2-I3)/I1*w(2)*w(3)+mu(1);
              (I3-I1)/I2*w(1)*w(3)+mu(2);
              (I1-I2)/I3*w(1)*w(2)+mu(3)];

tspan = [0,50];
hg_norm = L;

for w10 = -.2:.1:.2
    for w20 = -.4:.1:4
        if I1^2*w10^2+I2^2*w20^2 > L^2
            break;
        end
%         w10 = L/I1-.1;
%         w20 = 0.1
        w30 = sqrt(I1^2*w10^2+I2^2*w20^2+hg_norm^2)/I3;
        init = [w10,w20,w30];

        [t, x] = ode45(func, tspan, init);
        
        figure(1)
        plot3(x(:,1),x(:,2),x(:,3));
        hold on
    end
end
% for x10 = [-1.5 -1 -0.5 0 0.5 1 1.5]
%     for x20 = [-1.5 -1 -0.5 0 0.5 1 1.5]
%         [ts,xs] = ode45(func,tspan,[x10;x20]);
%         plot(xs(:,1),xs(:,2))
%         plot(xs(1,1),xs(1,2),'bo') % starting point
%         plot(xs(end,1),xs(end,2),'ks') % ending point
%     end
% end