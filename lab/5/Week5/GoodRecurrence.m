% GoodRecurrence.m
% Script to show 2 different methods to use a 2-term recurrence 
% to find an integral \int_0^1 x.^100./(x+2) dx

% using forward recurrence
clc
format long
disp('illustrating numerical stability');disp(' ');

I_0 = log(3/2);  % exact except for roundoff
I=I_0;
for n = 1:100
    I=1/n-2*I;
end

disp('using forward recurrence (unstable)');disp(I);

% now using backward recurrence

I_200 = 1/200; % only approximate
I=I_200;
for n=200:-1:101
    I=1/(2*n) - I/2;
end

disp('using backward recurrence (stable)');disp(I);

% check against numerical quadrature

F = @(x) x.^100./(x+2);
Q = integral(F,0,1); 
disp('check using numerical quadrature (integral)');disp(Q);