function eps=SphereInclusion(eps_host,eps_included,volume)
    % The relative permittivity of the mixture of two hetergeneous materials:
    % page 131 equation 4.36b
    %   eps_host:       relative permittivity of the host substance
    %   eps_included:   relative permittivity of the inclusions
    %   volume:         volume fraction
    %
    % By Baojian Liu,2018.8.23, Powered by Matlab 2018a
    %Chapter 4-3 in Microwave Radar and Radiometric Remote sensing, Ulaby and Long, 2014. 
    eps=eps_host+3.*volume.*eps_host.*(eps_included-eps_host)./(eps_included+2.*eps_host);
end