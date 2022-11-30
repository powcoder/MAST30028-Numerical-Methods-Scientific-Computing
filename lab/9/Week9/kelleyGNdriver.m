function  kelleyGNdriver(  )
%KELLEYGNDRIVER Illustrating use of Kelley's gaussn.m code
%   Doing same example as my GNdriver,but with lione search. 


% Now try Kelley's G-N 
% first on Heath example 6.9 with a good guess


x0 = [1;0];
tol = 1.e-6;
[x,histout,costdata] = gaussn(x0,@fgJ6p9,tol);
fprintf('solution:  %10.4e \t %10.4e \n',x');
fprintf('\n |g(xc)| \t f(xc) \t\t iter \n');
disp(histout(:,[1 2 end]));
fprintf('   numf    numg \n')
disp(costdata(1:2))

% now with a poor guess

x0 = [-3;3];
tol = 1.e-6;
[x,histout,costdata] = gaussn(x0,@fgJ6p9,tol);
fprintf('solution:  %10.4e \t %10.4e \n',x');
fprintf('\n |g(xc)| \t f(xc) \t\t iter \n');
disp(histout(:,[1 2 end]));
fprintf('   numf    numg \n')
disp(costdata(1:2))


end

function [ f,g, Jac ] = fgJ6p9(x) % for gaussn.m
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
tdata = 0:3;tdata = tdata';
ydata = [2.0, 0.7, 0.3, 0.1]';
R6p9 = @(x) ydata-x(1)*exp(x(2)*tdata);
% r = R6p9(x);
f = sum(R6p9(x).^2)/2;
Jac6p9 = @(x) [-exp(x(2)*tdata),-(x(1)*tdata.*exp(x(2)*tdata))]; 
g = Jac6p9(x)'*R6p9(x);
Jac = Jac6p9(x);
end



