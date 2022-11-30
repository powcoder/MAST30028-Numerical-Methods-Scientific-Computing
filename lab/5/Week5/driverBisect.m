format long
clf
%
%  set up problem
%
int=[1 2];tol=[1.e-12,1.e-12];
f=@(x) x^3+4*x^2-10;
%
%  do the calculation
%
[result,resids]=Bisection(int,f,tol);
%
%  plot the results in a way that reveals the rate of decay
%
semilogy(abs(resids));
title('Residuals during bisection');
xlabel('iterations');ylabel('|fmid|');