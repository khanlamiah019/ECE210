%%% CATLAB Last 
% Lamiah Khan, 04/07/2024
%(1)
function [Q, proj_func] = gram_schmidt(A)
  [m, n] = size(A); 
   Q = zeros(m, n); 
% Gram-Schmidt process - never said we couldnt use for loops! 
% citation: jacob's matlab section had to do a gram schmidt assignment, and
% this part was a little inspired by one of their posted functions on
% github. I'd link it but i cant find the link. 
 for j = 1:n
 v = A(:, j); % selecting the j-th column vector
  for i = 1:j-1
  v = v - (dot(Q(:, i), A(:, j)) / norm(Q(:, i))^2) * Q(:, i);
   end
   if norm(v) > eps
    Q(:, j) = v / norm(v); % Normalizing
   end
end
% removing zero columns (or it gives weird results)
    Q = Q(:, any(Q));
    
% small rewrite for part (3): orthogonal projection function! 
    proj_func = @(x) Q * (Q' * x);
end
