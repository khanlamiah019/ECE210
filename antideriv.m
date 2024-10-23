%% functions for my sinc is broken 
% Lamiah Khan February 17,2024
% (1) 

function [diffEq] = antideriv(y, x)
    dff = diff(x);
    dfdf = dff(1);
    diffEq = cumtrapz(y)*dfdf; 
end