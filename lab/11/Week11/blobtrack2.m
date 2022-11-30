function blobtrack2()

global Np Gam delta a b

% set problem parameters

Gam = 2*pi;     % strength of vortices
a=1;            % radius of bounding circle
b=0.5;          % vortices centred at (+-b,0)
delta = 0.1;    % used to mollify singularity at centre of vortex

Np=1000;        % number of particles in initial blob

% set computational parameters
h=1.e-3;
tf=3;
n=tf/h;

% initialize position of tracer particles

x0 = 0.2*rand(Np,1)-0.1;
y0=  0.2*rand(Np,1);
yinit = [x0;y0];    % put into 1 column

[~,yvals] = finalRK4(@vortices,0,yinit,h,n);

xpos=yvals(:,1:Np); 
ypos=yvals(:,Np+1:end); % separate x and y positions
close all;

plot(x0,y0,'ro');hold on;   %plot initial blob
plot(xpos,ypos,'x');axis equal; % plot mixed blob
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function [tvals,yvals] = finalRK4(fname,t0,y0,h,n)
% [tvals,yvals] = finalRK4(fname,t0,y0,h,n)
% Produces approximate solution (at the final time only) to the IVP
%
%      y'(t) = f(t,y(t))     y(t0) = y0
%
% using a strategy that is based upon a 4-th order
% Runge-Kutta method. Stepsize is fixed.
%
% fname = a function handle for  the function f.
% t0 = initial time.
% y0 = initial condition vector.
% h  = stepsize.
% n  = number of steps to be taken,
%
% tvals is a column vector with tvals(1) = t0; tvals(2) = tf = t0+nh
% yvals is a matrix with yvals(j,:) = approximate solution at tvals(j),
% j=1:2
% adapted from Van Loan's FixedRK and RKStep

tc = t0;
yc = y0;
tvals = tc;
yvals = yc';
fc = fname(tc,yc);
for j=1:n
   %[tc,yc,fc] = RK4(fname,tc,yc,fc,h);
   k1 = h*fc;
   k2 = h*fname(tc+(h/2),yc+(k1/2));   
   k3 = h*fname(tc+(h/2),yc+(k2/2));  
   k4 = h*fname(tc+h,yc+k3);  
   yc  = yc + (k1 + 2*k2 + 2*k3 + k4)/6;
   tc = tc+h;
   fc = fname(tc,yc);
end
yvals=yc';tvals=tc;
end

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function dydt=vortices(t,y) % encodes the ODEs for 4 ideal vortices

global Np Gam delta a b

y=reshape(y,Np,2);  % now 1st col. has x values; 2nd col. has y values

u1 = -Gam*y(:,2)./((y(:,1)-b).^2 + y(:,2).^2+delta^2)/2/pi;
u1p = Gam*y(:,2)./((y(:,1)-(a^2)/b).^2 + y(:,2).^2+delta^2)/2/pi;
u2 = -Gam*y(:,2)./((y(:,1)+b).^2 + y(:,2).^2+delta^2)/2/pi;
u2p = Gam*y(:,2)./((y(:,1)+(a^2)/b).^2 + y(:,2).^2+delta^2)/2/pi;

v1 = Gam*(y(:,1)-b)./((y(:,1)-b).^2 + y(:,2).^2+delta^2)/2/pi;
v1p = -Gam*(y(:,1)-a^2/b)./((y(:,1)-a^2/b).^2 + y(:,2).^2+delta^2)/2/pi;
v2 = Gam*(y(:,1)+b)./((y(:,1)+b).^2 + y(:,2).^2+delta^2)/2/pi;
v2p = -Gam*(y(:,1)+a^2/b)./((y(:,1)+a^2/b).^2 + y(:,2).^2+delta^2)/2/pi;

dydt = [u1+u1p+u2+u2p;v1+v1p+v2+v2p];
end