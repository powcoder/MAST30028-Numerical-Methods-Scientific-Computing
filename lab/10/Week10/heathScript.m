%% Now try Heath Ex6.9

% using lsqnonlin with trust region

disp('Default MATLAB method: lsqnonlin');
tdata = 0:3;
ydata = [2.0, 0.7, 0.3, 0.1];
R6p9 = @(x) ydata-x(1)*exp(x(2)*tdata);
options = optimoptions('lsqnonlin','Display','iter');

x0 = [1;0];
[x,resnorm,~,~,output] = lsqnonlin(R6p9,x0,[],[],options);

fprintf('Solution: %12.4e %12.4e \n',x');
disp(output)

%% Now try but using lsqcurvefit
 model6p9 = @(x,tdata) x(1)*exp(x(2)*tdata); 
 options = optimoptions('lsqcurvefit','Display','iter');
[x,resnorm,~,~,output] = lsqcurvefit(model6p9,x0,tdata,ydata,[],[],options);
fprintf('Solution: %12.4e %12.4e \n',x');
disp(output)

% showing they're identical

%% now try worse guess

options = optimoptions('lsqnonlin','Display','iter');

x0 = [-3;3];
[x,resnorm,~,~,output] = lsqnonlin(R6p9,x0,[],[],options);

fprintf('Solution: %12.4e %12.4e \n',x');
disp(output)

%% now with L-M

disp('levenberg-marquardt method');
options = optimoptions('lsqnonlin','Display','iter');
options.Algorithm = 'levenberg-marquardt';
x0 = [1;0];
[x,resnorm,~,~,output] = lsqnonlin(R6p9,x0,[],[],options);

fprintf('Solution: %12.4e %12.4e \n',x');
disp(output)

% Note how lambda always decreases, suggesting G-N will be OK
