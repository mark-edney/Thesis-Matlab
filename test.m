clear;
close all;
tic
i=4;
Data(1)=1;
import9;
Code;
[Error, ModelP]=CompareModels(theta(:,i),ett(:,i));
CSTR(1)=Error(1);
PFR(1)=Error(2);
Dispersion(1)=Error(3);
Dispop(1)=Error(4);
CSTRS(1)=Error(5);
GCSTRS(1)=Error(6);
ECSTRS(1)=Error(7);
modelP(1,:)=ModelP;


Data(2)=2;
import10;
Code;
[Error, ModelP]=CompareModels(theta(:,i),ett(:,i));
CSTR(2)=Error(1);
PFR(2)=Error(2);
Dispersion(2)=Error(3);
Dispop(2)=Error(4);
CSTRS(2)=Error(5);
GCSTRS(2)=Error(6);
ECSTRS(2)=Error(7);
modelP(2,:)=ModelP;

Data(3)=3;
import11;
Code;
[Error,ModelP]=CompareModels(theta(:,i),ett(:,i));
CSTR(3)=Error(1);
PFR(3)=Error(2);
Dispersion(3)=Error(3);
Dispop(3)=Error(4);
CSTRS(3)=Error(5);
GCSTRS(3)=Error(6);
ECSTRS(3)=Error(7);
modelP(3,:)=ModelP;
hold on;

T = table([CSTR'; mean(CSTR)],[PFR';mean(PFR)],[Dispersion';mean(Dispersion)],[Dispop';mean(Dispop)],[CSTRS';mean(CSTRS)],[GCSTRS';mean(GCSTRS)],[ECSTRS';mean(ECSTRS)],'VariableNames',{'CSTR','PFR','Low D','DispOpen','CSTRS','Nth CSTR','E-CSTRS'},'RowNames',{'Data Set 1','Data Set 2','Data Set 3','Average'})
T2=table([modelP(:,1);mean(modelP(:,1))],[modelP(:,2);mean(modelP(:,2))],[modelP(:,3);mean(modelP(:,3))],[modelP(:,4);mean(modelP(:,4))],[modelP(:,5);mean(modelP(:,5))],[modelP(:,6);mean(modelP(:,6))],[modelP(:,7);mean(modelP(:,7))],'VariableNames',{'Low D coeff','Open D','#CSTRS','#nthCSTRS','#E-CSTRS','nmin','Mmin'},'RowNames',{'Data Set 1','Data Set 2','Data Set 3','Average'})
toc

writetable(T,'test.xlsx','Sheet',1);
writetable(T2,'test.xlsx','Sheet',2);