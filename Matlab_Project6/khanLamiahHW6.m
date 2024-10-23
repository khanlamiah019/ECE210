%%% CATLAB HW6
% Lamiah Khan, 03/26/2024

close all; clear; clc;

%% Filters 
% defining variables fs
fs = 44.1e3;

% (1) - make Butterworth Filter!
% cite: https://www.mathworks.com/help/dsp/ref/fdesign.bandpass.html
bandpassSpecs = fdesign.bandpass('Fst1,Fp1,Fp2,Fst2,Ast1,Ap,Ast2', fs/7, fs/6, fs/3, fs/2.5, 50, 1, 50, fs);
Butterworth = design(bandpassSpecs, 'butter');

% (2) 
% The Elliptic, chebyshev type I, and cheby type II filters were made using
% filterDesigner, with var names  "Elliptic", "ChebyI", and "ChebyII" respectively
fvt = fvtool(Butterworth, Elliptic, ChebyI, ChebyII);
legend(fvt, 'Butterworth', 'Elliptic', 'Chebyshev Type I', 'Chebyshev Type II');

% (3)
% 2 sec of Gaussian white noise
t = 0:1/fs:2;   

% # of samples and freq. vector
noise = randn(size(t)); 
x = length(t);
freq = (0:x-1) * fs/x;

% defining filter noises for each one. 
filterNoise1 = filter(Butterworth, noise);
filterNoise2 = filter(Elliptic, noise);
filterNoise3 = filter(ChebyI, noise);
filterNoise4 = filter(ChebyII, noise);


% (4) citation: https://www.mathworks.com/help/matlab/ref/fft.html
% from the mathworks tutorial, the figures make sense! 
noise1FFT = fft(filterNoise1);
noise1FFT = fftshift(abs(noise1FFT))/x;
figure;
plot(freq, filterNoise1);
title('Fourier Transform - Filtered Noise (Butterworth)');
xlabel('Hz');
ylabel('Magnitude');

% Elliptic
noise2FFT = fft(filterNoise2);
noise2FFT = fftshift(abs(noise2FFT))/x;
figure;
plot(freq, filterNoise2);
title('Fourier Transform - Filtered Noise (Elliptic)');
xlabel('Hz');
ylabel('Magnitude');

% Chebyshev Type I 
noise3FFT = fft(filterNoise3);
noise3FFT = fftshift(abs(noise3FFT))/x;
figure;
plot(freq, filterNoise3);
title('Fourier Transform - Filtered Noise (Cheby.Type I)');
xlabel('Hz');
ylabel('Magnitude');

% Chebyshev Type II Filter
noise4FFT = fft(filterNoise4);
noise4FFT = fftshift(abs(noise4FFT))/x;
figure;
plot(freq, filterNoise4);
title('Fourier Transform - Filtered Noise (Cheby. Type II)');
xlabel('Hz');
ylabel('Magnitude');

% (5) how do the filters sound like? 
% all the sounds sound kinda more like white noise, rather than actual
% music. i also just commented them out because they dont sound as clean
% when run at the same time as the plots. i preferred just running them all
% individually! 

% unfiltered sound
% soundsc(noise, fs); % sound: medium pitch, very static. 

% filtered sound 
% soundsc(filterNoise1); 
% sound: higher pitch than unfiltered, lot longer, however the static
% amplitude sounds like it changes throughout the playback. 

% soundsc(filterNoise2); 
% sound: lower pitch than filterNoise1 and unfiltered noise, kinda sounds
% like haunted wind. 

% soundsc(filterNoise3); 
% sound: even lower pitch than filterNoise1, filterNoise2, and unfiltered
% noise. Very creepy, haunted house asmr. 

% soundsc(filterNoise4); 
% sound: high-pitched, literally sounds like crickets. 

% quantatively, the fact that there is a pitch difference and audio
% difference might point to the idea of signal to noise ratio (SNR), which
% can be calculated by computing the energy of the original and filtered
% signals. Then, we can compute the SNR in dB. I actually calculated these
% values out of curiousity, and it seems like the higher the SNR is, the
% "better" the sound quality of the signal sounds. we can also say the
% changes the filter made can correspond to the actual cut-off frequencies
% or order of the filter (which we kinda touched on when making our
% theremins!)

% qualitatively, the filter seems to have almost "smoothed" out the
% unfiltered noise. It seems like less insanely static, and more like there
% is some kind of pitch to it. this might just be the filter taking some of
% the high frequency noise. 
