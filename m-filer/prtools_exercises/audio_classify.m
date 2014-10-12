[sig_A,fs] = audioread('../testfiles/A_mid.wav');
[sig_D,fs] = audioread('../testfiles/D_mid.wav');

[f,fftA] = smc_fft(sig_A, fs);
[f,fftD] = smc_fft(sig_D, fs);
sig_AD(:,1) = sig_A;%fftA';
sig_AD(:,2) = sig_D;%fftD';
clf; scatterd(sig_AD); hold on; 
for class=1:2
    w_AD = gaussm(sig_AD,class,1);
    plotm(w_AD,6)
end

figure
fftAD(:,1) = fftA';
fftAD(:,2) = fftD';
clf; scatterd(fftAD); hold on; 
for class=1:2
    w_AD = qdc(fftAD);
    plotm(w_AD,6)
end
