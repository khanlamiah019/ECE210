%%% CATLAB Last 
% Lamiah Khan, 04/07/2024
%(2) eps function kept giving me errors so i just set a small threshold
%value for epsilon. 
function result = is_orthonormal(A)
% Set a small threshold value
    epsilon = 1e-10;
    % need to know size of A
    [m, n] = size(A); 
 % is the matrix mxn, where m=n?
 if m ~= n
    result = false;
    return;
 end 
% orthogonality 
for i = 1:n
 for j = i+1:n
 if abs(dot(A(:, i), A(:, j))) > epsilon
    result = false;
    return;
  end
  end
end
%  normalization
for i = 1:n
    if abs(norm(A(:, i)) - 1) > epsilon
    result = false;
    return;
    end
end   
% if all for loops are true (aka result is 1, then the matrix 
 % is orthonormal. 
  result = true;
end
