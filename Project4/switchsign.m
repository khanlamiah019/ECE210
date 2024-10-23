%% functions for my sinc is broken 
% Lamiah Khan February 17,2024
% (2) 

function [diffSign] = switchsign(x)
    xSign = sign(x);
    signChange = [false, diff(xSign) ~= 0];
    diffSign = logical(signChange);
end
		% mostly works here (and nicely done), but technically has an
		% error: calling `switchsign([-1 2 1 0 1 -3])` (the example i
		% gave) returns `[0 1 0 1 1 1]` rather than `[0 1 0 0 0 1]`.
		% not that that really matters.
