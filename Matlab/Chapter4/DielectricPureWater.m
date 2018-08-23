function e=DielectricPureWater(T,frequency)
%The Dielectric constant of pure water <=50GHz
%Input: frequency in Hz,Temperature in centigrade
%2018.8.22,Baojian Liu, powered by Matlab 2018a
%Chapter 4-2 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.
if(any(frequency>5e10))
    msgID = 'MATLAB:inputError';
    msgtext = 'frequency should be<=50GHz.';
    ME = MException(msgID,msgtext);
    throw(ME)
end
if(any(T<0|T>30))
    msgID = 'MATLAB:inputError';
    msgtext = "Temperature should be 0-30 centigrade";
    ME = MException(msgID,msgtext);
    throw(ME)
end
e_w0=88.045-0.4147.*T+6.295e-4.*T.^2+1.075e-5.*T.^3;
e_wInfty=4.9;
%relaxation time
tao_w_2pi=1.1109e-10-3.824e-12.*T+6.938e-14.*T.^2-5.096e-16.*T.^3;
tao_w=tao_w_2pi/(2*pi);
%relaxation frequency
e=e_wInfty+(e_w0-e_wInfty)./(1+1i*2*pi.*frequency.*tao_w);
end