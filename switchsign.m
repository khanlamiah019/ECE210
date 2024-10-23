%% functions for my sinc is broken 
% Lamiah Khan February 17,2024
% (2) 

function [diffSign] = switchsign(x)
    xSign = sign(x);
    signChange = [false, diff(xSign) ~= 0];
    diffSign = logical(signChange);
end