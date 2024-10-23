%% MATLAB - Homework #3
% Lamiah Khan , February 9, 2024

%% note: for loops and hold functions were stuff I saw on Mathworks that looked helpful! 
clc; clear; close all;

%% Two Dimensions
% Part (1)
x = linspace(0,2*pi,50);
y1 = sin(x);
plot(x,y1, "g");
xlabel("x");
ylabel("sin(x)");
title("Plot of the Sine Function");

% Part (2)
hold on;
y2 = cos(x);
plot(x,y2);
legend('Sinx', 'Cosx');
ylim([-1 1]);
xlim([0 2*pi]);
xticks([0 0.5*pi pi 1.5*pi 2*pi]);
xticklabels({'0','π/2','π','3π/2','2π'});
title("catherine, are you proud of your sin?");
hold off; 

% Part (3)-(1)subplots
    for k = 1
        subplot(1,2,k);
        stem(y1);
        xlabel("x");
        ylabel("sin(x)");
        title("Plot of the Sine Function");
        subplot(k,2,2);
        stem(y2,"r");
        xlabel("x");
        ylabel("cos(x)");
        title("Plot of the Cos Function");
    end

% Part (3)-(2)random-amplitude for cos
for k = 1
        subplot(1,2,k);
        stem(y1);
        xlabel("x");
        ylabel("sin(x)");
        title("Plot of the Sine Function");
        subplot(k,2,2);
        stem(y2*rand(1),"r");
        xlabel("x");
        ylabel("cos(x)");
        title("Plot of the Cos Function");
end

% Part (3)-(3)amplitude ratio
for k = 1
    subplot(1,2,k);
    stem(y1);
    xlabel("x");
    ylabel("sin(x)");
    title("Plot of the Sine Function");
    subplot(k,2,2);
    g2 = y2*rand(1);
    stem(g2,"r");
    xlabel("x");
    ylabel("cos(x)");
    X = fft(y1);
    Y = fft(g2);
    [mag_x] = max(abs(X));
    [mag_y] = max(abs(Y));
    amplitude_ratio = mag_y/mag_x;
    dB = mag2db(abs(amplitude_ratio));
    TIT = sprintf('Plot for Cosine, Amp. Ratio = %d',dB);
    title(TIT);
    grid on;
end

% Part (4) - Cat Image 
clc; clear; 
catImg = imread("cat.jpg");
imshow(catImg);

% Part (5) - resize code: https://www.mathworks.com/help/images/resize-an-image.html#
whos catImg;
catImg_g = rgb2gray(catImg);
changeIm = imresize(catImg_g,[500 500]);
imshowpair(catImg,changeIm,method="montage");

%% Three Dimensions
clc; clear;
% Part (1) - surf
subplot(2,2,1)
N = 20;
x = linspace(0,1,N);
y = linspace(0,1,N);
[X,Y] = meshgrid(x,y);
Z = exp(-X.^2-Y.^2);
surf(X,Y,Z);
title("Surf: Z = exp(-x^2-y^2)");
xlabel("x");
ylabel("y");
zlabel("z");
grid on;

% Part (1) - plot3
subplot(2,2,2)
N = 60 ;
x = linspace(0,1,N) ;
y = linspace(0,1,N) ;
[X,Y] = meshgrid(x,y) ;
plot3(X, Y, exp(-X.^2-Y.^2));
title("Plot3: Z = exp(-x^2-y^2)");
xlabel("x");
ylabel("y");
zlabel("z");
grid on;

% Part (1) - scatter3
subplot(2,2,3)
 N = 20 ;
x = linspace(0,1,N) ;
y = linspace(0,1,N) ;
[X,Y] = meshgrid(x,y) ;
scatter3(X, Y, exp(-X.^2-Y.^2));
title("scatter3: Z = exp(-x^2-y^2)");
xlabel("x");
ylabel("y");
zlabel("z");
grid on;

% Part (1) - mesh
 subplot(2,2,4);
 N = 50 ;
x = linspace(0,1,N) ;
y = linspace(0,1,N) ;
[X,Y] = meshgrid(x,y) ;
mesh(X, Y, exp(-X.^2-Y.^2));
title("Mesh: Z = exp(-x^2-y^2)");
xlabel("x");
ylabel("y");
zlabel("z");
grid on;

% Part (2) - cone
clc; clear;
t = 0:0.001:1;
x = t.*cos(27*t);
y = t.*sin(27*t);
z = t;
plot3(x,y,z);

xlabel("tcos(27t)");
ylabel("tsin(27t)");
zlabel("t");
title("Conical Helix");
daspect([1 1 1]);
view([-80,30,35]);
grid on;

%% here are some bonus titles i came up with 
% why? cos i can
% check your cotan shoes
% takes two to TANgo
% sorry, i went off on a tangent for a min. 
% your sin was that it took me too long to do this. 

