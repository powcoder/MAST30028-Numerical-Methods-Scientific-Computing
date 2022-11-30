% Script File: ShowKepler
% Applies ODE23 and ODE45 to a system of differential equations
% that define an elliptical orbit.

close all
clc

% A simple call to ode23.

tInitial = 0;
tFinal   =  2*pi;
uInitial = [ .4; 0 ; 0 ; 2];
tSpan = [tInitial tFinal];
[t, u] = ode23(@Kepler, tSpan, uInitial);
nSteps = length(t)-1;
figure(1)
plot(u(:,1),u(:,3),'o-');
ax = gca;
ax.FontSize = 8;
axis('equal')
title('Kepler Problem: ode23 with Default Tolerances');
xlabel(sprintf('Number of Steps = %5d',nSteps))
figure(2)
plot(t(2:length(t)),diff(t))
ax = gca;
ax.FontSize = 8;
title('Kepler Problem: ode23 with Default Tolerances')
ylabel('Step Length')
xlabel('t')
figure(11)

subplot(2,2,1); plot(t,u(:,1));
ax = gca;ax.FontSize = 8;title('x(t)');
subplot(2,2,2); plot(t,u(:,3));
ax = gca;ax.FontSize = 8;title('y(t)')
subplot(2,2,3); plot(t,u(:,2));
ax = gca;ax.FontSize = 8;title('x''(t)')
subplot(2,2,4); plot(t,u(:,4));
ax = gca;ax.FontSize = 8;title('y''(t)')


pause

% A call with specified output times.

tSpan = linspace(tInitial,tFinal,100);
[~, u] = ode23(@Kepler, tSpan, uInitial);
figure(22)
axis('equal')
plot(u(:,1),u(:,3),'o-')
ax = gca;
ax.FontSize = 8;
title('Output at equally-spaced specified times');

pause

% A call with a more stringent tolerances

tSpan = [tInitial tFinal];
options = odeset('AbsTol',1.e-8,'RelTol',1.e-6,'Stats','on');
fprintf('\n Stats for ODE23 Call:\n');
[t, u] = ode23(@Kepler, tSpan, uInitial,options);
nSteps = length(t)-1;
figure(3)

plot(u(:,1),u(:,3))
ax = gca;
ax.FontSize = 8;
axis('equal')
title({'Kepler Problem: ode23 with RelTol = 10^{-6} and AbsTol = 10^{-8}'})
xlabel(sprintf('Number of Steps = %5d',nSteps))
figure(4)

plot(t(2:length(t)),diff(t))
ax = gca;
ax.FontSize = 8;
title({'Kepler Problem: ode23 with RelTol = 10^{-6} and AbsTol = 10^{-8}'})
ylabel('Step Length')
xlabel('t')

pause

% Use ODE45 on the same problem.

tSpan = [tInitial tFinal];
options = odeset('AbsTol',1.e-8,'RelTol',1.e-6,'Stats','on');
fprintf('\n Stats for ode45 Call:\n');
[t, u] = ode45(@Kepler, tSpan, uInitial,options);
nSteps = length(t)-1;
figure(5)
plot(u(:,1),u(:,3))
ax = gca;
ax.FontSize = 8;
axis('equal')
title('Kepler Problem: ode45 with RelTol = 10^{-6} and AbsTol = 10^{-8}')
xlabel(sprintf('Number of Steps = %5d',nSteps))
figure(6)
plot(t(2:length(t)),diff(t))
ax = gca;
ax.FontSize = 8;
title('Kepler Problem: ode45 with RelTol = 10^{-6} and AbsTol = 10^{-8}')
ylabel('Step Length')
xlabel('t')

pause

% back to default tolerances

tSpan = [tInitial tFinal];
options = odeset('Stats','on');
fprintf('\n Stats for ode45 Call:\n');
[t, u] = ode45(@Kepler, tSpan, uInitial,options);
nSteps = length(t)-1;
figure(7)
plot(u(:,1),u(:,3))
ax = gca;
ax.FontSize = 8;
axis('equal')
title('Kepler Problem: ode45 with default tolerances')
xlabel(sprintf('Number of Steps = %5d',nSteps))
figure(8)
plot(t(2:length(t)),diff(t))
ax = gca;
ax.FontSize = 8;
title('Kepler Problem: ode45 with default tolerances')
ylabel('Step Length')
xlabel('t')

