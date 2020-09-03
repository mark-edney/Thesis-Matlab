clear all;
tau=.5;
cstr=@(x,tau)exp(-x/tau)/tau;
x=0:0.1:1;
y1=cstr(x,tau);
y2=cumtrapz(y1);
x2=linspace(0,1,101);
close all;
for i=1:1:101
y(i)=dd(x2(i),tau);
yf(i)=fd(x2(i),tau);
end

figure
plot(x,y1,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Idealized CSTR RTD','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)
saveas(gcf,'pic\ideal_cstr_et','epsc')
saveas(gcf,'pic\ideal_cstr_et','png')

figure
hold on;
plot(x,y1,'LineWidth',2.5);
plot(x2,y,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Idealized Reactors RTD','FontSize',20)
legend('Ideal CSTR','Ideal PFR');
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)
saveas(gcf,'pic\ideals','epsc')
saveas(gcf,'pic\ideals','png')

figure
plot(x,y2,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Idealized CSTR RTD','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'F(t)'},'FontSize',20)
saveas(gcf,'pic\ideal_cstr_ft','epsc')
saveas(gcf,'pic\ideal_cstr_ft','png')

figure
plot(x2,y,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Idealized PFR RTD','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)
saveas(gcf,'pic\ideal_pfr_et','epsc')
saveas(gcf,'pic\ideal_pfr_et','png')

figure
plot(x2,y,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Pulse Signal','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)

figure
plot(x2,yf,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Idealized PFR RTD','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'F(t)'},'FontSize',20)
saveas(gcf,'pic\ideal_pfr_ft','epsc')
saveas(gcf,'pic\ideal_pfr_ft','png')

figure
plot(x2,yf,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Step Signal','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)


