function eps=DielectricWetsnow(T,frequency,rho,W)
    % The relative permittivity of wet snow:
    % Debye-Like model
    %    T:          temperature [C]
    %    rho:        density [g/cm^3]
    %    frequency:  frequency [Hz]
    %    W:          wetness,e.g. volume fraction of liquid water in the snow mixture   
    % page 140~142 in Ulaby's book, Chapter 4.6.2
    % Baojian Liu,2018.8.24, Powered by Matlab 2018a
    % Chapter 4.6.2 in Microwave Radar and Radiometric Remote sensing, Ulaby and Long, 2014. 
    
    if(any(T>0))
        msgID = 'MATLAB:inputError';
        msgtext = "Temperature should be <0 centigrade";
        ME = MException(msgID,msgtext);
        throw(ME)
    end
    freq=frequency.*1e-9;
    A1 = 0.78+0.03.*freq-0.58e-3.*freq.^2;
    A2 = 0.97-0.39e-2.*freq+0.39e-3.*freq.^2;
    B1 = 0.31-0.05.*freq+0.87e-3.*freq.^2;
    A = A1.*(1.0+1.83.*rho+0.02.*(W.*100).^1.015)+B1;
    B = 0.073.*A1;
    C = 0.073.*A2;
    x = 1.31;
    f0 = 9.07 ;
    epsi  = A+ B.*(W.*100).^x./(1.0+(freq./f0).^2);
    epsii  = C.*(freq./f0).*(W .*100.0).^x./(1.0+(freq./f0).^2);
    eps=epsi-epsii.*1i;
end