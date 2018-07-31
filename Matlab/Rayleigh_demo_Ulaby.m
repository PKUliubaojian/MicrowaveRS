%The demo of Rayleigh Distribution, Cumulative distribution and
%N-successive convolution (N-Look Image)
subplot(2,2,1)
x=0:0.01:5;
y1=raylpdf(x,1);
y05=raylpdf(x,0.5);
y2=raylpdf(x,2);
plot(x,y1,x,y05,x,y2);
legend b=1 b=0.5 b=2
title('Rayleigh probability distribution function')

subplot(2,2,2)
x=0.01:0.01:5;
%F的分布为指数分布
yexp=exppdf(x,1);
%f的分布为瑞利分布
yrayl=raylpdf(x,1);
plot(x,yexp,x,yrayl);
legend('expotentional pdf F', 'Rayleigh pdf f')
title('pdf of f and F in radar scattering')

subplot(2,2,3)
x=0.01:0.01:5;
%F的分布为指数分布
yexp=expcdf(x,1);
%f的分布为瑞利分布
yrayl=raylcdf(x,1);
%amplitude in DB
x=10*log10(x);
plot(x,yexp,x,yrayl);
legend('p(F<=F'')', 'p(f<=f'')')
title('cdf of f and F in radar scattering')
xlabel('intensity in dB')

subplot(2,2,4)
x=0.01:0.01:5;
%F的分布为{\chi}^2分布
F_singleLook=2*chi2pdf(x,2);
%4-视
F_4Look=8*chi2pdf(8*x,8);
%10-视
F_10Look=20*chi2pdf(20*x,20);
%amplitude in DB
%x=10*log10(x);
plot(x,F_singleLook,x,F_4Look,x,F_10Look);
legend('N=1','N=4','N=10');
title('N-look pdf of F')
