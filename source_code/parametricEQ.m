% G0     : is the reference gain.     Typical unity gain for cascaded filters.
% G      : Gain at w0
% deltaw : Bandwidth at level GB
% GB     : Gain at bandwidth level. It lies between G0 and G and is specified from these.
%
%   The levels are chosen as:   
%                               BOOST:                      CUT:         
%                                       G0^2 < GB^2 < G^2       G^2 < GB^2 < G0^2
%
%   Therefore, a good choice is: GB^2 = G*G0 (geometric mean of dB values)
%                            or: GB^2 = (g0^2+G^2)/(2)
% --------------------------------------------------------------------------
%       Filter specification parameters: {G0,G,GB,w0,deltaw}
%----------------------------------------------------------------------------
%
% TODO: design a simple stable cut filter.
%       explore the best variable characteristic response by changing GB
%
%
clear all; close all; print = 0;
fs = 10e3;
fc = 1.75e3;
for gain = -20:20
Gboost = gain;
G0 = 1;
G = 10^(Gboost/20)*G0 
w0 = 2*pi*fc/fs
fwidth = 500; deltaw = 2*pi*fwidth/fs; % Q = w0/deltaw;

GB = (G+G0)/(2)

BETA = sqrt(( GB^2 - G0^2 )/( G^2  - GB^2  )) * tan((deltaw)/(2))
w0 = cos(w0)
    %% Coefficients for difference equation
    %            b0 - b1 z^-1 + b2 z^-2
    % H(z) = -------------------------------
    %            a0 - a1 z^-1 + a2 z^-2
    b0 = (G0+G*BETA)/(1+BETA)
    b1 = 2*(G0*w0)/(1+BETA)
    b2 = (G0-G*BETA)/(1+BETA)
    a0 = 1
    a1 = 2*(w0)/(1+BETA)
    a2 = (1-BETA)/(1+BETA)

%% Plotting
w=0:0.01:pi;z = exp(j.*w);
Ha= ( (G0 + G*BETA)/(1+BETA) - 2*(G0*w0)/(1+BETA)*z.^(-1) + (G0-G*BETA)/(1+BETA)*z.^(-2)  )./( 1 - 2*(w0)/(1+BETA).*z.^(-1) + (1-BETA)/(1+BETA).*z.^(-2)  );
% 
figure(1)
plot(w/pi,20*log10(abs(Ha))); hold on;
end
set(gcf,'Units', 'Normalized', 'OuterPosition', [0 0 1 1]); 
grid on; xlabel('\omega [\pi rad/sample]','fontsize', 16), ylabel('|H(e^{j\omega})|^2','fontsize', 16)
title('Parametric EQ','fontsize', 18);
if print == 1
    cleanfigure();
    fig2tikz(gcf,'1','EQ with Gain from -20dB to + 20dB','matlab_test_first_gain','/Users/OSX/Documents/UNI/P7/courses/sound_processing/eq');
 end
