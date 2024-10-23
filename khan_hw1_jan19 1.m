
%%%%MATLAB HW1
%% Lamiah Khan, January 19, 2024

% (1)ScalerErs
a = abs(sin(pi/3) + 1j/sec(-5 * pi/3)) %ans=1
l = 8 ^(1/3) %ans=2
u = (2/factorial(6) * sum(1:80)) ^(1/2)  %ans=3
m = (imag(floor(log(sqrt(66)^(7j)))))^ (2)  %ans=4

% (2)Mother
A = [a; l; u; m;]
F = [a l;u m;]
T = transpose(F)
B = inv(T*F)
B * (T*F);
C = [T F;F T;]

% (3) Cruelty
mean(B,"all")
mean(C,2)
V = mean(C,2)
%%just using V as a variable to store the matrix 

% (4) oddTypes
% T+F worked out fine, adding each element in T by the corresponding
% element in F.
%the others sucked tho! For T+1, each corressponding element was added by
%1, even though you cannot add a scalar in a matrix. 
%For C+A, each column element in C was added by a weird transpose pattern
%in A (column by column). 
T + F
T + 1
C + A

% (5)notWhatItSeems
k = 3
G1 = linspace(0,1,k)
B1= G1.^2
sum(B1,"all")/k
%%ans1 = 0.4167

k=5 
G2 = linspace(0,1,k)
B2= G2.^2
sum(B2,"all")/k
%%ans2 = 0.3750

k= 10
G3 = linspace(0,1,k)
B3= G3.^2
sum(B3,"all")/k
%%ans3 = 0.3519

k = 300
G4 = linspace(0,1,k)
B4= G4.^2
sum(B4,"all")/k
%%ans4 = 0.3339

k= 1e6
G5 = linspace(0,1,k)
B5= G5.^2
sum(B5,"all")/k
%%ans5 = 0.3333

%%the value its approaching is approximately 1/3. you can predict this
%%because you were basically finding the final value by approximating the
%%integral of the x^2, with bounds 0 to 1. This is riemann sums! and the
%%integral will evaluate to 1/3. 