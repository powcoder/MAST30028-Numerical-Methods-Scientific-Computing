% Script File: ShowLSq
% Illustrates LSq on problems with user-specified
% dimension and condition.

% Headings wrong way round in original SLC 28/4/06
% Improve formatting and output residuals SLC 7/8/17

m = input('Enter m: ');
n = input('Enter n: ');
logcond = input('Enter the log of the desired condition number: ');
condA = 10^logcond;
[Q1,R1] = qr(randn(m,m));
[Q2,R2] = qr(randn(n,n));
A = Q1(:,1:n)*diag(linspace(1,1/condA,n))*Q2;
clc
fprintf('m = %2.0f, n = %2.0f, cond(A) = %5.3e',m,n,condA);
b = A*ones(n,1);
[x,res] = LSq(A,b);
disp(' ')
disp('Zero residual problem.')
fprintf(' residual =   %20.16f\n',res);
disp(' ')
disp('   Exact Solution          Computed Solution')
disp('-----------------------------------------')
for i=1:n
   fprintf(' %20.16f   %20.16f\n',1,x(i));
end
b = b+Q1(:,m);
[x,res] = LSq(A,b);
disp(' ')
disp(' ')
disp(' ')
disp('Nonzero residual problem.')
fprintf(' residual =   %20.16f\n',res);
disp(' ')
disp('   Exact Solution          Computed Solution')
disp('-----------------------------------------')
for i=1:n
   fprintf(' %20.16f   %20.16f\n',1,x(i));
end