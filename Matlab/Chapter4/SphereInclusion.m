function eps=SphereInclusion(eps_host,eps_included,volume)
    eps=eps_host+3.*volume.*eps_host.*(eps_included-eps_host)./(eps_included+2.*eps_host);
end