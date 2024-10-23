%% functions for my sinc is broken 
% Lamiah Khan February 17,2024
% (3) 

function [infX, infY] = inflection(y, x)
    dydx = deriv(y, x);
    d2ydx2 = deriv(dydx, x);
    switchVal = switchsign(d2ydx2);
    infX = x(switchVal);
    infY = y(switchVal);
end