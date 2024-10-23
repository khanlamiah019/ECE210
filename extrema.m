%% functions for my sinc is broken 
% Lamiah Khan February 17,2024
% (3) 

function [extX, extY] = extrema(y, x)
    dydx = deriv(y, x);
    switchVal1 = switchsign(dydx);
    extX = x(switchVal1);
    extY = y(switchVal1);
end
