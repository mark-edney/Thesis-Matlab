%This porgam will look at different models and cmopare the absolute error
%to determine the most accurate model
function [error, ModelP] = CompareModels (theta,ett)
%This porgam will look at different models and cmopare the absolute error
%to determine the most accurate model
tau=1;
D=linspace(0,25,300);
md=dispersion(theta,D,tau);
E=Modeltest(theta,ett,md);
Edmin=min(E);
ndmin=D(find(E==min(E)));

D=linspace(0,25,300);
md2=dispop(theta,D,tau);
E=Modeltest(theta,ett,md2);
Edopmin=min(E);
ndopmin=D(find(E==min(E)));

%CSTRs in series
n=(1:1:200);
mc=cstrs(theta,n,tau);
E=Modeltest(theta,ett,mc);
Ecmin=min(E);
ncmin=n(find(E==Ecmin));

%gennCSTRs in series in test
n=(0:.01:20);
mg=genncstr(theta,n,tau);
E=Modeltest(theta,ett,mg);
Egmin=min(E);
ngmin=n(find(E==Egmin));

%enchanced CSTRs in series in test
[yee,EE,enmin,eMmin,eNmin]=ecstrs(theta,ett);

[yc,yp]=Ideal(1,theta);
EC=Modeltest(theta,ett,yc);
EP=Modeltest(theta,ett,yp);

figure;
hold on;
title("Ideal Reactors Check");
plot(theta,ett,'DisplayName','RTD','LineWidth',3);
plot(theta,yc,'LineWidth',2.5);
plot(theta,yp,'LineWidth',2.5);
string1=sprintf('Ideal CSTR(E=%0.2d)',EC);
string2=sprintf('Ideal PFR(E=%0.2d)',EP);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');
legend("RTD",string1,string2);
ylim([0 2]);
saveas(gcf,'pic\resultsideal','epsc')
saveas(gcf,'pic\resultsideal','png')

figure;
hold on;
title("Real Reactors Check");
plot(theta,ett,'DisplayName','RTD','LineWidth',3);
string4=sprintf('Low Dispersion Model(E=%0.2d)',Edmin);
string5=sprintf('Open Vessel Dispersion Model(E=%0.2d)',Edopmin);
string6=sprintf('CSTRs in series(E=%0.2d)',Ecmin);
plot(theta,dispersion(theta,ndmin,tau),'DisplayName',string4,'LineWidth',2.5);
plot(theta,dispop(theta,ndopmin,tau),'DisplayName',string5,'LineWidth',2.5);
plot(theta,cstrs(theta,ncmin,tau),'DisplayName',string6,'LineWidth',2.5);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');
legend;
ylim([0 2]);
saveas(gcf,'pic\resultsreal','epsc')
saveas(gcf,'pic\resultsreal','png')

figure;
hold on;
title("Real Reactors Check 2");
plot(theta,ett,'DisplayName','RTD','LineWidth',3);
string7=sprintf('Generalized Nth(E=%0.2d)',Egmin);
string8=sprintf('Enhanced Cstrs(E=%0.2d)',EE);
plot(theta,genncstr(theta,ngmin,tau),'DisplayName',string7,'LineWidth',2.5);
plot(theta,yee,'DisplayName',string8,'LineWidth',2.5);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');
legend;
ylim([0 2]);
saveas(gcf,'pic\resultsreal2','epsc')
saveas(gcf,'pic\resultsreal2','png')

error=[EC EP Edmin Edopmin Ecmin Egmin EE];
ModelP=[ndmin,ndopmin,ncmin,ngmin,eNmin,enmin,eMmin];
hold off;
end