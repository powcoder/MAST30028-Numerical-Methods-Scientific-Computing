function [ e1, e2 ] = twobytwoPivot( delta )
%TWOBYTWO Solves a 2 x 2 linear system by Gauss elimination
%   System chosen to illustrate need for pivoting
%   The exact solution is [1 1]'
%   This time the rows are first swapped as i  partial pivoting
%   Input: delta
%       as delta decreases the solution becomes more inaccurate
%   Output: the computed error in the solution
U22 = 1-delta;
b2 = 1+delta - 2*delta;
x2 = b2/U22;
e2 = x2-1;

b1 = 2;
x1 = (b1-x2);
e1 = x1-1;

end

