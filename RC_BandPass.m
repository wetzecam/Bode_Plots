% Bode Plot set 3dB freq Low Pass
close all

%% These variables choose the 3dB frequency
    C1 = 10*10^(-9);    % 10nF
    R1 = 1*10^(3);      % 1kOhm
    C2 = 10*10^(-12);   % 10pF
    R2 = 1*10^(3);      % 1kOhm

%% These 2 commands change the Bode plot settings
    opts = bodeoptions('cstprefs');
    opts.FreqUnits = 'Hz';
    
%% Create the Transfer Function = (Output)/(Input)
%       described with the laplace transform
s = tf('s');
XC1 = 1/(s*C1);     % Capacitor 1 Reactance [Ohms]
XC2 = 1/(s*C2);     % Capacitor 2 Reactance [Ohms]

% Band Pass Filter (BPF)
Zeq1 = R1*(R2+XC2)/(R1+R2+XC2);     % Node 1 Load Impedance
TF1 = Zeq1/(XC1+Zeq1);              % 
TF2 = XC2/(XC2+R2);                 % 

TF = TF1*TF2;

%%
bode(TF,opts)
title('RC Band Pass Filter')
grid on
