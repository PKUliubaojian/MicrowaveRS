function eps=DielectricSeaice(S,T,f,rho)
% The dielectric constant of saline sea ice with air bubbles.
% Background information: Ulaby et al. 1986 vol. III.
% some Python code from https://github.com/maiwinstrup/SICCI
%    T:          temperature [C]
%    rho:        density [g/cm?]
%    f:       frequency [Hz]
%    S:      salinity in psu     
%    2018.8.23 powered by Matlab 2018a
    eps_i = DielectricPureice(T,f);
    eps_b = DielectricBrine(T,f);
    vol_b = brine_volume(T,S); 
    % Assuming spherical brine inclusions:
    eps_m = SphereInclusion(eps_i,eps_b,vol_b);

    
    % Dielectric constant of saline sea ice with air bubbles:
    if nargin > 3
        % Air volume: 
        rho_ice = 0.926;
        vol_air=(rho_ice-rho)/rho_ice;
        vol_air(vol_air<0)=0;
        % Permittivity of air: 
        eps_a = 1;
        % Permittivity of saline sea ice with air bubbles as spherical inclusions:
        eps = SphereInclusion(eps_m,eps_a,vol_air);
    else
        eps=eps_m;
    end
end