function FixedPointErrors()
% use function M-file so we can use subfunctions

% example from Burden & Faires

% solving x^3 +4x^2-10=0 using 3 different fixed point functions
% g3 = sqrt(10-x^3)/2
% g4 = sqrt(10/(4+x))
% g5 = x - (x^3+4x^2-10)/(3x^2+8x)
% and testing for linear convergence

x0=1.5; % there is a unique root in [1,2]
N=20; % number of iterations
format long

sol = 1.36523001341410; % from FixedPoint output

x3=zeros(N,1); ratio3=zeros(N,1); % preallocate memory
x3(1)=g3(x0);
olderror = x3(1)-sol;
for n=2:N
    x3(n)=g3(x3(n-1));
    error=x3(n)-sol;
    ratio3(n)=error/olderror;
    olderror=error;
end

x4=zeros(N,1); ratio4=zeros(N,1); % preallocate memory
x4(1)=g4(x0);
olderror = x4(1)-sol;
for n=2:N
    x4(n)=g4(x4(n-1));
    error=x4(n)-sol;
    ratio4(n)=error/olderror;
    olderror=error;
end

x5=zeros(N,1); ratio5=zeros(N,1); % preallocate memory
x5(1)=g5(x0);
olderror = x5(1)-sol;
for n=2:N
    x5(n)=g5(x5(n-1));
    error=x5(n)-sol;
    ratio5(n)=error/olderror;
    olderror=error;
end


Iterates=[x3 x4 x5 ];
disp(Iterates);
ErrorRatio=[ratio3 ratio4 ratio5];
disp(ErrorRatio);
end


% -------------------------------------

% subfunctions

function y=g3(x)
y = sqrt(10-x^3)/2;
end

function y=g4(x)
y = sqrt(10/(4+x));
end

function y=g5(x)
y = x - (x^3+4*x^2-10)/(3*x^2+8*x);
end