figure
d=linspace(0,0.5,10);
yd=dispersion(0:0.01:4,d',1);
plot(0:0.01:4,yd,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Low Dispersion RTD','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)
string1=sprintf('D=%0.2d',d(1));
string2=sprintf('D=%0.2d',d(2));
string3=sprintf('D=%0.2d',d(3));
string4=sprintf('D=%0.2d',d(4));
string5=sprintf('D=%0.2d',d(5));
string6=sprintf('D=%0.2d',d(6));
string7=sprintf('D=%0.2d',d(7));
string8=sprintf('D=%0.2d',d(8));
string9=sprintf('D=%0.2d',d(9));
string10=sprintf('D=%0.2d',d(10));
lgd=legend(string1,string2,string3,string4,string5,string6,string7,string8,string9,string10);
title(lgd,'Dispersion Coefficent')
saveas(gcf,'pic\dispersion','epsc')
saveas(gcf,'pic\dispersion','png')

figure
d=[20,10, 5, 2, 1, 0.5, 0.2, 0.1, 0.05, 0.01];
yd2=dispop(0:0.01:4,d',1);
plot(0:0.01:4,yd2,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('Open Vessel Disperssion','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)
string1=sprintf('D=%0.2d',d(1));
string2=sprintf('D=%0.2d',d(2));
string3=sprintf('D=%0.2d',d(3));
string4=sprintf('D=%0.2d',d(4));
string5=sprintf('D=%0.2d',d(5));
string6=sprintf('D=%0.2d',d(6));
string7=sprintf('D=%0.2d',d(7));
string8=sprintf('D=%0.2d',d(8));
string9=sprintf('D=%0.2d',d(9));
string10=sprintf('D=%0.2d',d(10));
lgd=legend(string1,string2,string3,string4,string5,string6,string7,string8,string9,string10);
title(lgd,'Dispersion Coefficent')
saveas(gcf,'pic\dispop','epsc')
saveas(gcf,'pic\dispop','png')

figure
n=1:2:20;
ycs=cstrs(0:.01:2,n',1);
plot(0:0.01:2,ycs,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
title('CSTRs in series Model RTD','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)
string1=sprintf('N=%0.2d',n(1));
string2=sprintf('N=%0.2d',n(2));
string3=sprintf('N=%0.2d',n(3));
string4=sprintf('N=%0.2d',n(4));
string5=sprintf('N=%0.2d',n(5));
string6=sprintf('N=%0.2d',n(6));
string7=sprintf('N=%0.2d',n(7));
string8=sprintf('N=%0.2d',n(8));
string9=sprintf('N=%0.2d',n(9));
string10=sprintf('N=%0.2d',n(10));
lgd=legend(string1,string2,string3,string4,string5,string6,string7,string8,string9,string10);
title(lgd,'Number of CSTRs in series')
saveas(gcf,'pic\cstrs','epsc')
saveas(gcf,'pic\cstrs','png')

figure
n=[linspace(0.1,3,10)];
ygcs=genncstr(0:.01:2,n',1);
plot(0:0.01:2,ygcs,'LineWidth',2.5);
set(gca,'YTick',[])
set(gca,'XTick',[])
ylim([0,2]);
title('Generalized N CSTRs Model','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'E(t)'},'FontSize',20)
string1=sprintf('N=%0.2d',n(1));
string2=sprintf('N=%0.2d',n(2));
string3=sprintf('N=%0.2d',n(3));
string4=sprintf('N=%0.2d',n(4));
string5=sprintf('N=%0.2d',n(5));
string6=sprintf('N=%0.2d',n(6));
string7=sprintf('N=%0.2d',n(7));
string8=sprintf('N=%0.2d',n(8));
string9=sprintf('N=%0.2d',n(9));
string10=sprintf('N=%0.2d',n(10));
lgd=legend(string1,string2,string3,string4,string5,string6,string7,string8,string9,string10);
title(lgd,'Number of CSTRs in series')
saveas(gcf,'pic\genncstrs','epsc')
saveas(gcf,'pic\genncstrs','png')

figure
x=0:.01:.25;
n=1;
M=(0:.01:1);
N=2;
[x2,M2]=ndgrid(x,M);
d=(N.*n./M2.*x2);
Model=(1-n).*dirac(d);

for i=1:1:N
        Model=Model+(N.*n./M2.*(factorial(N).*exp(-d).*(d.^(i-1)).*((1-n).^(N-i)).*n.^i))./(factorial((N-i>0).*(N-i)).*(factorial(i)).*(factorial(i-1)));
end
inf=isinf(Model);
Model(inf)=0;
nan=isnan(Model);
Model(nan)=0;

plot3(x2,M2,Model)
set(gca,'YTick',[])
set(gca,'XTick',[])
set(gca,'ZTick',[])
title('ECSTRs Model(n=1,N=2)','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'M(0-1)'},'FontSize',20)
zlabel({'Model value'},'FontSize',20)
saveas(gcf,'pic\ecstrssetn','epsc')
saveas(gcf,'pic\ecstrssetn','png')

figure
x=0:.01:.25;
M=1;
n=(0:.01:1);
N=2;
[x2,n2]=ndgrid(x,n);
d=(N.*n2./M.*x2);
Model=(1-n2).*dirac(d);

for i=1:1:N
        Model=Model+(N.*n2./M.*(factorial(N).*exp(-d).*(d.^(i-1)).*((1-n2).^(N-i)).*n2.^i))./(factorial((N-i>0).*(N-i)).*(factorial(i)).*(factorial(i-1)));
end
inf=isinf(Model);
Model(inf)=0;
nan=isnan(Model);
Model(nan)=0;

plot3(x2,n2,Model)
set(gca,'YTick',[])
set(gca,'XTick',[])
set(gca,'ZTick',[])
title('Enhanced CSTRs in series Model(M=1,N=2)','FontSize',20)
xlabel({'Time'},'FontSize',20)
ylabel({'n(0-1)'},'FontSize',20)
zlabel({'Model value'},'FontSize',20)
saveas(gcf,'pic\ecstrssetM','epsc')
saveas(gcf,'pic\ecstrssetM','png')

import11;
Code;
plot(time,cond(:,1))
title('Conductivity for Sensor #4','FontSize',20)
xlabel({'Time(hr)'},'FontSize',20)
ylabel({'Conductivity(\mu S)'},'FontSize',20)
saveas(gcf,'pic\sample_cond','epsc')
saveas(gcf,'pic\sample_cond','png')

figure;
hold on;
plot(time,cond(:,4))
fitplot=plot(minv1);
fitplot(2).LineWidth=2.5;
title('Conductivity for Sensor #4','FontSize',20)
xlabel({'Time(hr)'},'FontSize',20)
ylabel({'Conductivity($\mu$ S)'},'Interpreter','Latex','FontSize',20)
saveas(gcf,'pic\sample_lm','epsc')
saveas(gcf,'pic\sample_lm','png')

figure;
plot(time,conf(:,4),'LineWidth',2.5)
title('Transformed Sensor #4','FontSize',20)
xlabel({'Time(hr)'},'FontSize',20)
ylabel({'Conductivity(\mu S)'},'FontSize',20)
saveas(gcf,'pic\sample_conf','epsc')
saveas(gcf,'pic\sample_conf','png')

figure;
plot(time,et(:,4),'LineWidth',2.5)
title('E(t) Sensor #1','FontSize',20)
xlabel({'Time(hr)'},'FontSize',20)
ylabel({'E (t)'},'FontSize',20)
saveas(gcf,'pic\sample_et','epsc')
saveas(gcf,'pic\sample_et','png')

figure;
plot(theta(:,4),ett(:,4),'LineWidth',2.5)
title('E (\theta ) Sensor #4','FontSize',20)
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');
saveas(gcf,'pic\sample_ett','epsc')
saveas(gcf,'pic\sample_ett','png')

function y=dd(x,tau)

y=0;
if x==tau
    y=1/tau;
end
end
function y=fd(x,tau)

if x<tau
    y=0;
else
    y=1/tau;
end
end

