function eps=DielectricBrine(T,frequency)
%     Permittivity of brine.
%     Equations from Ulaby et al, 1986.
%     Coefficients are derived for a fit between -2 - -43.2oC.
%     Alternative equations from Stogryn and Desargant, 1985, Eq.1, are also 
%     provided; coefficients are here derived for a fit down to -25°„C. 
%     The main difference between the two lies in the calculation of brine 
%     conductivity. 
%     For small salinity values (and temperatures close to 0oC), the saline-water 
%     Double-Debye model (D3M) may be used for the permittivity calculations. 
%     
%     [epsi_brine,epsii_brine] = ebrine(T, freq, method)
%         epsi_brine:   relative permittivity (real part of dielectric constant)
%         epsii_brine:  dielectric loss factor (imaginary part of dielectric constant)
%         freq:         frequency [Hz]
%         T:            temperature [C]
%         method:       'Stogryn','StogrynDesargant' (default)              
%     Uses: brine_conductivity, brine_salinity, brine_normality
    
    e0 = 8.85419e-12;
    S = brine_salinity(T);
    
    % Ionic conductivity of brine:
    [condbrine, N] = brine_conductivity(T,S);

    % Relaxation time:
    rel=(1.1109e-10-3.824e-12.*T+6.938e-14.*T.^2-5.096e-16.*T.^3)./(2.*pi);
    b=1.0+0.146e-2.*T.*N-4.89e-2.*N-2.97E-2.*N.^2+5.64e-3.*(N.^3);
    trelax=rel.*b;

    % Static dielectric constant of brine:
    % From Ulaby et al. 1986 vol. III E66
    eps=88.045-0.4147.*T+6.295e-4.*T.^2+1.075e-5.*T.^3;
    a=1.0-0.255.*N+5.15e-2.*N.^2-6.89e-3.*N.^3;
    eb0 = eps.*a;

    % The Debye relaxation law:
    % High-frequency limit of the dielectric constant:
    epsiwoo=4.9; 
    % Relative permittivity:
    epsi_brine = epsiwoo+(eb0-epsiwoo)./(1.+(2.*pi.*trelax.*frequency).^2);
    % Loss factor:
    epsii_brine = 2.*pi.*trelax.*frequency.*(eb0-epsiwoo)./(1.+(2.*pi.*trelax.*frequency).^2) + condbrine./(2.*pi.*frequency.*e0);
    epsi_brine(epsi_brine<0)=0;
    epsii_brine(epsii_brine<0)=0;
    eps= epsi_brine-1i.* epsii_brine;
end