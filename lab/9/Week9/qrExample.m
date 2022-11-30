  function  qrExample(  )
%QREXAMPLE Shows the steps in QR factorization
%  Example from pp. 150 in Moler Ch. 5
%  Fit a quadratic to U.S. census data 1950-2000
%  Solve overdetermined system X * beta = y
%  where X is the design matrix, beta are the quadratic coefficients
%  y are the census data 
 
format short 
y = [150.698  179.323 203.212 226.505 249.633 281.422]';
t  = (1950:10:2000)';
s = (t-1950)/50;

X = [s.*s s ones(size(s))];

qrsteps(X,y) 

[R,z] = qrsteps(X,y) 

beta = R(1:3,1:3)\z(1:3)
beta = R\z
beta = X\y

resid = norm(z(4:6))
resid = norm(X*beta-y)

end
 
