function [Rh,Rv]=emis(theta,e1,e2)
%emissity at different oblique angle according to Fresnel Law
%e2和e1是两种不同物质的介电常数，theta是入射角
    para=e2/e1;
    Rh=(para.*cos(theta)-sqrt(para-sin(theta).^2))./(para.*cos(theta)+sqrt(para-sin(theta).^2));
    Rv=(cos(theta)-sqrt(para-sin(theta).^2))./(cos(theta)+sqrt(para-sin(theta).^2));
end