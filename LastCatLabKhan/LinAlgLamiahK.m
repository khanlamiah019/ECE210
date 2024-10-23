%%% CATLAB Last 
% Lamiah Khan, 04/07/2024
close all; clear; clc;

%% Linear Algebra - Shooting the Schmidt
%(4)
% a
% Number of vectors
numVector = 3; 
% Number of elements in each vector
vecLength = 5; 
% generating random complex vectors
A1 = rand(vecLength, numVector) + rand(vecLength, numVector)*1i;

% running the gram_schmidt function
[Q1, proj_func1] = gram_schmidt(A1);
disp("Orthonormal set of vectors (a):");
disp(Q1);

% running is_orthonormal function
if is_orthonormal(Q1)
    disp("The matrix Q is orthonormal (a).");
else
    disp("The matrix Q is not orthonormal (a).");
end

% running ortho_proj function
estimate1 = rand(vecLength, 1) + rand(vecLength, 1)*1i; 
vector1 = ortho_proj(estimate1, Q1);
disp("Estimated vector (a):");
disp(vector1);

% Euclidean distance between the vectors and projs.
error1 = norm(estimate1 - vector1);
disp("euclidean distance for a: " + error1);

% b
numVector = 3; 
vecLength = numVector; 
A2 = rand(vecLength, numVector) + rand(vecLength, numVector)*1i;

% running gram_schmidt 
[Q2, proj_func2] = gram_schmidt(A2);
disp("Orthonormal set of vectors (b):");
disp(Q2);

% running is_orthonormal 
if is_orthonormal(Q2)
    disp("The matrix Q is orthonormal (b).");
else
    disp("The matrix Q is not orthonormal (b).");
end

% running ortho_proj 
estimate2 = rand(vecLength, 1) + rand(vecLength, 1)*1i; % Vector to be estimated
vector2 = ortho_proj(estimate2, Q2);
disp("Estimated vector (b):");
disp(vector2);

% Euclidean distance between the vectors and projs.
error2 = norm(estimate2 - vector2);
disp("Euclidean distance for b: " + error2);

% c
numVector = 5; 
vecLength = 3; 
A3 = rand(vecLength, numVector) + rand(vecLength, numVector)*1i;

% running gram_schmidt 
[Q3, proj_func3] = gram_schmidt(A3);
disp("Orthonormal set of vectors (c):");
disp(Q3);

% running is_orthonormal 
if is_orthonormal(Q3)
    disp("The matrix Q is orthonormal (c).");
else
    disp("The matrix Q is not orthonormal (c).");
end

% running ortho_proj 
estimate3 = rand(vecLength, 1) + rand(vecLength, 1)*1i; % Vector to be estimated
vector3 = ortho_proj(estimate3, Q3);
disp("Estimated vector (c):");
disp(vector3);

% Euclidean distance between the vectors and projs.
error3 = norm(estimate3 - vector3);
disp("Euclidean distance for c: " + error3);

% question: in terms of comparing the euclidean distance between case a-c, 
% it seems (b) has the lowest error, while (c) has the greatest
% error. 

%% Re-Gauss, Re-Gauss
%(1)
x = linspace(0, 2*pi, 1000);
origSignal = sin(x);
range = [0, pi/2, pi, 3*pi/2, 2*pi];
sigma = 1;
gausSig = zeros(length(x), length(range));
for i = 1:length(range)
   r = range(i);
   gausSig(:, i) = 1/(sqrt(2*pi*sigma)) * exp(-((x-r).^2) / (2*sigma^2));
end

%(2) I am getting errors in this part, but i can't fix it for the life of
%me. If i still need points, then ill probably resubmit this part! 
[Q, ~] = gram_schmidt(gausSig');
estimated_signal = ortho_proj(origSignal, Q');

% this part is currently not always working
subplot(2, 1, 1);
plot(x, origSignal, 'b', 'LineWidth', 2);
hold on;
plot(x, estimated_signal, 'r', 'LineWidth', 2);
xlabel('x');
ylabel('Amplitude');
title('Original Sinusoid vs. Estimated Sinusoid');
legend('Original Sinusoid', 'Estimated Sinusoid');

subplot(2, 1, 2);
plot(x, Q, 'LineWidth', 1.5);
xlabel('x');
ylabel('Amplitude');
title('Orthonormal Basis Functions');
legend('Gaussian Basis 1', 'Gaussian Basis 2', 'Gaussian Basis 3', 'Gaussian Basis 4', 'Gaussian Basis 5');
