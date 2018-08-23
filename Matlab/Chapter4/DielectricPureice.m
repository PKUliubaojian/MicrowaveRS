function eps=DielectricPureice(T,frequency)
    % The relative permittivity of pure water ice:
    % Derived by Matzler and Wegmuller (1987); Valid for frequency range: 
    % 10MHz to 300 GHz, and temperatures: -40<=T<=0¡ãC
    % By Baojian Liu,2018.8.23, Powered by Matlab 2018a
    %Chapter 4-3 in Microwave Radar and Radiometric Remote sensing, Ulaby and Long, 2014. 
    if(any(frequency>1e12|frequency<1e7))
        msgID = 'MATLAB:inputError';
        msgtext = 'frequency should be 10MHz-1000GHz.';
        ME = MException(msgID,msgtext);
        throw(ME)
    end
    if(any(T>0|T<-40))
        msgID = 'MATLAB:inputError';
        msgtext = "Temperature should be -40-0 centigrade";
        ME = MException(msgID,msgtext);
        throw(ME)
    end
    Tc=T;
    Tk=T+273.16;
    f=frequency*1e-9;
    eps_i=3.1884+9.1e-4.*Tc;
    %Hufford_corrected Method
    theta = 300./Tk-1;
    B1 = 0.0207;
    b = 335;
    B2 = 1.16e-11;
    alpha = (0.00504 + 0.0062*theta).*exp(-22.1*theta) ;       
    beta = B1./Tk.* exp(b./Tk)/((exp(b./Tk)-1).^2) + B2.*f.^2 + exp(-9.963+0.0372.*Tc);
    eps_ii = alpha./f + beta.*f;
    eps=eps_i-1i.*eps_ii;
end