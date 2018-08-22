%home work of lesson Microwave Remote Sensing, Peking University, fall 2017 
x=0:0.01:pi/2;
[Rh,Rv]=Polarization(x,1,81);
Rh=1-abs(Rh).^2;
Rv=1-abs(Rv).^2;
plot(x/pi*180,300*Rh,'-',x/pi*180,300*Rv,'--');
xlabel('Observation angle \theta(deg)','FontWeight','bold','Fontsize',12);
ylabel('Brightness temperature(K)','FontWeight','bold','Fontsize',12);
title('H&V Brightness temperature when T=300K,\epsilon=81','Fontsize',14)
legend('T_v','T_h')