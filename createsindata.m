% generating a sine wave
close all; clear all;
fs = 5; %frequency sampling
Amp = 1; %amplitude set to 1
t = 0:1/fs:2*pi; % time vector 1 to 2pi with intervals of 1/fs
sine_wave = Amp*sin(t); %generate the sin wave
figure(); %plot wave
plot(t, sine_wave);
xlabel('\bf Time');
ylabel('\bf Amplitude');
title('\bf Sine wave');

% obtain the current time
current_time = now(); % Get current time in days

% scale and convert to integer
% multiplying by 1e6 and taking the remainder with 2^32 keeps the seed in range
time_seed = mod(fix(current_time * 1e6), 2^32);

% check if the seed is non-negative and within range
if time_seed < 0 || time_seed >= 2^32
    error('Seed must be a non-negative integer less than 2^32.');
end

% set the random number generator with the valid seed
rng(time_seed); % initialize RNG with time-based seed
% set the random number generator with the seed

% add noise
a = 0.8; % upper limit
b = 0; % lower limit
noise = (b-a).*rand(length(sine_wave),1) + a; noise = noise'; %adds the noise
sine_noise = (sine_wave + noise);
sine_norm = sine_noise / max(abs(sine_noise));
figure();plot(1:length(sine_norm), sine_norm);
xlabel('\bf Time');
ylabel('\bf Amplitude');
title('\bf Sine wave + Noise');

% Convert from real to integers
total_wordlength = 16; % 8 bits
scaling = 7; %scaling factor
sine_noise_integers = round(sine_norm.*(2^scaling)); %converts normalized signal into scaled int by mult by 2^7
figure();plot(1:length(sine_noise_integers), sine_noise_integers); %plots scaled int representation 
xlabel('\bf Time');
ylabel('\bf Amplitude');
title('\bf Sine wave + Noise : Scaled Signal');

% Convert from integers to binary
sine_noise_in_binary_signed = dec2bin(mod((sine_noise_integers),2^total_wordlength),total_wordlength); %converts to binary for vivado
yy = cellstr(sine_noise_in_binary_signed); %create cell array of strings
fid = fopen('noisy.data', 'wt'); %write to a data file for vivado
fprintf(fid, '%8s \n', yy{:}); %write 16 bits each line then newline
disp('data file for noisy is finished'); %output done