function Hd = ChebyII
%CHEBYII Returns a discrete-time filter object.

% MATLAB Code
% Generated by MATLAB(R) 23.2 and Signal Processing Toolbox 23.2.
% Generated on: 26-Mar-2024 18:07:42

% Chebyshev Type II Highpass filter designed using FDESIGN.HIGHPASS.

% sampling freq (Hz)
fs = 44100; 

% passband freq (Hz)
Fpass = 14700;  

% stopband freq (Hz)
Fstop = 11025; 


% passband ripple (dB)
Apass = 5;        
match = 'stopband';  

% % stopband attenuation (dB)
Astop = 40;          

h  = fdesign.highpass(Fstop, Fpass, Astop, Apass, fs);
Hd = design(h, 'cheby2', 'MatchExactly', match);

% [EOF]