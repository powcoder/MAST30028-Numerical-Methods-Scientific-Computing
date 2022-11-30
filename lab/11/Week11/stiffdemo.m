function  stiffdemo(MU)
%VDPODE  Parameterizable van der Pol equation (stiff for large MU).
%   For the default value of MU = 1000 the equation is in relaxation
%   oscillation, and the problem becomes very stiff. The limit cycle has
%   portions where the solution components change slowly and the problem is
%   quite stiff, alternating with regions of very sharp change where it is
%   not stiff (quasi-discontinuities). The initial conditions are close to an
%   area of slow change so as to test schemes for the selection of the
%   initial step size.
%   
%   The subfunction J(T,Y,MU) returns the Jacobian matrix dF/dY evaluated
%   analytically at (T,Y). By default, the stiff solvers of the ODE Suite
%   approximate Jacobian matrices numerically. However, if the ODE Solver
%   property Jacobian is set to @J with ODESET, a solver calls the function 
%   to obtain dF/dY. Providing the solvers with an analytic Jacobian is not 
%   necessary, but it can improve the reliability and efficiency of
%   integration.  
%   
%   L. F. Shampine, Evaluation of a test set for stiff ODE solvers, ACM
%   Trans. Math. Soft., 7 (1981) pp. 409-420.
%   
%   See also ODE15S, ODE23S, ODE23T, ODE23TB, ODESET, @.

%   Mark W. Reichelt and Lawrence F. Shampine, 3-23-94, 4-19-94
%   Copyright 1984-2002 The MathWorks, Inc. 
%   $Revision: 1.18 $  $Date: 2002/04/15 03:30:52 $

%   method = 1 for ode45, 2 for ode15s

if nargin < 1
  MU = 1000;     % default
end

tspan = [0; max(20,3*MU)]              % several periods
y0 = [2; 0];
options = odeset('Jacobian',@J);
clc;


 disp('first use a stiff solver on this stiff problem');
 pause
ode15s(@f,tspan,y0,options,MU);

disp('no problem!'); 

disp('now plot the timesteps');
pause

[t,y]=ode15s(@f,tspan,y0,options,MU);
plot(t(2:length(t)),diff(t));
xlabel('t');ylabel('stepsize');

disp('now try a nonstiff solver');
disp('click Stop to quit when  you get bored...'); 
pause
    ode45(@f,tspan,y0,options,MU);

disp('to see what''s going on, run for a short time and plot the timesteps');
pause;
tspan=[0;2]
[t,y]=ode45(@f,tspan,y0,options,MU);
plot(t(2:length(t)),diff(t));
xlabel('t');ylabel('stepsize');

% --------------------------------------------------------------------------

function dydt = f(t,y,mu)
dydt = [            y(2) 
         mu*(1-y(1)^2)*y(2)-y(1) ]; 

% --------------------------------------------------------------------------

function dfdy = J(t,y,mu)
dfdy = [         0                  1
         -2*mu*y(1)*y(2)-1    mu*(1-y(1)^2) ];
