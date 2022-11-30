function ShowSDbanana()
% function: ShowSDbanana
% Minimizes the banana function using steepest descent.
% adapted by SLC from ShowSD.m by Van Loan SCMV 2nd ed. 

close all
Lmax = 1; 
nSteps   = 40;      % Total number of steps.
con_size = 50;      % Size of the contour plot

% Display contours of the banana function.
xRange = linspace(-2,2,con_size);
yRange = linspace(-0.5,3.5,con_size);
Z = zeros(con_size,con_size);
for i=1:con_size
   for j=1:con_size
      x = [xRange(i), yRange(j)];
      Z(i,j) = banana(x);
   end
end
figure
contour(xRange,yRange,Z',20);
xlabel('x1')
ylabel('x2')
xc = [-1.9; 2];
[fc,gc] = banana(xc);
xvals = xc;
fvals = fc;
gvals = norm(gc);
title('')
% Steepest Descent with line search:

clc
disp('Step       f            x(1)         x(2)       norm(grad)')
disp('----------------------------------------------------------------')
fprintf('%2.0f     %10.6f     %10.6f   %10.6f      %8.3e \n',0,fc,xc,norm(gc))
% figure(2)

for step = 1:nSteps
   % Automated Line Search
   [xnew,fnew,gnew] = SDStep1(xc,fc,gc,Lmax);
   xvals = [xvals xnew];       xc = xnew;
   fvals = [fvals fnew];       fc = fnew;
   gvals = [gvals norm(gnew)]; gc = gnew;
   fprintf('%2.0f     %10.6f     %10.6f   %10.6f      %8.3e \n',step,fc,xc,norm(gc))
end

% Show the descent path on the contour plot:

figure(1)
hold on
plot(xvals(1,:),xvals(2,:),xvals(1,1),xvals(2,1),'o')
hold off
title(sprintf('tmin = (%8.3f,%8.3f)   norm(gmin)= %8.4e',xvals(1,end),xvals(2,end),gvals(end)))

% Plot the descent of the sep and its gradient:

figure(2)
subplot(2,1,1)
plot(fvals)
title('Value of f')
xlabel('Iteration')
subplot(2,1,2)
semilogy(gvals)
title('Value of norm(gradf).')
xlabel('Iteration')
end

function [fval, gval] = banana(x)
fval = 100*(x(2)-x(1).^2).^2+(1-x(1)).^2;
gval = [-400*(x(2)-x(1).^2).*x(1)-2*(1-x(1)); ...
    200*(x(2)-x(1).^2)];
end

  function [xnew,fnew,gnew] = SDStep1(xc,fc,gc,Lmax)
% [tnew,fnew,gnew] = SDStep(tc,fc,gc,planet1,planet2,Lmax,auto)
% Generates a steepest descent step.
%
%  fName     the name of a function f(x,plist) that accepts column
%            n-vectors and returns a scalar.
%  gName     the name of a function g(x,plist) that returns the
%            gradient of f at x.
%     xc     a column-vector, an approximate minimizer
%     fc     f(xc,plist)
%     gc     g(xc,plist)
%  plist     orbit parameters for f and g
%   Lmax     max step length
%   auto     if auto is nonzero, then automated line search
%
%   xnew     a column n-vector, an improved minimizer
%   fnew     f(xnew,plist)
%   gnew     g(new,plist)
%

nplotvals = 20;

% Get the Steepest Descent Search Direction
sc = -gc;
% Line Search
% Try to get L<=Lmax so xc+L*sc is at least as good as xc.
L = Lmax;
Halvings = 0;
[fL,~] = banana(xc+L*sc);
while (fL>=fc) && Halvings<=10
   L = L/2;
   Halvings = Halvings+1;
   [fL,~] = banana(xc+L*sc);
end  
% Sample across [0.L]
lambdavals = linspace(0,L,nplotvals);
fvals = zeros(1,nplotvals);
for k=1:nplotvals
   [fvals(k),~] = banana(xc+lambdavals(k)*sc);
end

   % Automated line search.
   [fnew,i] = min(fvals(1:nplotvals));
   xnew = xc + lambdavals(i(1))*sc;
   [~,gnew] = banana(xnew);
end 
    

