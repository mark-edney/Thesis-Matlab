%Program used to determine the deadspace/bypassing in the reactor
v1=10;
V1=10;
V2=10;
V3=45;
%the theoretical residence time 
t=(V1+V2+V3)/(v1)

%real MRT from recycle experiment
tobs=7.0256;

%The amount of bypassing
vobs=(V1+V2+V3)/tobs;
vpb=v1-vobs
vpb/v1*100