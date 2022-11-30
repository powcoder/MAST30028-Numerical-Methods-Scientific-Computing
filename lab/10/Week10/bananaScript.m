%%
% Let's try to do banana using lsqnonlin

disp('Default MATLAB method');
x0=[-1.9;2];
% Need to write a residual vector whose sum squares gives banana
options = optimoptions('lsqnonlin','Display','iter');
banana = @(x) [10*(x(2)-x(1)^2), 1-x(1)];
[x,resnorm,~,~,output] = lsqnonlin(banana,x0,[],[],options);
disp(x)
disp(resnorm)
disp(output)
%% Now using L_M

disp('levenberg-marquardt method');
options = optimoptions('lsqnonlin','Display','iter');
options.Algorithm = 'levenberg-marquardt';
[x,resnorm,~,~,output] = lsqnonlin(banana,x0,[],[],options);
% x = lsqnonlin(banana,x0,[],[],options)
disp(x);
disp(resnorm);
disp(output);