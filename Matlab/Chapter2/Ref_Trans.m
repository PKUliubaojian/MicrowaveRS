function [Rv,Rh,Tv,Th]=Ref_Trans(theta,e1,e2)
%reflection coefficient magnitude and transmission coefficient magnitude at different oblique angle according to Fresnel Law
%Input
%e1 e2 are permitivity of two layers
%theta is incident angle
    theta2=asin(sin(theta).*sqrt(e1./e2));
    eta0=377;
    eta1=eta0./sqrt(e1);
    eta2=eta0./sqrt(e2);
    Rh=(eta2.*cos(theta)-eta1.*cos(theta2))./(eta2.*cos(theta)+eta1.*cos(theta2));
    Th=1+Rh;
    Rv=(eta2.*cos(theta2)-eta1.*cos(theta))./(eta2.*cos(theta2)+eta1.*cos(theta));
    Tv=(1+Rv).*cos(theta)./cos(theta2);
end