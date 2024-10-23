
%% MATLAB-Homework #2
% Lamiah Khan,January 28,2024

		% <-.02> please submit a file with a name MATLAB likes (sorry);
		% this one had a space in it.
%oops did that again in assig 3 but fixed it here! - lamiah
clc; clear; close all;

%% Spatial Awareness
% Part (1)
% created a matrix A and then transposed in order to get it to the same
% format as listed in assignment.
A = reshape(0:63,[8,8]).'; 
		% <-.02> usually it's considered bad style to reassign to a
		% variable in a way that changes its size/meaning drastically,
		% as you do here. makes it harder to reason about code, you
		% know.
        % fixed! - lamiah
B = repmat(2,8,8).^A;

% Part (2) reshape in matrix v, and then store all the prime numbers in the
% variable primeNum
v = reshape(B,1,[]);
primeNum = v(primes(length(v)));
		% <-.03> not what i meant -- there's only one prime *in* v, as
		% v consists of powers of 2. should be something like:
		% vPrimes = v(primes(length(v)));
        % fixed!

% Part (3)meanPrimNum takes the geometric mean of the prime number set
meanPrimNum = nthroot(prod(primeNum, 'all'), numel(primeNum));

% Part (4) Flip row 1 from end to end, and then delete cloumn 1 in part 5. 
A(1,:) = fliplr(A(1,:));

% Part (5)
A(:,1) = [];

%% Smallest Addition

% P(1)
t = linspace(0, 6.66);
expTRes = exp(-t.^2);

% P(2) Apprx Deriv take derivarive of equation outpEq. Find the mean
% squared error and dore it in outData. Print the results in fprintf. 
outp = diff(expTRes)./diff(t);
outpEq = -2.*exp(-t.^2).*t;
outData = mean((outp - outpEq(1:end-1)).^2);

fprintf('Derivative of expTResults at %g: %g\n',t,outp);
fprintf('Actual Derivative of expTResults at %g: %g\n',t,outpEq);

% P(3) with graph. Similarly in this section, approximate derivative using
% rieman sums (stored in riemTrap). Similar process is stored in reimError,
% riemTrap,etc.) Output the functions in a corresponding output variable,
% and then print plot. 
tDiff = diff(t);
dt = tDiff(1);
riemSum = cumsum(expTRes)*dt;
riemTrap = cumtrapz(expTRes)*dt;
reimError = (erf(t))/(sqrt(pi)/2);
outRieSum = mean((riemSum - reimError).^2);
outRieTrap = mean((riemTrap - reimError).^2);
		% <-.03> `erf` includes an extra factor of 2/root-pi which you
		% didn't account for here.
        % fixed...i think? - lamiah
        
figure();
title('Error, Riemann Sums, and Trapezoidal Sums');
plot(t, reimError, t, riemSum, t, riemTrap);
xlabel('t');
ylabel('Integral Functions');
legend('Error', 'RiemSum', 'RiemTrap');

% According to the results, the cumulative sum is better than the
% trapezoidal sum because cumtraps produced a smaller error. As shown by
% the figure, the red curve levels close to 0.92, which is closest to 1
% than the other curves (yellow is around 0.88-0.89). 
