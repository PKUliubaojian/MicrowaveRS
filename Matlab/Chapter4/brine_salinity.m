function sal=brine_salinity(T)
%Brine salinity as function of temperature.
%   sal:    Salinity [psu]
%   T:      Temperature [K]
%2018.8.23,Baojian Liu, powered by Matlab 2018a
%Chapter 4-5 in Microwave Radar and Radiometric Remote sensing, Ulaby et al.
    
    sal=zeros(size(T));

    mask = (T<-1.8)&(T>=-8.2);
    sal(mask)=1.725-18.756*T(mask)-0.3964*T(mask).^2;

    mask = (T<-8.2) & (T>=-22.9);
    sal(mask)=57.041-9.929*T(mask)-0.16204*T(mask).^2-0.002396*T(mask).^3;

    mask = (T<-22.9) & (T>=-36.8);
    sal(mask)=242.94+1.5299*T(mask)+0.0429*T(mask).^2;

    mask = (T<-36.8) & (T>=-43.2);
    sal(mask)=508.18+14.535*T(mask)+0.2018*T(mask).^2;

    % Constant level for temperatures below -43.2oC:
    mask = (T<-43.2);
    sal(mask)=508.18+14.535*-43.2+0.2018*(-43.2).^2; 
end