time=Conductivity(:,1);
cond1=Conductivity(:,2)
cond2=Conductivity(:,3);
cond3=Conductivity(:,4);
cond4=Conductivity(:,5);
figure
plot(time/3600,cond4)
title('RTD out of Stage 1')
xlabel({'Time','(hrs)'})
ylabel({'Conductivity','(uS/cm)'})
fil=filter(ones(1,1000),1000,cond4);
p=polyfit(time,cond4,20);
figure
plot(time/3600,fil)
title('RTD out of Stage 2')
xlabel({'Time','(hrs)'})
ylabel({'Conductivity','(uS/cm)'})
yp=polyval(p,time);
xp=time;
plot(xp,yp)
plot(xp,fil)
title('RTD out of Stage 2')
xlabel({'Time','(hrs)'})
ylabel({'Conductivity','(uS/cm)'})
bsum=9999999999999999999999999;
bp=0;
esum=0;
for i=1:1:200
    p=polyfit(time,cond4,i);
    yp=polyval(p,time);
for j=1:1:23645
esum=(polyval(p,time(j))-cond4(j))*(polyval(p,time(j))-cond4(j))+esum;
end
 if esum < bsum
     bsum=esum
     bp=i
 end
     esum=0;
end
bsum
esum
bp
p=polyfit(time,cond4,bp);
yp=polyval(p,time);
hold on
plot(xp,yp)
plot(xp,fil)
plot(time,cond4)