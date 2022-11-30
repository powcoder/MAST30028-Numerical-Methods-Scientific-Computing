% Display uniformly distributed random numbers 
% and normally distributed random numbers as
% coordinates in 2-space to check their spread.
% Also display histograms.
% DPO 11/02
% revised to use histogram not hist  SLC

close all

nn = 20;
mm = 30;

close all
hold on
title('Plot of uniform random numbers')
Xu = [];
for i=1:nn
x = rand(mm,2);
Xu = [Xu;x];
plot(x(:,1),x(:,2),'*');
pause
end

% Same test for normally distributed numbers. 

figure(2)
hold on
title('Plot of normal random numbers')
Xn = [];
for i=1:nn
x = randn(mm,2);
Xn = [Xn;x];
plot(x(:,1),x(:,2),'*');
pause
end

% Display histograms of the numbers

figure(3)
Xu = reshape(Xu,nn*mm*2,1);
histogram(Xu,100)
title(sprintf('Histogram of %d uniform random numbers',nn*mm*2))
pause

figure(4)
Xn = reshape(Xn,nn*mm*2,1);
histogram(Xn,100)
title(sprintf('Histogram of %d normal random numbers',nn*mm*2))
pause

% Histograms for larger samples

figure(5)
histogram(rand(100000,1),100)
title('Histogram of 100000 uniform random numbers')
pause

figure(6)
histogram(randn(100000,1),100)
title('Histogram of 100000 normal random numbers')

