%Program to find the value  H for Holdback and the segregation quantity s
%Each seperate trial is loaded into memory
clear;
close all;
tic
i=4;

import9;
Code;
conf1=conf(:,i);
time1=time;
theta1=theta(:,i);
ett1=ett(:,i);
Tavg(:,1)=tavg;
TVar(:,1)=Var;

import10;
Code;
conf2=conf(:,i);
time2=time;
theta2=theta(:,i);
ett2=ett(:,i);
Tavg(:,2)=tavg;
TVar(:,2)=Var;

import11;
Code;
conf3=conf(:,i);
time3=time;
theta3=theta(:,i);
ett3=ett(:,i);
Tavg(:,3)=tavg;
TVar(:,3)=Var;

%the mean values for the curve are found
minlen=min([length(theta1),length(theta2),length(theta3)]);
ValMatrix = [ett1(1:minlen),ett2(1:minlen),ett3(1:minlen)]';
meanval=mean(ValMatrix)';
theta= theta1(1:minlen);

%finds the f(theta) function
x=theta;
ftt=cumtrapz(x,meanval);
hold on;

%Plot F(theta)
plot(x,ftt,'LineWidth',2.5);
yline(1,'LineWidth',2.5);
ylim([0 1.15])
title('F (\theta) for sensor #4','FontSize',20);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$F(\theta )$','Interpreter','Latex');
saveas(gcf,'pic\ftt','epsc')
saveas(gcf,'pic\ft','png')

%finds the holdback H
figure;
hold on;
up=find(x>1);
up=up(1);
newx=x(1:up);
H=trapz(newx,ftt(1:up));
A=area(newx,ftt(1:up),'FaceColor','cyan');
plot(x,ftt,'LineWidth',2.5);
title('Holdback (H)','FontSize',20);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$F(\theta )$','Interpreter','Latex');
xline(1,'LineWidth',2.5);
yline(1,'LineWidth',2.5);
ylim([0 1.15]);
legend('Hold-back (H)','Reactor','Interpreter','Latex')
saveas(gcf,'pic\holdback','epsc')
saveas(gcf,'pic\holdback','png')

%Code for find segregation quantity s

%Find the boundaries in which the curves cross, needs to use a limit
%because there is no exact point so it needs to be coded manually as
%indexnum can show multiple points representing the same crossing
cstr=@(x)(1-exp(-x));
index=abs(cstr(x)-ftt)<0.00001;
indexnum=find(index);
R=indexnum(2):indexnum(3);

figure;
hold on;

wt = 4;
plot(x,ftt,'LineWidth',wt);
plot(x,cstr(x),'LineWidth',wt);
title('Segregation Quantity (S)','FontSize',20);
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex');
ylabel('$F(\theta )$','Interpreter','Latex');
ylim([0 1.15]);
inBetween = [ftt(R), cstr(x(R))];
fill(x(R),inBetween,'cyan');
xline(1,'LineWidth',wt);
yline(1,'LineWidth',wt);
plot(x,ftt,'LineWidth',wt,'color', [0,0.45,0.74]);
plot(x,cstr(x),'LineWidth',wt, 'color', 'red');
legend('F(t) of Reactor','F(t) of CSTR','Segregation (S)','Interpreter','Latex')
S=-sum(abs(trapz(x(R),cstr(x(R)))-trapz(x(R),ftt(R))));
saveas(gcf,'pic\Segs','epsc')
saveas(gcf,'pic\Segs','png')

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
saveas(gcf,'pic\Segs2','epsc')
saveas(gcf,'pic\Segs2','png')
toc;