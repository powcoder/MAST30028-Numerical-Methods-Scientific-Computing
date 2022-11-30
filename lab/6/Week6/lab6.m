%% lab6.m Matrices in MATLAB

%% Matrices (2D arrays) in MATLAB
% For more help, type "help matfun" and "help elmat".
% There are arrays of 3D etc but we won't use them.
%% Creating matrices
% Basic matrix creation functions:
clc; x = [ 1 2 3; 4, 5, 6]
%   the spaces and commas separate columns
%   and the semicolons separate rows
%%
% various ways to make a matrix
x = [ 1 2 3
    5 4 6]
%   in this case, the second line indicates a new row
%%
format; clc; Z = zeros(5,5)
% Note: zeros(5) is a shortcut for zeros(5,5)
O = ones(5,6)
I = eye(4,5)
I4 = eye(4)
%%
R1 = rand(3,1)
R2 = randn(2,4)
D1 = diag(1:5)      % with vector input argument
% type "help gallery" 
% for many example matrices
H = invhilb(5)
%% Accessing matrix entries
% Indices: use ( ) to access an element, not [ ]
% For creating a matrix, use [ ] not ( ).  
clc; x = [ 1 2; 3 4; 5 6]
x(2,1)      % convention is x(row, column)
%%
% We can also use "linear indices", with "column-major" order (like 
% FORTRAN, unlike C and most other languages).
% Major note: MATLAB is 1-indexed, unlike C.
x(2)
x(5)
% to convert from subscripts (e.g. x(2,1) ) to linear indices (e.g. x(2) ),
% MATLAB has the functions "ind2sub" and "sub2ind"
%% Matrix slices
% More powerfully, we can index many entries at once, using either
% subscripts or linear indices.  Here, we use the ":" operator.  There are
% several equivalent syntaxes
x(1:3, 1)       % shows just the first column ( x(1:3,2) is 2nd column )
x( :,  1)       % exact same
x(1:end, 1)     % exact same; the special keyword "end" refers to the last
                % entry
% This kind of referencing is sometimes called "slicing"
% Note that the conventions are different to Python's slices
%%
clc; x
x(2,:)
x(:,2)
x(1:2,:)
x(:)            % turns the matrix into a (column) vector
x( 3:5 )        % note that this "flattens" the matrix into a vector
%%
clc; x
x( 1:2:5 )      % the "2" means that we go from 1 to 5 in increments of 2
         
%%
clc; R = randn( 3,7)
R( 2, 3:5 )
size(R)

%%
% About indexing: you cannot create and then index a matrix in the same
% step!
H = invhilb(5);
h = H(3,4)
% h = invhilb(5)(3,4) would not work
%% Operations on matrices
%  mostly like vectors but remember:
% some operations are "matrix" operations, and others
% are "component-wise" aka "element-wise"

%% Array operators
% +   -   >   <
%  .*    ./   .^
clc
[1 2 3 4; 4 3 2 1].^2
[1 2; 0 4] < [1 3; -9 -7]

%% Operations by scalars on matrices
% +   -    *  /   <   >
5 + zeros(3)
ones(2,6)/2
[5 6 -9;4 9 0] > 4
%% Matrix operators
x = [1 2; 3 4];
x * x       % this tries to do matrix multiplication
%  works for suitably dimensioned matrices e.g. square
x .* x      % this works element-wise
%%

exp(x)      % this is element-wise
expm(x)     % this is an inherent matrix operation
%% 
x ^ 2       % this is matrix multiplication, e.g. "x * x"
x .^ 2      % this is element-wise, e.g. "x .* x"
%% Linear algebra
clc
x = [1+i 2i; 3 exp(2i)]
% Transpose:
x'
% or 
x.'
% What's the difference?  x' is actually the complex conjugate transpose,
% aka the adjoint or Hermitian transpose.  
% If you just want to "flip" a matrix, use "x.'"
% If x has all real numbers, they are of course the same.

