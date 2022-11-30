function  GNdriver( )
% GNDRIVER A driver for (undamped) Gauss-Newton method
%   applied to a nonlinear fitting problem from Heath

% Example 6.9
% The data

tdata = 0:3;
ydata = [2.0, 0.7, 0.3, 0.1];

% We fit to an exponential model y ~ x1 exp(x2 t)
% We need to supply a function handle that computes the residual vector
% and another to compute the Jacobian matrix, here 4x2

R6p9 = @(x) ydata-x(1)*exp(x(2)*tdata);
Jac6p9 = @(x) [-exp(x(2)*tdata)',-(x(1)*tdata.*exp(x(2)*tdata))']; 

% Gauss-Newton
% first with a good initial guess

disp('Gauss-Newton (no linesearch)');
x = [1;0]; N=5; gamma = 1;  % no damping
% disp('x0:'); disp(x);
fprintf('Initial guess: %2d %2d \n', x');
fprintf('\n Iteration    |residual| \t cost \t      |s|  \n');
for k = 1:N
    r = R6p9(x)';
    Jac = Jac6p9(x);
    cost = r'*r/2;
    s = -Jac\r;  % lsq solution
    x = x+gamma*s;
%     disp('iteration'); disp(k);
%     disp('r:'); disp(r);
%     disp('cost:');disp(cost); 
%     disp('Jac:'); disp(Jac);
%     disp('s:'); disp(s); 
%     disp('x:'); disp(x);
fprintf(' %5d \t %15.4e %14.4e %12.4e \n',k, norm(r),cost,norm(s));
end
fprintf('Solution: %12.4e %12.4e \n',x');

pause


% now try a worse x0
% Gauss-Newton
disp('Gauss-Newton (no linesearch)');
x=[-3 ;3 ];
N=10; gamma = 1;  % no damping
% disp('x0:'); disp(x);
fprintf('Initial guess: %2d %2d \n', x');
fprintf('\n Iteration    |residual| \t cost \t      |s|  \n');
for k = 1:N
    r = R6p9(x)';
    Jac = Jac6p9(x);
    cost = r'*r/2;
    s = -Jac\r;  % lsq solution
    x = x+gamma*s;
%     disp('iteration'); disp(k);
%     disp('r:'); disp(r);
%     disp('cost:');disp(cost); 
%     disp('Jac:'); disp(Jac);
%     disp('s:'); disp(s); 
%     disp('x:'); disp(x);
    fprintf(' %5d \t %15.4e %14.4e %12.4e \n',k, norm(r),cost,norm(s));
end
fprintf('Solution: %12.4e %12.4e \n',x');
end




