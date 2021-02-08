% Bode Plot set 3dB freq Low Pass


%% These variables choose the 3dB frequency
    fcorner = 10.0;
    wcorner = 2*pi*fcorner;

%% These 2 commands change the Bode plot settings
    opts = bodeoptions('cstprefs');
    opts.FreqUnits = 'Hz';
    
%% Create the Transfer Function = (Output)/(Input)
%       described with the laplace transform
s = tf('s')
LowPass = 1/(1 + s/wcorner);


%%
bode(LowPass)
title('Simple Low Pass Bode Plot')
grid on
