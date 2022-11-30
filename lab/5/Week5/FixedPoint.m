function FixedPoint()
% use function M-file so we can use subfunctions

% example from Burden & Faires

% solving x^3 +4x^2-10=0 using 5 different fixed point functions
% g1= x-x^3-4x^2+10
% g2 = sqrt(10/x-4x)
% g3 = sqrt(10-x^3)/2
% g4 = sqrt(10/(4+x))
% g5 = x - (x^3+4x^2-10)/(3x^2+8x)

x0=1.5; % there is a unique root in [1,2]
N=30; % number of iterations
format long

x1=zeros(N,1); % preallocate memory
x1(1)=g1(x0);
for n=2:N
    x1(n)=g1(x1(n-1));
end

x2=zeros(N,1); % preallocate memory
x2(1)=g2(x0);
for n=2:N
    x2(n)=g2(x2(n-1));
end

x3=zeros(N,1); % preallocate memory
x3(1)=g3(x0);
for n=2:N
    x3(n)=g3(x3(n-1));
end

x4=zeros(N,1); % preallocate memory
x4(1)=g4(x0);
for n=2:N
    x4(n)=g4(x4(n-1));
end

x5=zeros(N,1); % preallocate memory
x5(1)=g5(x0);
for n=2:N
    x5(n)=g5(x5(n-1));
end

% Iterates= [x2  ];
 Iterates=[x3 x4 x5 ];
disp(Iterates)
end


% -------------------------------------

% subfunctions

function y=g1(x)
y = x-x^3-4*x^2+10;
end

function y=g2(x)
y = sqrt(10/x-4*x);
end

function y=g3(x)
y = sqrt(10-x^3)/2;
end

function y=g4(x)
y = sqrt(10/(4+x));
end

function y=g5(x)
y = x - (x^3+4*x^2-10)/(3*x^2+8*x);
end

