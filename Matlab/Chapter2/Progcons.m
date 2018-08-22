function [Attenuation,phase]=Progcons(e,frequency)
%attenuation and phase coefficients of a lossy or lossless medium over a specified frequency.
%e is complex permitivity,frequency is in Hz
%2018.8.22 in Matlab 2018a
%Chapter 2.4 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.
lambda=299792458./frequency;
e1=real(e);
e2=-imag(e);
Attenuation=2*pi./lambda.*sqrt(e1/2.*(sqrt(1+(e2./e1).^2)-1));
phase=2*pi./lambda.*sqrt(e1/2.*(sqrt(1+(e2./e1).^2)+1));
end