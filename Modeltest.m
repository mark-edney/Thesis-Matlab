%This functino will find the difference of squares between the data and a
%model using the standard error method

function [E]=Modeltest(dx,dy,my)
E=0;
Temp=mean((dy-my).^2);
E=sqrt(Temp);
end
