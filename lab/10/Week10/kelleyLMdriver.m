function  kelleyLMdriver(  )
%KELLEYLMDRIVER This is a driver for Kelley's Levenberg-
% Marquardt code levmarCorr.m. You have to 
% provide function handles that return the cost function f,
% its gradient g and the Jacobian J at the current guess


% Now try Kelley's L-M
% first on Heath example 6.9 with a good guess


x0 = [1;0];
tol = 1.e-6;
[x,histout,costdata] = levmarCorr(x0,@fgJ6p9,tol);
fprintf('solution:  %10.4e \t %10.4e \n',x');
fprintf('\n   |g(xc)| \t f(xc) \t lambda \t iter \n');
disp(histout);
fprintf('   numf    numg \n')
disp(costdata(1:2))

% then with a poor guess

x0 = [-3;3];
tol = 1.e-6;
[x,histout,costdata] = levmarCorr(x0,@fgJ6p9,tol);
fprintf('solution:  %10.4e \t %10.4e \n',x');
fprintf('\n   |g(xc)| \t f(xc) \t lambda   iter \n');
% disp(histout);
fprintf(' %9.4e %9.4e %9.4e %3d \n',histout');
fprintf('   numf    numg \n')
disp(costdata(1:2))



end


function [ f,g, Jac,r ] = fgJ6p9(x) % for levmar
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tdata = 0:3;tdata = tdata';
ydata = [2.0, 0.7, 0.3, 0.1]';
R6p9 = @(x) ydata-x(1)*exp(x(2)*tdata);
r = R6p9(x);
f = sum(R6p9(x).^2)/2;
Jac6p9 = @(x) [-exp(x(2)*tdata),-(x(1)*tdata.*exp(x(2)*tdata))]; 
g = Jac6p9(x)'*R6p9(x);
Jac = Jac6p9(x);
end

% L-M
% x=x0; 
% for k = 1:N
%     [r,Jac] = Ex6p9(x);
%     cost = r'*r/2;
%     s = -Jac\r;  % lsq solution
%     x = x+s;
%     disp(r);disp(cost); disp(Jac);disp(s); disp(x);
% end

% end
% %% 
% function [r,Jac] = Ex6p9(x)
% % Heath Example 6.9
%     r = [2.0-x(1); 0.7-x(1)*exp(1*x(2)); ...
%         0.3-x(1)*exp(2*x(2)); 0.1-x(1)*exp(3*x(2))];
%     Jac = [-1, -exp(1*x(2)), -exp(2*x(2)), -exp(3*x(2)); ...
%         0, -1*x(1)*exp(1*x(2)), -2*x(1)*exp(2*x(2)),-3*x(1)*exp(3*x(2))];
%     Jac = Jac';
% end
% 
% %%
% function [r,Jac] = banana2(x)
% % Heath Example 6.9
%     r = [10*(x(2)-x(1).^2);1-x(1)];
%     Jac = [-20*x(1), -1; ...
%         10,0];
%     % Jac = Jac';
% end


