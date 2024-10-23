%%% CATLAB Last 
% Lamiah Khan, 04/07/2024

close all; clear; clc;

%% Symbolic Manipulation - Cheating at Calculus 
% (1) - note to self: giving errors
syms y(x) g  
equation = diff(y,x) == y.^2*x.^3; 
ySol(x) = dsolve(equation);

% Test the numeric function with some values, mainly -1,0,1 
figure();
hold on;
grid on;
fplot(subs(ySol(x),g,-1));
fplot(subs(ySol(x),g,0));
fplot(subs(ySol(x),g,1));
hold off;
title 'Plot of Solution Curve';
legend('parameter -1', 'parameter 0', 'parameter 1');
xlabel 'x';
ylabel 'y';

%(2)
syms t s
h_t = 5*dirac(t) + heaviside(t) + exp(-t/2)*sin(3*t);
H_s = laplace(h_t, t, s);
disp('The Laplace transform of h(t) is:');
disp(H_s);
inverse = ilaplace(H_s, s, t);
disp('The inverse Laplace transform of H(s) is:');
disp(inverse);
% comment: MATLAB's answer seems pretty accurate, but it is in a different
% order. the output is also not exact, so it will not be in terms of sin,
% cos, or exponentials. 

%(3) i wasnt really sure how to do this one, but i tried. 
% small citation:used mathworks for some of this stuff. 
% Define the vector field F and the parameter a
aVal = linspace(-3, 1, 100); 
tVal = linspace(-pi, pi, 100); 

% Define the closed path r(t)
r_x = @(t) (1 - 2*cos(t)).*cos(3*t);
r_y = @(t) (1 - 2*cos(t)).*sin(3*t);
r_z = @(t) sin(t);

% Define the vector field F
% https://www.mathworks.com/matlabcentral/answers/54929-creating-a-vector-field
F_x = @(x, y, z, a) 3 + x*z*a^2;
F_y = @(x, y, z) z*exp(y);
F_z = @(x, y, z, a) exp(y) - x^2*exp(pi*a);

% Calculate the line integral for each value of a
lineInt = zeros(size(aVal));
for i = 1:length(aVal)
  a = aVal(i);
   intVal = 0;
  for j = 1:length(tVal)-1
     t1 = tVal(j);
     t2 = tVal(j+1);
 % Calculates r(t), F(r(t)), and dr
     r1 = [r_x(t1), r_y(t1), r_z(t1)];
     r2 = [r_x(t2), r_y(t2), r_z(t2)];
     F1 = [F_x(r1(1), r1(2), r1(3), a), F_y(r1(1), r1(2), r1(3)), F_z(r1(1), r1(2), r1(3), a)];
     F2 = [F_x(r2(1), r2(2), r2(3), a), F_y(r2(1), r2(2), r2(3)), F_z(r2(1), r2(2), r2(3), a)];
     dr = r2 - r1;
% Computes F(r(t)) dot dr?? i think this is what i had to do. 
  intVal = intVal + dot(F1, dr);
  end
 lineInt(i) = intVal;
end

% Plot the line integral as a function of a
% i tried to plot using fplot, but it kept giving me errors, so i opted for
%plot. maybe this happened because of the for loop, but it kept saying that
%it was behaving unexpectedly on array elements. 
plot(aVal, lineInt);
xlabel('Parameter a');
ylabel('Line Integral');
title('Line Integral of F along Closed Path vs. Parameter a');

% Bonus 
% To determine whether the vector field F is conservative, we can check if 
% its curl is zero. If the curl of F is zero, then F is conservative. I do
% not know if you actually want me to write code here, but basically i
% would calculate the curve of F and see what happens. 

%% It Ain't Magic 
%(1)
syms x y; 
fSym = 1 - x^2 - y^2;
% matlabFunction for numeric function
fNum = matlabFunction(fSym, 'Vars', {x, y});

%(2)
% Define symbolic function
syms x y;
fSym(x, y) = 1 - x^2 - y^2;

% a) integrate symbolically over the unit disk
tic;
intSymb = int(int(fSym*sqrt(1 - x^2 - y^2), y, -sqrt(1 - x^2), sqrt(1 - x^2)), x, -1, 1);
tSym = toc;
disp(['Symbolic Integration Result: ', char(intSymb)]);
disp(['Time taken for symbolic integration: ', num2str(tSym), ' seconds']);

% b) numerical approximation using trapz and a 100x100 grid
n = 100;
xVals = linspace(-1, 1, n);
yVals = linspace(-1, 1, n);
[X, Y] = meshgrid(xVals, yVals);
fVals = 1 - X.^2 - Y.^2;
tic;
intNum = trapz(yVals, trapz(xVals, fVals, 2));
tNums = toc;
disp(['Numerical Integration Result: ', num2str(intNum)]);
disp(['Time taken for numerical integration: ', num2str(tNums), ' seconds']);

% comparing answers: 
% the symbolic integration took about 8.5 seconds, while numerical
% integration took 0.04 seconds. hence, numerical integration performed the
% operation much faster. In terms of answers, symbolic integration gave an
% asnwer of approximately 1.257, whereas numerical inegration gave 1.3328.
%therefore, if you are trying to integrate, probably use numeric since its
%faster. 


