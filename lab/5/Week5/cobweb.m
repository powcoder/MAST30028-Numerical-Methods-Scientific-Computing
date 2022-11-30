function cobweb(f,a,b,x0,N)
% generate the cobweb plot associated with
% the orbits x_n+1=f(x_n).
% N is the number of iterates, and
% (a,b) is the interval
% x0 is the initial point.
% use @f to pass function ...

close all
% generate N linearly space values on (a,b)
x=linspace(a,b,N);  
% which we use to plot the function y=f(x)
y=f(x);

% turn hold on to gather up all plots in one
hold on;
plot(x,y,'k'); % plot the function
plot(x,x,'r'); % plot the straight line
x(1)=x0; % plot orbit starting at x0
for i=1:N
    x(i+1)=f(x(i));
    line([x(i),x(i)],[x(i),x(i+1)]);
    line([x(i),x(i+1)],[x(i+1),x(i+1)]);
end
hold off;
