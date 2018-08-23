function eps=DielectricSalineWater(T,frequency,S)
%Relative dielectric constant of water at any temperature between 0C and 30C, 
%for Salinities between 0 and 30 psu, and for frequencies between 0.1 and 50 GHz.
%e is complex permitivity,frequency is in Hz,S is Salinity is in psu
%2018.8.22,Baojian Liu, powered by Matlab 2018a
%Chapter 4-3 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.

if(any(frequency>1e12))
    msgID = 'MATLAB:inputError';
    msgtext = 'frequency should be<=1000GHz.';
    ME = MException(msgID,msgtext);
    throw(ME)
end
if(any(T<0|T>30))
    msgID = 'MATLAB:inputError';
    msgtext = "Temperature should be 0-30 centigrade";
    ME = MException(msgID,msgtext);
    throw(ME)
end
if(any(S>40))
    msgID = 'MATLAB:inputError';
    msgtext = "Salinity should be 0-40 psu";
    ME = MException(msgID,msgtext);
    throw(ME)
end

%Parameters for the D3M model (P127)
a1=0.46606917e-2;
a2=-0.26087876e-4;
a3=-0.63926782e-5;
a4=0.63000075e1;
a5=0.26242021e-2;
a6=-0.42984155e-2;
a7=0.34414691e-4;
a8=0.17667420e-3;
a9=-0.20491560e-6;
a10=0.58366888e3;
a11=0.12684992e3;
a12=0.69227972e-4;
a13=0.38957681e-6;
a14=0.30742330e3;
a15=0.12634992e3;
a16=0.37245044e1;
a17=0.92609781e-2;
a18=-0.26093754e-1;

%D3M model
eps_0=8.85419e-12;
eps_w0=87.85306.*exp(-0.00456992.*T-a1.*S-a2.*S.^2-a3.*S.*T);
eps_w1=a4.*exp(-a5.*T-a6.*S-a7.*S.*T);
tau_w1=(a8+a9.*S).*exp(a10./(T+a11))*1e-9;
tau_w2=(a12+a13.*S).*exp(a14./(T+a15))*1e-9;
eps_wInf=a16+a17.*T+a18.*S;
sigma_t_35=2.903602+8.607e-2.*T+4.738817e-4.*T.^2-2.991e-6.*T.^3+4.3041e-9.*T.^4;
alpha_0=(6.9431+3.2841.*S-0.099486.*S.^2)./(84.85+69.024.*S+S.^2);
alpha_1=49.843-0.2276.*S+0.00198.*S.^2;
P=S.*(37.5109+5.45216.*S+0.014409.*S.^2)./(1004.75+182.283.*S+S.^2);
Q=1+alpha_0.*(T-15)./(T+alpha_1);
sigma_i=sigma_t_35.*P.*Q;
omega=2*pi*frequency;
eps_w_r=eps_wInf+(eps_w0-eps_w1)./(1+(omega.*tau_w1).^2)+(eps_w1-eps_wInf)./(1+(omega.*tau_w2).^2);
eps_w_i=omega.*tau_w1.*(eps_w0-eps_w1)./(1+(omega.*tau_w1).^2)+...
    omega.*tau_w2.*(eps_w1-eps_wInf)./(1+(omega.*tau_w2).^2)+...
    sigma_i./(eps_0.*omega);
eps=eps_w_r-1i*eps_w_i;
end