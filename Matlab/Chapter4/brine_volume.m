function v=brine_volume(T,S)
%Brine volume fraction as function of temperature.
%   T:      Temperature [C] T<=-0.5
%2018.8.23,Baojian Liu, powered by Matlab 2018a
%Chapter 4-5 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.
    if(any(T>-0.1))
        msgID = 'MATLAB:inputError';
        msgtext = 'Temperature should be<=-0.5¡ãC';
        ME = MException(msgID,msgtext);
    throw(ME)
    end
    v=1e-3*S.*(-49.185./T+0.532);
end