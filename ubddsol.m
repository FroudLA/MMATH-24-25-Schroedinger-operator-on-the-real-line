% Lewis Froud MMATH Project 2025
% The First Few Zeros of an Oscillating Solution
% 


tspan = [0 100*pi];
y_0 = [0;1];
dydt = @(t,y) [y(2); (-40/(1+t^2)+ cos(t))*y(1)];
[t,pollution] = ode45(dydt, tspan, y_0);
u1 = pollution(:,1);
zeroes = sign(u1);
differences = zeroes .* circshift(zeroes,-1);
a = differences < 0;
a(end) = 0;
b = a.* u1./(a.*u1 - a.*circshift(u1,-1)); 
timesteps = circshift(t,-1)-t; timesteps(end) = 0;

interpolatedzeros = a.*t + b.*timesteps;

x = 20; y = 20; width = 900; height = 200; header = ['An unbounded solution on a truncated interval length: ', num2str(2*tspan(2)/pi), '$\pi$ centred at 0 with an initial value $u(0) = 0, u''(0) = 1$']; 
headerr = 'The markers represent its zeros.';

figure('Position',[x y width height])
hold on;
title(header,'interpreter','latex')
subtitle(headerr,'interpreter','latex')
plot(t,pollution(:,1)); plot(-t,-pollution(:,1)),scatter([interpolatedzeros;-interpolatedzeros], 0*[t;t])

% figure
% plot(t,u1)
% hold on
% scatter(a.*t + b.*timesteps, 0*t)
z = interpolatedzeros(~isnan(interpolatedzeros));