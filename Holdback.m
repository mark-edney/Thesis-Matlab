%Program to find the value  H for Holdback and the segregation quantity s
clear;
close all;
import11;
Code;

%finds the f(theta) function
x=theta(:,4);
ftt=cumtrapz(x,ett(:,4));
hold on;

%finds the holdback H
up=find(x>1);
newx=x(1:up);
H=trapz(newx,ftt(1:up));
A=area(newx,ftt(1:up));
A.FaceColor='cyan';
plot(x,ftt,'LineWidth',2.5);
title('Holdback (H)','FontSize',20);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$F(\theta )$','Interpreter','Latex');
xline(1,'LineWidth',2.5);
yline(1,'LineWidth',2.5);
ylim([0 1.15])
legend('Hold-back (H)','Reactor','Interpreter','Latex')
saveas(gcf,'\Thesis\Writing\pic\holdback','epsc')
saveas(gcf,'\Thesis\Writing\pic\holdback','png')

%Code for find segregation quantity s

%Find the boundaries in which the curves cross, needs to use a limit
%because there is no exact point so it needs to be coded manually as
%indexnum can show multiple points representing the same crossing
cstr=@(x)(1-exp(-x));
index=abs(cstr(x)-ftt)<0.00001;
indexnum=find(index);
R=2296:40243;

figure;
hold on;

plot(x,ftt,'LineWidth',2.5);
plot(x,cstr(x),'LineWidth',2.5);
title('Segregation Quantity (S)','FontSize',20);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$F(\theta )$','Interpreter','Latex');
ylim([0 1.15])
inBetween = [ftt(R), cstr(x(R))]
A=fill(x(R),inBetween,'cyan');
xline(1,'LineWidth',2.5);
yline(1,'LineWidth',2.5);
legend('Reactor','CSTR','Segregation (S)','Interpreter','Latex')
S=-sum(abs(trapz(x(R),cstr(x(R)))-trapz(x(R),ftt(R))))
saveas(gcf,'\Thesis\Writing\pic\Segs','epsc')
saveas(gcf,'\Thesis\Writing\pic\Segs','png')

%zoom in to the plot to show that the system proceeds the cstr
figure;
hold on;
plot(x,ftt,'LineWidth',2.5);
plot(x,cstr(x),'LineWidth',2.5);
title('Segregation Quantity (S) zoomed-in','FontSize',20);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$F(\theta )$','Interpreter','Latex');
xlim([0 0.5]);
legend('Reactor','CSTR','Interpreter','Latex')
saveas(gcf,'\Thesis\Writing\pic\Segs2','epsc')
saveas(gcf,'\Thesis\Writing\pic\Segs2','png')