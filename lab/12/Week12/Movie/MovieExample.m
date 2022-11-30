clear 
close all

% Creates a 2D Mesh to plot surface
x=linspace(0,1,100);
[X,Y] = meshgrid(x,x);

% make a new figure for movie 
fig = figure();

% Prepare Movie File
v = VideoWriter('peaks.avi');
open(v);

%Create a set of frames and write each frame to the file.
N=100; % Number of frames
for i = 1:N
    Z = sin(2*pi*(X-i/N)).*sin(2*pi*(Y-i/N));
    surf(X,Y,Z)
   
    frame = getframe(gcf); %leaving gcf out crops the frame 
    writeVideo(v,frame);
end 

close(v);