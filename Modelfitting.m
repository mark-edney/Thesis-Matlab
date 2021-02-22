%This code test the different models to find the best fit for the average 
%RTD curve

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


%Each of the models are tested
[Error, ModelP]=CompareModels(theta,meanval);

%Ploting the three best models
[yee,EE,enmin,eMmin,eNmin]=ecstrs(theta,meanval);
figure;
hold on;
title("STAR RTD Modeling",'FontSize',20);
plot(theta,meanval,'DisplayName','RTD','LineWidth',3);
string1=sprintf('Low Dispersion Model(E = %0.2d)',Error(3));
string2=sprintf('Generalized Nth(E = %0.2d)',Error(6));
string3=sprintf('Enhanced Cstrs(E = %0.2d)',Error(7));
plot(theta, dispersion(theta, ModelP(1),1), '-o', 'MarkerSize', 5, 'MarkerIndices'...
    ,1:1000:length(time1),'DisplayName', string1)
plot(theta,genncstr(theta,ModelP(6),1),'-*','MarkerSize',5,'MarkerIndices',...
    1:1000:length(time1),'DisplayName', string2)
plot(theta,yee,'-+','MarkerSize',5,'MarkerIndices', 1:1000:length(time1)...
    ,'DisplayName',string3)
xlabel('Dimensionless time($\theta = \frac{time}{\bar{t}_{avg}})$','Interpreter','Latex','FontSize',20);
ylabel('$E(\theta )$','Interpreter','Latex','FontSize',20);
legend;
ylim([0 2]);
saveas(gcf,'pic\bestmdls','epsc')
saveas(gcf,'pic\bestmdls','png')
toc;