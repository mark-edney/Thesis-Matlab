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
title('RTD Trial Comparison','FontSize',20);
xlabel({'Time(hrs)'},'FontSize',20)
ylabel('Conductivity(\mu S)');
legend('Trial 1','Trial 2', 'Trial 3');
saveas(gcf,'pic\tracertest','epsc')
saveas(gcf,'pic\tracertest','png')

%finding the mean values and the 90% condifence interval 
minlen=min([length(time1),length(time2),length(time3)]);
ValMatrix = [conf1(1:minlen),conf2(1:minlen),conf3(1:minlen)]';
meanval=mean(ValMatrix);
dev = std(ValMatrix);
ts = tinv([0.05 .95],2);

%finding the mean residence time and usign the same confidence interval
meanrt = mean(Tavg(4,:));
devmrt = std(Tavg(4,:));
MRT = meanrt + devmrt/sqrt(2)*ts

figure
hold on;
y1 = meanval+[dev'.*ts(2)/sqrt(3)]';
y2 = meanval+[dev'.*ts(1)/sqrt(3)]';
patch([time1' fliplr(time1')], [y1 fliplr(y2)], [.827 .827 .827])
p1 = plot(time1,meanval,'-o','MarkerSize',5,'MarkerIndices',1:1000:length(time1));
p2 = plot(time1,y1,'-<','MarkerSize',5,'MarkerIndices',1:1000:length(time1));
p3 = plot(time1,y2,'->','MarkerSize',5,'MarkerIndices',1:1000:length(time1));
title('Error Analysis','FontSize',20);
xlabel({'Time(hrs)'},'FontSize',20)
ylabel('Conductivity(\mu S)','FontSize',20);
legend([p1 p2 p3], 'Mean','Upper bound(90%CI)', 'Lower bound(90%CI)');
saveas(gcf,'pic\erroran','epsc')
saveas(gcf,'pic\erroran','png')


T3=table([Tavg(4,:)';mean(Tavg(4,:))],[TVar(4,:)';mean(TVar(4,:))],'VariableNames',{'Mean Residence Time','Variance'});
writetable(T3,'test.xlsx','Sheet',3);

rsme(1)=Modeltest(time1,conf1,conf2(1:length(time1)));
rsme(2)=Modeltest(time1,conf1,conf3(1:length(time1)));
rsme(3)=Modeltest(time2,conf2,conf3(1:length(time2)));

T4=table(rsme','VariableNames',{'RSME'},'RowNames',{'Trial 1 and 2','Trial 1 and 3','Trial 2 and 3'});
writetable(T4,'test.xlsx','Sheet',4);