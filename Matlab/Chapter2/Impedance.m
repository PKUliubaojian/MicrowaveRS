function impedance=Impedance(e)
%Intrinsic impedance of a lossy or lossless medium.
%e is complex permitivity
%2018.8.22 in Matlab 2018a
%Chapter 2.4 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.
e1=real(e);
e2=-imag(e);
impedance=377./(e1)./sqrt(1-e2/e1*1i);
end