%%
A = magic(3)
t = trace(A)
det(A)
Ainv = inv(A)       %  (almost) never use this! 
d2 = diag(A)        % this time with a matrix input argument


%% More advanced operators 

b = ones(3,1);
x = A\b             % we'll learn what this does
eig(A)              % these we won't
svd(A)

%% Surface plots
[X,Y] = meshgrid(-2:.2:2, -2:.2:2);
Z = X .* exp(-X.^2 - Y.^2);  %  note use of array operators
surf(X,Y,Z)
%% Efficiency issues: pre-allocation & vectorization

% Vectors and matrices can be changed dynamically! Very nice
clc; A = eye(5)
A = [A; A]      % we overwrite A with the expression

% We can change the size of matrices whenever.  However, there is a cost.
% MATLAB needs to re-allocate RAM whenever this happens.  To speed things
% up, we can allocate all the memory at once.  For example, to create the
% Hilbert matrix:
clc; clear;
N = 2000;
tic
for i = 1:N
    for j = 1:N
        % make sure to use a semicolon to suppress output!
        % Otherwise, it'll take forever.
        A(i,j) = 1/(i+j-1);
    end
end
toc
%%
% Now, pre-allocate space for the matrix
tic
B = zeros(N);
for i = 1:N
    for j = 1:N
        B(i,j) = 1/(i+j-1);
    end
end
toc
%%
% And even easier, use MATLAB's own commands
tic; C = hilb(N); toc

%% Vectorization
% Why was our code so much slower than MATLAB's code?  We didn't take
% advantage of vector operations.  But, we can fix that
N = 5;
d = 1:N;
Dx = repmat(d,N,1);     % "repmat" stands for Repeat Matrix
Dy = repmat(d',1,N);    % We make a new, bigger matrix out of copies
                        % of the smaller matrix
D = ( Dx + Dy - ones(N) ).^-1
hilb(5)                 % compare our code to make sure we are correct
%%
% so, how fast is our new code?
N = 2000;
tic
d = 1:N;
Dx = repmat(d,N,1);
Dy = repmat(d',1,N);
D = ( Dx + Dy - ones(N) ).^-1;
toc
% it's fast!
%% "if" statement is slow
% e.g. we have to vectors x and y, and for each element x_i and y_i, we
% want to form a new element z_i where z_i is 2*x_i if x_i > y_i, and z_i
% is -y_i if x_i <= y_i.
clc; clear
N = 7;
y = randn(1,N)
x = randn(1,N)
% The plain way to create z:
for i = 1:N
    if x(i) > y(i)
        z(i) = 2*x(i);
    else
        z(i) = -y(i);
    end
end
z
disp('and the "MATLAB-way" to create z:');
z = 2*x.*( x > y ) - y .*( x <= y)
% much, much faster!
%%
% Let's repeat the previous command, but with bigger vectors so that we can
% see a difference in the time.
clc; clear
N = 500000;  % remember: to end execution of a program, type Ctrl + c
y = randn(1,N); x = randn(1,N);
tic
for i = 1:N
    if x(i) > y(i)
        z(i) = 2*x(i);
    else
        z(i) = -y(i);
    end
end
toc
disp('and the "MATLAB-way" to create z:');
tic;
z = 2*x.*( x > y ) - y .*( x <= y);
toc
%% Logical indexing
% using "find"
clc; clear; H = abs(invhilb(5))
f=find( H < 1000 )  % this uses linear indexing
% find returns a list of indices, NOT of values of the matrix
%%
% this is the command to find the values of the matrix that were found
H(f)
%%
% We do operations on these entries, without affecting other entries
H(f) = 0        % it's statements like this that make MATLAB so powerful
%%
clc; H
[I,J] = find( H );  % this time, using subscript indexing
                    % This is the same as find( H ~= 0 )
[I,J]
%%
% we can combine a few steps
H( H > 0 ) = -3;
H

%%
% Now do Exercise set 1