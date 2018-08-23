function [condutivity,N]=brine_conductivity(T,sal)
%Brine salinity as function of temperature
%   cond:   Brine conductivity [S/m]
%   sal:    Salinity [psu]
%   T:      Temperature [C] [-43.2,-1.8oC]
%2018.8.23,Baojian Liu, powered by Matlab 2018a
%Chapter 4-5 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.
    N = brine_normality(sal);
    % Conductivity:
    D = 25-T;
    sig = N.* (10.39-2.378.*N+0.683.*(N.^2)-0.135.*N.^3+1.01e-2.*N.^4);
    c = 1.0 - 1.96e-2.*D + 8.08e-5.*(D.^2) - N.*D.*(3.02e-5+3.92e-5.*D + N.*(1.72e-5 - 6.58e-6.*D));
    condutivity=c.*sig;
    condutivity(condutivity<0)=0;
end