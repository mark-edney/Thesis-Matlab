%Mark Edney 
%Theis code to convert recored measuremenets to e(t) graphs
%02/06/2020

%clears all the open windows
clc;
opengl software;

%copies the imported data from labview to seperate variables
clear cond;clear conf;
time=ConductivitySensorslogfile(:,1)/3600;
cond(:,1)=ConductivitySensorslogfile(:,2);
cond(:,2)=ConductivitySensorslogfile(:,3);
cond(:,3)=ConductivitySensorslogfile(:,4);
cond(:,4)=ConductivitySensorslogfile(:,5);

%variable used to filter data, the higher it is the more the data will be
%filtered
f=length(time)/50-rem(length(time),50)/50;

%There is a requirement to construct a linear regression model to remove
%the minimum value as the conductivity doesnt start at 0 and the sensors
%have a change in preformance over time due to fouling. This variable
%selects how many points to use from the start and the end to create the
%linear model. 
group=10;

%Conductivity 1
minv1=fitlm([time(1:group);time(end-group:end)],[cond(1:group,1); cond(end-group:end,1)]);
minv2=fitlm([time(1:group);time(end-group:end)],[cond(1:group,2); cond(end-group:end,2)]);
minv3=fitlm([time(1:group);time(end-group:end)],[cond(1:group,3); cond(end-group:end,3)]);
minv4=fitlm([time(1:group);time(end-group:end)],[cond(1:group,4); cond(end-group:end,4)]);
%corrects the conductivity values by deleting the linear model
conf(:,1)=gt(cond(:,1),predict(minv1,time)).*(cond(:,1)-predict(minv1,time));
conf(:,2)=gt(cond(:,2),predict(minv2,time)).*(cond(:,2)-predict(minv2,time));
conf(:,3)=gt(cond(:,3),predict(minv3,time)).*(cond(:,3)-predict(minv3,time));
conf(:,4)=gt(cond(:,4),predict(minv4,time)).*(cond(:,4)-predict(minv4,time));
%the filtering step 
conf=filter(ones(1,f),f,conf);

%application of the written Clean function which returns the normalized
%values
[tavg,et,Var,Skew]=Clean(time,conf);

%Chages made to go from function to tavg to funtion of theta
theta=time./tavg;
ett=et.*tavg;