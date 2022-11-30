function  twodriver(  )
%TWODRIVER illustrates the errors caused by not pivoting 
%   An extreme 2 x 2 case 
%  A = [delta 1; 1 1]  b= [1+delta; 2]
%  Computes the error with or without partial pivoting
%  Plots show computational errors of each component
%  Without pivoting, x1 shows large growth in error as delta -> 0 
 
close all;
deltarange = logspace(-15, -1);
errorx1 = zeros(size(deltarange));
errorx2 = errorx1;

%  first without pivoting

n=0;
for delta = deltarange
    [errorx1(n+1),errorx2(n+1)] = twobytwo(delta);
    n = n+1;
end
 figure(1);
 loglog(deltarange,abs(errorx1));
 hold on;
 loglog(deltarange, 0.5*eps*deltarange.^-1,'ro')
 xlabel('delta');ylabel('|error in x1|');
 legend('error in x1', 'u / delta');
 title('No Pivoting: error in x1');
 figure(2)
 semilogx(deltarange, abs(errorx2));
 xlabel('delta');ylabel('|error in x2|');
 title('No Pivoting: error in x2');
 
% now with partial pivoting

 errorx1 = zeros(size(deltarange));
 errorx2 = errorx1;
 n=0;
for delta = deltarange
    [errorx1(n+1),errorx2(n+1)] = twobytwoPivot(delta);
    n = n+1;
end
figure(3)
semilogx(deltarange, abs(errorx1));
xlabel('delta');ylabel('|error in x1|');
title('Partial Pivoting: error in x1');
figure(4)
semilogx(deltarange, abs(errorx2));
xlabel('delta');ylabel('|error in x2|');
title('Partial Pivoting: error in x2');
end

