% BadRecurrence.m
% Script to show  a 2-term recurrence 
% to find an integral \int_0^1 x.^100./(x+2) dx

% using forward recurrence


clc
disp('illustrating numerical instability');
I_0 = log(3/2);  % exact except for roundoff
I=I_0;
nIter = 40;
for n = 1:nIter
    I=1/n-2*I;
end
F = @(x) x.^nIter./(x+2);
Q = integral(F,0,1); 
disp(I)
disp(Q)
disp(' I must be < 0.01!');