function eps=DielectricSeaice(S,T,f,rho)
% The dielectric constant of saline sea ice with air bubbles.
% If no air, use rho = []
% Background information: Ulaby et al. 1986 vol. III.
% 
%     [epsi_mix,epsii_mix] = salineicewithairbubbles(sal,T,freq)
%         epsi_mix:   relative permittivity of mixture (real part of dielectric constant) 
%         epsii_mix:  dielectric loss factor of mixture (imaginary part of dielectric constant)
%         T:          temperature [K]
%         rho:        density [g/cm?]
%         freq:       frequency [GHz]
%         
%     Uses: epureice, ebrine, brine.volume, sphericalinclusions, (randomneedles)    
    eps_i = DielectricPureice(T,f);
    eps_b = DielectricBrine(T,f);
    vol_b = brine_volume(T,S); 
    % Assuming spherical brine inclusions:
    eps_m = SphereInclusion(eps_i,eps_b,vol_b);

    
    % Dielectric constant of saline sea ice with air bubbles:
    if varargin > 3
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