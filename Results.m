close all;
clear;
import11;
Code;

figure;
sgtitle('Tracer Experiment Raw Data','FontSize',20)
subplot(2,2,1);
plot(time,cond(:,1));
title('Recycle stream');
xlabel({'Time(hr)'})
ylabel({'Conductivity(\muS)'})

subplot(2,2,2);
plot(time,cond(:,2));
title('Anoxic #1');
xlabel({'Time(hr)'})
ylabel({'Conductivity(\muS)'})

subplot(2,2,3);
plot(time,cond(:,3));
title('Anoxic #2');
xlabel({'Time(hr)'})
ylabel({'Conductivity(\muS)'})
subplot(2,2,4);
plot(time,cond(:,4));
title('STAR overall');
xlabel({'Time(hr)'})
ylabel({'Conductivity(\muS)'})
saveas(gcf,'pic\rawdata','epsc')
saveas(gcf,'pic\rawdata','png')

figure;
plot(theta(:,4),ett(:,4),'LineWidth',2.5);
title('RTD STAR Reactor','FontSize',20)
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');
saveas(gcf,'pic\etheta4','epsc')
saveas(gcf,'pic\etheta4','png')

a1=0.2323;
a2=1.276;

min1=find(theta(:,4)>a1);
min2=find(theta(:,4)>a2);
A1=trapz(theta(1:min1(1),4),ett(1:min1(1),4));
A2=trapz(theta(min1(1):min2(1),4),ett(min1(1):min2(1),4));
A3=trapz(theta(min2(1):(end),4),ett(min2(1):(end),4));
V1=1
V2=A2/A1
V3=A3/A1

figure;
sgtitle('Tracer Experiment Transformed Data','FontSize',20)
subplot(2,2,1);
plot(theta(:,1),ett(:,1));
title('Recycle stream');
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');

subplot(2,2,2);
plot(theta(:,2),ett(:,2));
title('Anoxic #1');
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');

subplot(2,2,3);
plot(theta(:,3),ett(:,3));
title('Anoxic #2');
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');

subplot(2,2,4);
plot(theta(:,4),ett(:,4));
title('STAR overall');
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$E(\theta )$','Interpreter','Latex');
saveas(gcf,'pic\4paneltheta','epsc')
saveas(gcf,'pic\4paneltheta','png')