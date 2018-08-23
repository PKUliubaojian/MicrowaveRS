function N=brine_normality(sal)
%2018.8.23,Baojian Liu, powered by Matlab 2018a
%Chapter 4-5 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.

%there are no parameter 0.9141 in eq.4.49e
    N = sal.*(1.707e-2 + 1.205e-5*sal + 4.058e-9*sal.^2);
end