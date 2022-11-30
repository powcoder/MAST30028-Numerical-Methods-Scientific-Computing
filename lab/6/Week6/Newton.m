  function [sol, it_hist, ierr] = Newton(x,f,fdash,tol,parms)
% Newton solver, locally convergent 
% solver for f(x) = 0
%
% adapted from nsol.m by C.T.Kelley (1997) by SLC 10/3/2006.
% fevals removed 18/5/2017
%
% function [sol, it_hist, ierr] = Newton(x,f,fdash,tol,parms)
%
% inputs:
%     initial iterate = x
%	  function = f
%        f is a function handle for a continuous function  f(x) of a single variable.
%     derivative = fdash
%        fdash is a function handle for the derivative function f'(x)
%     tol = [atol, rtol] relative/absolute
%			error tolerances
%	  parms = [MAXIT]
%			MAXIT = maximum number of iterations
%				default = 40
%
% output:
%	sol = solution
%	it_hist =  residuals for the iteration
%	ierr = 0 upon successful termination
%	ierr = 1 if  after maxit iterations
%             the termination criterion is not satsified%
%
% internal parameter:
%       debug = turns on/off iteration statistics display as
%               the iteration progresses
%
% Example: x=2; tol=[1.e-10 1.e-10]; parms = [100];
%       [result, errs, it_hist]=Newton(x,@sin,@cos,tol,parms);
%       result


format long e
%
% set the debug parameter, 1 turns display on, otherwise off
%
debug=1;
%
% initialize it_hist, ierr, and set the iteration parameters
%
ierr = 0;
MAXIT=40;
if nargin == 5
    MAXIT=parms(1); 
end
if nargin <= 3
    tol = [0 eps];
end
rtol=tol(2); atol=tol(1);
if nargin<3 
    disp('Must specify 2 functions and an interval.');
    ierr=1;
    return
end
it_hist=[];
itc=0;
xc = x;
fc = f(xc); 
fd = fdash(xc);
it_hist=[it_hist,fc];
step = -fc/fd;
while abs(step) > atol+rtol*abs(xc) && itc < MAXIT 
   outstat(itc+1, :) = [itc  xc fc ];
   itc=itc+1;
   step = -fc/fd;
   xc = xc+step;
   fc   = f(xc);
   fd   = fdash(xc);
   it_hist=[it_hist,fc];
   if debug==1
        % disp([itc xc fc])
    end
     outstat(itc+1, :)=[itc xc fc];
end
sol = xc;
if debug==1
    disp(outstat)
end
%
% on failure, set the error flag
%
if itc >= MAXIT
    ierr = 1;
end