  function [tvals,yvals] = FixedEulerVec(fname,tspan,y0,n)
% [tvals,yvals] = FixedEulerVec(fname,y0,tspan,n)
% Fixed step Euler method.
% vectorized by SLC 23/3/10
%
% fname is a function handle for a function of the form f(t,y). 
%   must return a col vector; the rows of yvals are time slices
%
% Determine positive h so that if tvals = linspace(t0,tmax,n+1), then
t0=tspan(1);tmax=tspan(2);
h=((tmax-t0)/n);

m = length(y0);    % the dimension of the system , set by y0 vector 

yvals = zeros(n+1,m);
tvals = linspace(t0,tmax,n+1)';
yvals(1,:) = y0';
for k=1:n
   fval = fname(tvals(k),yvals(k,:)');
   yvals(k+1,:) = yvals(k,:)+h*fval';
end