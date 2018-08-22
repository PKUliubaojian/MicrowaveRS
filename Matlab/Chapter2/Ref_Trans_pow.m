function [Reflectivity_v,Reflectivity_h,Transmissivity_v,Transmissivity_h]=Ref_Trans_pow(theta,e1,e2)
%Reflectivity and transmissivityat different oblique angle according to Fresnel Law
%Input
%e1 e2 are permitivity of two layers
%theta is incident angle

%%
%to test the code
%[Rv,Rh,Tv,Th]=Ref_Trans_pow(incident,1,5+12i)
%plot(incident,Th,incident,Rh,incident,Rv,incident,Tv)
%legend Th Rh Rv Tv
%%
    [Rv,Rh,~,~]=Ref_Trans(theta,e1,e2);
    Reflectivity_v=abs(Rv.^2);
    Transmissivity_v=1-Reflectivity_v;
    Reflectivity_h=abs(Rh.^2);
    Transmissivity_h=1-Reflectivity_h;
end