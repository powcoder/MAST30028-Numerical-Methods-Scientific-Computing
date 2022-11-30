% testEuler.m

% to show behaviour of Euler's method
close all;

 f=@(t,y) 2*y+1;

 exact = @(t) -1/2+exp(2*t)/2;

y0=0;
tspan=[0 1];


n=10;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error1=abs(yvals-exact(tvals));
semilogy(tvals,error1,'o')
title('Euler''s method example 1: J > 0');
xlabel('t');ylabel('Global error ');
hold on

n=100;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error2=abs(yvals-exact(tvals));
semilogy(tvals,error2,'x')
hold on;

n=1000;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error3=abs(yvals-exact(tvals));
semilogy(tvals,error3,tvals,10*error3,tvals,100*error3)
hold off

pause

clf

f=@(t,y) 1./(1+t.^2)-2*y.^2;
exact = @(t) t./(1+t.^2);

y0=0;
tspan=[0 2];

n=10;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error1=abs(yvals-exact(tvals));
semilogy(tvals,error1,'o')
title('Euler''s method example 2: J < 0');
xlabel('t');ylabel('Global error ');
hold on

n=100;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error2=abs(yvals-exact(tvals));
semilogy(tvals,error2,'x')
hold on;

n=1000;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error3=abs(yvals-exact(tvals));
semilogy(tvals,error3,tvals,10*error3,tvals,100*error3)
hold off

pause

clf

f=@(t,y) -100*(y-sin(t))+cos(t);
exact = @(t) exp(-100*t)+sin(t);
y0=1;
tspan=[0 1];

n=10;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error1=abs(yvals-exact(tvals));
semilogy(tvals,error1,'o')
title('Euler''s method example 3: J << 0');
xlabel('t');ylabel('Global error ');
hold on

n=100;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error2=abs(yvals-exact(tvals));
semilogy(tvals,error2,'x')
hold on;

n=1000;
[tvals,yvals] = FixedEuler(f,tspan,y0,n);
error3=abs(yvals-exact(tvals));
semilogy(tvals,error3,tvals,10*error3,tvals,100*error3)
hold off

