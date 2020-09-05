%This script compares the different trials run against each other

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

hold on;
plot(time1,conf1,'LineWidth',2.5);
plot(time2,conf2,'LineWidth',2.5);
plot(time3,conf3,'LineWidth',2.5);
title('RTD Trial Comparision','FontSize',20);
xlabel({'Time(hrs)'},'FontSize',20)
ylabel('E(t)');
legend('Trial 1','Trial 2', 'Trial 3');
saveas(gcf,'pic\tracertest','epsc')
saveas(gcf,'pic\tracertest','png')

Error=(ett1(1:min([length(theta1),length(theta2),length(theta3)]))+ett2(1:min([length(theta1),length(theta2),length(theta3)]))+ett3(1:min(([length(theta1),length(theta2),length(theta3)]))))/3
figure
plot(1:min([length(theta1),length(theta2),length(theta3)]),Error)

T3=table([Tavg(4,:)';mean(Tavg(4,:))],[TVar(4,:)';mean(TVar(4,:))],'VariableNames',{'Mean Residence Time','Variance'})
writetable(T3,'test.xlsx','Sheet',3);

rsme(1)=Modeltest(theta1,ett1,ett2(1:length(theta1)));
rsme(2)=Modeltest(theta1,ett1,ett3(1:length(theta1)));
rsme(3)=Modeltest(theta2,ett2,ett3(1:length(theta2)));

T4=table(rsme','VariableNames',{'RSME'},'RowNames',{'Trial 1 and 2','Trial 1 and 3','Trial 2 and 3'})
writetable(T4,'test.xlsx','Sheet',4);