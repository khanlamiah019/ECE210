%% functions for my sinc is broken 
% Lamiah Khan February 17,2024
% (1) 

function [diffEq] = deriv(y, x)
    diffEq = [diff(y)./diff(x), NaN];
		% <-.03> padding with NaN is probably a really bad idea!
		% that'll propagate into other calculations and screw up the
		% rest of the code. 0 or a duplicate value is a much better
		% choice.
end
