%%% CATLAB HW5
% Lamiah Khan, 03/10/2024
% used mathworks for a lot of this stuff! mostly on the air and under the
% sea. 

%%% ALL UPDATED STUFF SAYS "UPDATE" 
close all; clear; clc;

%% On the Air
% (1)
[x1, y1] = meshgrid(-9:1:9, 1i*(9:-1:-9));
coordinates = x1 + y1;

% (2)
% the old stuff 
%[t, n] = meshgrid((1:50), linspace(0, 1, 10000));
%tPower = t .^ n; 
%integral_values = trapz((1:50), sin(tPower), 2);
		% <-.05> we're integrating dt, not dn, so you'd need to sum
		% over the increasing t dimension (in this case, dimension 1 --
		% check `size(tPower)` to see). you should wind up with 50
		% integral estimates, one for each n value.

% UPDATE:
t = linspace(0, 1, 10000);
[T, n] = meshgrid(t, 1:50);
trapSum = trapz(t, sin(T.^n), 2);

% (3) - Part 1
[theta, phi] = meshgrid(linspace(0, 2*pi, 5), linspace(0, pi, 5));

% (3) - Part 2 - https://www.mathworks.com/help/matlab/ref/pbaspect.html
		% <+.01> nice! thanks for the reference.
[x, y, z] = sph2cart(theta, pi/2 - phi, ones(size(phi)));
figure;
surf(x, y, z);
pbaspect([1 1 1]); 
title('Plot of Sphere');
xlabel('x');
ylabel('y');
zlabel('z');

%% Under the Sea (dalin iz betta down where iz weyter take it from meeeeh)
		% <+.01> lol
% (1) - https://www.mathworks.com/matlabcentral/answers/369397-what-does-idx-mean-in-matlab
%J = sin(linspace(0,5,100) .* linspace(-5,0,100).'); 
%[~, idx] = min(abs(J - 1/2)); 
		% <-.07> two things:
		%   1. `min` only works along one dimension by default; you'll
		%   have to call it twice or pass an extra argument (or do some
		%   other trick) to get it to operate along two dimensions.
		%   2. probably more efficient to reuse calculations done in
		%   above steps here, if you can.
%[row, col] = find(abs(J - 1/2) == min(abs(J - 1/2))); 

% UPDATE: 
val = sin(linspace(0, 5, 100) .* linspace(-5, 0, 100).');
[~, idx] = min(abs(val(:) - 0.5));
estimates = val(idx);

% (2) - dont know if i plotted it right but oh well
[x2, y2] = meshgrid(linspace(-2, 2, 100), linspace(-2, 2, 100));
z1 = exp(-(1-x2.*y2).^2); 
z2 = 1/4*sqrt(x2.^2 + y2.^2); 
volume = z1 > z2;
[rows, cols] = find(volume);
		% <-.07> yes, but what *is* the volume as a number? you're
		% basically estimating a 2D integral.
figure;
scatter3(x2(volume), y2(volume), z1(volume), 'b*');
title('Plot of Volume');
xlabel('x');
ylabel('y');
zlabel('z');
		% <+.02> that's about half of the plot, so a few points. doing
		% it as a surface (if you can) might be better.


%% I Need a Vacation - me too. 
% (1) - iff so i used for loops
		% <-.24> (ongoing) i did specifically say *not* to use `for`
		% loops, and meant it here. these are not too difficult to
		% vectorize, and basically wind up being one-liners each if you
		% do so. i'd say resubmit with vectorization -- contact me if
		% you'd like to talk about how!

		% one other note: you're one of the the few people who got the
		% i/j order right for matrices, so well done.

% UPDATE: 
[j, i] = meshgrid(1:1:256, 1:1:256);
A = sqrt((i-99).^2 + (j-99).^2) < 29;
figure();
imshow(A);
title('Plot of Matrix A');


% UPDATE: 
% (2)
B = sqrt((i-62).^2 + (j-62).^2) < 58;
figure();
imshow(B);
title('Plot of Matrix B');

% UPDATE: 
% (3)
C = (i - 4.*sin(j/10)) > 200;
figure();
imshow(C);
title('Plot of Matrix C');

% UPDATE: 
% (4)
S = rand(256,256,3);
S(:,:,1:2) = false;
figure();
imshow(S);
title('Plot of Matrix S');

% UPDATE: 
% (5)
% creates matrix M, which shows the intersection of A and B complement.
M = A & ~B;
figure();
imshow(M);
title('Plot of Matrix M');

% UPDATE: 
% (6)
% creates matrix Z with elementwise multiplication of C and S.
% then introduces addition with matrix M from (5)
Z = (C.*S) + M;
figure();
imshow(Z);
title('Plot of Matrix Z');


%% I need a vacation: the old stuff 

% creates matrix A, and initializes with vals of 0. 
%A = false(256); 
%for i = 1:256
    % goes through elements in row i and column j
    %for j = 1:256 
        % if conditions are met, index vals are changed to 1. 
        %if sqrt((i-99)^2 + (j-99)^2) < 29 
            %A(i, j) = true;
        %end
   % end
%end
%figure;
%imshow(A);
%title('Plot of Matrix A');

% (2) 
% Same: creates matrix B and initiliazes with values '0'.
%B = false(256);
%for i = 1:256
  %runs through the array and if conditions are met, it changes index to 1.
    %for j = 1:256 
       % if sqrt((i-62)^2 + (j-62)^2) < 58 
            %B(i, j) = true; 
       % end
  %  end
%figure;
%imshow(B);
%title('Plot of Matrix B');

% (3) - similar steps here from (1) and (2)
%C = false(256); 
%for i = 1:256
   % for j = 1:256 
        %if i - 4*sin(j/10) > 200 
          %C(i, j) = true; 
       % end
  %  end
%end
%figure;
%imshow(C);
%title('Plot of Matrix C');

% (4)
% creates matrix 
%S = rand(256, 256, 3); 
 % 2 lower "layers" of S is zeroed out 
%S(:,:,1:2) = 0;
%figure;
%imshow(S);
%title('Plot of Matrix S');

% (5)
% creates matrix M, which shows the intersection of A and B complement.
%M = A & ~B; 
%figure;
%imshow(M);
%title('Plot of Matrix M');

% (6)
% creates matrix Z with elementwise multiplication of C and S.
% then introduces addition with matrix M from (5)
%Z = (C .* S) + M;  
%figure;
%imshow(Z);
%title('Plot of Matrix Z');

