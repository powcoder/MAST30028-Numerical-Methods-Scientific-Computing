clear; close all;

x=linspace(0,1,50);
[X,Y] = meshgrid(x,x);

% make a new figure for movie 
fig = figure();
Z = sin(2*pi*(X)).*sin(2*pi*(Y));
surf(X,Y,Z);
xlabel('x')
ylabel('y')
title('Cool Figure')

SaveAsPngEpsAndFig(-1,'DemoFigure', 7, 7/5, 9)
