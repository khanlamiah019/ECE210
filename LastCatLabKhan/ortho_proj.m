%%% CATLAB Last 
% Lamiah Khan, 04/07/2024
%(3)
function projected_vector = ortho_proj(x, Q)
    projected_vector = Q * (Q' * x);
end
