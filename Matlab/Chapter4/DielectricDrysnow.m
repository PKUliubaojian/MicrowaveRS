function eps=DielectricDrysnow(T,frequency,rho)
    % The relative permittivity of dry snow:
    % By Baojian Liu,2018.8.24, Powered by Matlab 2018a
    %    T:          temperature [C]
    %    rho:        density [g/cm^3]
    %    frequency:     frequency [Hz]  
    % Chapter 4.6.1 pages 140~142 in Microwave Radar and Radiometric Remote sensing, Ulaby and Long, 2014. 

    if(any(T>0))
        msgID = 'MATLAB:inputError';
        msgtext = "Temperature should be <0 centigrade";
        ME = MException(msgID,msgtext);
        throw(ME)
    end
    %0.9167 g/cm^3 is the density of pure ice
    v_i=rho./0.9167;
    eps_ice=DielectricPureice(T,frequency);
    % A emperical expression was used in volume fraction>=0.45 and <0.45,respectively.
    eps_i=(1+0.4759.*v_i).^3;
    eps_i(v_i<0.45)=1+1.4667.*v_i(v_i<0.45)+1.435.*v_i(v_i<0.45).^3;
    eps_ii=0.34.*v_i.*(-imag(eps_ice))./((1-0.42.*v_i).^2);
    %eps_ii=-imag(eps_ice)*(0.52.*rho+0.62.*rho.^2);
    eps=eps_i-1i.*eps_ii;
end