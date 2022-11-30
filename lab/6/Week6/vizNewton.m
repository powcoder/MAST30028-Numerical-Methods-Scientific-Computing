function vizNewton(f,fdash,x0,N,a,b)
% visualize Newton's method
% N is the number of iterates, and
% x0 is the initial point.
% use @f @fdash to pass function and its derivative ...

close all
% generate N linearly space values on (a,b)
x=linspace(a,b);  
% which we use to plot the function y=f(x)
y=f(x);

% turn hold on to gather up all plots in one
hold on;
plot(x,y,'k'); % plot the function 
plot(x,zeros(size(x)),'r'); % plot the x-axis
x(1)=x0; % plot orbit starting at x0
for i=1:N
    x(i+1)=x(i)-f(x(i))/fdash(x(i));
    line([x(i),x(i)],[0,f(x(i))]);
    line([x(i),x(i+1)],[f(x(i)),0]);
end
hold off;
