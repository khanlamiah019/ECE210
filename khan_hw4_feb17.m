%% MATLAB-Homework #3
% Lamiah Khan February 17,2024

%% note: Mathworks code was used for some parts! 
clc; clear; close all;

%% my sinc is broken 
% (4) (-7,7) range is used for x mostly because I thought it looked better.
x = linspace(-7, 7);
y = sinc(x);

% (4)
[infX, infY] = inflection(y, x);
[extX, extY] = extrema(y, x);
figure();
hold on;
grid on;
plot(x, y, x, deriv(y, x), x, antideriv(y, x));
plot(extX, extY, 'r*', infX, infY, 'bo');
hold off;
title('plot of sinc(x) and other functions');
xlabel 'x';
ylabel 'sinc(x), deriv, antideriv, extrema, inflec';
legend('sinc(x)', 'deriv', 'anti', 'extrema', 'inflect');

%% objectification
% (1) - equations for L and some other things were on 
% https://www.mathworks.com/help/matlab/visualize/creating-the-matlab-logo.html
% starts here
L = 160*membrane(1,100);
f = figure;
ax1 = subplot(1, 2, 1);
s = surface(L);
s.EdgeColor = 'none';
view(3)

ax.XLim = [1 201];
ax.YLim = [1 201];
ax.ZLim = [-53.4 160];

ax.CameraPosition = [-145.5 -229.7 283.6];
ax.CameraTarget = [77.4 60.2 63.9];
ax.CameraUpVector = [0 0 1];
ax.CameraViewAngle = 36.7;

ax.Position = [0 0 1 1];
ax.DataAspectRatio = [1 1 .9];

l1 = light;
l1.Position = [160 400 80];
l1.Style = 'local';
l1.Color = [0 0.8 0.8];


l2 = light;
l2.Position = [.5 -1 .4];
l2.Color = [0.8 0.8 0];

s.FaceColor = [0.9 0.2 0.2];

s.FaceLighting = 'gouraud';
s.AmbientStrength = 0.3;
s.DiffuseStrength = 0.6; 
s.BackFaceLighting = 'lit';

s.SpecularStrength = 1;
s.SpecularColorReflectance = 1;
s.SpecularExponent = 7;

axis off
f.Color = 'black';
% ends here

% (2) and (3) 
N = 160*membrane(4, 23);
ax2 = subplot(1, 2, 2);
u = surface(N);
u.EdgeColor = 'none';
view(3)

ax.XLim = [1 201];
ax.YLim = [1 201];
ax.ZLim = [-53.4 160];

ax.CameraPosition = [-145.5 -229.7 283.6];
ax.CameraTarget = [77.4 60.2 63.9];
ax.CameraUpVector = [0 0 1];
ax.CameraViewAngle = 90;

ax.Position = [0 0 1 1];
ax.DataAspectRatio = [1 1 0.9];

n1 = light;
n1.Position = [90 300 200];
n1.Style = 'local';
n1.Color = [0.5 0.1 0.3];

n2 = light;
n2.Position = [0.5 -1 4]; 
n2.Color = [0.2 0.7 0.7]; 

u.FaceColor = [0.3 0.6 0.6];

u.FaceLighting = 'gouraud';
u.BackFaceLighting = 'unlit';
u.AmbientStrength = 0.1;
u.DiffuseStrength = 0.6;


u.SpecularStrength = 1;
u.SpecularExponent = 10;
u.SpecularColorReflectance = 0.7;


axis off

% (4) - from mathworks
get(u);
u.MeshStyle = 'row';
u.EdgeColor = 'flat';
u.LineStyle = '-.';

% i used get for my "changed" surface, u. originally, surface u was a 
% lot darker/smoother, and "edgecolor" snd now it seems more like it came out a mesh or
% surf function. I think mesh style stretched it out a bit. 
% Line style seems like it somehow made it brighter? Or
% perhaps the texture made it seem brighter. lastly,line style created the mesh grid.  



