f=@(x) x^3-3*x+2;
fd=@(x) 3*x^2-3;
x=-2.4; tol=[1.e-12 1.e-12]; parms = 100;
[~, resids] = Newton(x,f,fd,tol,parms);

x=1.2;
[~, resids1] = Newton(x,f,fd,tol,parms);

semilogy(1:5,abs(resids(1:5)),1:25,abs(resids1(1:25)));
title('Residuals during Newton iteration');
xlabel('iterations');ylabel('|f(x_n)|');
legend('simple root','double root');