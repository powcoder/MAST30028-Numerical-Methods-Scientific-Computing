  function [tvals,yvals] = FixedEuler(fname,tspan,y0,n)
% [tvals,yvals] = FixedEuler(fname,y0,tspan,n)
% Fixed step Euler method.
%
% Input:    fname is a function handle for a function of the form f(t,y).
%           y0    the inital value , scalar
%           tspan  a vector [t0 tmax]  to solve over
%           n     the number of timesteps to cover the time interval
% Updated from SCMV, Van Loan 1999.
%
% Determine positive h so that if tvals = linspace(t0,tmax,n+1), then
t0=tspan(1);tmax=tspan(2);
h=((tmax-t0)/n);

yvals = zeros(n+1,1);
tvals = linspace(t0,tmax,n+1)';
yvals(1) = y0;
for k=1:n
   fval = fname(tvals(k),yvals(k));
   yvals(k+1) = yvals(k)+h*fval;
end