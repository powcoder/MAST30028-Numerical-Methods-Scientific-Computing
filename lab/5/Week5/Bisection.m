  function [sol, it_hist, ierr] = Bisection(int,f,tol)
% Method of bisection for f(x) = 0.
%
% adapted from SCMV Bisection.m by C. Van Loan (2000) 
% with ideas from nsol.m by C.T.Kelley (1997) by SLC 10/3/2006.
% updated to MATLAB 7 14/1/09 (remove feval calls)
%
% function [sol, it_hist, ierr] = Bisection(int,f,tol)
%
% inputs:
%      initial interval = [a b] 
%           a and b must bracket the root i.e. f(a)f(b) < 0
%	   function = f
%           f is a function handle for a continuous function  f(x) of a single variable.            
%      tol = [atol, rtol] relative/absolute
%			error tolerances
%               default = [0 eps]
%
% output:
%	sol = solution
%	it_hist =   residuals for the iteration
%	ierr = 0 upon successful termination
%	ierr = 1 if  inital interval is not bracketing
%             
% internal parameter:
%       debug = turns on/off iteration statistics display as
%               the iteration progresses
%
% Example: int=[1 2];tol=[1.e-10,1.e-10];
%  [result,resids]=Bisection(int,@cos,tol)

%
% set the debug parameter, 1 turns display on, otherwise off
%
debug=1;
%
% initialize it_hist, ierr, and set the iteration parameters
%
ierr = 0;
if nargin <= 2
    tol = [0 eps];
end
rtol=tol(2); atol=tol(1);
if nargin<2 
    disp('Must specify a function and an interval.');
    ierr=1;
    return
end
it_hist=[];
itc=0;
a=int(1);b = int(2);
fa=f(a); fb=f(b);
if fa*fb > 0
   disp('Initial interval is not bracketing.')
   ierr=1;
   return
end
while abs(a-b) > atol+rtol*max(abs(a),abs(b))
   mid = (a+b)/2;
    fmid = f(mid);
   it_hist=[it_hist,fmid];
   outstat(itc+1, :) = [itc  a b fmid];
   itc=itc+1;
   if fa*fmid<=0
      % There is a root in [a,mid].
      b  = mid; 
      fb = fmid;
   else
      % There is a root in [mid,b].
      a  = mid; 
      fa = fmid;
   end
% end while
end
sol = (a+b)/2;
if debug==1
    fprintf('\t iteration \t\t  a  \t\t  b  \t\t f(mid)\n');
    disp(outstat)
end
