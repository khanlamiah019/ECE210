%% functions for my sinc is broken 
% Lamiah Khan February 17,2024
% (1) 

function [diffEq] = deriv(y, x)
    diffEq = [diff(y)./diff(x), NaN];
end